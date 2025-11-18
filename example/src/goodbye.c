/*
   The most basic multiple executable example using a shared object/header file.

   goodbye.c will generate an executable named hello which that prints goodbye, world
*/
#include "string/string.h"

int main(void)
{
  out("goodbye, world");
  return 0;
}
