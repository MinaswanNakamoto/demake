/*

  typedefs.h -- Include and typedefs for basic C types

  These typedefs appear in all full library header files.

  You can override all of them by including this file first and making your changes here.

  To add text editor color highlight support for these typedefs see below.

*/

#ifndef TYPEDEFS_H_Minaswan     /* Prevents multiple inclusions */
  #define TYPEDEFS_H_Minaswan
  #define TYPEDEFS_VERSION      "0.1.0"
  #include <stdint.h>

  typedef uint8_t b8;           /* Booleans                     */
  typedef uint16_t b16;
  typedef uint32_t b32;
  typedef uint64_t b64;

  typedef char c8;              /* Characters                   */
  typedef unsigned char uc8;

  typedef uint8_t u8;           /* Unsigned Numbers             */
  typedef uint16_t u16;
  typedef uint32_t u32;
  typedef uint64_t u64;

  typedef int8_t i8;            /* Signed Numbers               */
  typedef int16_t i16;
  typedef int32_t i32;
  typedef int64_t i64;

  typedef float f32;            /* Floating Point Numbers       */
  typedef double f64;
#endif                          /* TYPEDEFS_H_Minaswan          */

/*

For nvim, add to ~/.config/nvim/init.lua:

vim.cmd("syntax on")
vim.api.nvim_create_augroup("CustomCTypedefs", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "CustomCTypedefs",
    pattern = { "c", "h", "cpp", "hpp" },
    callback = function()
        vim.cmd([[syntax match CustomTypedef /\<\(b8\|b16\|b32\|b64\|c8\|uc8\|i8\|i16\|i32\|i64\|u8\|u16\|u32\|u64\|f32\|f64\)\>/]])
        vim.cmd([[highlight CustomTypedef guifg=green ctermfg=green]])
    end,
})

For nano, add to /usr/share/nano/c.nanorc:

color green "\<(b8|b16|b32|b64|c8|uc8|i8|i16|i32|i64|u8|u16|u32|u64|f32|f64)\>"

For emacs, it would seem the magic is strong, because it just works. :)

*/
nezmar@F44-Nezmar1:~/X-local/demake/lib/apps/oreo/src$ 
