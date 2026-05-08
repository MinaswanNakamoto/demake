/*
   The most basic multiple executable example using a shared object/header file.

   hello.c will generate an executable named hello which that prints hello, world
*/
#include "string/string.h"

int main(void)
{
  out("hello, world");
  return 0;
}
