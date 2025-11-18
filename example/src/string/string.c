/*
   The most basic multiple executable example using a shared object/header file.

   string.c creates a simple shared function named out which prints output
*/
#include <stdio.h>
#include "string.h"

void out(const char *in)
{
  printf("%s\n", in);
}
