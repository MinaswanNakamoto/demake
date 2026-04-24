/*

  fast_read_file.h -- *Full Library* Header File

  For reading the entire contents of a file into 64-bit aligned memory.

  See the end of this file for examples.

  Public Functions:     ** DON'T FORGET TO FREE YOUR MEMORY AFTER USE **

  c8 *fast_read_all_file_mapped(FILE *file, u64 *total_bytes);  ** READ ONLY **
  void free_all_mapped_read_memory(c8 *data, u64 *total_bytes);

  c8 *fast_read_all_file_aligned(FILE *file, u64 *total_bytes); ** READ/WRITE **
  void free_all_aligned_read_memory(c8 *data);

*/

#ifndef FAST_READ_FILE_H_Minaswan       /* Prevent multiple inclusions  */
#define FAST_READ_FILE_H_Minaswan
  #define FAST_READ_FILE_VERSION        "0.1.0"
  #ifndef TYPEDEFS_H_Minaswan           /* Header guard for typedefs.h  */
    #define TYPEDEFS_H_Minaswan
    #include <stdint.h>
    typedef uint8_t b8;                 /* Booleans                     */
    typedef uint16_t b16;
    typedef uint32_t b32;
    typedef uint64_t b64;

    typedef char c8;                    /* Characters                   */
    typedef unsigned char uc8;

    typedef uint8_t u8;                 /* Unsigned Numbers             */
    typedef uint16_t u16;
    typedef uint32_t u32;
    typedef uint64_t u64;

    typedef int8_t i8;                  /* Signed Numbers               */
    typedef int16_t i16;
    typedef int32_t i32;
    typedef int64_t i64;

    typedef float f32;                  /* Floating Point Numbers       */
    typedef double f64;
  #endif                                /* TYPEDEFS_H_Minaswan          */

  #include <stdio.h>

  /* Public Functions */
  void free_all_mapped_read_memory(c8 *data, u64 *total_bytes);
  void free_all_aligned_read_memory(c8 *data);
  c8 *fast_read_all_file_mapped(FILE *file, u64 *total_bytes);
  c8 *fast_read_all_file_aligned(FILE *file, u64 *total_bytes);

  #ifdef FAST_READ_FILE_IMPLEMENTATION  /* Effectively read_all_file.c  */
    #include <stdlib.h>
    #include <string.h>
    #if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
      #include <windows.h>
    #else
      #include <sys/mman.h>
      #include <sys/stat.h>
      #include <fcntl.h>
      #include <unistd.h>
    #endif

    extern i32 fileno(FILE *stream);

    #define FAST_READ_FILE_BUFFER_SIZE  4096

    #ifndef FALSE
      #define FALSE                     0
    #endif

    #ifndef TRUE
      #define TRUE                      1
    #endif

    #ifndef NULL
      #define NULL                      ((void *) 0)
    #endif

    #ifndef MIN
      #define MIN(a, b)                 ((a) < (b) ? a : b)
    #endif

    void *fast_file_align64_malloc(size_t size)
    {
      void *result = NULL;

      if(size == 0)
        return(NULL);
    #if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
      result = _aligned_malloc(size, 64);
    #else
      #if(defined(_POSIX_C_SOURCE) && _POSIX_C_SOURCE >= 200112L) || \
          (defined(_XOPEN_SOURCE) && _XOPEN_SOURCE >= 600)
        if(posix_memalign(&result, 64, size) != 0)
          return(NULL);
      #else
        result = malloc(size);
      #endif
    #endif
      return(result);
    }

    void *fast_file_align64_calloc(size_t size)
    {
      void *result = fast_file_align64_malloc(size);

      if(result)
        memset(result, 0, size);
      return(result);
    }

    void *fast_file_align64_realloc(void *existing_memory, size_t old_size, size_t new_size)
    {
      void *new_memory = fast_file_align64_calloc(new_size);

      if(new_memory && existing_memory) {
        memcpy(new_memory, existing_memory, MIN(new_size, old_size));
        free(existing_memory);
        return(new_memory);
      }
      return(NULL);
    }

    c8 *fast_read_all_file_aligned(FILE *file, u64 *total_bytes)
    {
      size_t bytes = 0, count = 0;
      c8 buffer[FAST_READ_FILE_BUFFER_SIZE + 1];
      c8 *data = NULL;

      bytes = fread(buffer, sizeof(c8), FAST_READ_FILE_BUFFER_SIZE, file);
      while(bytes) {
        if(data) {
          data = fast_file_align64_realloc(data, *total_bytes + 1, *total_bytes + bytes + 1);
          count = 0;
          while(count < bytes) {
            *(data + *total_bytes + count) = buffer[count];
            count++;
          }
        } else {
          data = fast_file_align64_calloc(bytes + 1);
          count = 0;
          while(count < bytes) {
            *(data + *total_bytes + count) = buffer[count];
            count++;
          }
        }
        *total_bytes += (u32)bytes;
        *(data + *total_bytes) = '\0';
        bytes = fread(buffer, sizeof(c8), FAST_READ_FILE_BUFFER_SIZE, file);
      }
      return(data);
    }

    c8 *fast_read_all_file_mapped(FILE *file, u64 *total_bytes)
    {
      c8 *data = NULL;
    #if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
      HANDLE windows_file_handle = {0};
      HANDLE windows_map_handle = {0};
      LARGE_INTEGER windows_file_size = {0};
    #else
      i32 file_descriptor = fileno(file);
      struct stat st = {0};
    #endif

    #if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
      windows_file_handle = (HANDLE)_get_osfhandle(fileno(file));
      if(windows_file_handle == INVALID_HANDLE_VALUE)
        return(NULL);
      if(!GetFileSizeEx(windows_file_handle, &windows_file_size) ||
          windows_file_size.QuadPart == 0) {
        CloseHandle(windows_file_handle);
        return(NULL);
      }
      *total_bytes = (u64)windows_file_size.QuadPart;
      windows_map_handle = CreateFileMapping(windows_file_handle,
          NULL, PAGE_READONLY, 0, 0, NULL);
      data = MapViewOfFile(windows_map_handle, FILE_MAP_READ, 0, 0, 0);
      CloseHandle(windows_file_handle);
      CloseHandle(windows_map_handle);
    #else
      if(file_descriptor == -1)
        return(NULL);
      if(fstat(file_descriptor, &st) == -1 || st.st_size == 0) {
        close(file_descriptor);
        return(NULL);
      }
      *total_bytes = (u64)st.st_size;
      data = mmap(NULL, *total_bytes, PROT_READ, MAP_PRIVATE,
          file_descriptor, 0);
      if(data == MAP_FAILED) {
        close(file_descriptor);
        return(NULL);
      }
      #ifdef POSIX_FADV_SEQUENTIAL
        posix_fadvise(file_descriptor, 0, (i64)*total_bytes,
            POSIX_FADV_SEQUENTIAL);
      #endif
      #ifdef MADV_SEQUENTIAL
        madvise(data, *total_bytes, MADV_SEQUENTIAL);
      #endif
      close(file_descriptor);
    #endif
      return(data);
    }

    void free_all_mapped_read_memory(c8 *data, u64 *total_bytes)
    {
    #if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
      UnmapViewOfFile(data);
    #else
      munmap(data, *total_bytes);
    #endif
    }

    void free_all_aligned_read_memory(c8 *data)
    {
    #if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
      _aligned_free(data);
    #else
      free(data);
    #endif
    }
  #endif /* FAST_READ_FILE_IMPLEMENTATION */
#endif /* FAST_READ_FILE_H_Minaswan */

/*

  Examples:      ** DON'T FORGET TO FREE YOUR MEMORY AFTER USE **

  #define FAST_READ_FILE_IMPLEMENTATION
  #include "fast_read_file.h"

  // Read everything from file example:

  FILE *file = fopen(argv[1], "rb");
  u64 total_bytes = 0;
  c8 *data = fast_read_all_file_mapped(file, &total_bytes);
  use(string);
  free_all_mapped_read_memory(string);  // Note: Doesn't use malloc/free

  // Read everything from stdin / non-kernal mapping example:

  u64 total_bytes = 0;
  c8 *data = fast_read_all_file_aligned(stdin, &total_bytes);
  use(string);
  free_all_aligned_read_memory(string); // Note: Might not use malloc/free

  FILE *file = fopen(argv[1], "rb");
  u64 total_bytes = 0;
  c8 *data = fast_read_all_file_aligned(file, &total_bytes);
  use(string);
  free_all_aligned_read_memory(string); // Note: Might not use malloc/free

*/
