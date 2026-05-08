/*
   oreo.c -- A simple c program that reads data piped in, issued as arguments or from a file and echos output

   Program main entry point: _start/main
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Cross platform test to see if data has been piped from stdin */
#if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
  #include <io.h>
  #define piped_from_stdin      !_isatty(fileno(stdin))
#else
  #include <unistd.h>
  #define piped_from_stdin      !isatty(fileno(stdin))
#endif

/* Cross platform test to see if data has been piped from stdin - Option 2 */
/*
#if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
  #include <windows.h>
#else
  #include <sys/ioctl.h>
#endif
*/

#include "defines.h"
#include "typedefs.h"
#define FAST_READ_FILE_IMPLEMENTATION
#include "fast_read_file.h"

i32 main(i32 argc, c8 **argv)
{
  FILE *file = NULL;
  u64 total_bytes = 0, l = 0;
  i32 n = 0;
  c8 *string = NULL;
  b8 displayed = FALSE;

/* Cross platform test to see if data has been piped from stdin - Option 2 */
/*
#if defined(_WIN32) || defined(__WIN32__) || defined(WIN32)
  HANDLE stdin_handle = GetStdHandle(STD_INPUT_HANDLE);
  DWORD bytes;

  if(PeekNamedPipe(stdin_handle, NULL, 0, NULL, &bytes, NULL) && bytes > 0) {
#else
  if(ioctl(0, FIONREAD, &n) == 0 && n > 0) {
#endif
*/

  if(piped_from_stdin) {
    string = (c8 *)fast_read_all_file_aligned(stdin, &total_bytes);
#ifdef OREO_DEBUG
    printf("From stdin:\r\n");
#endif
    printf("oreo: %s\r\n", string);
    free_all_aligned_read_memory(string);
    string = NULL;
    displayed = TRUE;
  }
  if(argv[1] != NULL) {
    file = fopen(argv[1], "r");
    if(file == NULL) {
      /* We need to manually recreate the command input based on arguments with spaces */
      for(n = 1; n < argc; n++) {
        if(string != NULL) {
          l = (u32)strlen(argv[n]);
          total_bytes += l + 1;                                 /* +1 for space         */
          string = realloc(string, (size_t)total_bytes + 1);    /* +1 for \0            */
          strncat((c8 *)string, " ", (size_t)2);                /* 2 for space and \0   */
          strncat((c8 *)string, argv[n], l);
        } else {
          total_bytes = (u32)strlen(argv[n]);
          string = calloc(total_bytes + 1, sizeof(c8));         /* +1 for \0            */
          strncpy((c8 *)string, argv[n], total_bytes);
        }
      }
#ifdef OREO_DEBUG
      printf("From argument:\r\n");
#endif
      printf("oreo: %s\r\n", string);
      free(string);
      string = NULL;
    } else {
#ifdef OREO_DEBUG
      printf("From file: %s\r\n", argv[1]);
#endif
      string = (c8 *)fast_read_all_file_mapped(file, &total_bytes);
      printf("oreo: %s\r\n", string);
      free_all_mapped_read_memory(string, &total_bytes);
      string = NULL;
    }
  } else if(!displayed) {
#ifdef OREO_DEBUG
    printf("No input provided.\r\n");
#endif
  }
  exit(0);
}
