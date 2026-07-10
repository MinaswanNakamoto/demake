/*
   defines.h -- Basic C preprocessor macro definitions
*/

#ifndef DEFINES_H_Minaswan      /* Prevent multiple inclusions */
  #define DEFINES_H_Minaswan
  #define DEFINES_VERSION       "0.1.1"
  #ifndef NULL
    #define NULL                ((void *) 0)
  #endif
  #ifndef FALSE
    #define FALSE               0
  #endif
  #ifndef TRUE
    #define TRUE                1
  #endif
  #ifndef NO
    #define NO                  0
  #endif
  #ifndef YES
    #define YES                 1
  #endif
  #ifndef OFF
    #define OFF                 0
  #endif
  #ifndef ON
    #define ON                  1
  #endif
  #ifndef MIN
    #define MIN(x, y)           (x) < (y) ? (x) : (y)
  #endif
  #ifndef MAX
    #define MAX(x, y)           (x) > (y) ? (x) : (y)
  #endif
  #ifndef KB
    #define KB(x)               ((u64)(x) * 1024)
  #endif
  #ifndef MB
    #define MB(x)               ((u64)(x) * 1024 * 1024)
  #endif
  #ifndef GB
    #define GB(x)               ((u64)(x) * 1024 * 1024 * 1024)
  #endif
  #ifndef TO_UPPER_CASE
    #define TO_UPPER_CASE(x)    (((uc8)(x) >= (uc8)'a' && (uc8)(x) <= (uc8)'z') ? \
                                (uc8)((uc8)(x) - (uc8)'a' + (uc8)'A') : (uc8)(x))
  #endif
  #ifndef TO_LOWER_CASE
    #define TO_LOWER_CASE(x)    (((uc8)(x) >= (uc8)'A' && (uc8)(x) <= (uc8)'Z') ? \
                                (uc8)((uc8)(x) - (uc8)'A' + (uc8)'a') : (uc8)(x))
  #endif
  #ifndef IS_WHITE_SPACE
    #define IS_WHITE_SPACE(x)   ((uc8)(x) == ' ' || (uc8)(x) - (uc8)'\t' < 5)
  #endif
#endif                          /* DEFINES_H_Minaswan */
