# 1 "pluma-spell-checker-language.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 398 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "pluma-spell-checker-language.c" 2
# 37 "pluma-spell-checker-language.c"
# 1 "../../config.h" 1
# 38 "pluma-spell-checker-language.c" 2


# 1 "/usr/include/string.h" 1 3 4
# 26 "/usr/include/string.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 33 "/usr/include/bits/libc-header-start.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 402 "/usr/include/features.h" 3 4
# 1 "/usr/include/features-time64.h" 1 3 4
# 20 "/usr/include/features-time64.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 21 "/usr/include/features-time64.h" 2 3 4
# 1 "/usr/include/bits/timesize.h" 1 3 4
# 19 "/usr/include/bits/timesize.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 20 "/usr/include/bits/timesize.h" 2 3 4
# 22 "/usr/include/features-time64.h" 2 3 4
# 403 "/usr/include/features.h" 2 3 4
# 489 "/usr/include/features.h" 3 4
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 490 "/usr/include/features.h" 2 3 4
# 511 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 730 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 731 "/usr/include/sys/cdefs.h" 2 3 4
# 1 "/usr/include/bits/long-double.h" 1 3 4
# 732 "/usr/include/sys/cdefs.h" 2 3 4
# 512 "/usr/include/features.h" 2 3 4
# 535 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4
# 10 "/usr/include/gnu/stubs.h" 3 4
# 1 "/usr/include/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/gnu/stubs.h" 2 3 4
# 536 "/usr/include/features.h" 2 3 4
# 34 "/usr/include/bits/libc-header-start.h" 2 3 4
# 27 "/usr/include/string.h" 2 3 4






# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 18 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 3 4
typedef long unsigned int size_t;
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 108 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 34 "/usr/include/string.h" 2 3 4
# 43 "/usr/include/string.h" 3 4
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));





extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
    __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2))) ;




extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 80 "/usr/include/string.h" 3 4
extern int __memcmpeq (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 107 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 141 "/usr/include/string.h" 3 4
extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
    __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2))) ;



# 1 "/usr/include/bits/types/locale_t.h" 1 3 4
# 22 "/usr/include/bits/types/locale_t.h" 3 4
# 1 "/usr/include/bits/types/__locale_t.h" 1 3 4
# 27 "/usr/include/bits/types/__locale_t.h" 3 4
struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
};

typedef struct __locale_struct *__locale_t;
# 23 "/usr/include/bits/types/locale_t.h" 2 3 4

typedef __locale_t locale_t;
# 173 "/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, locale_t __l)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));


extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    locale_t __l) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 4)))
                                           ;





extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 246 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 273 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 286 "/usr/include/string.h" 3 4
extern char *strchrnul (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 323 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 350 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));



extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 3)));
# 380 "/usr/include/string.h" 3 4
extern char *strcasestr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));







extern void *memmem (const void *__haystack, size_t __haystacklen,
       const void *__needle, size_t __needlelen)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)))

                                         ;



extern void *__mempcpy (void *__restrict __dest,
   const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        const void *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern char *strerror (int __errnum) __attribute__ ((__nothrow__ ));
# 432 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)))


                                          ;
# 458 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, locale_t __l) __attribute__ ((__nothrow__ ));



# 1 "/usr/include/strings.h" 1 3 4
# 23 "/usr/include/strings.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 24 "/usr/include/strings.h" 2 3 4
# 34 "/usr/include/strings.h" 3 4
extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bcopy (const void *__src, void *__dest, size_t __n)
  __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 68 "/usr/include/strings.h" 3 4
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 96 "/usr/include/strings.h" 3 4
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));






extern int ffs (int __i) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));





extern int ffsl (long int __l) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
__extension__ extern int ffsll (long long int __ll)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__));



extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));






extern int strcasecmp_l (const char *__s1, const char *__s2, locale_t __loc)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));



extern int strncasecmp_l (const char *__s1, const char *__s2,
     size_t __n, locale_t __loc)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));
# 463 "/usr/include/string.h" 2 3 4



extern void explicit_bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)))
                                                  ;



extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ ));
# 489 "/usr/include/string.h" 3 4
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern size_t strlcpy (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
  __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2))) ;



extern size_t strlcat (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
  __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2))) ;
# 41 "pluma-spell-checker-language.c" 2

# 1 "/usr/include/enchant-2/enchant.h" 1
# 33 "/usr/include/enchant-2/enchant.h"
# 1 "/usr/bin/../lib/clang/19/include/stdint.h" 1 3
# 56 "/usr/bin/../lib/clang/19/include/stdint.h" 3
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/bits/types.h" 1 3 4
# 27 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 28 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/timesize.h" 1 3 4
# 19 "/usr/include/bits/timesize.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 20 "/usr/include/bits/timesize.h" 2 3 4
# 29 "/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;






typedef __int8_t __int_least8_t;
typedef __uint8_t __uint_least8_t;
typedef __int16_t __int_least16_t;
typedef __uint16_t __uint_least16_t;
typedef __int32_t __int_least32_t;
typedef __uint32_t __uint_least32_t;
typedef __int64_t __int_least64_t;
typedef __uint64_t __uint_least64_t;



typedef long int __quad_t;
typedef unsigned long int __u_quad_t;







typedef long int __intmax_t;
typedef unsigned long int __uintmax_t;
# 141 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 142 "/usr/include/bits/types.h" 2 3 4
# 1 "/usr/include/bits/time64.h" 1 3 4
# 143 "/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef long int __suseconds64_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;




typedef int __sig_atomic_t;
# 28 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/bits/wchar.h" 1 3 4
# 29 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 30 "/usr/include/stdint.h" 2 3 4




# 1 "/usr/include/bits/stdint-intn.h" 1 3 4
# 24 "/usr/include/bits/stdint-intn.h" 3 4
typedef __int8_t int8_t;
typedef __int16_t int16_t;
typedef __int32_t int32_t;
typedef __int64_t int64_t;
# 35 "/usr/include/stdint.h" 2 3 4


# 1 "/usr/include/bits/stdint-uintn.h" 1 3 4
# 24 "/usr/include/bits/stdint-uintn.h" 3 4
typedef __uint8_t uint8_t;
typedef __uint16_t uint16_t;
typedef __uint32_t uint32_t;
typedef __uint64_t uint64_t;
# 38 "/usr/include/stdint.h" 2 3 4



# 1 "/usr/include/bits/stdint-least.h" 1 3 4
# 25 "/usr/include/bits/stdint-least.h" 3 4
typedef __int_least8_t int_least8_t;
typedef __int_least16_t int_least16_t;
typedef __int_least32_t int_least32_t;
typedef __int_least64_t int_least64_t;


typedef __uint_least8_t uint_least8_t;
typedef __uint_least16_t uint_least16_t;
typedef __uint_least32_t uint_least32_t;
typedef __uint_least64_t uint_least64_t;
# 42 "/usr/include/stdint.h" 2 3 4





typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 60 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 76 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 90 "/usr/include/stdint.h" 3 4
typedef __intmax_t intmax_t;
typedef __uintmax_t uintmax_t;
# 57 "/usr/bin/../lib/clang/19/include/stdint.h" 2 3
# 34 "/usr/include/enchant-2/enchant.h" 2
# 1 "/usr/include/sys/types.h" 1 3 4
# 33 "/usr/include/sys/types.h" 3 4
typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;


typedef __loff_t loff_t;




typedef __ino_t ino_t;
# 59 "/usr/include/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 97 "/usr/include/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;




# 1 "/usr/include/bits/types/clock_t.h" 1 3 4






typedef __clock_t clock_t;
# 127 "/usr/include/sys/types.h" 2 3 4

# 1 "/usr/include/bits/types/clockid_t.h" 1 3 4






typedef __clockid_t clockid_t;
# 129 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/bits/types/time_t.h" 1 3 4
# 10 "/usr/include/bits/types/time_t.h" 3 4
typedef __time_t time_t;
# 130 "/usr/include/sys/types.h" 2 3 4
# 1 "/usr/include/bits/types/timer_t.h" 1 3 4






typedef __timer_t timer_t;
# 131 "/usr/include/sys/types.h" 2 3 4
# 144 "/usr/include/sys/types.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 145 "/usr/include/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;







typedef __uint8_t u_int8_t;
typedef __uint16_t u_int16_t;
typedef __uint32_t u_int32_t;
typedef __uint64_t u_int64_t;


typedef int register_t __attribute__ ((__mode__ (__word__)));
# 176 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 24 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/endian.h" 1 3 4
# 35 "/usr/include/bits/endian.h" 3 4
# 1 "/usr/include/bits/endianness.h" 1 3 4
# 36 "/usr/include/bits/endian.h" 2 3 4
# 25 "/usr/include/endian.h" 2 3 4
# 35 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/byteswap.h" 1 3 4
# 33 "/usr/include/bits/byteswap.h" 3 4
static __inline __uint16_t
__bswap_16 (__uint16_t __bsx)
{



  return ((__uint16_t) ((((__bsx) >> 8) & 0xff) | (((__bsx) & 0xff) << 8)));

}






static __inline __uint32_t
__bswap_32 (__uint32_t __bsx)
{



  return ((((__bsx) & 0xff000000u) >> 24) | (((__bsx) & 0x00ff0000u) >> 8) | (((__bsx) & 0x0000ff00u) << 8) | (((__bsx) & 0x000000ffu) << 24));

}
# 69 "/usr/include/bits/byteswap.h" 3 4
__extension__ static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{



  return ((((__bsx) & 0xff00000000000000ull) >> 56) | (((__bsx) & 0x00ff000000000000ull) >> 40) | (((__bsx) & 0x0000ff0000000000ull) >> 24) | (((__bsx) & 0x000000ff00000000ull) >> 8) | (((__bsx) & 0x00000000ff000000ull) << 8) | (((__bsx) & 0x0000000000ff0000ull) << 24) | (((__bsx) & 0x000000000000ff00ull) << 40) | (((__bsx) & 0x00000000000000ffull) << 56));

}
# 36 "/usr/include/endian.h" 2 3 4
# 1 "/usr/include/bits/uintn-identity.h" 1 3 4
# 32 "/usr/include/bits/uintn-identity.h" 3 4
static __inline __uint16_t
__uint16_identity (__uint16_t __x)
{
  return __x;
}

static __inline __uint32_t
__uint32_identity (__uint32_t __x)
{
  return __x;
}

static __inline __uint64_t
__uint64_identity (__uint64_t __x)
{
  return __x;
}
# 37 "/usr/include/endian.h" 2 3 4
# 177 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/select.h" 1 3 4
# 30 "/usr/include/sys/select.h" 3 4
# 1 "/usr/include/bits/select.h" 1 3 4
# 31 "/usr/include/sys/select.h" 2 3 4


# 1 "/usr/include/bits/types/sigset_t.h" 1 3 4



# 1 "/usr/include/bits/types/__sigset_t.h" 1 3 4




typedef struct
{
  unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
} __sigset_t;
# 5 "/usr/include/bits/types/sigset_t.h" 2 3 4


typedef __sigset_t sigset_t;
# 34 "/usr/include/sys/select.h" 2 3 4



# 1 "/usr/include/bits/types/struct_timeval.h" 1 3 4







struct timeval
{




  __time_t tv_sec;
  __suseconds_t tv_usec;

};
# 38 "/usr/include/sys/select.h" 2 3 4

# 1 "/usr/include/bits/types/struct_timespec.h" 1 3 4
# 11 "/usr/include/bits/types/struct_timespec.h" 3 4
struct timespec
{



  __time_t tv_sec;




  __syscall_slong_t tv_nsec;
# 31 "/usr/include/bits/types/struct_timespec.h" 3 4
};
# 40 "/usr/include/sys/select.h" 2 3 4



typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 59 "/usr/include/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 102 "/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 127 "/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 180 "/usr/include/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 227 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/bits/thread-shared-types.h" 1 3 4
# 44 "/usr/include/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/bits/pthreadtypes-arch.h" 1 3 4
# 21 "/usr/include/bits/pthreadtypes-arch.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 22 "/usr/include/bits/pthreadtypes-arch.h" 2 3 4
# 45 "/usr/include/bits/thread-shared-types.h" 2 3 4

# 1 "/usr/include/bits/atomic_wide_counter.h" 1 3 4
# 25 "/usr/include/bits/atomic_wide_counter.h" 3 4
typedef union
{
  __extension__ unsigned long long int __value64;
  struct
  {
    unsigned int __low;
    unsigned int __high;
  } __value32;
} __atomic_wide_counter;
# 47 "/usr/include/bits/thread-shared-types.h" 2 3 4




typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;

typedef struct __pthread_internal_slist
{
  struct __pthread_internal_slist *__next;
} __pthread_slist_t;
# 76 "/usr/include/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/bits/struct_mutex.h" 1 3 4
# 22 "/usr/include/bits/struct_mutex.h" 3 4
struct __pthread_mutex_s
{
  int __lock;
  unsigned int __count;
  int __owner;

  unsigned int __nusers;



  int __kind;

  short __spins;
  short __elision;
  __pthread_list_t __list;
# 53 "/usr/include/bits/struct_mutex.h" 3 4
};
# 77 "/usr/include/bits/thread-shared-types.h" 2 3 4
# 89 "/usr/include/bits/thread-shared-types.h" 3 4
# 1 "/usr/include/bits/struct_rwlock.h" 1 3 4
# 23 "/usr/include/bits/struct_rwlock.h" 3 4
struct __pthread_rwlock_arch_t
{
  unsigned int __readers;
  unsigned int __writers;
  unsigned int __wrphase_futex;
  unsigned int __writers_futex;
  unsigned int __pad3;
  unsigned int __pad4;

  int __cur_writer;
  int __shared;
  signed char __rwelision;




  unsigned char __pad1[7];


  unsigned long int __pad2;


  unsigned int __flags;
# 55 "/usr/include/bits/struct_rwlock.h" 3 4
};
# 90 "/usr/include/bits/thread-shared-types.h" 2 3 4




struct __pthread_cond_s
{
  __atomic_wide_counter __wseq;
  __atomic_wide_counter __g1_start;
  unsigned int __g_refs[2] ;
  unsigned int __g_size[2];
  unsigned int __g1_orig_size;
  unsigned int __wrefs;
  unsigned int __g_signals[2];
};

typedef unsigned int __tss_t;
typedef unsigned long int __thrd_t;

typedef struct
{
  int __data ;
} __once_flag;
# 24 "/usr/include/bits/pthreadtypes.h" 2 3 4



typedef unsigned long int pthread_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;




typedef union
{
  struct __pthread_mutex_s __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;


typedef union
{
  struct __pthread_cond_s __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;





typedef union
{
  struct __pthread_rwlock_arch_t __data;
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 228 "/usr/include/sys/types.h" 2 3 4
# 35 "/usr/include/enchant-2/enchant.h" 2






typedef struct _EnchantBroker EnchantBroker;
typedef struct _EnchantDict EnchantDict;

const char *enchant_get_version (void);
# 57 "/usr/include/enchant-2/enchant.h"
EnchantBroker *enchant_broker_init (void);







void enchant_broker_free (EnchantBroker * broker);
# 76 "/usr/include/enchant-2/enchant.h"
EnchantDict *enchant_broker_request_dict (EnchantBroker * broker, const char *const tag);
# 90 "/usr/include/enchant-2/enchant.h"
EnchantDict *enchant_broker_request_dict_with_pwl (EnchantBroker * broker, const char *const tag, const char *pwl);
# 99 "/usr/include/enchant-2/enchant.h"
EnchantDict *enchant_broker_request_pwl_dict (EnchantBroker * broker, const char *const pwl);
# 109 "/usr/include/enchant-2/enchant.h"
void enchant_broker_free_dict (EnchantBroker * broker, EnchantDict * dict);
# 119 "/usr/include/enchant-2/enchant.h"
int enchant_broker_dict_exists (EnchantBroker * broker, const char * const tag);
# 130 "/usr/include/enchant-2/enchant.h"
void enchant_broker_set_ordering (EnchantBroker * broker,
      const char * const tag,
      const char * const ordering);
# 142 "/usr/include/enchant-2/enchant.h"
const char *enchant_broker_get_error (EnchantBroker * broker);
# 154 "/usr/include/enchant-2/enchant.h"
typedef void (*EnchantBrokerDescribeFn) (const char * const provider_name,
      const char * const provider_desc,
      const char * const provider_dll_file,
      void * user_data);
# 168 "/usr/include/enchant-2/enchant.h"
void enchant_broker_describe (EnchantBroker * broker,
         EnchantBrokerDescribeFn fn,
         void * user_data);
# 181 "/usr/include/enchant-2/enchant.h"
int enchant_dict_check (EnchantDict * dict, const char *const word, ssize_t len);
# 194 "/usr/include/enchant-2/enchant.h"
char **enchant_dict_suggest (EnchantDict * dict, const char *const word,
        ssize_t len, size_t * out_n_suggs);
# 206 "/usr/include/enchant-2/enchant.h"
void enchant_dict_add (EnchantDict * dict, const char *const word, ssize_t len);







void enchant_dict_add_to_session (EnchantDict * dict, const char *const word, ssize_t len);
# 225 "/usr/include/enchant-2/enchant.h"
void enchant_dict_remove (EnchantDict * dict, const char *const word, ssize_t len);







void enchant_dict_remove_from_session (EnchantDict * dict, const char *const word, ssize_t len);
# 243 "/usr/include/enchant-2/enchant.h"
int enchant_dict_is_added (EnchantDict * dict, const char *const word, ssize_t len);
# 255 "/usr/include/enchant-2/enchant.h"
int enchant_dict_is_removed (EnchantDict * dict, const char *const word, ssize_t len);
# 268 "/usr/include/enchant-2/enchant.h"
void enchant_dict_store_replacement (EnchantDict * dict,
         const char *const mis, ssize_t mis_len,
         const char *const cor, ssize_t cor_len);
# 279 "/usr/include/enchant-2/enchant.h"
void enchant_dict_free_string_list (EnchantDict * dict, char **string_list);
# 290 "/usr/include/enchant-2/enchant.h"
const char *enchant_dict_get_error (EnchantDict * dict);
# 307 "/usr/include/enchant-2/enchant.h"
const char *enchant_dict_get_extra_word_characters (EnchantDict * dict);
# 336 "/usr/include/enchant-2/enchant.h"
int enchant_dict_is_word_character (EnchantDict * dict, uint32_t uc, size_t n);
# 349 "/usr/include/enchant-2/enchant.h"
typedef void (*EnchantDictDescribeFn) (const char * const lang_tag,
           const char * const provider_name,
           const char * const provider_desc,
           const char * const provider_file,
           void * user_data);
# 363 "/usr/include/enchant-2/enchant.h"
void enchant_dict_describe (EnchantDict * dict,
       EnchantDictDescribeFn fn,
       void * user_data);
# 375 "/usr/include/enchant-2/enchant.h"
void enchant_broker_list_dicts (EnchantBroker * broker,
    EnchantDictDescribeFn fn,
    void * user_data);







void enchant_set_prefix_dir(const char *);
# 43 "pluma-spell-checker-language.c" 2

# 1 "/usr/include/glib-2.0/glib/gi18n.h" 1
# 23 "/usr/include/glib-2.0/glib/gi18n.h"
# 1 "/usr/include/glib-2.0/glib.h" 1
# 32 "/usr/include/glib-2.0/glib.h"
# 1 "/usr/include/glib-2.0/glib/galloca.h" 1
# 34 "/usr/include/glib-2.0/glib/galloca.h"
# 1 "/usr/include/glib-2.0/glib/gtypes.h" 1
# 34 "/usr/include/glib-2.0/glib/gtypes.h"
# 1 "/usr/lib64/glib-2.0/include/glibconfig.h" 1








# 1 "/usr/include/glib-2.0/glib/gmacros.h" 1
# 40 "/usr/include/glib-2.0/glib/gmacros.h"
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3
# 84 "/usr/bin/../lib/clang/19/include/stddef.h" 3
# 1 "/usr/bin/../lib/clang/19/include/__stddef_header_macro.h" 1 3
# 85 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3



# 1 "/usr/bin/../lib/clang/19/include/__stddef_ptrdiff_t.h" 1 3
# 18 "/usr/bin/../lib/clang/19/include/__stddef_ptrdiff_t.h" 3
typedef long int ptrdiff_t;
# 89 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3




# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3
# 103 "/usr/bin/../lib/clang/19/include/stddef.h" 3
# 1 "/usr/bin/../lib/clang/19/include/__stddef_wchar_t.h" 1 3
# 24 "/usr/bin/../lib/clang/19/include/__stddef_wchar_t.h" 3
typedef int wchar_t;
# 104 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3




# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3
# 123 "/usr/bin/../lib/clang/19/include/stddef.h" 3
# 1 "/usr/bin/../lib/clang/19/include/__stddef_max_align_t.h" 1 3
# 19 "/usr/bin/../lib/clang/19/include/__stddef_max_align_t.h" 3
typedef struct {
  long long __clang_max_align_nonce1
      __attribute__((__aligned__(__alignof__(long long))));
  long double __clang_max_align_nonce2
      __attribute__((__aligned__(__alignof__(long double))));
} max_align_t;
# 124 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3




# 1 "/usr/bin/../lib/clang/19/include/__stddef_offsetof.h" 1 3
# 129 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3
# 41 "/usr/include/glib-2.0/glib/gmacros.h" 2
# 10 "/usr/lib64/glib-2.0/include/glibconfig.h" 2

# 1 "/usr/bin/../lib/clang/19/include/limits.h" 1 3
# 25 "/usr/bin/../lib/clang/19/include/limits.h" 3
# 1 "/usr/include/limits.h" 1 3 4
# 26 "/usr/include/limits.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/limits.h" 2 3 4
# 195 "/usr/include/limits.h" 3 4
# 1 "/usr/include/bits/posix1_lim.h" 1 3 4
# 27 "/usr/include/bits/posix1_lim.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 28 "/usr/include/bits/posix1_lim.h" 2 3 4
# 161 "/usr/include/bits/posix1_lim.h" 3 4
# 1 "/usr/include/bits/local_lim.h" 1 3 4
# 38 "/usr/include/bits/local_lim.h" 3 4
# 1 "/usr/include/linux/limits.h" 1 3 4
# 39 "/usr/include/bits/local_lim.h" 2 3 4
# 81 "/usr/include/bits/local_lim.h" 3 4
# 1 "/usr/include/bits/pthread_stack_min-dynamic.h" 1 3 4
# 29 "/usr/include/bits/pthread_stack_min-dynamic.h" 3 4
# 1 "/usr/include/bits/pthread_stack_min.h" 1 3 4
# 30 "/usr/include/bits/pthread_stack_min-dynamic.h" 2 3 4
# 82 "/usr/include/bits/local_lim.h" 2 3 4
# 162 "/usr/include/bits/posix1_lim.h" 2 3 4
# 196 "/usr/include/limits.h" 2 3 4



# 1 "/usr/include/bits/posix2_lim.h" 1 3 4
# 200 "/usr/include/limits.h" 2 3 4
# 26 "/usr/bin/../lib/clang/19/include/limits.h" 2 3
# 12 "/usr/lib64/glib-2.0/include/glibconfig.h" 2
# 1 "/usr/bin/../lib/clang/19/include/float.h" 1 3
# 13 "/usr/lib64/glib-2.0/include/glibconfig.h" 2
# 45 "/usr/lib64/glib-2.0/include/glibconfig.h"
typedef signed char gint8;
typedef unsigned char guint8;

typedef signed short gint16;
typedef unsigned short guint16;






typedef signed int gint32;
typedef unsigned int guint32;
# 66 "/usr/lib64/glib-2.0/include/glibconfig.h"
typedef signed long gint64;
typedef unsigned long guint64;
# 82 "/usr/lib64/glib-2.0/include/glibconfig.h"
typedef signed long gssize;
typedef unsigned long gsize;
# 93 "/usr/lib64/glib-2.0/include/glibconfig.h"
typedef gint64 goffset;
# 109 "/usr/lib64/glib-2.0/include/glibconfig.h"
typedef signed long gintptr;
typedef unsigned long guintptr;
# 201 "/usr/lib64/glib-2.0/include/glibconfig.h"
typedef int GPid;
# 35 "/usr/include/glib-2.0/glib/gtypes.h" 2

# 1 "/usr/include/glib-2.0/glib/gversionmacros.h" 1
# 37 "/usr/include/glib-2.0/glib/gtypes.h" 2


# 1 "/usr/include/glib-2.0/glib/glib-visibility.h" 1
# 40 "/usr/include/glib-2.0/glib/gtypes.h" 2

# 1 "/usr/include/time.h" 1 3 4
# 29 "/usr/include/time.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 108 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 30 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/bits/time.h" 1 3 4
# 34 "/usr/include/time.h" 2 3 4





# 1 "/usr/include/bits/types/struct_tm.h" 1 3 4






struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  const char *tm_zone;




};
# 40 "/usr/include/time.h" 2 3 4








# 1 "/usr/include/bits/types/struct_itimerspec.h" 1 3 4







struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };
# 49 "/usr/include/time.h" 2 3 4
struct sigevent;
# 72 "/usr/include/time.h" 3 4
extern clock_t clock (void) __attribute__ ((__nothrow__ ));



extern time_t time (time_t *__timer) __attribute__ ((__nothrow__ ));


extern double difftime (time_t __time1, time_t __time0);


extern time_t mktime (struct tm *__tp) __attribute__ ((__nothrow__ ));
# 99 "/usr/include/time.h" 3 4
extern size_t strftime (char *__restrict __s, size_t __maxsize,
   const char *__restrict __format,
   const struct tm *__restrict __tp)
   __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 3, 4)));
# 116 "/usr/include/time.h" 3 4
extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     const char *__restrict __format,
     const struct tm *__restrict __tp,
     locale_t __loc) __attribute__ ((__nothrow__ ));
# 132 "/usr/include/time.h" 3 4
extern struct tm *gmtime (const time_t *__timer) __attribute__ ((__nothrow__ ));



extern struct tm *localtime (const time_t *__timer) __attribute__ ((__nothrow__ ));
# 154 "/usr/include/time.h" 3 4
extern struct tm *gmtime_r (const time_t *__restrict __timer,
       struct tm *__restrict __tp) __attribute__ ((__nothrow__ ));



extern struct tm *localtime_r (const time_t *__restrict __timer,
          struct tm *__restrict __tp) __attribute__ ((__nothrow__ ));
# 179 "/usr/include/time.h" 3 4
extern char *asctime (const struct tm *__tp) __attribute__ ((__nothrow__ ));



extern char *ctime (const time_t *__timer) __attribute__ ((__nothrow__ ));
# 197 "/usr/include/time.h" 3 4
extern char *asctime_r (const struct tm *__restrict __tp,
   char *__restrict __buf) __attribute__ ((__nothrow__ ));



extern char *ctime_r (const time_t *__restrict __timer,
        char *__restrict __buf) __attribute__ ((__nothrow__ ));
# 217 "/usr/include/time.h" 3 4
extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) __attribute__ ((__nothrow__ ));



extern int daylight;
extern long int timezone;
# 246 "/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) __attribute__ ((__nothrow__ ));
# 263 "/usr/include/time.h" 3 4
extern time_t timelocal (struct tm *__tp) __attribute__ ((__nothrow__ ));







extern int dysize (int __year) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
# 281 "/usr/include/time.h" 3 4
extern int nanosleep (const struct timespec *__requested_time,
        struct timespec *__remaining);


extern int clock_getres (clockid_t __clock_id, struct timespec *__res) __attribute__ ((__nothrow__ ));


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));


extern int clock_settime (clockid_t __clock_id, const struct timespec *__tp)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));
# 323 "/usr/include/time.h" 3 4
extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       const struct timespec *__req,
       struct timespec *__rem);
# 338 "/usr/include/time.h" 3 4
extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) __attribute__ ((__nothrow__ ));




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) __attribute__ ((__nothrow__ ));


extern int timer_delete (timer_t __timerid) __attribute__ ((__nothrow__ ));



extern int timer_settime (timer_t __timerid, int __flags,
     const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) __attribute__ ((__nothrow__ ));


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     __attribute__ ((__nothrow__ ));
# 376 "/usr/include/time.h" 3 4
extern int timer_getoverrun (timer_t __timerid) __attribute__ ((__nothrow__ ));






extern int timespec_get (struct timespec *__ts, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 42 "/usr/include/glib-2.0/glib/gtypes.h" 2
# 52 "/usr/include/glib-2.0/glib/gtypes.h"
typedef char gchar;
typedef short gshort;
typedef long glong;
typedef int gint;
typedef gint gboolean;

typedef unsigned char guchar;
typedef unsigned short gushort;
typedef unsigned long gulong;
typedef unsigned int guint;

typedef float gfloat;
typedef double gdouble;
# 109 "/usr/include/glib-2.0/glib/gtypes.h"
typedef void* gpointer;
typedef const void *gconstpointer;

typedef gint (*GCompareFunc) (gconstpointer a,
                                                 gconstpointer b);
typedef gint (*GCompareDataFunc) (gconstpointer a,
                                                 gconstpointer b,
       gpointer user_data);
typedef gboolean (*GEqualFunc) (gconstpointer a,
                                                 gconstpointer b);
# 136 "/usr/include/glib-2.0/glib/gtypes.h"
typedef gboolean (*GEqualFuncFull) (gconstpointer a,
                                                 gconstpointer b,
                                                 gpointer user_data);

typedef void (*GDestroyNotify) (gpointer data);
typedef void (*GFunc) (gpointer data,
                                                 gpointer user_data);
typedef guint (*GHashFunc) (gconstpointer key);
typedef void (*GHFunc) (gpointer key,
                                                 gpointer value,
                                                 gpointer user_data);
# 160 "/usr/include/glib-2.0/glib/gtypes.h"
typedef gpointer (*GCopyFunc) (gconstpointer src,
                                                 gpointer data);
# 170 "/usr/include/glib-2.0/glib/gtypes.h"
typedef void (*GFreeFunc) (gpointer data);
# 184 "/usr/include/glib-2.0/glib/gtypes.h"
typedef const gchar * (*GTranslateFunc) (const gchar *str,
       gpointer data);
# 528 "/usr/include/glib-2.0/glib/gtypes.h"
typedef union _GDoubleIEEE754 GDoubleIEEE754;
typedef union _GFloatIEEE754 GFloatIEEE754;





union _GFloatIEEE754
{
  gfloat v_float;
  struct {
    guint mantissa : 23;
    guint biased_exponent : 8;
    guint sign : 1;
  } mpn;
};
union _GDoubleIEEE754
{
  gdouble v_double;
  struct {
    guint mantissa_low : 32;
    guint mantissa_high : 20;
    guint biased_exponent : 11;
    guint sign : 1;
  } mpn;
};
# 578 "/usr/include/glib-2.0/glib/gtypes.h"
typedef struct _GTimeVal GTimeVal __attribute__((__deprecated__("Use '" "GDateTime" "' instead")));

struct _GTimeVal
{
  glong tv_sec;
  glong tv_usec;
} __attribute__((__deprecated__("Use '" "GDateTime" "' instead")));

typedef gint grefcount;
typedef gint gatomicrefcount;
# 35 "/usr/include/glib-2.0/glib/galloca.h" 2
# 33 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/garray.h" 1
# 38 "/usr/include/glib-2.0/glib/garray.h"
typedef struct _GBytes GBytes;
typedef struct _GArray GArray;
typedef struct _GByteArray GByteArray;
typedef struct _GPtrArray GPtrArray;

struct _GArray
{
  gchar *data;
  guint len;
};

struct _GByteArray
{
  guint8 *data;
  guint len;
};

struct _GPtrArray
{
  gpointer *pdata;
  guint len;
};
# 71 "/usr/include/glib-2.0/glib/garray.h"
 extern
GArray* g_array_new (gboolean zero_terminated,
       gboolean clear_,
       guint element_size);
 extern
GArray* g_array_new_take (gpointer data,
                                   gsize len,
                                   gboolean clear,
                                   gsize element_size);
 extern
GArray* g_array_new_take_zero_terminated (gpointer data,
                                          gboolean clear,
                                          gsize element_size);
 extern
gpointer g_array_steal (GArray *array,
                                   gsize *len);
 extern
GArray* g_array_sized_new (gboolean zero_terminated,
       gboolean clear_,
       guint element_size,
       guint reserved_size);
 extern
GArray* g_array_copy (GArray *array);
 extern
gchar* g_array_free (GArray *array,
       gboolean free_segment);
 extern
GArray *g_array_ref (GArray *array);
 extern
void g_array_unref (GArray *array);
 extern
guint g_array_get_element_size (GArray *array);
 extern
GArray* g_array_append_vals (GArray *array,
       gconstpointer data,
       guint len);
 extern
GArray* g_array_prepend_vals (GArray *array,
       gconstpointer data,
       guint len);
 extern
GArray* g_array_insert_vals (GArray *array,
       guint index_,
       gconstpointer data,
       guint len);
 extern
GArray* g_array_set_size (GArray *array,
       guint length);
 extern
GArray* g_array_remove_index (GArray *array,
       guint index_);
 extern
GArray* g_array_remove_index_fast (GArray *array,
       guint index_);
 extern
GArray* g_array_remove_range (GArray *array,
       guint index_,
       guint length);
 extern
void g_array_sort (GArray *array,
       GCompareFunc compare_func);
 extern
void g_array_sort_with_data (GArray *array,
       GCompareDataFunc compare_func,
       gpointer user_data);
 extern
gboolean g_array_binary_search (GArray *array,
                                   gconstpointer target,
                                   GCompareFunc compare_func,
                                   guint *out_match_index);
 extern
void g_array_set_clear_func (GArray *array,
                                   GDestroyNotify clear_func);






 extern
GPtrArray* g_ptr_array_new (void);
 extern
GPtrArray* g_ptr_array_new_with_free_func (GDestroyNotify element_free_func);
 extern
GPtrArray* g_ptr_array_new_take (gpointer *data,
                                           gsize len,
                                           GDestroyNotify element_free_func);
 extern
GPtrArray* g_ptr_array_new_from_array (gpointer *data,
                                           gsize len,
                                           GCopyFunc copy_func,
                                           gpointer copy_func_user_data,
                                           GDestroyNotify element_free_func);
 extern
gpointer* g_ptr_array_steal (GPtrArray *array,
                                            gsize *len);
 extern
GPtrArray *g_ptr_array_copy (GPtrArray *array,
                                           GCopyFunc func,
                                           gpointer user_data);
 extern
GPtrArray* g_ptr_array_sized_new (guint reserved_size);
 extern
GPtrArray* g_ptr_array_new_full (guint reserved_size,
        GDestroyNotify element_free_func);
 extern
GPtrArray* g_ptr_array_new_null_terminated (guint reserved_size,
                                            GDestroyNotify element_free_func,
                                            gboolean null_terminated);
 extern
GPtrArray* g_ptr_array_new_take_null_terminated (gpointer *data,
                                                  GDestroyNotify element_free_func);
 extern
GPtrArray* g_ptr_array_new_from_null_terminated_array (gpointer *data,
                                                       GCopyFunc copy_func,
                                                       gpointer copy_func_user_data,
                                                       GDestroyNotify element_free_func);
 extern
gpointer* g_ptr_array_free (GPtrArray *array,
        gboolean free_seg);
 extern
GPtrArray* g_ptr_array_ref (GPtrArray *array);
 extern
void g_ptr_array_unref (GPtrArray *array);
 extern
void g_ptr_array_set_free_func (GPtrArray *array,
                                           GDestroyNotify element_free_func);
 extern
void g_ptr_array_set_size (GPtrArray *array,
        gint length);
 extern
gpointer g_ptr_array_remove_index (GPtrArray *array,
        guint index_);
 extern
gpointer g_ptr_array_remove_index_fast (GPtrArray *array,
        guint index_);
 extern
gpointer g_ptr_array_steal_index (GPtrArray *array,
                                           guint index_);
 extern
gpointer g_ptr_array_steal_index_fast (GPtrArray *array,
                                           guint index_);
 extern
gboolean g_ptr_array_remove (GPtrArray *array,
        gpointer data);
 extern
gboolean g_ptr_array_remove_fast (GPtrArray *array,
        gpointer data);
 extern
GPtrArray *g_ptr_array_remove_range (GPtrArray *array,
        guint index_,
        guint length);
 extern
void g_ptr_array_add (GPtrArray *array,
        gpointer data);
 extern
void g_ptr_array_extend (GPtrArray *array_to_extend,
                                           GPtrArray *array,
                                           GCopyFunc func,
                                           gpointer user_data);
 extern
void g_ptr_array_extend_and_steal (GPtrArray *array_to_extend,
                                           GPtrArray *array);
 extern
void g_ptr_array_insert (GPtrArray *array,
                                           gint index_,
                                           gpointer data);
 extern
void g_ptr_array_sort (GPtrArray *array,
        GCompareFunc compare_func);
 extern
void g_ptr_array_sort_with_data (GPtrArray *array,
        GCompareDataFunc compare_func,
        gpointer user_data);
 extern
void g_ptr_array_sort_values (GPtrArray *array,
                                           GCompareFunc compare_func);
 extern
void g_ptr_array_sort_values_with_data (GPtrArray *array,
                                              GCompareDataFunc compare_func,
                                              gpointer user_data);
 extern
void g_ptr_array_foreach (GPtrArray *array,
        GFunc func,
        gpointer user_data);
 extern
gboolean g_ptr_array_find (GPtrArray *haystack,
                                           gconstpointer needle,
                                           guint *index_);
 extern
gboolean g_ptr_array_find_with_equal_func (GPtrArray *haystack,
                                             gconstpointer needle,
                                             GEqualFunc equal_func,
                                             guint *index_);

 extern
gboolean g_ptr_array_is_null_terminated (GPtrArray *array);





 extern
GByteArray* g_byte_array_new (void);
 extern
GByteArray* g_byte_array_new_take (guint8 *data,
                                            gsize len);
 extern
guint8* g_byte_array_steal (GByteArray *array,
                                            gsize *len);
 extern
GByteArray* g_byte_array_sized_new (guint reserved_size);
 extern
guint8* g_byte_array_free (GByteArray *array,
         gboolean free_segment);
 extern
GBytes* g_byte_array_free_to_bytes (GByteArray *array);
 extern
GByteArray *g_byte_array_ref (GByteArray *array);
 extern
void g_byte_array_unref (GByteArray *array);
 extern
GByteArray* g_byte_array_append (GByteArray *array,
         const guint8 *data,
         guint len);
 extern
GByteArray* g_byte_array_prepend (GByteArray *array,
         const guint8 *data,
         guint len);
 extern
GByteArray* g_byte_array_set_size (GByteArray *array,
         guint length);
 extern
GByteArray* g_byte_array_remove_index (GByteArray *array,
         guint index_);
 extern
GByteArray* g_byte_array_remove_index_fast (GByteArray *array,
         guint index_);
 extern
GByteArray* g_byte_array_remove_range (GByteArray *array,
         guint index_,
         guint length);
 extern
void g_byte_array_sort (GByteArray *array,
         GCompareFunc compare_func);
 extern
void g_byte_array_sort_with_data (GByteArray *array,
         GCompareDataFunc compare_func,
         gpointer user_data);
# 34 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gasyncqueue.h" 1
# 34 "/usr/include/glib-2.0/glib/gasyncqueue.h"
# 1 "/usr/include/glib-2.0/glib/gthread.h" 1
# 34 "/usr/include/glib-2.0/glib/gthread.h"
# 1 "/usr/include/glib-2.0/glib/gatomic.h" 1
# 30 "/usr/include/glib-2.0/glib/gatomic.h"
# 1 "/usr/include/glib-2.0/glib/glib-typeof.h" 1
# 31 "/usr/include/glib-2.0/glib/gatomic.h" 2



 extern
gint g_atomic_int_get (const volatile gint *atomic);
 extern
void g_atomic_int_set (volatile gint *atomic,
                                                               gint newval);
 extern
void g_atomic_int_inc (volatile gint *atomic);
 extern
gboolean g_atomic_int_dec_and_test (volatile gint *atomic);
 extern
gboolean g_atomic_int_compare_and_exchange (volatile gint *atomic,
                                                               gint oldval,
                                                               gint newval);
 extern
gboolean g_atomic_int_compare_and_exchange_full (gint *atomic,
                                                                gint oldval,
                                                                gint newval,
                                                                gint *preval);
 extern
gint g_atomic_int_exchange (gint *atomic,
                                                               gint newval);
 extern
gint g_atomic_int_add (volatile gint *atomic,
                                                               gint val);
 extern
guint g_atomic_int_and (volatile guint *atomic,
                                                               guint val);
 extern
guint g_atomic_int_or (volatile guint *atomic,
                                                               guint val);
 extern
guint g_atomic_int_xor (volatile guint *atomic,
                                                               guint val);

 extern
gpointer g_atomic_pointer_get (const volatile void *atomic);
 extern
void g_atomic_pointer_set (volatile void *atomic,
                                                               gpointer newval);
 extern
gboolean g_atomic_pointer_compare_and_exchange (volatile void *atomic,
                                                               gpointer oldval,
                                                               gpointer newval);
 extern
gboolean g_atomic_pointer_compare_and_exchange_full (void *atomic,
                                                                    gpointer oldval,
                                                                    gpointer newval,
                                                                    void *preval);
 extern
gpointer g_atomic_pointer_exchange (void *atomic,
                                                               gpointer newval);
 extern
gintptr g_atomic_pointer_add (volatile void *atomic,
                                                               gssize val);
 extern
guintptr g_atomic_pointer_and (volatile void *atomic,
                                                               gsize val);
 extern
guintptr g_atomic_pointer_or (volatile void *atomic,
                                                               gsize val);
 extern
guintptr g_atomic_pointer_xor (volatile void *atomic,
                                                               gsize val);

__attribute__((__deprecated__("Use '" "g_atomic_int_add" "' instead"))) extern
gint g_atomic_int_exchange_and_add (volatile gint *atomic,
                                                               gint val);
# 35 "/usr/include/glib-2.0/glib/gthread.h" 2
# 1 "/usr/include/glib-2.0/glib/gerror.h" 1
# 28 "/usr/include/glib-2.0/glib/gerror.h"
# 1 "/usr/bin/../lib/clang/19/include/stdarg.h" 1 3
# 47 "/usr/bin/../lib/clang/19/include/stdarg.h" 3
# 1 "/usr/bin/../lib/clang/19/include/__stdarg_header_macro.h" 1 3
# 48 "/usr/bin/../lib/clang/19/include/stdarg.h" 2 3



# 1 "/usr/bin/../lib/clang/19/include/__stdarg___gnuc_va_list.h" 1 3
# 12 "/usr/bin/../lib/clang/19/include/__stdarg___gnuc_va_list.h" 3
typedef __builtin_va_list __gnuc_va_list;
# 52 "/usr/bin/../lib/clang/19/include/stdarg.h" 2 3




# 1 "/usr/bin/../lib/clang/19/include/__stdarg_va_list.h" 1 3
# 12 "/usr/bin/../lib/clang/19/include/__stdarg_va_list.h" 3
typedef __builtin_va_list va_list;
# 57 "/usr/bin/../lib/clang/19/include/stdarg.h" 2 3




# 1 "/usr/bin/../lib/clang/19/include/__stdarg_va_arg.h" 1 3
# 62 "/usr/bin/../lib/clang/19/include/stdarg.h" 2 3




# 1 "/usr/bin/../lib/clang/19/include/__stdarg___va_copy.h" 1 3
# 67 "/usr/bin/../lib/clang/19/include/stdarg.h" 2 3




# 1 "/usr/bin/../lib/clang/19/include/__stdarg_va_copy.h" 1 3
# 72 "/usr/bin/../lib/clang/19/include/stdarg.h" 2 3
# 29 "/usr/include/glib-2.0/glib/gerror.h" 2

# 1 "/usr/include/glib-2.0/glib/gquark.h" 1
# 38 "/usr/include/glib-2.0/glib/gquark.h"
typedef guint32 GQuark;



 extern
GQuark g_quark_try_string (const gchar *string);
 extern
GQuark g_quark_from_static_string (const gchar *string);
 extern
GQuark g_quark_from_string (const gchar *string);
 extern
const gchar * g_quark_to_string (GQuark quark) __attribute__ ((__const__));
# 63 "/usr/include/glib-2.0/glib/gquark.h"
 extern
const gchar * g_intern_string (const gchar *string);
 extern
const gchar * g_intern_static_string (const gchar *string);
# 31 "/usr/include/glib-2.0/glib/gerror.h" 2
# 43 "/usr/include/glib-2.0/glib/gerror.h"
typedef struct _GError GError;

struct _GError
{
  GQuark domain;
  gint code;
  gchar *message;
};
# 142 "/usr/include/glib-2.0/glib/gerror.h"
typedef void (*GErrorInitFunc) (GError *error);
# 160 "/usr/include/glib-2.0/glib/gerror.h"
typedef void (*GErrorCopyFunc) (const GError *src_error, GError *dest_error);
# 175 "/usr/include/glib-2.0/glib/gerror.h"
typedef void (*GErrorClearFunc) (GError *error);

 extern
GQuark g_error_domain_register_static (const char *error_type_name,
                                         gsize error_type_private_size,
                                         GErrorInitFunc error_type_init,
                                         GErrorCopyFunc error_type_copy,
                                         GErrorClearFunc error_type_clear);

 extern
GQuark g_error_domain_register (const char *error_type_name,
                                  gsize error_type_private_size,
                                  GErrorInitFunc error_type_init,
                                  GErrorCopyFunc error_type_copy,
                                  GErrorClearFunc error_type_clear);

 extern
GError* g_error_new (GQuark domain,
                                gint code,
                                const gchar *format,
                                ...) __attribute__((__format__ (__printf__, 3, 4)));

 extern
GError* g_error_new_literal (GQuark domain,
                                gint code,
                                const gchar *message);
 extern
GError* g_error_new_valist (GQuark domain,
                                gint code,
                                const gchar *format,
                                va_list args) __attribute__((__format__ (__printf__, 3, 0)));

 extern
void g_error_free (GError *error);
 extern
GError* g_error_copy (const GError *error);

 extern
gboolean g_error_matches (const GError *error,
                                GQuark domain,
                                gint code);




 extern
void g_set_error (GError **err,
                                GQuark domain,
                                gint code,
                                const gchar *format,
                                ...) __attribute__((__format__ (__printf__, 4, 5)));

 extern
void g_set_error_literal (GError **err,
                                GQuark domain,
                                gint code,
                                const gchar *message);



 extern
void g_propagate_error (GError **dest,
    GError *src);


 extern
void g_clear_error (GError **err);


 extern
void g_prefix_error (GError **err,
                                       const gchar *format,
                                       ...) __attribute__((__format__ (__printf__, 2, 3)));


 extern
void g_prefix_error_literal (GError **err,
                                       const gchar *prefix);


 extern
void g_propagate_prefixed_error (GError **dest,
                                       GError *src,
                                       const gchar *format,
                                       ...) __attribute__((__format__ (__printf__, 3, 4)));
# 36 "/usr/include/glib-2.0/glib/gthread.h" 2
# 1 "/usr/include/glib-2.0/glib/gutils.h" 1
# 35 "/usr/include/glib-2.0/glib/gutils.h"
# 1 "/usr/bin/../lib/clang/19/include/stdarg.h" 1 3
# 36 "/usr/include/glib-2.0/glib/gutils.h" 2



 extern
const gchar * g_get_user_name (void);
 extern
const gchar * g_get_real_name (void);
 extern
const gchar * g_get_home_dir (void);
 extern
const gchar * g_get_tmp_dir (void);
 extern
const gchar * g_get_host_name (void);
 extern
const gchar * g_get_prgname (void);
 extern
void g_set_prgname (const gchar *prgname);
 extern
const gchar * g_get_application_name (void);
 extern
void g_set_application_name (const gchar *application_name);
 extern
gchar * g_get_os_info (const gchar *key_name);
# 181 "/usr/include/glib-2.0/glib/gutils.h"
 extern
void g_reload_user_special_dirs_cache (void);
 extern
const gchar * g_get_user_data_dir (void);
 extern
const gchar * g_get_user_config_dir (void);
 extern
const gchar * g_get_user_cache_dir (void);
 extern
const gchar * g_get_user_state_dir (void);
 extern
const gchar * const * g_get_system_data_dirs (void);
# 213 "/usr/include/glib-2.0/glib/gutils.h"
 extern
const gchar * const * g_get_system_config_dirs (void);

 extern
const gchar * g_get_user_runtime_dir (void);
# 241 "/usr/include/glib-2.0/glib/gutils.h"
typedef enum {
  G_USER_DIRECTORY_DESKTOP,
  G_USER_DIRECTORY_DOCUMENTS,
  G_USER_DIRECTORY_DOWNLOAD,
  G_USER_DIRECTORY_MUSIC,
  G_USER_DIRECTORY_PICTURES,
  G_USER_DIRECTORY_PUBLIC_SHARE,
  G_USER_DIRECTORY_TEMPLATES,
  G_USER_DIRECTORY_VIDEOS,

  G_USER_N_DIRECTORIES
} GUserDirectory;

 extern
const gchar * g_get_user_special_dir (GUserDirectory directory);
# 265 "/usr/include/glib-2.0/glib/gutils.h"
typedef struct _GDebugKey GDebugKey;
struct _GDebugKey
{
  const gchar *key;
  guint value;
};



 extern
guint g_parse_debug_string (const gchar *string,
         const GDebugKey *keys,
         guint nkeys);

 extern
gint g_snprintf (gchar *string,
         gulong n,
         gchar const *format,
         ...) __attribute__((__format__ (__printf__, 3, 4)));
 extern
gint g_vsnprintf (gchar *string,
         gulong n,
         gchar const *format,
         va_list args)
         __attribute__((__format__ (__printf__, 3, 0)));

 extern
void g_nullify_pointer (gpointer *nullify_location);

typedef enum
{
  G_FORMAT_SIZE_DEFAULT = 0,
  G_FORMAT_SIZE_LONG_FORMAT = 1 << 0,
  G_FORMAT_SIZE_IEC_UNITS = 1 << 1,
  G_FORMAT_SIZE_BITS = 1 << 2,
  G_FORMAT_SIZE_ONLY_VALUE = 1 << 3,
  G_FORMAT_SIZE_ONLY_UNIT = 1 << 4
} GFormatSizeFlags;

 extern
gchar *g_format_size_full (guint64 size,
                             GFormatSizeFlags flags);
 extern
gchar *g_format_size (guint64 size);

__attribute__((__deprecated__("Use '" "g_format_size" "' instead"))) extern
gchar *g_format_size_for_display (goffset size);
# 324 "/usr/include/glib-2.0/glib/gutils.h"
typedef void (*GVoidFunc) (void) __attribute__((__deprecated__));


#pragma clang diagnostic push
# 327 "/usr/include/glib-2.0/glib/gutils.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
__attribute__((__deprecated__)) extern
void g_atexit (GVoidFunc func);
#pragma clang diagnostic pop
# 347 "/usr/include/glib-2.0/glib/gutils.h"
 extern
gchar* g_find_program_in_path (const gchar *program);
# 365 "/usr/include/glib-2.0/glib/gutils.h"
 extern
gint (g_bit_nth_lsf) (gulong mask,
                                 gint nth_bit);
 extern
gint (g_bit_nth_msf) (gulong mask,
                                 gint nth_bit);
 extern
guint (g_bit_storage) (gulong number);

static inline gint
g_bit_nth_lsf_impl (gulong mask,
                    gint nth_bit)
{
  if ((__builtin_expect (__extension__ ({ int _g_boolean_var_0; if (nth_bit < -1) _g_boolean_var_0 = 1; else _g_boolean_var_0 = 0; _g_boolean_var_0; }), 0)))
    nth_bit = -1;
  while (nth_bit < ((8 * 8) - 1))
    {
      nth_bit++;
      if (mask & (1UL << nth_bit))
        return nth_bit;
    }
  return -1;
}

static inline gint
g_bit_nth_msf_impl (gulong mask,
                    gint nth_bit)
{
  if (nth_bit < 0 || (__builtin_expect (__extension__ ({ int _g_boolean_var_1; if (nth_bit > 8 * 8) _g_boolean_var_1 = 1; else _g_boolean_var_1 = 0; _g_boolean_var_1; }), 0)))
    nth_bit = 8 * 8;
  while (nth_bit > 0)
    {
      nth_bit--;
      if (mask & (1UL << nth_bit))
        return nth_bit;
    }
  return -1;
}

static inline guint
g_bit_storage_impl (gulong number)
{

  return (__builtin_expect (__extension__ ({ int _g_boolean_var_2; if (number) _g_boolean_var_2 = 1; else _g_boolean_var_2 = 0; _g_boolean_var_2; }), 1)) ?
           ((8 * 8U - 1) ^ (guint) __builtin_clzl(number)) + 1 : 1;
# 421 "/usr/include/glib-2.0/glib/gutils.h"
}




# 1 "/usr/include/stdlib.h" 1 3 4
# 26 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 27 "/usr/include/stdlib.h" 2 3 4





# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 103 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_wchar_t.h" 1 3 4
# 104 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4




# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 33 "/usr/include/stdlib.h" 2 3 4







# 1 "/usr/include/bits/waitflags.h" 1 3 4
# 41 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/bits/waitstatus.h" 1 3 4
# 42 "/usr/include/stdlib.h" 2 3 4
# 56 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/bits/floatn.h" 1 3 4
# 119 "/usr/include/bits/floatn.h" 3 4
# 1 "/usr/include/bits/floatn-common.h" 1 3 4
# 24 "/usr/include/bits/floatn-common.h" 3 4
# 1 "/usr/include/bits/long-double.h" 1 3 4
# 25 "/usr/include/bits/floatn-common.h" 2 3 4
# 214 "/usr/include/bits/floatn-common.h" 3 4
typedef float _Float32;
# 251 "/usr/include/bits/floatn-common.h" 3 4
typedef double _Float64;
# 268 "/usr/include/bits/floatn-common.h" 3 4
typedef double _Float32x;
# 285 "/usr/include/bits/floatn-common.h" 3 4
typedef long double _Float64x;
# 120 "/usr/include/bits/floatn.h" 2 3 4
# 57 "/usr/include/stdlib.h" 2 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;





__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;
# 98 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ )) ;



extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;



extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 177 "/usr/include/stdlib.h" 3 4
extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 480 "/usr/include/stdlib.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ )) atoi (const char *__nptr)
{
  return (int) strtol (__nptr, (char **) ((void*)0), 10);
}
extern __inline __attribute__ ((__gnu_inline__)) long int
__attribute__ ((__nothrow__ )) atol (const char *__nptr)
{
  return strtol (__nptr, (char **) ((void*)0), 10);
}


__extension__ extern __inline __attribute__ ((__gnu_inline__)) long long int
__attribute__ ((__nothrow__ )) atoll (const char *__nptr)
{
  return strtoll (__nptr, (char **) ((void*)0), 10);
}
# 505 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ )) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
# 521 "/usr/include/stdlib.h" 3 4
extern long int random (void) __attribute__ ((__nothrow__ ));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ ));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));





extern int rand (void) __attribute__ ((__nothrow__ ));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ ));



extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ ));







extern double drand48 (void) __attribute__ ((__nothrow__ ));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ ));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ ));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ ));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern __uint32_t arc4random (void)
     __attribute__ ((__nothrow__ )) ;


extern void arc4random_buf (void *__buf, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern __uint32_t arc4random_uniform (__uint32_t __upper_bound)
     __attribute__ ((__nothrow__ )) ;




extern void *malloc (size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__))
                                         ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;






extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__)) ;


extern void free (void *__ptr) __attribute__ ((__nothrow__ ));







extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__warn_unused_result__))

                       ;


extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ )) ;



# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ ));
# 707 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__))
                                         ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;




extern void *aligned_alloc (size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) __attribute__ ((__alloc_align__ (1)))
                                         ;



extern void abort (void) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







extern int at_quick_exit (void (*__func) (void)) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));






extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





extern void exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));





extern void quick_exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));





extern void _Exit (int __status) __attribute__ ((__nothrow__ )) __attribute__ ((__noreturn__));




extern char *getenv (const char *__name) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 786 "/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ ));
# 814 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 827 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 849 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 870 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 923 "/usr/include/stdlib.h" 3 4
extern int system (const char *__command) ;
# 940 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ )) ;






typedef int (*__compar_fn_t) (const void *, const void *);
# 960 "/usr/include/stdlib.h" 3 4
extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;


# 1 "/usr/include/bits/stdlib-bsearch.h" 1 3 4
# 19 "/usr/include/bits/stdlib-bsearch.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) void *
bsearch (const void *__key, const void *__base, size_t __nmemb, size_t __size,
  __compar_fn_t __compar)
{
  size_t __l, __u, __idx;
  const void *__p;
  int __comparison;

  __l = 0;
  __u = __nmemb;
  while (__l < __u)
    {
      __idx = (__l + __u) / 2;
      __p = (const void *) (((const char *) __base) + (__idx * __size));
      __comparison = (*__compar) (__key, __p);
      if (__comparison < 0)
 __u = __idx;
      else if (__comparison > 0)
 __l = __idx + 1;
      else
 {




   return (void *) __p;



 }
    }

  return ((void*)0);
}
# 966 "/usr/include/stdlib.h" 2 3 4




extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 980 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;


__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;






extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;


__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ )) __attribute__ ((__const__)) ;
# 1012 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3, 4, 5)));





extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ ));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ ));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ ));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ ))
                                      ;

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ ))

                                    ;






extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) ;
# 1099 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 1145 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 1155 "/usr/include/stdlib.h" 3 4
# 1 "/usr/include/bits/stdlib-float.h" 1 3 4
# 24 "/usr/include/bits/stdlib-float.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) double
__attribute__ ((__nothrow__ )) atof (const char *__nptr)
{
  return strtod (__nptr, (char **) ((void*)0));
}
# 1156 "/usr/include/stdlib.h" 2 3 4
# 427 "/usr/include/glib-2.0/glib/gutils.h" 2
# 37 "/usr/include/glib-2.0/glib/gthread.h" 2




 extern
GQuark g_thread_error_quark (void);

typedef enum
{
  G_THREAD_ERROR_AGAIN
} GThreadError;

typedef gpointer (*GThreadFunc) (gpointer data);

typedef struct _GThread GThread;

typedef union _GMutex GMutex;
typedef struct _GRecMutex GRecMutex;
typedef struct _GRWLock GRWLock;
typedef struct _GCond GCond;
typedef struct _GPrivate GPrivate;
typedef struct _GOnce GOnce;

union _GMutex
{

  gpointer p;
  guint i[2];
};

struct _GRWLock
{

  gpointer p;
  guint i[2];
};

struct _GCond
{

  gpointer p;
  guint i[2];
};

struct _GRecMutex
{

  gpointer p;
  guint i[2];
};


struct _GPrivate
{

  gpointer p;
  GDestroyNotify notify;
  gpointer future[2];
};

typedef enum
{
  G_ONCE_STATUS_NOTCALLED,
  G_ONCE_STATUS_PROGRESS,
  G_ONCE_STATUS_READY
} GOnceStatus;


struct _GOnce
{
  volatile GOnceStatus status;
  volatile gpointer retval;
};
# 146 "/usr/include/glib-2.0/glib/gthread.h"
 extern
GThread * g_thread_ref (GThread *thread);
 extern
void g_thread_unref (GThread *thread);
 extern
GThread * g_thread_new (const gchar *name,
                                                 GThreadFunc func,
                                                 gpointer data);
 extern
GThread * g_thread_try_new (const gchar *name,
                                                 GThreadFunc func,
                                                 gpointer data,
                                                 GError **error);
 extern
GThread * g_thread_self (void);
__attribute__ ((__noreturn__)) extern
void g_thread_exit (gpointer retval);
 extern
gpointer g_thread_join (GThread *thread);
 extern
void g_thread_yield (void);


 extern
void g_mutex_init (GMutex *mutex);
 extern
void g_mutex_clear (GMutex *mutex);
 extern
void g_mutex_lock (GMutex *mutex);
 extern
gboolean g_mutex_trylock (GMutex *mutex);
 extern
void g_mutex_unlock (GMutex *mutex);

 extern
void g_rw_lock_init (GRWLock *rw_lock);
 extern
void g_rw_lock_clear (GRWLock *rw_lock);
 extern
void g_rw_lock_writer_lock (GRWLock *rw_lock);
 extern
gboolean g_rw_lock_writer_trylock (GRWLock *rw_lock);
 extern
void g_rw_lock_writer_unlock (GRWLock *rw_lock);
 extern
void g_rw_lock_reader_lock (GRWLock *rw_lock);
 extern
gboolean g_rw_lock_reader_trylock (GRWLock *rw_lock);
 extern
void g_rw_lock_reader_unlock (GRWLock *rw_lock);

 extern
void g_rec_mutex_init (GRecMutex *rec_mutex);
 extern
void g_rec_mutex_clear (GRecMutex *rec_mutex);
 extern
void g_rec_mutex_lock (GRecMutex *rec_mutex);
 extern
gboolean g_rec_mutex_trylock (GRecMutex *rec_mutex);
 extern
void g_rec_mutex_unlock (GRecMutex *rec_mutex);

 extern
void g_cond_init (GCond *cond);
 extern
void g_cond_clear (GCond *cond);
 extern
void g_cond_wait (GCond *cond,
                                                 GMutex *mutex);
 extern
void g_cond_signal (GCond *cond);
 extern
void g_cond_broadcast (GCond *cond);
 extern
gboolean g_cond_wait_until (GCond *cond,
                                                 GMutex *mutex,
                                                 gint64 end_time);

 extern
gpointer g_private_get (GPrivate *key);
 extern
void g_private_set (GPrivate *key,
                                                 gpointer value);
 extern
void g_private_replace (GPrivate *key,
                                                 gpointer value);

 extern
gpointer g_once_impl (GOnce *once,
                                                 GThreadFunc func,
                                                 gpointer arg);
 extern
gboolean g_once_init_enter (volatile void *location);
 extern
void g_once_init_leave (volatile void *location,
                                                 gsize result);

 extern
gboolean g_once_init_enter_pointer (void *location);
 extern
void g_once_init_leave_pointer (void *location,
                                                 gpointer result);
# 307 "/usr/include/glib-2.0/glib/gthread.h"
 extern
guint g_get_num_processors (void);







typedef void GMutexLocker;
# 365 "/usr/include/glib-2.0/glib/gthread.h"
static inline GMutexLocker *
g_mutex_locker_new (GMutex *mutex)
{
  g_mutex_lock (mutex);
  return (GMutexLocker *) mutex;
}
# 383 "/usr/include/glib-2.0/glib/gthread.h"
static inline void
g_mutex_locker_free (GMutexLocker *locker)
{
  g_mutex_unlock ((GMutex *) locker);
}
# 438 "/usr/include/glib-2.0/glib/gthread.h"
typedef void GRecMutexLocker;
# 486 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic push
# 486 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static inline GRecMutexLocker *
g_rec_mutex_locker_new (GRecMutex *rec_mutex)
{
  g_rec_mutex_lock (rec_mutex);
  return (GRecMutexLocker *) rec_mutex;
}
#pragma clang diagnostic pop
# 506 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic push
# 506 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static inline void
g_rec_mutex_locker_free (GRecMutexLocker *locker)
{
  g_rec_mutex_unlock ((GRecMutex *) locker);
}
#pragma clang diagnostic pop
# 564 "/usr/include/glib-2.0/glib/gthread.h"
typedef void GRWLockWriterLocker;
# 643 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic push
# 643 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static inline GRWLockWriterLocker *
g_rw_lock_writer_locker_new (GRWLock *rw_lock)
{
  g_rw_lock_writer_lock (rw_lock);
  return (GRWLockWriterLocker *) rw_lock;
}
#pragma clang diagnostic pop
# 664 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic push
# 664 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static inline void
g_rw_lock_writer_locker_free (GRWLockWriterLocker *locker)
{
  g_rw_lock_writer_unlock ((GRWLock *) locker);
}
#pragma clang diagnostic pop
# 722 "/usr/include/glib-2.0/glib/gthread.h"
typedef void GRWLockReaderLocker;
# 741 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic push
# 741 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static inline GRWLockReaderLocker *
g_rw_lock_reader_locker_new (GRWLock *rw_lock)
{
  g_rw_lock_reader_lock (rw_lock);
  return (GRWLockReaderLocker *) rw_lock;
}
#pragma clang diagnostic pop
# 762 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic push
# 762 "/usr/include/glib-2.0/glib/gthread.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static inline void
g_rw_lock_reader_locker_free (GRWLockReaderLocker *locker)
{
  g_rw_lock_reader_unlock ((GRWLock *) locker);
}
#pragma clang diagnostic pop
# 35 "/usr/include/glib-2.0/glib/gasyncqueue.h" 2



typedef struct _GAsyncQueue GAsyncQueue;

 extern
GAsyncQueue *g_async_queue_new (void);
 extern
GAsyncQueue *g_async_queue_new_full (GDestroyNotify item_free_func);
 extern
void g_async_queue_lock (GAsyncQueue *queue);
 extern
void g_async_queue_unlock (GAsyncQueue *queue);
 extern
GAsyncQueue *g_async_queue_ref (GAsyncQueue *queue);
 extern
void g_async_queue_unref (GAsyncQueue *queue);

__attribute__((__deprecated__("Use '" "g_async_queue_ref" "' instead"))) extern
void g_async_queue_ref_unlocked (GAsyncQueue *queue);

__attribute__((__deprecated__("Use '" "g_async_queue_unref" "' instead"))) extern
void g_async_queue_unref_and_unlock (GAsyncQueue *queue);

 extern
void g_async_queue_push (GAsyncQueue *queue,
                                                 gpointer data);
 extern
void g_async_queue_push_unlocked (GAsyncQueue *queue,
                                                 gpointer data);
 extern
void g_async_queue_push_sorted (GAsyncQueue *queue,
                                                 gpointer data,
                                                 GCompareDataFunc func,
                                                 gpointer user_data);
 extern
void g_async_queue_push_sorted_unlocked (GAsyncQueue *queue,
                                                 gpointer data,
                                                 GCompareDataFunc func,
                                                 gpointer user_data);
 extern
gpointer g_async_queue_pop (GAsyncQueue *queue);
 extern
gpointer g_async_queue_pop_unlocked (GAsyncQueue *queue);
 extern
gpointer g_async_queue_try_pop (GAsyncQueue *queue);
 extern
gpointer g_async_queue_try_pop_unlocked (GAsyncQueue *queue);
 extern
gpointer g_async_queue_timeout_pop (GAsyncQueue *queue,
                                                 guint64 timeout);
 extern
gpointer g_async_queue_timeout_pop_unlocked (GAsyncQueue *queue,
                                                 guint64 timeout);
 extern
gint g_async_queue_length (GAsyncQueue *queue);
 extern
gint g_async_queue_length_unlocked (GAsyncQueue *queue);
 extern
void g_async_queue_sort (GAsyncQueue *queue,
                                                 GCompareDataFunc func,
                                                 gpointer user_data);
 extern
void g_async_queue_sort_unlocked (GAsyncQueue *queue,
                                                 GCompareDataFunc func,
                                                 gpointer user_data);

 extern
gboolean g_async_queue_remove (GAsyncQueue *queue,
                                                 gpointer item);
 extern
gboolean g_async_queue_remove_unlocked (GAsyncQueue *queue,
                                                 gpointer item);
 extern
void g_async_queue_push_front (GAsyncQueue *queue,
                                                 gpointer item);
 extern
void g_async_queue_push_front_unlocked (GAsyncQueue *queue,
                                                 gpointer item);

#pragma clang diagnostic push
# 115 "/usr/include/glib-2.0/glib/gasyncqueue.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
__attribute__((__deprecated__("Use '" "g_async_queue_timeout_pop" "' instead"))) extern
gpointer g_async_queue_timed_pop (GAsyncQueue *queue,
                                                 GTimeVal *end_time);
__attribute__((__deprecated__("Use '" "g_async_queue_timeout_pop_unlocked" "' instead"))) extern
gpointer g_async_queue_timed_pop_unlocked (GAsyncQueue *queue,
                                                 GTimeVal *end_time);
#pragma clang diagnostic pop
# 35 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gbacktrace.h" 1
# 38 "/usr/include/glib-2.0/glib/gbacktrace.h"
# 1 "/usr/include/signal.h" 1 3 4
# 30 "/usr/include/signal.h" 3 4
# 1 "/usr/include/bits/signum-generic.h" 1 3 4
# 76 "/usr/include/bits/signum-generic.h" 3 4
# 1 "/usr/include/bits/signum-arch.h" 1 3 4
# 77 "/usr/include/bits/signum-generic.h" 2 3 4
# 31 "/usr/include/signal.h" 2 3 4

# 1 "/usr/include/bits/types/sig_atomic_t.h" 1 3 4







typedef __sig_atomic_t sig_atomic_t;
# 33 "/usr/include/signal.h" 2 3 4
# 57 "/usr/include/signal.h" 3 4
# 1 "/usr/include/bits/types/siginfo_t.h" 1 3 4



# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 5 "/usr/include/bits/types/siginfo_t.h" 2 3 4

# 1 "/usr/include/bits/types/__sigval_t.h" 1 3 4
# 24 "/usr/include/bits/types/__sigval_t.h" 3 4
union sigval
{
  int sival_int;
  void *sival_ptr;
};

typedef union sigval __sigval_t;
# 7 "/usr/include/bits/types/siginfo_t.h" 2 3 4
# 16 "/usr/include/bits/types/siginfo_t.h" 3 4
# 1 "/usr/include/bits/siginfo-arch.h" 1 3 4
# 17 "/usr/include/bits/types/siginfo_t.h" 2 3 4
# 36 "/usr/include/bits/types/siginfo_t.h" 3 4
typedef struct
  {
    int si_signo;

    int si_errno;

    int si_code;





    int __pad0;


    union
      {
 int _pad[((128 / sizeof (int)) - 4)];


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
   } _kill;


 struct
   {
     int si_tid;
     int si_overrun;
     __sigval_t si_sigval;
   } _timer;


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
     __sigval_t si_sigval;
   } _rt;


 struct
   {
     __pid_t si_pid;
     __uid_t si_uid;
     int si_status;
     __clock_t si_utime;
     __clock_t si_stime;
   } _sigchld;


 struct
   {
     void *si_addr;

     short int si_addr_lsb;
     union
       {

  struct
    {
      void *_lower;
      void *_upper;
    } _addr_bnd;

  __uint32_t _pkey;
       } _bounds;
   } _sigfault;


 struct
   {
     long int si_band;
     int si_fd;
   } _sigpoll;



 struct
   {
     void *_call_addr;
     int _syscall;
     unsigned int _arch;
   } _sigsys;

      } _sifields;
  } siginfo_t ;
# 58 "/usr/include/signal.h" 2 3 4
# 1 "/usr/include/bits/siginfo-consts.h" 1 3 4
# 35 "/usr/include/bits/siginfo-consts.h" 3 4
enum
{
  SI_ASYNCNL = -60,
  SI_DETHREAD = -7,

  SI_TKILL,
  SI_SIGIO,

  SI_ASYNCIO,
  SI_MESGQ,
  SI_TIMER,





  SI_QUEUE,
  SI_USER,
  SI_KERNEL = 0x80
# 66 "/usr/include/bits/siginfo-consts.h" 3 4
};




enum
{
  ILL_ILLOPC = 1,

  ILL_ILLOPN,

  ILL_ILLADR,

  ILL_ILLTRP,

  ILL_PRVOPC,

  ILL_PRVREG,

  ILL_COPROC,

  ILL_BADSTK,

  ILL_BADIADDR

};


enum
{
  FPE_INTDIV = 1,

  FPE_INTOVF,

  FPE_FLTDIV,

  FPE_FLTOVF,

  FPE_FLTUND,

  FPE_FLTRES,

  FPE_FLTINV,

  FPE_FLTSUB,

  FPE_FLTUNK = 14,

  FPE_CONDTRAP

};


enum
{
  SEGV_MAPERR = 1,

  SEGV_ACCERR,

  SEGV_BNDERR,

  SEGV_PKUERR,

  SEGV_ACCADI,

  SEGV_ADIDERR,

  SEGV_ADIPERR,

  SEGV_MTEAERR,

  SEGV_MTESERR,

  SEGV_CPERR

};


enum
{
  BUS_ADRALN = 1,

  BUS_ADRERR,

  BUS_OBJERR,

  BUS_MCEERR_AR,

  BUS_MCEERR_AO

};
# 178 "/usr/include/bits/siginfo-consts.h" 3 4
enum
{
  CLD_EXITED = 1,

  CLD_KILLED,

  CLD_DUMPED,

  CLD_TRAPPED,

  CLD_STOPPED,

  CLD_CONTINUED

};


enum
{
  POLL_IN = 1,

  POLL_OUT,

  POLL_MSG,

  POLL_ERR,

  POLL_PRI,

  POLL_HUP

};
# 59 "/usr/include/signal.h" 2 3 4



# 1 "/usr/include/bits/types/sigval_t.h" 1 3 4
# 16 "/usr/include/bits/types/sigval_t.h" 3 4
typedef __sigval_t sigval_t;
# 63 "/usr/include/signal.h" 2 3 4



# 1 "/usr/include/bits/types/sigevent_t.h" 1 3 4



# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 5 "/usr/include/bits/types/sigevent_t.h" 2 3 4
# 22 "/usr/include/bits/types/sigevent_t.h" 3 4
typedef struct sigevent
  {
    __sigval_t sigev_value;
    int sigev_signo;
    int sigev_notify;

    union
      {
 int _pad[((64 / sizeof (int)) - 4)];



 __pid_t _tid;

 struct
   {
     void (*_function) (__sigval_t);
     pthread_attr_t *_attribute;
   } _sigev_thread;
      } _sigev_un;
  } sigevent_t;
# 67 "/usr/include/signal.h" 2 3 4
# 1 "/usr/include/bits/sigevent-consts.h" 1 3 4
# 27 "/usr/include/bits/sigevent-consts.h" 3 4
enum
{
  SIGEV_SIGNAL = 0,

  SIGEV_NONE,

  SIGEV_THREAD,


  SIGEV_THREAD_ID = 4


};
# 68 "/usr/include/signal.h" 2 3 4




typedef void (*__sighandler_t) (int);




extern __sighandler_t __sysv_signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ ));
# 88 "/usr/include/signal.h" 3 4
extern __sighandler_t signal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ ));
# 112 "/usr/include/signal.h" 3 4
extern int kill (__pid_t __pid, int __sig) __attribute__ ((__nothrow__ ));






extern int killpg (__pid_t __pgrp, int __sig) __attribute__ ((__nothrow__ ));



extern int raise (int __sig) __attribute__ ((__nothrow__ ));



extern __sighandler_t ssignal (int __sig, __sighandler_t __handler)
     __attribute__ ((__nothrow__ ));
extern int gsignal (int __sig) __attribute__ ((__nothrow__ ));




extern void psignal (int __sig, const char *__s);


extern void psiginfo (const siginfo_t *__pinfo, const char *__s);
# 173 "/usr/include/signal.h" 3 4
extern int sigblock (int __mask) __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));


extern int sigsetmask (int __mask) __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));


extern int siggetmask (void) __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));
# 193 "/usr/include/signal.h" 3 4
typedef __sighandler_t sig_t;





extern int sigemptyset (sigset_t *__set) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int sigfillset (sigset_t *__set) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int sigaddset (sigset_t *__set, int __signo) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int sigdelset (sigset_t *__set, int __signo) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int sigismember (const sigset_t *__set, int __signo)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 229 "/usr/include/signal.h" 3 4
# 1 "/usr/include/bits/sigaction.h" 1 3 4
# 27 "/usr/include/bits/sigaction.h" 3 4
struct sigaction
  {


    union
      {

 __sighandler_t sa_handler;

 void (*sa_sigaction) (int, siginfo_t *, void *);
      }
    __sigaction_handler;







    __sigset_t sa_mask;


    int sa_flags;


    void (*sa_restorer) (void);
  };
# 230 "/usr/include/signal.h" 2 3 4


extern int sigprocmask (int __how, const sigset_t *__restrict __set,
   sigset_t *__restrict __oset) __attribute__ ((__nothrow__ ));






extern int sigsuspend (const sigset_t *__set) __attribute__ ((__nonnull__ (1)));


extern int sigaction (int __sig, const struct sigaction *__restrict __act,
        struct sigaction *__restrict __oact) __attribute__ ((__nothrow__ ));


extern int sigpending (sigset_t *__set) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







extern int sigwait (const sigset_t *__restrict __set, int *__restrict __sig)
     __attribute__ ((__nonnull__ (1, 2)));







extern int sigwaitinfo (const sigset_t *__restrict __set,
   siginfo_t *__restrict __info) __attribute__ ((__nonnull__ (1)));







extern int sigtimedwait (const sigset_t *__restrict __set,
    siginfo_t *__restrict __info,
    const struct timespec *__restrict __timeout)
     __attribute__ ((__nonnull__ (1)));
# 292 "/usr/include/signal.h" 3 4
extern int sigqueue (__pid_t __pid, int __sig, const union sigval __val)
     __attribute__ ((__nothrow__ ));







# 1 "/usr/include/bits/sigcontext.h" 1 3 4
# 31 "/usr/include/bits/sigcontext.h" 3 4
struct _fpx_sw_bytes
{
  __uint32_t magic1;
  __uint32_t extended_size;
  __uint64_t xstate_bv;
  __uint32_t xstate_size;
  __uint32_t __glibc_reserved1[7];
};

struct _fpreg
{
  unsigned short significand[4];
  unsigned short exponent;
};

struct _fpxreg
{
  unsigned short significand[4];
  unsigned short exponent;
  unsigned short __glibc_reserved1[3];
};

struct _xmmreg
{
  __uint32_t element[4];
};
# 123 "/usr/include/bits/sigcontext.h" 3 4
struct _fpstate
{

  __uint16_t cwd;
  __uint16_t swd;
  __uint16_t ftw;
  __uint16_t fop;
  __uint64_t rip;
  __uint64_t rdp;
  __uint32_t mxcsr;
  __uint32_t mxcr_mask;
  struct _fpxreg _st[8];
  struct _xmmreg _xmm[16];
  __uint32_t __glibc_reserved1[24];
};

struct sigcontext
{
  __uint64_t r8;
  __uint64_t r9;
  __uint64_t r10;
  __uint64_t r11;
  __uint64_t r12;
  __uint64_t r13;
  __uint64_t r14;
  __uint64_t r15;
  __uint64_t rdi;
  __uint64_t rsi;
  __uint64_t rbp;
  __uint64_t rbx;
  __uint64_t rdx;
  __uint64_t rax;
  __uint64_t rcx;
  __uint64_t rsp;
  __uint64_t rip;
  __uint64_t eflags;
  unsigned short cs;
  unsigned short gs;
  unsigned short fs;
  unsigned short __pad0;
  __uint64_t err;
  __uint64_t trapno;
  __uint64_t oldmask;
  __uint64_t cr2;
  __extension__ union
    {
      struct _fpstate * fpstate;
      __uint64_t __fpstate_word;
    };
  __uint64_t __reserved1 [8];
};



struct _xsave_hdr
{
  __uint64_t xstate_bv;
  __uint64_t __glibc_reserved1[2];
  __uint64_t __glibc_reserved2[5];
};

struct _ymmh_state
{
  __uint32_t ymmh_space[64];
};

struct _xstate
{
  struct _fpstate fpstate;
  struct _xsave_hdr xstate_hdr;
  struct _ymmh_state ymmh;
};
# 302 "/usr/include/signal.h" 2 3 4


extern int sigreturn (struct sigcontext *__scp) __attribute__ ((__nothrow__ ));






# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 312 "/usr/include/signal.h" 2 3 4

# 1 "/usr/include/bits/types/stack_t.h" 1 3 4
# 23 "/usr/include/bits/types/stack_t.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 24 "/usr/include/bits/types/stack_t.h" 2 3 4


typedef struct
  {
    void *ss_sp;
    int ss_flags;
    size_t ss_size;
  } stack_t;
# 314 "/usr/include/signal.h" 2 3 4


# 1 "/usr/include/sys/ucontext.h" 1 3 4
# 37 "/usr/include/sys/ucontext.h" 3 4
__extension__ typedef long long int greg_t;
# 46 "/usr/include/sys/ucontext.h" 3 4
typedef greg_t gregset_t[23];
# 101 "/usr/include/sys/ucontext.h" 3 4
struct _libc_fpxreg
{
  unsigned short int significand[4];
  unsigned short int exponent;
  unsigned short int __glibc_reserved1[3];
};

struct _libc_xmmreg
{
  __uint32_t element[4];
};

struct _libc_fpstate
{

  __uint16_t cwd;
  __uint16_t swd;
  __uint16_t ftw;
  __uint16_t fop;
  __uint64_t rip;
  __uint64_t rdp;
  __uint32_t mxcsr;
  __uint32_t mxcr_mask;
  struct _libc_fpxreg _st[8];
  struct _libc_xmmreg _xmm[16];
  __uint32_t __glibc_reserved1[24];
};


typedef struct _libc_fpstate *fpregset_t;


typedef struct
  {
    gregset_t gregs;

    fpregset_t fpregs;
    __extension__ unsigned long long __reserved1 [8];
} mcontext_t;


typedef struct ucontext_t
  {
    unsigned long int uc_flags;
    struct ucontext_t *uc_link;
    stack_t uc_stack;
    mcontext_t uc_mcontext;
    sigset_t uc_sigmask;
    struct _libc_fpstate __fpregs_mem;
    __extension__ unsigned long long int __ssp[4];
  } ucontext_t;
# 317 "/usr/include/signal.h" 2 3 4







extern int siginterrupt (int __sig, int __interrupt) __attribute__ ((__nothrow__ ))
  __attribute__ ((__deprecated__ ("Use sigaction with SA_RESTART instead")));

# 1 "/usr/include/bits/sigstack.h" 1 3 4
# 328 "/usr/include/signal.h" 2 3 4
# 1 "/usr/include/bits/sigstksz.h" 1 3 4
# 329 "/usr/include/signal.h" 2 3 4
# 1 "/usr/include/bits/ss_flags.h" 1 3 4
# 27 "/usr/include/bits/ss_flags.h" 3 4
enum
{
  SS_ONSTACK = 1,

  SS_DISABLE

};
# 330 "/usr/include/signal.h" 2 3 4



extern int sigaltstack (const stack_t *__restrict __ss,
   stack_t *__restrict __oss) __attribute__ ((__nothrow__ ));




# 1 "/usr/include/bits/types/struct_sigstack.h" 1 3 4
# 23 "/usr/include/bits/types/struct_sigstack.h" 3 4
struct sigstack
  {
    void *ss_sp;
    int ss_onstack;
  };
# 340 "/usr/include/signal.h" 2 3 4







extern int sigstack (struct sigstack *__ss, struct sigstack *__oss)
     __attribute__ ((__nothrow__ )) __attribute__ ((__deprecated__));
# 376 "/usr/include/signal.h" 3 4
# 1 "/usr/include/bits/sigthread.h" 1 3 4
# 31 "/usr/include/bits/sigthread.h" 3 4
extern int pthread_sigmask (int __how,
       const __sigset_t *__restrict __newmask,
       __sigset_t *__restrict __oldmask)__attribute__ ((__nothrow__ ));


extern int pthread_kill (pthread_t __threadid, int __signo) __attribute__ ((__nothrow__ ));
# 377 "/usr/include/signal.h" 2 3 4






extern int __libc_current_sigrtmin (void) __attribute__ ((__nothrow__ ));

extern int __libc_current_sigrtmax (void) __attribute__ ((__nothrow__ ));





# 1 "/usr/include/bits/signal_ext.h" 1 3 4
# 392 "/usr/include/signal.h" 2 3 4
# 39 "/usr/include/glib-2.0/glib/gbacktrace.h" 2



 extern
void g_on_error_query (const gchar *prg_name);
 extern
void g_on_error_stack_trace (const gchar *prg_name);
# 37 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gbase64.h" 1
# 32 "/usr/include/glib-2.0/glib/gbase64.h"
 extern
gsize g_base64_encode_step (const guchar *in,
                                 gsize len,
                                 gboolean break_lines,
                                 gchar *out,
                                 gint *state,
                                 gint *save);
 extern
gsize g_base64_encode_close (gboolean break_lines,
                                 gchar *out,
                                 gint *state,
                                 gint *save);
 extern
gchar* g_base64_encode (const guchar *data,
                                 gsize len) __attribute__ ((__malloc__));
 extern
gsize g_base64_decode_step (const gchar *in,
                                 gsize len,
                                 guchar *out,
                                 gint *state,
                                 guint *save);
 extern
guchar *g_base64_decode (const gchar *text,
                                 gsize *out_len) __attribute__ ((__malloc__));
 extern
guchar *g_base64_decode_inplace (gchar *text,
                                 gsize *out_len);
# 38 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gbitlock.h" 1
# 34 "/usr/include/glib-2.0/glib/gbitlock.h"
 extern
void g_bit_lock (volatile gint *address,
                                           gint lock_bit);
 extern
gboolean g_bit_trylock (volatile gint *address,
                                           gint lock_bit);
 extern
void g_bit_unlock (volatile gint *address,
                                           gint lock_bit);

 extern
void g_pointer_bit_lock (volatile void *address,
                                           gint lock_bit);

 extern
void g_pointer_bit_lock_and_get (gpointer address,
                                           guint lock_bit,
                                           guintptr *out_ptr);

 extern
gboolean g_pointer_bit_trylock (volatile void *address,
                                           gint lock_bit);
 extern
void g_pointer_bit_unlock (volatile void *address,
                                           gint lock_bit);

 extern
gpointer g_pointer_bit_lock_mask_ptr (gpointer ptr,
                                           guint lock_bit,
                                           gboolean set,
                                           guintptr preserve_mask,
                                           gpointer preserve_ptr);

 extern
void g_pointer_bit_unlock_and_set (void *address,
                                           guint lock_bit,
                                           gpointer ptr,
                                           guintptr preserve_mask);
# 39 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gbookmarkfile.h" 1
# 28 "/usr/include/glib-2.0/glib/gbookmarkfile.h"
# 1 "/usr/include/glib-2.0/glib/gdatetime.h" 1
# 33 "/usr/include/glib-2.0/glib/gdatetime.h"
# 1 "/usr/include/glib-2.0/glib/gtimezone.h" 1
# 34 "/usr/include/glib-2.0/glib/gtimezone.h"
typedef struct _GTimeZone GTimeZone;
# 51 "/usr/include/glib-2.0/glib/gtimezone.h"
typedef enum
{
  G_TIME_TYPE_STANDARD,
  G_TIME_TYPE_DAYLIGHT,
  G_TIME_TYPE_UNIVERSAL
} GTimeType;

__attribute__((__deprecated__("Use '" "g_time_zone_new_identifier" "' instead"))) extern
GTimeZone * g_time_zone_new (const gchar *identifier);
 extern
GTimeZone * g_time_zone_new_identifier (const gchar *identifier);
 extern
GTimeZone * g_time_zone_new_utc (void);
 extern
GTimeZone * g_time_zone_new_local (void);
 extern
GTimeZone * g_time_zone_new_offset (gint32 seconds);

 extern
GTimeZone * g_time_zone_ref (GTimeZone *tz);
 extern
void g_time_zone_unref (GTimeZone *tz);

 extern
gint g_time_zone_find_interval (GTimeZone *tz,
                                                                         GTimeType type,
                                                                         gint64 time_);

 extern
gint g_time_zone_adjust_time (GTimeZone *tz,
                                                                         GTimeType type,
                                                                         gint64 *time_);

 extern
const gchar * g_time_zone_get_abbreviation (GTimeZone *tz,
                                                                         gint interval);
 extern
gint32 g_time_zone_get_offset (GTimeZone *tz,
                                                                         gint interval);
 extern
gboolean g_time_zone_is_dst (GTimeZone *tz,
                                                                         gint interval);
 extern
const gchar * g_time_zone_get_identifier (GTimeZone *tz);
# 34 "/usr/include/glib-2.0/glib/gdatetime.h" 2
# 89 "/usr/include/glib-2.0/glib/gdatetime.h"
typedef gint64 GTimeSpan;
# 122 "/usr/include/glib-2.0/glib/gdatetime.h"
typedef struct _GDateTime GDateTime;

 extern
void g_date_time_unref (GDateTime *datetime);
 extern
GDateTime * g_date_time_ref (GDateTime *datetime);

 extern
GDateTime * g_date_time_new_now (GTimeZone *tz);
 extern
GDateTime * g_date_time_new_now_local (void);
 extern
GDateTime * g_date_time_new_now_utc (void);

 extern
GDateTime * g_date_time_new_from_unix_local (gint64 t);
 extern
GDateTime * g_date_time_new_from_unix_utc (gint64 t);

 extern
GDateTime * g_date_time_new_from_unix_local_usec (gint64 usecs);
 extern
GDateTime * g_date_time_new_from_unix_utc_usec (gint64 usecs);

#pragma clang diagnostic push
# 146 "/usr/include/glib-2.0/glib/gdatetime.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
__attribute__((__deprecated__("Use '" "g_date_time_new_from_unix_local" "' instead"))) extern
GDateTime * g_date_time_new_from_timeval_local (const GTimeVal *tv);
__attribute__((__deprecated__("Use '" "g_date_time_new_from_unix_utc" "' instead"))) extern
GDateTime * g_date_time_new_from_timeval_utc (const GTimeVal *tv);
#pragma clang diagnostic pop

 extern
GDateTime * g_date_time_new_from_iso8601 (const gchar *text,
                                                                         GTimeZone *default_tz);

 extern
GDateTime * g_date_time_new (GTimeZone *tz,
                                                                         gint year,
                                                                         gint month,
                                                                         gint day,
                                                                         gint hour,
                                                                         gint minute,
                                                                         gdouble seconds);
 extern
GDateTime * g_date_time_new_local (gint year,
                                                                         gint month,
                                                                         gint day,
                                                                         gint hour,
                                                                         gint minute,
                                                                         gdouble seconds);
 extern
GDateTime * g_date_time_new_utc (gint year,
                                                                         gint month,
                                                                         gint day,
                                                                         gint hour,
                                                                         gint minute,
                                                                         gdouble seconds);

 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add (GDateTime *datetime,
                                                                         GTimeSpan timespan);

 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add_years (GDateTime *datetime,
                                                                         gint years);
 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add_months (GDateTime *datetime,
                                                                         gint months);
 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add_weeks (GDateTime *datetime,
                                                                         gint weeks);
 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add_days (GDateTime *datetime,
                                                                         gint days);

 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add_hours (GDateTime *datetime,
                                                                         gint hours);
 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add_minutes (GDateTime *datetime,
                                                                         gint minutes);
 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add_seconds (GDateTime *datetime,
                                                                         gdouble seconds);

 extern
__attribute__((warn_unused_result))
GDateTime * g_date_time_add_full (GDateTime *datetime,
                                                                         gint years,
                                                                         gint months,
                                                                         gint days,
                                                                         gint hours,
                                                                         gint minutes,
                                                                         gdouble seconds);

 extern
gint g_date_time_compare (gconstpointer dt1,
                                                                         gconstpointer dt2);
 extern
GTimeSpan g_date_time_difference (GDateTime *end,
                                                                         GDateTime *begin);
 extern
guint g_date_time_hash (gconstpointer datetime);
 extern
gboolean g_date_time_equal (gconstpointer dt1,
                                                                         gconstpointer dt2);

 extern
void g_date_time_get_ymd (GDateTime *datetime,
                                                                         gint *year,
                                                                         gint *month,
                                                                         gint *day);

 extern
gint g_date_time_get_year (GDateTime *datetime);
 extern
gint g_date_time_get_month (GDateTime *datetime);
 extern
gint g_date_time_get_day_of_month (GDateTime *datetime);

 extern
gint g_date_time_get_week_numbering_year (GDateTime *datetime);
 extern
gint g_date_time_get_week_of_year (GDateTime *datetime);
 extern
gint g_date_time_get_day_of_week (GDateTime *datetime);

 extern
gint g_date_time_get_day_of_year (GDateTime *datetime);

 extern
gint g_date_time_get_hour (GDateTime *datetime);
 extern
gint g_date_time_get_minute (GDateTime *datetime);
 extern
gint g_date_time_get_second (GDateTime *datetime);
 extern
gint g_date_time_get_microsecond (GDateTime *datetime);
 extern
gdouble g_date_time_get_seconds (GDateTime *datetime);

 extern
gint64 g_date_time_to_unix (GDateTime *datetime);
 extern
gint64 g_date_time_to_unix_usec (GDateTime *datetime);

#pragma clang diagnostic push
# 276 "/usr/include/glib-2.0/glib/gdatetime.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
__attribute__((__deprecated__("Use '" "g_date_time_to_unix" "' instead"))) extern
gboolean g_date_time_to_timeval (GDateTime *datetime,
                                                                         GTimeVal *tv);
#pragma clang diagnostic pop

 extern
GTimeSpan g_date_time_get_utc_offset (GDateTime *datetime);
 extern
GTimeZone * g_date_time_get_timezone (GDateTime *datetime);
 extern
const gchar * g_date_time_get_timezone_abbreviation (GDateTime *datetime);
 extern
gboolean g_date_time_is_daylight_savings (GDateTime *datetime);

 extern
GDateTime * g_date_time_to_timezone (GDateTime *datetime,
                                                                         GTimeZone *tz);
 extern
GDateTime * g_date_time_to_local (GDateTime *datetime);
 extern
GDateTime * g_date_time_to_utc (GDateTime *datetime);

 extern
gchar * g_date_time_format (GDateTime *datetime,
                                                                         const gchar *format) __attribute__ ((__malloc__));
 extern
gchar * g_date_time_format_iso8601 (GDateTime *datetime) __attribute__ ((__malloc__));
# 29 "/usr/include/glib-2.0/glib/gbookmarkfile.h" 2
# 60 "/usr/include/glib-2.0/glib/gbookmarkfile.h"
typedef enum
{
  G_BOOKMARK_FILE_ERROR_INVALID_URI,
  G_BOOKMARK_FILE_ERROR_INVALID_VALUE,
  G_BOOKMARK_FILE_ERROR_APP_NOT_REGISTERED,
  G_BOOKMARK_FILE_ERROR_URI_NOT_FOUND,
  G_BOOKMARK_FILE_ERROR_READ,
  G_BOOKMARK_FILE_ERROR_UNKNOWN_ENCODING,
  G_BOOKMARK_FILE_ERROR_WRITE,
  G_BOOKMARK_FILE_ERROR_FILE_NOT_FOUND
} GBookmarkFileError;

 extern
GQuark g_bookmark_file_error_quark (void);
# 118 "/usr/include/glib-2.0/glib/gbookmarkfile.h"
typedef struct _GBookmarkFile GBookmarkFile;

 extern
GBookmarkFile *g_bookmark_file_new (void);
 extern
void g_bookmark_file_free (GBookmarkFile *bookmark);

 extern
GBookmarkFile *g_bookmark_file_copy (GBookmarkFile *bookmark);

 extern
gboolean g_bookmark_file_load_from_file (GBookmarkFile *bookmark,
          const gchar *filename,
          GError **error);
 extern
gboolean g_bookmark_file_load_from_data (GBookmarkFile *bookmark,
          const gchar *data,
          gsize length,
          GError **error);
 extern
gboolean g_bookmark_file_load_from_data_dirs (GBookmarkFile *bookmark,
          const gchar *file,
          gchar **full_path,
          GError **error);
 extern
gchar * g_bookmark_file_to_data (GBookmarkFile *bookmark,
          gsize *length,
          GError **error) __attribute__ ((__malloc__));
 extern
gboolean g_bookmark_file_to_file (GBookmarkFile *bookmark,
          const gchar *filename,
          GError **error);

 extern
void g_bookmark_file_set_title (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *title);
 extern
gchar * g_bookmark_file_get_title (GBookmarkFile *bookmark,
          const gchar *uri,
          GError **error) __attribute__ ((__malloc__));
 extern
void g_bookmark_file_set_description (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *description);
 extern
gchar * g_bookmark_file_get_description (GBookmarkFile *bookmark,
          const gchar *uri,
          GError **error) __attribute__ ((__malloc__));
 extern
void g_bookmark_file_set_mime_type (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *mime_type);
 extern
gchar * g_bookmark_file_get_mime_type (GBookmarkFile *bookmark,
          const gchar *uri,
          GError **error) __attribute__ ((__malloc__));
 extern
void g_bookmark_file_set_groups (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar **groups,
          gsize length);
 extern
void g_bookmark_file_add_group (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *group);
 extern
gboolean g_bookmark_file_has_group (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *group,
          GError **error);
 extern
gchar ** g_bookmark_file_get_groups (GBookmarkFile *bookmark,
          const gchar *uri,
          gsize *length,
          GError **error);
 extern
void g_bookmark_file_add_application (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *name,
          const gchar *exec);
 extern
gboolean g_bookmark_file_has_application (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *name,
          GError **error);
 extern
gchar ** g_bookmark_file_get_applications (GBookmarkFile *bookmark,
          const gchar *uri,
          gsize *length,
          GError **error);
__attribute__((__deprecated__("Use '" "g_bookmark_file_set_application_info" "' instead"))) extern
gboolean g_bookmark_file_set_app_info (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *name,
          const gchar *exec,
          gint count,
          time_t stamp,
          GError **error);
 extern
gboolean g_bookmark_file_set_application_info (GBookmarkFile *bookmark,
                                                     const char *uri,
                                                     const char *name,
                                                     const char *exec,
                                                     int count,
                                                     GDateTime *stamp,
                                                     GError **error);
__attribute__((__deprecated__("Use '" "g_bookmark_file_get_application_info" "' instead"))) extern
gboolean g_bookmark_file_get_app_info (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *name,
          gchar **exec,
          guint *count,
          time_t *stamp,
          GError **error);
 extern
gboolean g_bookmark_file_get_application_info (GBookmarkFile *bookmark,
                                                     const char *uri,
                                                     const char *name,
                                                     char **exec,
                                                     unsigned int *count,
                                                     GDateTime **stamp,
                                                     GError **error);
 extern
void g_bookmark_file_set_is_private (GBookmarkFile *bookmark,
          const gchar *uri,
          gboolean is_private);
 extern
gboolean g_bookmark_file_get_is_private (GBookmarkFile *bookmark,
          const gchar *uri,
          GError **error);
 extern
void g_bookmark_file_set_icon (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *href,
          const gchar *mime_type);
 extern
gboolean g_bookmark_file_get_icon (GBookmarkFile *bookmark,
          const gchar *uri,
          gchar **href,
          gchar **mime_type,
          GError **error);
__attribute__((__deprecated__("Use '" "g_bookmark_file_set_added_date_time" "' instead"))) extern
void g_bookmark_file_set_added (GBookmarkFile *bookmark,
          const gchar *uri,
          time_t added);
 extern
void g_bookmark_file_set_added_date_time (GBookmarkFile *bookmark,
                                                    const char *uri,
                                                    GDateTime *added);
__attribute__((__deprecated__("Use '" "g_bookmark_file_get_added_date_time" "' instead"))) extern
time_t g_bookmark_file_get_added (GBookmarkFile *bookmark,
          const gchar *uri,
          GError **error);
 extern
GDateTime *g_bookmark_file_get_added_date_time (GBookmarkFile *bookmark,
                                                    const char *uri,
                                                    GError **error);
__attribute__((__deprecated__("Use '" "g_bookmark_file_set_modified_date_time" "' instead"))) extern
void g_bookmark_file_set_modified (GBookmarkFile *bookmark,
          const gchar *uri,
          time_t modified);
 extern
void g_bookmark_file_set_modified_date_time (GBookmarkFile *bookmark,
                                                       const char *uri,
                                                       GDateTime *modified);
__attribute__((__deprecated__("Use '" "g_bookmark_file_get_modified_date_time" "' instead"))) extern
time_t g_bookmark_file_get_modified (GBookmarkFile *bookmark,
          const gchar *uri,
          GError **error);
 extern
GDateTime *g_bookmark_file_get_modified_date_time (GBookmarkFile *bookmark,
                                                       const char *uri,
                                                       GError **error);
__attribute__((__deprecated__("Use '" "g_bookmark_file_set_visited_date_time" "' instead"))) extern
void g_bookmark_file_set_visited (GBookmarkFile *bookmark,
          const gchar *uri,
          time_t visited);
 extern
void g_bookmark_file_set_visited_date_time (GBookmarkFile *bookmark,
                                                      const char *uri,
                                                      GDateTime *visited);
__attribute__((__deprecated__("Use '" "g_bookmark_file_get_visited_date_time" "' instead"))) extern
time_t g_bookmark_file_get_visited (GBookmarkFile *bookmark,
          const gchar *uri,
          GError **error);
 extern
GDateTime *g_bookmark_file_get_visited_date_time (GBookmarkFile *bookmark,
                                                      const char *uri,
                                                      GError **error);
 extern
gboolean g_bookmark_file_has_item (GBookmarkFile *bookmark,
          const gchar *uri);
 extern
gint g_bookmark_file_get_size (GBookmarkFile *bookmark);
 extern
gchar ** g_bookmark_file_get_uris (GBookmarkFile *bookmark,
          gsize *length);
 extern
gboolean g_bookmark_file_remove_group (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *group,
          GError **error);
 extern
gboolean g_bookmark_file_remove_application (GBookmarkFile *bookmark,
          const gchar *uri,
          const gchar *name,
          GError **error);
 extern
gboolean g_bookmark_file_remove_item (GBookmarkFile *bookmark,
          const gchar *uri,
          GError **error);
 extern
gboolean g_bookmark_file_move_item (GBookmarkFile *bookmark,
          const gchar *old_uri,
          const gchar *new_uri,
          GError **error);
# 40 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gbytes.h" 1
# 36 "/usr/include/glib-2.0/glib/gbytes.h"
 extern
GBytes * g_bytes_new (gconstpointer data,
                                                 gsize size);

 extern
GBytes * g_bytes_new_take (gpointer data,
                                                 gsize size);

 extern
GBytes * g_bytes_new_static (gconstpointer data,
                                                 gsize size);

 extern
GBytes * g_bytes_new_with_free_func (gconstpointer data,
                                                 gsize size,
                                                 GDestroyNotify free_func,
                                                 gpointer user_data);

 extern
GBytes * g_bytes_new_from_bytes (GBytes *bytes,
                                                 gsize offset,
                                                 gsize length);

 extern
gconstpointer g_bytes_get_data (GBytes *bytes,
                                                 gsize *size);

 extern
gsize g_bytes_get_size (GBytes *bytes);

 extern
GBytes * g_bytes_ref (GBytes *bytes);

 extern
void g_bytes_unref (GBytes *bytes);

 extern
gpointer g_bytes_unref_to_data (GBytes *bytes,
                                                 gsize *size);

 extern
GByteArray * g_bytes_unref_to_array (GBytes *bytes);

 extern
guint g_bytes_hash (gconstpointer bytes);

 extern
gboolean g_bytes_equal (gconstpointer bytes1,
                                                 gconstpointer bytes2);

 extern
gint g_bytes_compare (gconstpointer bytes1,
                                                 gconstpointer bytes2);

 extern
gconstpointer g_bytes_get_region (GBytes *bytes,
                                                 gsize element_size,
                                                 gsize offset,
                                                 gsize n_elements);
# 41 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gcharset.h" 1
# 32 "/usr/include/glib-2.0/glib/gcharset.h"
 extern
gboolean g_get_charset (const char **charset);
 extern
gchar * g_get_codeset (void);
 extern
gboolean g_get_console_charset (const char **charset);

 extern
const gchar * const * g_get_language_names (void);
 extern
const gchar * const * g_get_language_names_with_category
                                            (const gchar *category_name);
 extern
gchar ** g_get_locale_variants (const gchar *locale);
# 42 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gchecksum.h" 1
# 49 "/usr/include/glib-2.0/glib/gchecksum.h"
typedef enum {
  G_CHECKSUM_MD5,
  G_CHECKSUM_SHA1,
  G_CHECKSUM_SHA256,
  G_CHECKSUM_SHA512,
  G_CHECKSUM_SHA384
} GChecksumType;

typedef struct _GChecksum GChecksum;

 extern
gssize g_checksum_type_get_length (GChecksumType checksum_type);

 extern
GChecksum * g_checksum_new (GChecksumType checksum_type);
 extern
void g_checksum_reset (GChecksum *checksum);
 extern
GChecksum * g_checksum_copy (const GChecksum *checksum);
 extern
void g_checksum_free (GChecksum *checksum);
 extern
void g_checksum_update (GChecksum *checksum,
                                                     const guchar *data,
                                                     gssize length);
 extern
const gchar * g_checksum_get_string (GChecksum *checksum);
 extern
void g_checksum_get_digest (GChecksum *checksum,
                                                     guint8 *buffer,
                                                     gsize *digest_len);

 extern
gchar *g_compute_checksum_for_data (GChecksumType checksum_type,
                                                     const guchar *data,
                                                     gsize length);
 extern
gchar *g_compute_checksum_for_string (GChecksumType checksum_type,
                                                     const gchar *str,
                                                     gssize length);

 extern
gchar *g_compute_checksum_for_bytes (GChecksumType checksum_type,
                                                     GBytes *data);
# 43 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gconvert.h" 1
# 56 "/usr/include/glib-2.0/glib/gconvert.h"
typedef enum
{
  G_CONVERT_ERROR_NO_CONVERSION,
  G_CONVERT_ERROR_ILLEGAL_SEQUENCE,
  G_CONVERT_ERROR_FAILED,
  G_CONVERT_ERROR_PARTIAL_INPUT,
  G_CONVERT_ERROR_BAD_URI,
  G_CONVERT_ERROR_NOT_ABSOLUTE_PATH,
  G_CONVERT_ERROR_NO_MEMORY,
  G_CONVERT_ERROR_EMBEDDED_NUL
} GConvertError;
# 76 "/usr/include/glib-2.0/glib/gconvert.h"
 extern
GQuark g_convert_error_quark (void);







typedef struct _GIConv *GIConv;

 extern
GIConv g_iconv_open (const gchar *to_codeset,
         const gchar *from_codeset);
 extern
gsize g_iconv (GIConv converter,
         gchar **inbuf,
         gsize *inbytes_left,
         gchar **outbuf,
         gsize *outbytes_left);
 extern
gint g_iconv_close (GIConv converter);


 extern
gchar* g_convert (const gchar *str,
    gssize len,
    const gchar *to_codeset,
    const gchar *from_codeset,
    gsize *bytes_read,
    gsize *bytes_written,
    GError **error) __attribute__ ((__malloc__));
 extern
gchar* g_convert_with_iconv (const gchar *str,
    gssize len,
    GIConv converter,
    gsize *bytes_read,
    gsize *bytes_written,
    GError **error) __attribute__ ((__malloc__));
 extern
gchar* g_convert_with_fallback (const gchar *str,
    gssize len,
    const gchar *to_codeset,
    const gchar *from_codeset,
    const gchar *fallback,
    gsize *bytes_read,
    gsize *bytes_written,
    GError **error) __attribute__ ((__malloc__));




 extern
gchar* g_locale_to_utf8 (const gchar *opsysstring,
      gssize len,
      gsize *bytes_read,
      gsize *bytes_written,
      GError **error) __attribute__ ((__malloc__));
 extern
gchar* g_locale_from_utf8 (const gchar *utf8string,
      gssize len,
      gsize *bytes_read,
      gsize *bytes_written,
      GError **error) __attribute__ ((__malloc__));




 extern
gchar* g_filename_to_utf8 (const gchar *opsysstring,
        gssize len,
        gsize *bytes_read,
        gsize *bytes_written,
        GError **error) __attribute__ ((__malloc__));
 extern
gchar* g_filename_from_utf8 (const gchar *utf8string,
        gssize len,
        gsize *bytes_read,
        gsize *bytes_written,
        GError **error) __attribute__ ((__malloc__));

 extern
gchar *g_filename_from_uri (const gchar *uri,
       gchar **hostname,
       GError **error) __attribute__ ((__malloc__));

 extern
gchar *g_filename_to_uri (const gchar *filename,
       const gchar *hostname,
       GError **error) __attribute__ ((__malloc__));
 extern
gchar *g_filename_display_name (const gchar *filename) __attribute__ ((__malloc__));
 extern
gboolean g_get_filename_charsets (const gchar ***filename_charsets);

 extern
gchar *g_filename_display_basename (const gchar *filename) __attribute__ ((__malloc__));

 extern
gchar **g_uri_list_extract_uris (const gchar *uri_list);
# 44 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gdataset.h" 1
# 38 "/usr/include/glib-2.0/glib/gdataset.h"
typedef struct _GData GData;

typedef void (*GDataForeachFunc) (GQuark key_id,
                                                 gpointer data,
                                                 gpointer user_data);



 extern
void g_datalist_init (GData **datalist);
 extern
void g_datalist_clear (GData **datalist);
 extern
gpointer g_datalist_id_get_data (GData **datalist,
      GQuark key_id);
 extern
void g_datalist_id_set_data_full (GData **datalist,
      GQuark key_id,
      gpointer data,
      GDestroyNotify destroy_func);
 extern
void g_datalist_id_remove_multiple (GData **datalist,
                                         GQuark *keys,
                                         gsize n_keys);

typedef gpointer (*GDuplicateFunc) (gpointer data, gpointer user_data);

 extern
gpointer g_datalist_id_dup_data (GData **datalist,
                                         GQuark key_id,
                                         GDuplicateFunc dup_func,
      gpointer user_data);
 extern
gboolean g_datalist_id_replace_data (GData **datalist,
                                         GQuark key_id,
                                         gpointer oldval,
                                         gpointer newval,
                                         GDestroyNotify destroy,
      GDestroyNotify *old_destroy);

 extern
gpointer g_datalist_id_remove_no_notify (GData **datalist,
      GQuark key_id);
 extern
void g_datalist_foreach (GData **datalist,
      GDataForeachFunc func,
      gpointer user_data);
# 95 "/usr/include/glib-2.0/glib/gdataset.h"
 extern
void g_datalist_set_flags (GData **datalist,
      guint flags);
 extern
void g_datalist_unset_flags (GData **datalist,
      guint flags);
 extern
guint g_datalist_get_flags (GData **datalist);
# 119 "/usr/include/glib-2.0/glib/gdataset.h"
 extern
void g_dataset_destroy (gconstpointer dataset_location);
 extern
gpointer g_dataset_id_get_data (gconstpointer dataset_location,
                                         GQuark key_id);
 extern
gpointer g_datalist_get_data (GData **datalist,
       const gchar *key);
 extern
void g_dataset_id_set_data_full (gconstpointer dataset_location,
                                         GQuark key_id,
                                         gpointer data,
                                         GDestroyNotify destroy_func);
 extern
gpointer g_dataset_id_remove_no_notify (gconstpointer dataset_location,
                                         GQuark key_id);
 extern
void g_dataset_foreach (gconstpointer dataset_location,
                                         GDataForeachFunc func,
                                         gpointer user_data);
# 45 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gdate.h" 1
# 41 "/usr/include/glib-2.0/glib/gdate.h"
typedef gint32 GTime __attribute__((__deprecated__("Use '" "GDateTime" "' instead")));
typedef guint16 GDateYear;
typedef guint8 GDateDay;
typedef struct _GDate GDate;


typedef enum
{
  G_DATE_DAY = 0,
  G_DATE_MONTH = 1,
  G_DATE_YEAR = 2
} GDateDMY;


typedef enum
{
  G_DATE_BAD_WEEKDAY = 0,
  G_DATE_MONDAY = 1,
  G_DATE_TUESDAY = 2,
  G_DATE_WEDNESDAY = 3,
  G_DATE_THURSDAY = 4,
  G_DATE_FRIDAY = 5,
  G_DATE_SATURDAY = 6,
  G_DATE_SUNDAY = 7
} GDateWeekday;
typedef enum
{
  G_DATE_BAD_MONTH = 0,
  G_DATE_JANUARY = 1,
  G_DATE_FEBRUARY = 2,
  G_DATE_MARCH = 3,
  G_DATE_APRIL = 4,
  G_DATE_MAY = 5,
  G_DATE_JUNE = 6,
  G_DATE_JULY = 7,
  G_DATE_AUGUST = 8,
  G_DATE_SEPTEMBER = 9,
  G_DATE_OCTOBER = 10,
  G_DATE_NOVEMBER = 11,
  G_DATE_DECEMBER = 12
} GDateMonth;
# 92 "/usr/include/glib-2.0/glib/gdate.h"
struct _GDate
{
  guint julian_days : 32;





  guint julian : 1;
  guint dmy : 1;


  guint day : 6;
  guint month : 4;
  guint year : 16;
};





 extern
GDate* g_date_new (void);
 extern
GDate* g_date_new_dmy (GDateDay day,
                                           GDateMonth month,
                                           GDateYear year);
 extern
GDate* g_date_new_julian (guint32 julian_day);
 extern
void g_date_free (GDate *date);
 extern
GDate* g_date_copy (const GDate *date);






 extern
gboolean g_date_valid (const GDate *date);
 extern
gboolean g_date_valid_day (GDateDay day) __attribute__ ((__const__));
 extern
gboolean g_date_valid_month (GDateMonth month) __attribute__ ((__const__));
 extern
gboolean g_date_valid_year (GDateYear year) __attribute__ ((__const__));
 extern
gboolean g_date_valid_weekday (GDateWeekday weekday) __attribute__ ((__const__));
 extern
gboolean g_date_valid_julian (guint32 julian_date) __attribute__ ((__const__));
 extern
gboolean g_date_valid_dmy (GDateDay day,
                                           GDateMonth month,
                                           GDateYear year) __attribute__ ((__const__));

 extern
GDateWeekday g_date_get_weekday (const GDate *date);
 extern
GDateMonth g_date_get_month (const GDate *date);
 extern
GDateYear g_date_get_year (const GDate *date);
 extern
GDateDay g_date_get_day (const GDate *date);
 extern
guint32 g_date_get_julian (const GDate *date);
 extern
guint g_date_get_day_of_year (const GDate *date);






 extern
guint g_date_get_monday_week_of_year (const GDate *date);
 extern
guint g_date_get_sunday_week_of_year (const GDate *date);
 extern
guint g_date_get_iso8601_week_of_year (const GDate *date);





 extern
void g_date_clear (GDate *date,
                                           guint n_dates);





 extern
void g_date_set_parse (GDate *date,
                                           const gchar *str);
 extern
void g_date_set_time_t (GDate *date,
        time_t timet);
#pragma clang diagnostic push
# 191 "/usr/include/glib-2.0/glib/gdate.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
__attribute__((__deprecated__("Use '" "g_date_set_time_t" "' instead"))) extern
void g_date_set_time_val (GDate *date,
        GTimeVal *timeval);
__attribute__((__deprecated__("Use '" "g_date_set_time_t" "' instead"))) extern
void g_date_set_time (GDate *date,
                                           GTime time_);
#pragma clang diagnostic pop
 extern
void g_date_set_month (GDate *date,
                                           GDateMonth month);
 extern
void g_date_set_day (GDate *date,
                                           GDateDay day);
 extern
void g_date_set_year (GDate *date,
                                           GDateYear year);
 extern
void g_date_set_dmy (GDate *date,
                                           GDateDay day,
                                           GDateMonth month,
                                           GDateYear y);
 extern
void g_date_set_julian (GDate *date,
                                           guint32 julian_date);
 extern
gboolean g_date_is_first_of_month (const GDate *date);
 extern
gboolean g_date_is_last_of_month (const GDate *date);


 extern
void g_date_add_days (GDate *date,
                                           guint n_days);
 extern
void g_date_subtract_days (GDate *date,
                                           guint n_days);


 extern
void g_date_add_months (GDate *date,
                                           guint n_months);
 extern
void g_date_subtract_months (GDate *date,
                                           guint n_months);


 extern
void g_date_add_years (GDate *date,
                                           guint n_years);
 extern
void g_date_subtract_years (GDate *date,
                                           guint n_years);
 extern
gboolean g_date_is_leap_year (GDateYear year) __attribute__ ((__const__));
 extern
guint8 g_date_get_days_in_month (GDateMonth month,
                                           GDateYear year) __attribute__ ((__const__));
 extern
guint8 g_date_get_monday_weeks_in_year (GDateYear year) __attribute__ ((__const__));
 extern
guint8 g_date_get_sunday_weeks_in_year (GDateYear year) __attribute__ ((__const__));



 extern
gint g_date_days_between (const GDate *date1,
        const GDate *date2);


 extern
gint g_date_compare (const GDate *lhs,
                                           const GDate *rhs);
 extern
void g_date_to_struct_tm (const GDate *date,
                                           struct tm *tm);

 extern
void g_date_clamp (GDate *date,
        const GDate *min_date,
        const GDate *max_date);


 extern
void g_date_order (GDate *date1, GDate *date2);




 extern
gsize g_date_strftime (gchar *s,
                                           gsize slen,
                                           const gchar *format,
                                           const GDate *date);
# 46 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gdir.h" 1
# 34 "/usr/include/glib-2.0/glib/gdir.h"
# 1 "/usr/include/dirent.h" 1 3 4
# 61 "/usr/include/dirent.h" 3 4
# 1 "/usr/include/bits/dirent.h" 1 3 4
# 22 "/usr/include/bits/dirent.h" 3 4
struct dirent
  {

    __ino_t d_ino;
    __off_t d_off;




    unsigned short int d_reclen;
    unsigned char d_type;
    char d_name[256];
  };
# 62 "/usr/include/dirent.h" 2 3 4
# 97 "/usr/include/dirent.h" 3 4
enum
  {
    DT_UNKNOWN = 0,

    DT_FIFO = 1,

    DT_CHR = 2,

    DT_DIR = 4,

    DT_BLK = 6,

    DT_REG = 8,

    DT_LNK = 10,

    DT_SOCK = 12,

    DT_WHT = 14

  };
# 127 "/usr/include/dirent.h" 3 4
typedef struct __dirstream DIR;






extern int closedir (DIR *__dirp) __attribute__ ((__nonnull__ (1)));






extern DIR *opendir (const char *__name) __attribute__ ((__nonnull__ (1)))
 __attribute__ ((__malloc__)) ;






extern DIR *fdopendir (int __fd)
 __attribute__ ((__malloc__)) ;
# 164 "/usr/include/dirent.h" 3 4
extern struct dirent *readdir (DIR *__dirp) __attribute__ ((__nonnull__ (1)));
# 185 "/usr/include/dirent.h" 3 4
extern int readdir_r (DIR *__restrict __dirp,
        struct dirent *__restrict __entry,
        struct dirent **__restrict __result)
     __attribute__ ((__nonnull__ (1, 2, 3))) __attribute__ ((__deprecated__));
# 211 "/usr/include/dirent.h" 3 4
extern void rewinddir (DIR *__dirp) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





extern void seekdir (DIR *__dirp, long int __pos) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern long int telldir (DIR *__dirp) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));





extern int dirfd (DIR *__dirp) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 247 "/usr/include/dirent.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 248 "/usr/include/dirent.h" 2 3 4
# 257 "/usr/include/dirent.h" 3 4
extern int scandir (const char *__restrict __dir,
      struct dirent ***__restrict __namelist,
      int (*__selector) (const struct dirent *),
      int (*__cmp) (const struct dirent **,
      const struct dirent **))
     __attribute__ ((__nonnull__ (1, 2)));
# 327 "/usr/include/dirent.h" 3 4
extern int alphasort (const struct dirent **__e1,
        const struct dirent **__e2)
     __attribute__ ((__nothrow__ )) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 355 "/usr/include/dirent.h" 3 4
extern __ssize_t getdirentries (int __fd, char *__restrict __buf,
    size_t __nbytes,
    __off_t *__restrict __basep)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 4)));
# 406 "/usr/include/dirent.h" 3 4
# 1 "/usr/include/bits/dirent_ext.h" 1 3 4
# 407 "/usr/include/dirent.h" 2 3 4
# 35 "/usr/include/glib-2.0/glib/gdir.h" 2




typedef struct _GDir GDir;

 extern
GDir * g_dir_open (const gchar *path,
            guint flags,
            GError **error);
 extern
const gchar * g_dir_read_name (GDir *dir);
 extern
void g_dir_rewind (GDir *dir);
 extern
void g_dir_close (GDir *dir);

 extern
GDir * g_dir_ref (GDir *dir);
 extern
void g_dir_unref (GDir *dir);
# 48 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/genviron.h" 1
# 38 "/usr/include/glib-2.0/glib/genviron.h"
 extern
const gchar * g_getenv (const gchar *variable);
 extern
gboolean g_setenv (const gchar *variable,
                                  const gchar *value,
                                  gboolean overwrite);
 extern
void g_unsetenv (const gchar *variable);
 extern
gchar ** g_listenv (void);

 extern
gchar ** g_get_environ (void);
 extern
const gchar * g_environ_getenv (gchar **envp,
                                  const gchar *variable);
 extern
gchar ** g_environ_setenv (gchar **envp,
                                  const gchar *variable,
                                  const gchar *value,
                                  gboolean overwrite) __attribute__((warn_unused_result));
 extern
gchar ** g_environ_unsetenv (gchar **envp,
                                  const gchar *variable) __attribute__((warn_unused_result));
# 49 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gfileutils.h" 1
# 35 "/usr/include/glib-2.0/glib/gfileutils.h"
typedef enum
{
  G_FILE_ERROR_EXIST,
  G_FILE_ERROR_ISDIR,
  G_FILE_ERROR_ACCES,
  G_FILE_ERROR_NAMETOOLONG,
  G_FILE_ERROR_NOENT,
  G_FILE_ERROR_NOTDIR,
  G_FILE_ERROR_NXIO,
  G_FILE_ERROR_NODEV,
  G_FILE_ERROR_ROFS,
  G_FILE_ERROR_TXTBSY,
  G_FILE_ERROR_FAULT,
  G_FILE_ERROR_LOOP,
  G_FILE_ERROR_NOSPC,
  G_FILE_ERROR_NOMEM,
  G_FILE_ERROR_MFILE,
  G_FILE_ERROR_NFILE,
  G_FILE_ERROR_BADF,
  G_FILE_ERROR_INVAL,
  G_FILE_ERROR_PIPE,
  G_FILE_ERROR_AGAIN,
  G_FILE_ERROR_INTR,
  G_FILE_ERROR_IO,
  G_FILE_ERROR_PERM,
  G_FILE_ERROR_NOSYS,
  G_FILE_ERROR_FAILED
} GFileError;





typedef enum
{
  G_FILE_TEST_IS_REGULAR = 1 << 0,
  G_FILE_TEST_IS_SYMLINK = 1 << 1,
  G_FILE_TEST_IS_DIR = 1 << 2,
  G_FILE_TEST_IS_EXECUTABLE = 1 << 3,
  G_FILE_TEST_EXISTS = 1 << 4
} GFileTest;
# 101 "/usr/include/glib-2.0/glib/gfileutils.h"
typedef enum
{
  G_FILE_SET_CONTENTS_NONE = 0,
  G_FILE_SET_CONTENTS_CONSISTENT = 1 << 0,
  G_FILE_SET_CONTENTS_DURABLE = 1 << 1,
  G_FILE_SET_CONTENTS_ONLY_EXISTING = 1 << 2
} GFileSetContentsFlags
                                 ;

 extern
GQuark g_file_error_quark (void);

 extern
GFileError g_file_error_from_errno (gint err_no);

 extern
gboolean g_file_test (const gchar *filename,
                              GFileTest test);
 extern
gboolean g_file_get_contents (const gchar *filename,
                              gchar **contents,
                              gsize *length,
                              GError **error);
 extern
gboolean g_file_set_contents (const gchar *filename,
                              const gchar *contents,
                              gssize length,
                              GError **error);
#pragma clang diagnostic push
# 129 "/usr/include/glib-2.0/glib/gfileutils.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
 extern
gboolean g_file_set_contents_full (const gchar *filename,
                                   const gchar *contents,
                                   gssize length,
                                   GFileSetContentsFlags flags,
                                   int mode,
                                   GError **error);
#pragma clang diagnostic pop
 extern
gchar *g_file_read_link (const gchar *filename,
                              GError **error);


 extern
gchar *g_mkdtemp (gchar *tmpl);
 extern
gchar *g_mkdtemp_full (gchar *tmpl,
                               gint mode);


 extern
gint g_mkstemp (gchar *tmpl);
 extern
gint g_mkstemp_full (gchar *tmpl,
                               gint flags,
                               gint mode);


 extern
gint g_file_open_tmp (const gchar *tmpl,
                               gchar **name_used,
                               GError **error);
 extern
gchar *g_dir_make_tmp (const gchar *tmpl,
                               GError **error);

 extern
gchar *g_build_path (const gchar *separator,
                               const gchar *first_element,
                               ...) __attribute__ ((__malloc__)) __attribute__((__sentinel__));
 extern
gchar *g_build_pathv (const gchar *separator,
                               gchar **args) __attribute__ ((__malloc__));

 extern
gchar *g_build_filename (const gchar *first_element,
                               ...) __attribute__ ((__malloc__)) __attribute__((__sentinel__));
 extern
gchar *g_build_filenamev (gchar **args) __attribute__ ((__malloc__));
 extern
gchar *g_build_filename_valist (const gchar *first_element,
                                  va_list *args) __attribute__ ((__malloc__));

 extern
gint g_mkdir_with_parents (const gchar *pathname,
                               gint mode);
# 201 "/usr/include/glib-2.0/glib/gfileutils.h"
 extern
gboolean g_path_is_absolute (const gchar *file_name);
 extern
const gchar *g_path_skip_root (const gchar *file_name);

__attribute__((__deprecated__("Use '" "g_path_get_basename" "' instead"))) extern
const gchar *g_basename (const gchar *file_name);


 extern
gchar *g_get_current_dir (void);
 extern
gchar *g_path_get_basename (const gchar *file_name) __attribute__ ((__malloc__));
 extern
gchar *g_path_get_dirname (const gchar *file_name) __attribute__ ((__malloc__));

 extern
gchar *g_canonicalize_filename (const gchar *filename,
                                const gchar *relative_to) __attribute__ ((__malloc__));
# 51 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/ggettext.h" 1
# 38 "/usr/include/glib-2.0/glib/ggettext.h"
 extern
const gchar *g_strip_context (const gchar *msgid,
                              const gchar *msgval) __attribute__ ((__format_arg__ (1)));

 extern
const gchar *g_dgettext (const gchar *domain,
                              const gchar *msgid) __attribute__ ((__format_arg__ (2)));
 extern
const gchar *g_dcgettext (const gchar *domain,
                              const gchar *msgid,
                              gint category) __attribute__ ((__format_arg__ (2)));
 extern
const gchar *g_dngettext (const gchar *domain,
                              const gchar *msgid,
                              const gchar *msgid_plural,
                              gulong n) __attribute__ ((__format_arg__ (3)));
 extern
const gchar *g_dpgettext (const gchar *domain,
                              const gchar *msgctxtid,
                              gsize msgidoffset) __attribute__ ((__format_arg__ (2)));
 extern
const gchar *g_dpgettext2 (const gchar *domain,
                              const gchar *context,
                              const gchar *msgid) __attribute__ ((__format_arg__ (3)));
# 52 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/ghash.h" 1
# 36 "/usr/include/glib-2.0/glib/ghash.h"
# 1 "/usr/include/glib-2.0/glib/glist.h" 1
# 34 "/usr/include/glib-2.0/glib/glist.h"
# 1 "/usr/include/glib-2.0/glib/gmem.h" 1
# 54 "/usr/include/glib-2.0/glib/gmem.h"
typedef struct _GMemVTable GMemVTable;
# 73 "/usr/include/glib-2.0/glib/gmem.h"
 extern
void (g_free) (gpointer mem);
 extern
void g_free_sized (gpointer mem,
                           size_t size);

 extern
void g_clear_pointer (gpointer *pp,
                           GDestroyNotify destroy);

 extern
gpointer g_malloc (gsize n_bytes) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_malloc0 (gsize n_bytes) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_realloc (gpointer mem,
      gsize n_bytes) __attribute__((warn_unused_result));
 extern
gpointer g_try_malloc (gsize n_bytes) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_try_malloc0 (gsize n_bytes) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_try_realloc (gpointer mem,
      gsize n_bytes) __attribute__((warn_unused_result));

 extern
gpointer g_malloc_n (gsize n_blocks,
      gsize n_block_bytes) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1,2)));
 extern
gpointer g_malloc0_n (gsize n_blocks,
      gsize n_block_bytes) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1,2)));
 extern
gpointer g_realloc_n (gpointer mem,
      gsize n_blocks,
      gsize n_block_bytes) __attribute__((warn_unused_result));
 extern
gpointer g_try_malloc_n (gsize n_blocks,
      gsize n_block_bytes) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1,2)));
 extern
gpointer g_try_malloc0_n (gsize n_blocks,
      gsize n_block_bytes) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1,2)));
 extern
gpointer g_try_realloc_n (gpointer mem,
      gsize n_blocks,
      gsize n_block_bytes) __attribute__((warn_unused_result));

 extern
gpointer g_aligned_alloc (gsize n_blocks,
                           gsize n_block_bytes,
                           gsize alignment) __attribute__((warn_unused_result)) __attribute__((__alloc_size__(1,2)));
 extern
gpointer g_aligned_alloc0 (gsize n_blocks,
                           gsize n_block_bytes,
                           gsize alignment) __attribute__((warn_unused_result)) __attribute__((__alloc_size__(1,2)));
 extern
void g_aligned_free (gpointer mem);
 extern
void g_aligned_free_sized (gpointer mem,
                               size_t alignment,
                               size_t size);
# 233 "/usr/include/glib-2.0/glib/gmem.h"
static inline gpointer
g_steal_pointer (gpointer pp)
{
  gpointer *ptr = (gpointer *) pp;
  gpointer ref;

  ref = *ptr;
  *ptr = ((void*)0);

  return ref;
}
# 398 "/usr/include/glib-2.0/glib/gmem.h"
struct _GMemVTable {
  gpointer (*malloc) (gsize n_bytes);
  gpointer (*realloc) (gpointer mem,
      gsize n_bytes);
  void (*free) (gpointer mem);

  gpointer (*calloc) (gsize n_blocks,
      gsize n_block_bytes);
  gpointer (*try_malloc) (gsize n_bytes);
  gpointer (*try_realloc) (gpointer mem,
      gsize n_bytes);
};
__attribute__((__deprecated__)) extern
void g_mem_set_vtable (GMemVTable *vtable);
__attribute__((__deprecated__)) extern
gboolean g_mem_is_system_malloc (void);

 extern gboolean g_mem_gc_friendly;



 extern GMemVTable *glib_mem_profiler_table;
__attribute__((__deprecated__)) extern
void g_mem_profile (void);
# 35 "/usr/include/glib-2.0/glib/glist.h" 2
# 1 "/usr/include/glib-2.0/glib/gnode.h" 1
# 38 "/usr/include/glib-2.0/glib/gnode.h"
typedef struct _GNode GNode;


typedef enum
{
  G_TRAVERSE_LEAVES = 1 << 0,
  G_TRAVERSE_NON_LEAVES = 1 << 1,
  G_TRAVERSE_ALL = G_TRAVERSE_LEAVES | G_TRAVERSE_NON_LEAVES,
  G_TRAVERSE_MASK = 0x03,
  G_TRAVERSE_LEAFS = G_TRAVERSE_LEAVES,
  G_TRAVERSE_NON_LEAFS = G_TRAVERSE_NON_LEAVES
} GTraverseFlags;


typedef enum
{
  G_IN_ORDER,
  G_PRE_ORDER,
  G_POST_ORDER,
  G_LEVEL_ORDER
} GTraverseType;

typedef gboolean (*GNodeTraverseFunc) (GNode *node,
       gpointer data);
typedef void (*GNodeForeachFunc) (GNode *node,
       gpointer data);



struct _GNode
{
  gpointer data;
  GNode *next;
  GNode *prev;
  GNode *parent;
  GNode *children;
};
# 100 "/usr/include/glib-2.0/glib/gnode.h"
 extern
GNode* g_node_new (gpointer data);
 extern
void g_node_destroy (GNode *root);
 extern
void g_node_unlink (GNode *node);
 extern
GNode* g_node_copy_deep (GNode *node,
     GCopyFunc copy_func,
     gpointer data);
 extern
GNode* g_node_copy (GNode *node);
 extern
GNode* g_node_insert (GNode *parent,
     gint position,
     GNode *node);
 extern
GNode* g_node_insert_before (GNode *parent,
     GNode *sibling,
     GNode *node);
 extern
GNode* g_node_insert_after (GNode *parent,
     GNode *sibling,
     GNode *node);
 extern
GNode* g_node_prepend (GNode *parent,
     GNode *node);
 extern
guint g_node_n_nodes (GNode *root,
     GTraverseFlags flags);
 extern
GNode* g_node_get_root (GNode *node);
 extern
gboolean g_node_is_ancestor (GNode *node,
     GNode *descendant);
 extern
guint g_node_depth (GNode *node);
 extern
GNode* g_node_find (GNode *root,
     GTraverseType order,
     GTraverseFlags flags,
     gpointer data);
# 225 "/usr/include/glib-2.0/glib/gnode.h"
 extern
void g_node_traverse (GNode *root,
     GTraverseType order,
     GTraverseFlags flags,
     gint max_depth,
     GNodeTraverseFunc func,
     gpointer data);






 extern
guint g_node_max_height (GNode *root);

 extern
void g_node_children_foreach (GNode *node,
      GTraverseFlags flags,
      GNodeForeachFunc func,
      gpointer data);
 extern
void g_node_reverse_children (GNode *node);
 extern
guint g_node_n_children (GNode *node);
 extern
GNode* g_node_nth_child (GNode *node,
      guint n);
 extern
GNode* g_node_last_child (GNode *node);
 extern
GNode* g_node_find_child (GNode *node,
      GTraverseFlags flags,
      gpointer data);
 extern
gint g_node_child_position (GNode *node,
      GNode *child);
 extern
gint g_node_child_index (GNode *node,
      gpointer data);

 extern
GNode* g_node_first_sibling (GNode *node);
 extern
GNode* g_node_last_sibling (GNode *node);
# 36 "/usr/include/glib-2.0/glib/glist.h" 2



typedef struct _GList GList;

struct _GList
{
  gpointer data;
  GList *next;
  GList *prev;
};



 extern
GList* g_list_alloc (void) __attribute__((warn_unused_result));
 extern
void g_list_free (GList *list);
 extern
void g_list_free_1 (GList *list);

 extern
void g_list_free_full (GList *list,
      GDestroyNotify free_func);
 extern
GList* g_list_append (GList *list,
      gpointer data) __attribute__((warn_unused_result));
 extern
GList* g_list_prepend (GList *list,
      gpointer data) __attribute__((warn_unused_result));
 extern
GList* g_list_insert (GList *list,
      gpointer data,
      gint position) __attribute__((warn_unused_result));
 extern
GList* g_list_insert_sorted (GList *list,
      gpointer data,
      GCompareFunc func) __attribute__((warn_unused_result));
 extern
GList* g_list_insert_sorted_with_data (GList *list,
      gpointer data,
      GCompareDataFunc func,
      gpointer user_data) __attribute__((warn_unused_result));
 extern
GList* g_list_insert_before (GList *list,
      GList *sibling,
      gpointer data) __attribute__((warn_unused_result));
 extern
GList* g_list_insert_before_link (GList *list,
      GList *sibling,
      GList *link_) __attribute__((warn_unused_result));
 extern
GList* g_list_concat (GList *list1,
      GList *list2) __attribute__((warn_unused_result));
 extern
GList* g_list_remove (GList *list,
      gconstpointer data) __attribute__((warn_unused_result));
 extern
GList* g_list_remove_all (GList *list,
      gconstpointer data) __attribute__((warn_unused_result));
 extern
GList* g_list_remove_link (GList *list,
      GList *llink) __attribute__((warn_unused_result));
 extern
GList* g_list_delete_link (GList *list,
      GList *link_) __attribute__((warn_unused_result));
 extern
GList* g_list_reverse (GList *list) __attribute__((warn_unused_result));
 extern
GList* g_list_copy (GList *list) __attribute__((warn_unused_result));

 extern
GList* g_list_copy_deep (GList *list,
      GCopyFunc func,
      gpointer user_data) __attribute__((warn_unused_result));

 extern
GList* g_list_nth (GList *list,
      guint n);
 extern
GList* g_list_nth_prev (GList *list,
      guint n);
 extern
GList* g_list_find (GList *list,
      gconstpointer data);
 extern
GList* g_list_find_custom (GList *list,
      gconstpointer data,
      GCompareFunc func);
 extern
gint g_list_position (GList *list,
      GList *llink);
 extern
gint g_list_index (GList *list,
      gconstpointer data);
 extern
GList* g_list_last (GList *list);
 extern
GList* g_list_first (GList *list);
 extern
guint g_list_length (GList *list);
 extern
void g_list_foreach (GList *list,
      GFunc func,
      gpointer user_data);
 extern
GList* g_list_sort (GList *list,
      GCompareFunc compare_func) __attribute__((warn_unused_result));
 extern
GList* g_list_sort_with_data (GList *list,
      GCompareDataFunc compare_func,
      gpointer user_data) __attribute__((warn_unused_result));
 extern
gpointer g_list_nth_data (GList *list,
      guint n);

 extern
void g_clear_list (GList **list_ptr,
                                         GDestroyNotify destroy);
# 37 "/usr/include/glib-2.0/glib/ghash.h" 2



typedef struct _GHashTable GHashTable;

typedef gboolean (*GHRFunc) (gpointer key,
                               gpointer value,
                               gpointer user_data);

typedef struct _GHashTableIter GHashTableIter;

struct _GHashTableIter
{

  gpointer dummy1;
  gpointer dummy2;
  gpointer dummy3;
  int dummy4;
  gboolean dummy5;
  gpointer dummy6;
};

 extern
GHashTable* g_hash_table_new (GHashFunc hash_func,
                                            GEqualFunc key_equal_func);
 extern
GHashTable* g_hash_table_new_full (GHashFunc hash_func,
                                            GEqualFunc key_equal_func,
                                            GDestroyNotify key_destroy_func,
                                            GDestroyNotify value_destroy_func);
 extern
GHashTable *g_hash_table_new_similar (GHashTable *other_hash_table);
 extern
void g_hash_table_destroy (GHashTable *hash_table);
 extern
gboolean g_hash_table_insert (GHashTable *hash_table,
                                            gpointer key,
                                            gpointer value);
 extern
gboolean g_hash_table_replace (GHashTable *hash_table,
                                            gpointer key,
                                            gpointer value);
 extern
gboolean g_hash_table_add (GHashTable *hash_table,
                                            gpointer key);
 extern
gboolean g_hash_table_remove (GHashTable *hash_table,
                                            gconstpointer key);
 extern
void g_hash_table_remove_all (GHashTable *hash_table);
 extern
gboolean g_hash_table_steal (GHashTable *hash_table,
                                            gconstpointer key);
 extern
gboolean g_hash_table_steal_extended (GHashTable *hash_table,
                                            gconstpointer lookup_key,
                                            gpointer *stolen_key,
                                            gpointer *stolen_value);
 extern
void g_hash_table_steal_all (GHashTable *hash_table);
 extern
GPtrArray * g_hash_table_steal_all_keys (GHashTable *hash_table);
 extern
GPtrArray * g_hash_table_steal_all_values (GHashTable *hash_table);
 extern
gpointer g_hash_table_lookup (GHashTable *hash_table,
                                            gconstpointer key);
 extern
gboolean g_hash_table_contains (GHashTable *hash_table,
                                            gconstpointer key);
 extern
gboolean g_hash_table_lookup_extended (GHashTable *hash_table,
                                            gconstpointer lookup_key,
                                            gpointer *orig_key,
                                            gpointer *value);
 extern
void g_hash_table_foreach (GHashTable *hash_table,
                                            GHFunc func,
                                            gpointer user_data);
 extern
gpointer g_hash_table_find (GHashTable *hash_table,
                                            GHRFunc predicate,
                                            gpointer user_data);
 extern
guint g_hash_table_foreach_remove (GHashTable *hash_table,
                                            GHRFunc func,
                                            gpointer user_data);
 extern
guint g_hash_table_foreach_steal (GHashTable *hash_table,
                                            GHRFunc func,
                                            gpointer user_data);
 extern
guint g_hash_table_size (GHashTable *hash_table);
 extern
GList * g_hash_table_get_keys (GHashTable *hash_table);
 extern
GList * g_hash_table_get_values (GHashTable *hash_table);
 extern
gpointer * g_hash_table_get_keys_as_array (GHashTable *hash_table,
                                            guint *length);
 extern
GPtrArray * g_hash_table_get_keys_as_ptr_array (GHashTable *hash_table);

 extern
GPtrArray * g_hash_table_get_values_as_ptr_array (GHashTable *hash_table);

 extern
void g_hash_table_iter_init (GHashTableIter *iter,
                                            GHashTable *hash_table);
 extern
gboolean g_hash_table_iter_next (GHashTableIter *iter,
                                            gpointer *key,
                                            gpointer *value);
 extern
GHashTable* g_hash_table_iter_get_hash_table (GHashTableIter *iter);
 extern
void g_hash_table_iter_remove (GHashTableIter *iter);
 extern
void g_hash_table_iter_replace (GHashTableIter *iter,
                                            gpointer value);
 extern
void g_hash_table_iter_steal (GHashTableIter *iter);

 extern
GHashTable* g_hash_table_ref (GHashTable *hash_table);
 extern
void g_hash_table_unref (GHashTable *hash_table);






 extern
gboolean g_str_equal (gconstpointer v1,
                         gconstpointer v2);




 extern
guint g_str_hash (gconstpointer v);

 extern
gboolean g_int_equal (gconstpointer v1,
                         gconstpointer v2);
 extern
guint g_int_hash (gconstpointer v);

 extern
gboolean g_int64_equal (gconstpointer v1,
                         gconstpointer v2);
 extern
guint g_int64_hash (gconstpointer v);

 extern
gboolean g_double_equal (gconstpointer v1,
                         gconstpointer v2);
 extern
guint g_double_hash (gconstpointer v);

 extern
guint g_direct_hash (gconstpointer v) __attribute__ ((__const__));
 extern
gboolean g_direct_equal (gconstpointer v1,
                         gconstpointer v2) __attribute__ ((__const__));
# 53 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/ghmac.h" 1
# 33 "/usr/include/glib-2.0/glib/ghmac.h"
typedef struct _GHmac GHmac;

 extern
GHmac * g_hmac_new (GChecksumType digest_type,
                                                     const guchar *key,
                                                     gsize key_len);
 extern
GHmac * g_hmac_copy (const GHmac *hmac);
 extern
GHmac * g_hmac_ref (GHmac *hmac);
 extern
void g_hmac_unref (GHmac *hmac);
 extern
void g_hmac_update (GHmac *hmac,
                                                     const guchar *data,
                                                     gssize length);
 extern
const gchar * g_hmac_get_string (GHmac *hmac);
 extern
void g_hmac_get_digest (GHmac *hmac,
                                                     guint8 *buffer,
                                                     gsize *digest_len);

 extern
gchar *g_compute_hmac_for_data (GChecksumType digest_type,
                                                     const guchar *key,
                                                     gsize key_len,
                                                     const guchar *data,
                                                     gsize length);
 extern
gchar *g_compute_hmac_for_string (GChecksumType digest_type,
                                                     const guchar *key,
                                                     gsize key_len,
                                                     const gchar *str,
                                                     gssize length);
 extern
gchar *g_compute_hmac_for_bytes (GChecksumType digest_type,
                                                     GBytes *key,
                                                     GBytes *data);
# 54 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/ghook.h" 1
# 40 "/usr/include/glib-2.0/glib/ghook.h"
typedef struct _GHook GHook;
typedef struct _GHookList GHookList;

typedef gint (*GHookCompareFunc) (GHook *new_hook,
       GHook *sibling);
typedef gboolean (*GHookFindFunc) (GHook *hook,
       gpointer data);
typedef void (*GHookMarshaller) (GHook *hook,
       gpointer marshal_data);
typedef gboolean (*GHookCheckMarshaller) (GHook *hook,
       gpointer marshal_data);
typedef void (*GHookFunc) (gpointer data);
typedef gboolean (*GHookCheckFunc) (gpointer data);
typedef void (*GHookFinalizeFunc) (GHookList *hook_list,
       GHook *hook);
typedef enum
{
  G_HOOK_FLAG_ACTIVE = 1 << 0,
  G_HOOK_FLAG_IN_CALL = 1 << 1,
  G_HOOK_FLAG_MASK = 0x0f
} GHookFlagMask;




struct _GHookList
{
  gulong seq_id;
  guint hook_size : 16;
  guint is_setup : 1;
  GHook *hooks;
  gpointer dummy3;
  GHookFinalizeFunc finalize_hook;
  gpointer dummy[2];
};
struct _GHook
{
  gpointer data;
  GHook *next;
  GHook *prev;
  guint ref_count;
  gulong hook_id;
  guint flags;
  gpointer func;
  GDestroyNotify destroy;
};
# 106 "/usr/include/glib-2.0/glib/ghook.h"
 extern
void g_hook_list_init (GHookList *hook_list,
      guint hook_size);
 extern
void g_hook_list_clear (GHookList *hook_list);
 extern
GHook* g_hook_alloc (GHookList *hook_list);
 extern
void g_hook_free (GHookList *hook_list,
      GHook *hook);
 extern
GHook * g_hook_ref (GHookList *hook_list,
      GHook *hook);
 extern
void g_hook_unref (GHookList *hook_list,
      GHook *hook);
 extern
gboolean g_hook_destroy (GHookList *hook_list,
      gulong hook_id);
 extern
void g_hook_destroy_link (GHookList *hook_list,
      GHook *hook);
 extern
void g_hook_prepend (GHookList *hook_list,
      GHook *hook);
 extern
void g_hook_insert_before (GHookList *hook_list,
      GHook *sibling,
      GHook *hook);
 extern
void g_hook_insert_sorted (GHookList *hook_list,
      GHook *hook,
      GHookCompareFunc func);
 extern
GHook* g_hook_get (GHookList *hook_list,
      gulong hook_id);
 extern
GHook* g_hook_find (GHookList *hook_list,
      gboolean need_valids,
      GHookFindFunc func,
      gpointer data);
 extern
GHook* g_hook_find_data (GHookList *hook_list,
      gboolean need_valids,
      gpointer data);
 extern
GHook* g_hook_find_func (GHookList *hook_list,
      gboolean need_valids,
      gpointer func);
 extern
GHook* g_hook_find_func_data (GHookList *hook_list,
      gboolean need_valids,
      gpointer func,
      gpointer data);

 extern
GHook* g_hook_first_valid (GHookList *hook_list,
      gboolean may_be_in_call);



 extern
GHook* g_hook_next_valid (GHookList *hook_list,
      GHook *hook,
      gboolean may_be_in_call);

 extern
gint g_hook_compare_ids (GHook *new_hook,
      GHook *sibling);





 extern
void g_hook_list_invoke (GHookList *hook_list,
      gboolean may_recurse);



 extern
void g_hook_list_invoke_check (GHookList *hook_list,
      gboolean may_recurse);


 extern
void g_hook_list_marshal (GHookList *hook_list,
      gboolean may_recurse,
      GHookMarshaller marshaller,
      gpointer marshal_data);
 extern
void g_hook_list_marshal_check (GHookList *hook_list,
      gboolean may_recurse,
      GHookCheckMarshaller marshaller,
      gpointer marshal_data);
# 55 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/ghostutils.h" 1
# 31 "/usr/include/glib-2.0/glib/ghostutils.h"
 extern
gboolean g_hostname_is_non_ascii (const gchar *hostname);
 extern
gboolean g_hostname_is_ascii_encoded (const gchar *hostname);
 extern
gboolean g_hostname_is_ip_address (const gchar *hostname);

 extern
gchar *g_hostname_to_ascii (const gchar *hostname);
 extern
gchar *g_hostname_to_unicode (const gchar *hostname);
# 56 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/giochannel.h" 1
# 35 "/usr/include/glib-2.0/glib/giochannel.h"
# 1 "/usr/include/glib-2.0/glib/gmain.h" 1
# 27 "/usr/include/glib-2.0/glib/gmain.h"
# 1 "/usr/include/glib-2.0/glib/gpoll.h" 1
# 61 "/usr/include/glib-2.0/glib/gpoll.h"
typedef struct _GPollFD GPollFD;
# 76 "/usr/include/glib-2.0/glib/gpoll.h"
typedef gint (*GPollFunc) (GPollFD *ufds,
                                 guint nfsd,
                                 gint timeout_);
# 93 "/usr/include/glib-2.0/glib/gpoll.h"
struct _GPollFD
{





  gint fd;

  gushort events;
  gushort revents;
};
# 114 "/usr/include/glib-2.0/glib/gpoll.h"
 extern
gint
g_poll (GPollFD *fds,
 guint nfds,
 gint timeout);
# 28 "/usr/include/glib-2.0/glib/gmain.h" 2
# 1 "/usr/include/glib-2.0/glib/gslist.h" 1
# 39 "/usr/include/glib-2.0/glib/gslist.h"
typedef struct _GSList GSList;

struct _GSList
{
  gpointer data;
  GSList *next;
};



 extern
GSList* g_slist_alloc (void) __attribute__((warn_unused_result));
 extern
void g_slist_free (GSList *list);
 extern
void g_slist_free_1 (GSList *list);

 extern
void g_slist_free_full (GSList *list,
       GDestroyNotify free_func);
 extern
GSList* g_slist_append (GSList *list,
       gpointer data) __attribute__((warn_unused_result));
 extern
GSList* g_slist_prepend (GSList *list,
       gpointer data) __attribute__((warn_unused_result));
 extern
GSList* g_slist_insert (GSList *list,
       gpointer data,
       gint position) __attribute__((warn_unused_result));
 extern
GSList* g_slist_insert_sorted (GSList *list,
       gpointer data,
       GCompareFunc func) __attribute__((warn_unused_result));
 extern
GSList* g_slist_insert_sorted_with_data (GSList *list,
       gpointer data,
       GCompareDataFunc func,
       gpointer user_data) __attribute__((warn_unused_result));
 extern
GSList* g_slist_insert_before (GSList *slist,
       GSList *sibling,
       gpointer data) __attribute__((warn_unused_result));
 extern
GSList* g_slist_concat (GSList *list1,
       GSList *list2) __attribute__((warn_unused_result));
 extern
GSList* g_slist_remove (GSList *list,
       gconstpointer data) __attribute__((warn_unused_result));
 extern
GSList* g_slist_remove_all (GSList *list,
       gconstpointer data) __attribute__((warn_unused_result));
 extern
GSList* g_slist_remove_link (GSList *list,
       GSList *link_) __attribute__((warn_unused_result));
 extern
GSList* g_slist_delete_link (GSList *list,
       GSList *link_) __attribute__((warn_unused_result));
 extern
GSList* g_slist_reverse (GSList *list) __attribute__((warn_unused_result));
 extern
GSList* g_slist_copy (GSList *list) __attribute__((warn_unused_result));

 extern
GSList* g_slist_copy_deep (GSList *list,
       GCopyFunc func,
       gpointer user_data) __attribute__((warn_unused_result));
 extern
GSList* g_slist_nth (GSList *list,
       guint n);
 extern
GSList* g_slist_find (GSList *list,
       gconstpointer data);
 extern
GSList* g_slist_find_custom (GSList *list,
       gconstpointer data,
       GCompareFunc func);
 extern
gint g_slist_position (GSList *list,
       GSList *llink);
 extern
gint g_slist_index (GSList *list,
       gconstpointer data);
 extern
GSList* g_slist_last (GSList *list);
 extern
guint g_slist_length (GSList *list);
 extern
void g_slist_foreach (GSList *list,
       GFunc func,
       gpointer user_data);
 extern
GSList* g_slist_sort (GSList *list,
       GCompareFunc compare_func) __attribute__((warn_unused_result));
 extern
GSList* g_slist_sort_with_data (GSList *list,
       GCompareDataFunc compare_func,
       gpointer user_data) __attribute__((warn_unused_result));
 extern
gpointer g_slist_nth_data (GSList *list,
       guint n);

 extern
void g_clear_slist (GSList **slist_ptr,
                                          GDestroyNotify destroy);
# 29 "/usr/include/glib-2.0/glib/gmain.h" 2




typedef enum
{
  G_IO_IN =1,
  G_IO_OUT =4,
  G_IO_PRI =2,
  G_IO_ERR =8,
  G_IO_HUP =16,
  G_IO_NVAL =32
} GIOCondition;
# 57 "/usr/include/glib-2.0/glib/gmain.h"
typedef enum
{
  G_MAIN_CONTEXT_FLAGS_NONE = 0,
  G_MAIN_CONTEXT_FLAGS_OWNERLESS_POLLING = 1
} GMainContextFlags;
# 70 "/usr/include/glib-2.0/glib/gmain.h"
typedef struct _GMainContext GMainContext;







typedef struct _GMainLoop GMainLoop;







typedef struct _GSource GSource;
typedef struct _GSourcePrivate GSourcePrivate;
# 99 "/usr/include/glib-2.0/glib/gmain.h"
typedef struct _GSourceCallbackFuncs GSourceCallbackFuncs;
# 157 "/usr/include/glib-2.0/glib/gmain.h"
typedef struct _GSourceFuncs GSourceFuncs;
# 199 "/usr/include/glib-2.0/glib/gmain.h"
typedef gboolean (*GSourceFunc) (gpointer user_data);
# 213 "/usr/include/glib-2.0/glib/gmain.h"
typedef void (* GSourceOnceFunc) (gpointer user_data);
# 249 "/usr/include/glib-2.0/glib/gmain.h"
typedef void (*GChildWatchFunc) (GPid pid,
                                       gint wait_status,
                                       gpointer user_data);
# 264 "/usr/include/glib-2.0/glib/gmain.h"
typedef void (*GSourceDisposeFunc) (GSource *source);

struct _GSource
{

  gpointer callback_data;
  GSourceCallbackFuncs *callback_funcs;

  const GSourceFuncs *source_funcs;
  guint ref_count;

  GMainContext *context;

  gint priority;
  guint flags;
  guint source_id;

  GSList *poll_fds;

  GSource *prev;
  GSource *next;

  char *name;

  GSourcePrivate *priv;
};

struct _GSourceCallbackFuncs
{
  void (*ref) (gpointer cb_data);
  void (*unref) (gpointer cb_data);
  void (*get) (gpointer cb_data,
                 GSource *source,
                 GSourceFunc *func,
                 gpointer *data);
};







typedef void (*GSourceDummyMarshal) (void);
# 333 "/usr/include/glib-2.0/glib/gmain.h"
typedef gboolean (*GSourceFuncsPrepareFunc) (GSource *source,
                                             gint *timeout_);
# 354 "/usr/include/glib-2.0/glib/gmain.h"
typedef gboolean (*GSourceFuncsCheckFunc) (GSource *source);
# 379 "/usr/include/glib-2.0/glib/gmain.h"
typedef gboolean (*GSourceFuncsDispatchFunc) (GSource *source,
                                              GSourceFunc callback,
                                              gpointer user_data);
# 396 "/usr/include/glib-2.0/glib/gmain.h"
typedef void (*GSourceFuncsFinalizeFunc) (GSource *source);

struct _GSourceFuncs
{
  GSourceFuncsPrepareFunc prepare;
  GSourceFuncsCheckFunc check;
  GSourceFuncsDispatchFunc dispatch;
  GSourceFuncsFinalizeFunc finalize;



  GSourceFunc closure_callback;
  GSourceDummyMarshal closure_marshal;
};
# 486 "/usr/include/glib-2.0/glib/gmain.h"
 extern
GMainContext *g_main_context_new (void);
#pragma clang diagnostic push
# 488 "/usr/include/glib-2.0/glib/gmain.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
 extern
GMainContext *g_main_context_new_with_flags (GMainContextFlags flags);
#pragma clang diagnostic pop
 extern
GMainContext *g_main_context_ref (GMainContext *context);
 extern
void g_main_context_unref (GMainContext *context);
 extern
GMainContext *g_main_context_default (void);

 extern
gboolean g_main_context_iteration (GMainContext *context,
                                        gboolean may_block);
 extern
gboolean g_main_context_pending (GMainContext *context);



 extern
GSource *g_main_context_find_source_by_id (GMainContext *context,
                                                             guint source_id);
 extern
GSource *g_main_context_find_source_by_user_data (GMainContext *context,
                                                             gpointer user_data);
 extern
GSource *g_main_context_find_source_by_funcs_user_data (GMainContext *context,
                                                             GSourceFuncs *funcs,
                                                             gpointer user_data);



 extern
void g_main_context_wakeup (GMainContext *context);
 extern
gboolean g_main_context_acquire (GMainContext *context);
 extern
void g_main_context_release (GMainContext *context);
 extern
gboolean g_main_context_is_owner (GMainContext *context);
__attribute__((__deprecated__("Use '" "g_main_context_is_owner" "' instead"))) extern
gboolean g_main_context_wait (GMainContext *context,
                                 GCond *cond,
                                 GMutex *mutex);

 extern
gboolean g_main_context_prepare (GMainContext *context,
                                  gint *priority);
 extern
gint g_main_context_query (GMainContext *context,
                                  gint max_priority,
                                  gint *timeout_,
                                  GPollFD *fds,
                                  gint n_fds);
 extern
gboolean g_main_context_check (GMainContext *context,
                                      gint max_priority,
                                      GPollFD *fds,
                                      gint n_fds);
 extern
void g_main_context_dispatch (GMainContext *context);

 extern
void g_main_context_set_poll_func (GMainContext *context,
                                       GPollFunc func);
 extern
GPollFunc g_main_context_get_poll_func (GMainContext *context);



 extern
void g_main_context_add_poll (GMainContext *context,
                                     GPollFD *fd,
                                     gint priority);
 extern
void g_main_context_remove_poll (GMainContext *context,
                                     GPollFD *fd);

 extern
gint g_main_depth (void);
 extern
GSource *g_main_current_source (void);



 extern
void g_main_context_push_thread_default (GMainContext *context);
 extern
void g_main_context_pop_thread_default (GMainContext *context);
 extern
GMainContext *g_main_context_get_thread_default (void);
 extern
GMainContext *g_main_context_ref_thread_default (void);
# 589 "/usr/include/glib-2.0/glib/gmain.h"
typedef void GMainContextPusher ;
# 636 "/usr/include/glib-2.0/glib/gmain.h"
#pragma clang diagnostic push
# 636 "/usr/include/glib-2.0/glib/gmain.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static inline GMainContextPusher *
g_main_context_pusher_new (GMainContext *main_context)
{
  g_main_context_push_thread_default (main_context);
  return (GMainContextPusher *) main_context;
}
#pragma clang diagnostic pop
# 658 "/usr/include/glib-2.0/glib/gmain.h"
#pragma clang diagnostic push
# 658 "/usr/include/glib-2.0/glib/gmain.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static inline void
g_main_context_pusher_free (GMainContextPusher *pusher)
{
  g_main_context_pop_thread_default ((GMainContext *) pusher);
}
#pragma clang diagnostic pop



 extern
GMainLoop *g_main_loop_new (GMainContext *context,
                                   gboolean is_running);
 extern
void g_main_loop_run (GMainLoop *loop);
 extern
void g_main_loop_quit (GMainLoop *loop);
 extern
GMainLoop *g_main_loop_ref (GMainLoop *loop);
 extern
void g_main_loop_unref (GMainLoop *loop);
 extern
gboolean g_main_loop_is_running (GMainLoop *loop);
 extern
GMainContext *g_main_loop_get_context (GMainLoop *loop);



 extern
GSource *g_source_new (GSourceFuncs *source_funcs,
                                   guint struct_size);

#pragma clang diagnostic push
# 691 "/usr/include/glib-2.0/glib/gmain.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
 extern
void g_source_set_dispose_function (GSource *source,
                                        GSourceDisposeFunc dispose);
#pragma clang diagnostic pop

 extern
GSource *g_source_ref (GSource *source);
 extern
void g_source_unref (GSource *source);

 extern
guint g_source_attach (GSource *source,
                                   GMainContext *context);
 extern
void g_source_destroy (GSource *source);

 extern
void g_source_set_priority (GSource *source,
                                   gint priority);
 extern
gint g_source_get_priority (GSource *source);
 extern
void g_source_set_can_recurse (GSource *source,
                                   gboolean can_recurse);
 extern
gboolean g_source_get_can_recurse (GSource *source);
 extern
guint g_source_get_id (GSource *source);

 extern
GMainContext *g_source_get_context (GSource *source);

 extern
void g_source_set_callback (GSource *source,
                                   GSourceFunc func,
                                   gpointer data,
                                   GDestroyNotify notify);

 extern
void g_source_set_funcs (GSource *source,
                                   GSourceFuncs *funcs);
 extern
gboolean g_source_is_destroyed (GSource *source);

 extern
void g_source_set_name (GSource *source,
                                              const char *name);
 extern
void g_source_set_static_name (GSource *source,
                                               const char *name);
 extern
const char * g_source_get_name (GSource *source);
 extern
void g_source_set_name_by_id (guint tag,
                                              const char *name);

 extern
void g_source_set_ready_time (GSource *source,
                                              gint64 ready_time);
 extern
gint64 g_source_get_ready_time (GSource *source);


 extern
gpointer g_source_add_unix_fd (GSource *source,
                                              gint fd,
                                              GIOCondition events);
 extern
void g_source_modify_unix_fd (GSource *source,
                                              gpointer tag,
                                              GIOCondition new_events);
 extern
void g_source_remove_unix_fd (GSource *source,
                                              gpointer tag);
 extern
GIOCondition g_source_query_unix_fd (GSource *source,
                                              gpointer tag);



 extern
void g_source_set_callback_indirect (GSource *source,
                                     gpointer callback_data,
                                     GSourceCallbackFuncs *callback_funcs);

 extern
void g_source_add_poll (GSource *source,
           GPollFD *fd);
 extern
void g_source_remove_poll (GSource *source,
           GPollFD *fd);

 extern
void g_source_add_child_source (GSource *source,
           GSource *child_source);
 extern
void g_source_remove_child_source (GSource *source,
           GSource *child_source);

#pragma clang diagnostic push
# 791 "/usr/include/glib-2.0/glib/gmain.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
__attribute__((__deprecated__("Use '" "g_source_get_time" "' instead"))) extern
void g_source_get_current_time (GSource *source,
                                    GTimeVal *timeval);
#pragma clang diagnostic pop

 extern
gint64 g_source_get_time (GSource *source);







 extern
GSource *g_idle_source_new (void);
 extern
GSource *g_child_watch_source_new (GPid pid);
 extern
GSource *g_timeout_source_new (guint interval);
 extern
GSource *g_timeout_source_new_seconds (guint interval);



#pragma clang diagnostic push
# 817 "/usr/include/glib-2.0/glib/gmain.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
__attribute__((__deprecated__("Use '" "g_get_real_time" "' instead"))) extern
void g_get_current_time (GTimeVal *result);
#pragma clang diagnostic pop

 extern
gint64 g_get_monotonic_time (void);
 extern
gint64 g_get_real_time (void);



 extern
gboolean g_source_remove (guint tag);
 extern
gboolean g_source_remove_by_user_data (gpointer user_data);
 extern
gboolean g_source_remove_by_funcs_user_data (GSourceFuncs *funcs,
                                              gpointer user_data);
# 848 "/usr/include/glib-2.0/glib/gmain.h"
typedef void (* GClearHandleFunc) (guint handle_id);

 extern
void g_clear_handle_id (guint *tag_ptr,
                           GClearHandleFunc clear_func);
# 870 "/usr/include/glib-2.0/glib/gmain.h"
 extern
guint g_timeout_add_full (gint priority,
                                     guint interval,
                                     GSourceFunc function,
                                     gpointer data,
                                     GDestroyNotify notify);
 extern
guint g_timeout_add (guint interval,
                                     GSourceFunc function,
                                     gpointer data);
 extern
guint g_timeout_add_once (guint interval,
                                     GSourceOnceFunc function,
                                     gpointer data);
 extern
guint g_timeout_add_seconds_full (gint priority,
                                     guint interval,
                                     GSourceFunc function,
                                     gpointer data,
                                     GDestroyNotify notify);
 extern
guint g_timeout_add_seconds (guint interval,
                                     GSourceFunc function,
                                     gpointer data);
 extern
guint g_timeout_add_seconds_once (guint interval,
                                     GSourceOnceFunc function,
                                     gpointer data);
 extern
guint g_child_watch_add_full (gint priority,
                                     GPid pid,
                                     GChildWatchFunc function,
                                     gpointer data,
                                     GDestroyNotify notify);
 extern
guint g_child_watch_add (GPid pid,
                                     GChildWatchFunc function,
                                     gpointer data);
 extern
guint g_idle_add (GSourceFunc function,
                                     gpointer data);
 extern
guint g_idle_add_full (gint priority,
                                     GSourceFunc function,
                                     gpointer data,
                                     GDestroyNotify notify);
 extern
guint g_idle_add_once (GSourceOnceFunc function,
                                     gpointer data);
 extern
gboolean g_idle_remove_by_data (gpointer data);

 extern
void g_main_context_invoke_full (GMainContext *context,
                                     gint priority,
                                     GSourceFunc function,
                                     gpointer data,
                                     GDestroyNotify notify);
 extern
void g_main_context_invoke (GMainContext *context,
                                     GSourceFunc function,
                                     gpointer data);


static inline int
g_steal_fd (int *fd_ptr)
{
  int fd = *fd_ptr;
  *fd_ptr = -1;
  return fd;
}


 extern GSourceFuncs g_timeout_funcs;
 extern GSourceFuncs g_child_watch_funcs;
 extern GSourceFuncs g_idle_funcs;

 extern GSourceFuncs g_unix_signal_funcs;
 extern GSourceFuncs g_unix_fd_source_funcs;
# 36 "/usr/include/glib-2.0/glib/giochannel.h" 2
# 1 "/usr/include/glib-2.0/glib/gstring.h" 1
# 35 "/usr/include/glib-2.0/glib/gstring.h"
# 1 "/usr/include/glib-2.0/glib/gunicode.h" 1
# 61 "/usr/include/glib-2.0/glib/gunicode.h"
typedef guint32 gunichar;
# 79 "/usr/include/glib-2.0/glib/gunicode.h"
typedef guint16 gunichar2;
# 118 "/usr/include/glib-2.0/glib/gunicode.h"
typedef enum
{
  G_UNICODE_CONTROL,
  G_UNICODE_FORMAT,
  G_UNICODE_UNASSIGNED,
  G_UNICODE_PRIVATE_USE,
  G_UNICODE_SURROGATE,
  G_UNICODE_LOWERCASE_LETTER,
  G_UNICODE_MODIFIER_LETTER,
  G_UNICODE_OTHER_LETTER,
  G_UNICODE_TITLECASE_LETTER,
  G_UNICODE_UPPERCASE_LETTER,
  G_UNICODE_SPACING_MARK,
  G_UNICODE_ENCLOSING_MARK,
  G_UNICODE_NON_SPACING_MARK,
  G_UNICODE_DECIMAL_NUMBER,
  G_UNICODE_LETTER_NUMBER,
  G_UNICODE_OTHER_NUMBER,
  G_UNICODE_CONNECT_PUNCTUATION,
  G_UNICODE_DASH_PUNCTUATION,
  G_UNICODE_CLOSE_PUNCTUATION,
  G_UNICODE_FINAL_PUNCTUATION,
  G_UNICODE_INITIAL_PUNCTUATION,
  G_UNICODE_OTHER_PUNCTUATION,
  G_UNICODE_OPEN_PUNCTUATION,
  G_UNICODE_CURRENCY_SYMBOL,
  G_UNICODE_MODIFIER_SYMBOL,
  G_UNICODE_MATH_SYMBOL,
  G_UNICODE_OTHER_SYMBOL,
  G_UNICODE_LINE_SEPARATOR,
  G_UNICODE_PARAGRAPH_SEPARATOR,
  G_UNICODE_SPACE_SEPARATOR
} GUnicodeType;
# 220 "/usr/include/glib-2.0/glib/gunicode.h"
typedef enum
{
  G_UNICODE_BREAK_MANDATORY,
  G_UNICODE_BREAK_CARRIAGE_RETURN,
  G_UNICODE_BREAK_LINE_FEED,
  G_UNICODE_BREAK_COMBINING_MARK,
  G_UNICODE_BREAK_SURROGATE,
  G_UNICODE_BREAK_ZERO_WIDTH_SPACE,
  G_UNICODE_BREAK_INSEPARABLE,
  G_UNICODE_BREAK_NON_BREAKING_GLUE,
  G_UNICODE_BREAK_CONTINGENT,
  G_UNICODE_BREAK_SPACE,
  G_UNICODE_BREAK_AFTER,
  G_UNICODE_BREAK_BEFORE,
  G_UNICODE_BREAK_BEFORE_AND_AFTER,
  G_UNICODE_BREAK_HYPHEN,
  G_UNICODE_BREAK_NON_STARTER,
  G_UNICODE_BREAK_OPEN_PUNCTUATION,
  G_UNICODE_BREAK_CLOSE_PUNCTUATION,
  G_UNICODE_BREAK_QUOTATION,
  G_UNICODE_BREAK_EXCLAMATION,
  G_UNICODE_BREAK_IDEOGRAPHIC,
  G_UNICODE_BREAK_NUMERIC,
  G_UNICODE_BREAK_INFIX_SEPARATOR,
  G_UNICODE_BREAK_SYMBOL,
  G_UNICODE_BREAK_ALPHABETIC,
  G_UNICODE_BREAK_PREFIX,
  G_UNICODE_BREAK_POSTFIX,
  G_UNICODE_BREAK_COMPLEX_CONTEXT,
  G_UNICODE_BREAK_AMBIGUOUS,
  G_UNICODE_BREAK_UNKNOWN,
  G_UNICODE_BREAK_NEXT_LINE,
  G_UNICODE_BREAK_WORD_JOINER,
  G_UNICODE_BREAK_HANGUL_L_JAMO,
  G_UNICODE_BREAK_HANGUL_V_JAMO,
  G_UNICODE_BREAK_HANGUL_T_JAMO,
  G_UNICODE_BREAK_HANGUL_LV_SYLLABLE,
  G_UNICODE_BREAK_HANGUL_LVT_SYLLABLE,
  G_UNICODE_BREAK_CLOSE_PARANTHESIS,
  G_UNICODE_BREAK_CLOSE_PARENTHESIS = G_UNICODE_BREAK_CLOSE_PARANTHESIS,
  G_UNICODE_BREAK_CONDITIONAL_JAPANESE_STARTER,
  G_UNICODE_BREAK_HEBREW_LETTER,
  G_UNICODE_BREAK_REGIONAL_INDICATOR,
  G_UNICODE_BREAK_EMOJI_BASE,
  G_UNICODE_BREAK_EMOJI_MODIFIER,
  G_UNICODE_BREAK_ZERO_WIDTH_JOINER,
  G_UNICODE_BREAK_AKSARA,
  G_UNICODE_BREAK_AKSARA_PRE_BASE,
  G_UNICODE_BREAK_AKSARA_START,
  G_UNICODE_BREAK_VIRAMA_FINAL,
  G_UNICODE_BREAK_VIRAMA
} GUnicodeBreakType;
# 463 "/usr/include/glib-2.0/glib/gunicode.h"
typedef enum
{
  G_UNICODE_SCRIPT_INVALID_CODE = -1,
  G_UNICODE_SCRIPT_COMMON = 0,
  G_UNICODE_SCRIPT_INHERITED,
  G_UNICODE_SCRIPT_ARABIC,
  G_UNICODE_SCRIPT_ARMENIAN,
  G_UNICODE_SCRIPT_BENGALI,
  G_UNICODE_SCRIPT_BOPOMOFO,
  G_UNICODE_SCRIPT_CHEROKEE,
  G_UNICODE_SCRIPT_COPTIC,
  G_UNICODE_SCRIPT_CYRILLIC,
  G_UNICODE_SCRIPT_DESERET,
  G_UNICODE_SCRIPT_DEVANAGARI,
  G_UNICODE_SCRIPT_ETHIOPIC,
  G_UNICODE_SCRIPT_GEORGIAN,
  G_UNICODE_SCRIPT_GOTHIC,
  G_UNICODE_SCRIPT_GREEK,
  G_UNICODE_SCRIPT_GUJARATI,
  G_UNICODE_SCRIPT_GURMUKHI,
  G_UNICODE_SCRIPT_HAN,
  G_UNICODE_SCRIPT_HANGUL,
  G_UNICODE_SCRIPT_HEBREW,
  G_UNICODE_SCRIPT_HIRAGANA,
  G_UNICODE_SCRIPT_KANNADA,
  G_UNICODE_SCRIPT_KATAKANA,
  G_UNICODE_SCRIPT_KHMER,
  G_UNICODE_SCRIPT_LAO,
  G_UNICODE_SCRIPT_LATIN,
  G_UNICODE_SCRIPT_MALAYALAM,
  G_UNICODE_SCRIPT_MONGOLIAN,
  G_UNICODE_SCRIPT_MYANMAR,
  G_UNICODE_SCRIPT_OGHAM,
  G_UNICODE_SCRIPT_OLD_ITALIC,
  G_UNICODE_SCRIPT_ORIYA,
  G_UNICODE_SCRIPT_RUNIC,
  G_UNICODE_SCRIPT_SINHALA,
  G_UNICODE_SCRIPT_SYRIAC,
  G_UNICODE_SCRIPT_TAMIL,
  G_UNICODE_SCRIPT_TELUGU,
  G_UNICODE_SCRIPT_THAANA,
  G_UNICODE_SCRIPT_THAI,
  G_UNICODE_SCRIPT_TIBETAN,
  G_UNICODE_SCRIPT_CANADIAN_ABORIGINAL,
  G_UNICODE_SCRIPT_YI,
  G_UNICODE_SCRIPT_TAGALOG,
  G_UNICODE_SCRIPT_HANUNOO,
  G_UNICODE_SCRIPT_BUHID,
  G_UNICODE_SCRIPT_TAGBANWA,


  G_UNICODE_SCRIPT_BRAILLE,
  G_UNICODE_SCRIPT_CYPRIOT,
  G_UNICODE_SCRIPT_LIMBU,
  G_UNICODE_SCRIPT_OSMANYA,
  G_UNICODE_SCRIPT_SHAVIAN,
  G_UNICODE_SCRIPT_LINEAR_B,
  G_UNICODE_SCRIPT_TAI_LE,
  G_UNICODE_SCRIPT_UGARITIC,


  G_UNICODE_SCRIPT_NEW_TAI_LUE,
  G_UNICODE_SCRIPT_BUGINESE,
  G_UNICODE_SCRIPT_GLAGOLITIC,
  G_UNICODE_SCRIPT_TIFINAGH,
  G_UNICODE_SCRIPT_SYLOTI_NAGRI,
  G_UNICODE_SCRIPT_OLD_PERSIAN,
  G_UNICODE_SCRIPT_KHAROSHTHI,


  G_UNICODE_SCRIPT_UNKNOWN,
  G_UNICODE_SCRIPT_BALINESE,
  G_UNICODE_SCRIPT_CUNEIFORM,
  G_UNICODE_SCRIPT_PHOENICIAN,
  G_UNICODE_SCRIPT_PHAGS_PA,
  G_UNICODE_SCRIPT_NKO,


  G_UNICODE_SCRIPT_KAYAH_LI,
  G_UNICODE_SCRIPT_LEPCHA,
  G_UNICODE_SCRIPT_REJANG,
  G_UNICODE_SCRIPT_SUNDANESE,
  G_UNICODE_SCRIPT_SAURASHTRA,
  G_UNICODE_SCRIPT_CHAM,
  G_UNICODE_SCRIPT_OL_CHIKI,
  G_UNICODE_SCRIPT_VAI,
  G_UNICODE_SCRIPT_CARIAN,
  G_UNICODE_SCRIPT_LYCIAN,
  G_UNICODE_SCRIPT_LYDIAN,


  G_UNICODE_SCRIPT_AVESTAN,
  G_UNICODE_SCRIPT_BAMUM,
  G_UNICODE_SCRIPT_EGYPTIAN_HIEROGLYPHS,
  G_UNICODE_SCRIPT_IMPERIAL_ARAMAIC,
  G_UNICODE_SCRIPT_INSCRIPTIONAL_PAHLAVI,
  G_UNICODE_SCRIPT_INSCRIPTIONAL_PARTHIAN,
  G_UNICODE_SCRIPT_JAVANESE,
  G_UNICODE_SCRIPT_KAITHI,
  G_UNICODE_SCRIPT_LISU,
  G_UNICODE_SCRIPT_MEETEI_MAYEK,
  G_UNICODE_SCRIPT_OLD_SOUTH_ARABIAN,
  G_UNICODE_SCRIPT_OLD_TURKIC,
  G_UNICODE_SCRIPT_SAMARITAN,
  G_UNICODE_SCRIPT_TAI_THAM,
  G_UNICODE_SCRIPT_TAI_VIET,


  G_UNICODE_SCRIPT_BATAK,
  G_UNICODE_SCRIPT_BRAHMI,
  G_UNICODE_SCRIPT_MANDAIC,


  G_UNICODE_SCRIPT_CHAKMA,
  G_UNICODE_SCRIPT_MEROITIC_CURSIVE,
  G_UNICODE_SCRIPT_MEROITIC_HIEROGLYPHS,
  G_UNICODE_SCRIPT_MIAO,
  G_UNICODE_SCRIPT_SHARADA,
  G_UNICODE_SCRIPT_SORA_SOMPENG,
  G_UNICODE_SCRIPT_TAKRI,


  G_UNICODE_SCRIPT_BASSA_VAH,
  G_UNICODE_SCRIPT_CAUCASIAN_ALBANIAN,
  G_UNICODE_SCRIPT_DUPLOYAN,
  G_UNICODE_SCRIPT_ELBASAN,
  G_UNICODE_SCRIPT_GRANTHA,
  G_UNICODE_SCRIPT_KHOJKI,
  G_UNICODE_SCRIPT_KHUDAWADI,
  G_UNICODE_SCRIPT_LINEAR_A,
  G_UNICODE_SCRIPT_MAHAJANI,
  G_UNICODE_SCRIPT_MANICHAEAN,
  G_UNICODE_SCRIPT_MENDE_KIKAKUI,
  G_UNICODE_SCRIPT_MODI,
  G_UNICODE_SCRIPT_MRO,
  G_UNICODE_SCRIPT_NABATAEAN,
  G_UNICODE_SCRIPT_OLD_NORTH_ARABIAN,
  G_UNICODE_SCRIPT_OLD_PERMIC,
  G_UNICODE_SCRIPT_PAHAWH_HMONG,
  G_UNICODE_SCRIPT_PALMYRENE,
  G_UNICODE_SCRIPT_PAU_CIN_HAU,
  G_UNICODE_SCRIPT_PSALTER_PAHLAVI,
  G_UNICODE_SCRIPT_SIDDHAM,
  G_UNICODE_SCRIPT_TIRHUTA,
  G_UNICODE_SCRIPT_WARANG_CITI,


  G_UNICODE_SCRIPT_AHOM,
  G_UNICODE_SCRIPT_ANATOLIAN_HIEROGLYPHS,
  G_UNICODE_SCRIPT_HATRAN,
  G_UNICODE_SCRIPT_MULTANI,
  G_UNICODE_SCRIPT_OLD_HUNGARIAN,
  G_UNICODE_SCRIPT_SIGNWRITING,


  G_UNICODE_SCRIPT_ADLAM,
  G_UNICODE_SCRIPT_BHAIKSUKI,
  G_UNICODE_SCRIPT_MARCHEN,
  G_UNICODE_SCRIPT_NEWA,
  G_UNICODE_SCRIPT_OSAGE,
  G_UNICODE_SCRIPT_TANGUT,


  G_UNICODE_SCRIPT_MASARAM_GONDI,
  G_UNICODE_SCRIPT_NUSHU,
  G_UNICODE_SCRIPT_SOYOMBO,
  G_UNICODE_SCRIPT_ZANABAZAR_SQUARE,


  G_UNICODE_SCRIPT_DOGRA,
  G_UNICODE_SCRIPT_GUNJALA_GONDI,
  G_UNICODE_SCRIPT_HANIFI_ROHINGYA,
  G_UNICODE_SCRIPT_MAKASAR,
  G_UNICODE_SCRIPT_MEDEFAIDRIN,
  G_UNICODE_SCRIPT_OLD_SOGDIAN,
  G_UNICODE_SCRIPT_SOGDIAN,


  G_UNICODE_SCRIPT_ELYMAIC,
  G_UNICODE_SCRIPT_NANDINAGARI,
  G_UNICODE_SCRIPT_NYIAKENG_PUACHUE_HMONG,
  G_UNICODE_SCRIPT_WANCHO,


  G_UNICODE_SCRIPT_CHORASMIAN,
  G_UNICODE_SCRIPT_DIVES_AKURU,
  G_UNICODE_SCRIPT_KHITAN_SMALL_SCRIPT,
  G_UNICODE_SCRIPT_YEZIDI,


  G_UNICODE_SCRIPT_CYPRO_MINOAN,
  G_UNICODE_SCRIPT_OLD_UYGHUR,
  G_UNICODE_SCRIPT_TANGSA,
  G_UNICODE_SCRIPT_TOTO,
  G_UNICODE_SCRIPT_VITHKUQI,


  G_UNICODE_SCRIPT_MATH,


  G_UNICODE_SCRIPT_KAWI ,
  G_UNICODE_SCRIPT_NAG_MUNDARI ,
} GUnicodeScript;

 extern
guint32 g_unicode_script_to_iso15924 (GUnicodeScript script);
 extern
GUnicodeScript g_unicode_script_from_iso15924 (guint32 iso15924);



 extern
gboolean g_unichar_isalnum (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_isalpha (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_iscntrl (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_isdigit (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_isgraph (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_islower (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_isprint (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_ispunct (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_isspace (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_isupper (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_isxdigit (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_istitle (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_isdefined (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_iswide (gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_iswide_cjk(gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_iszerowidth(gunichar c) __attribute__ ((__const__));
 extern
gboolean g_unichar_ismark (gunichar c) __attribute__ ((__const__));



 extern
gunichar g_unichar_toupper (gunichar c) __attribute__ ((__const__));
 extern
gunichar g_unichar_tolower (gunichar c) __attribute__ ((__const__));
 extern
gunichar g_unichar_totitle (gunichar c) __attribute__ ((__const__));



 extern
gint g_unichar_digit_value (gunichar c) __attribute__ ((__const__));

 extern
gint g_unichar_xdigit_value (gunichar c) __attribute__ ((__const__));


 extern
GUnicodeType g_unichar_type (gunichar c) __attribute__ ((__const__));


 extern
GUnicodeBreakType g_unichar_break_type (gunichar c) __attribute__ ((__const__));


 extern
gint g_unichar_combining_class (gunichar uc) __attribute__ ((__const__));

 extern
gboolean g_unichar_get_mirror_char (gunichar ch,
                                    gunichar *mirrored_ch);

 extern
GUnicodeScript g_unichar_get_script (gunichar ch) __attribute__ ((__const__));


 extern
gboolean g_unichar_validate (gunichar ch) __attribute__ ((__const__));


 extern
gboolean g_unichar_compose (gunichar a,
                            gunichar b,
                            gunichar *ch);
 extern
gboolean g_unichar_decompose (gunichar ch,
                              gunichar *a,
                              gunichar *b);

 extern
gsize g_unichar_fully_decompose (gunichar ch,
                                 gboolean compat,
                                 gunichar *result,
                                 gsize result_len);
# 780 "/usr/include/glib-2.0/glib/gunicode.h"
 extern
void g_unicode_canonical_ordering (gunichar *string,
                                   gsize len);


__attribute__((__deprecated__)) extern
gunichar *g_unicode_canonical_decomposition (gunichar ch,
                                             gsize *result_len) __attribute__ ((__malloc__));



 extern const gchar * const g_utf8_skip;
# 811 "/usr/include/glib-2.0/glib/gunicode.h"
 extern
gunichar g_utf8_get_char (const gchar *p) __attribute__((__pure__));
 extern
gunichar g_utf8_get_char_validated (const gchar *p,
                                    gssize max_len) __attribute__((__pure__));

 extern
gchar* g_utf8_offset_to_pointer (const gchar *str,
                                   glong offset) __attribute__((__pure__));
 extern
glong g_utf8_pointer_to_offset (const gchar *str,
                                   const gchar *pos) __attribute__((__pure__));
 extern
gchar* g_utf8_prev_char (const gchar *p) __attribute__((__pure__));
 extern
gchar* g_utf8_find_next_char (const gchar *p,
                                   const gchar *end) __attribute__((__pure__));
 extern
gchar* g_utf8_find_prev_char (const gchar *str,
                                   const gchar *p) __attribute__((__pure__));

 extern
glong g_utf8_strlen (const gchar *p,
                                   gssize max) __attribute__((__pure__));

 extern
gchar *g_utf8_substring (const gchar *str,
                                   glong start_pos,
                                   glong end_pos) __attribute__ ((__malloc__));

 extern
gchar *g_utf8_strncpy (gchar *dest,
                                   const gchar *src,
                                   gsize n);

 extern
gchar *g_utf8_truncate_middle (const gchar *string,
                                   gsize truncate_length);



 extern
gchar* g_utf8_strchr (const gchar *p,
                       gssize len,
                       gunichar c);
 extern
gchar* g_utf8_strrchr (const gchar *p,
                       gssize len,
                       gunichar c);
 extern
gchar* g_utf8_strreverse (const gchar *str,
                          gssize len);

 extern
gunichar2 *g_utf8_to_utf16 (const gchar *str,
                                glong len,
                                glong *items_read,
                                glong *items_written,
                                GError **error) __attribute__ ((__malloc__));
 extern
gunichar * g_utf8_to_ucs4 (const gchar *str,
                                glong len,
                                glong *items_read,
                                glong *items_written,
                                GError **error) __attribute__ ((__malloc__));
 extern
gunichar * g_utf8_to_ucs4_fast (const gchar *str,
                                glong len,
                                glong *items_written) __attribute__ ((__malloc__));
 extern
gunichar * g_utf16_to_ucs4 (const gunichar2 *str,
                                glong len,
                                glong *items_read,
                                glong *items_written,
                                GError **error) __attribute__ ((__malloc__));
 extern
gchar* g_utf16_to_utf8 (const gunichar2 *str,
                                glong len,
                                glong *items_read,
                                glong *items_written,
                                GError **error) __attribute__ ((__malloc__));
 extern
gunichar2 *g_ucs4_to_utf16 (const gunichar *str,
                                glong len,
                                glong *items_read,
                                glong *items_written,
                                GError **error) __attribute__ ((__malloc__));
 extern
gchar* g_ucs4_to_utf8 (const gunichar *str,
                                glong len,
                                glong *items_read,
                                glong *items_written,
                                GError **error) __attribute__ ((__malloc__));

 extern
gint g_unichar_to_utf8 (gunichar c,
                             gchar *outbuf);

 extern
gboolean g_utf8_validate (const gchar *str,
                          gssize max_len,
                          const gchar **end);
 extern
gboolean g_utf8_validate_len (const gchar *str,
                              gsize max_len,
                              const gchar **end);

 extern
gchar *g_utf8_strup (const gchar *str,
                       gssize len) __attribute__ ((__malloc__));
 extern
gchar *g_utf8_strdown (const gchar *str,
                       gssize len) __attribute__ ((__malloc__));
 extern
gchar *g_utf8_casefold (const gchar *str,
                        gssize len) __attribute__ ((__malloc__));
# 952 "/usr/include/glib-2.0/glib/gunicode.h"
typedef enum {
  G_NORMALIZE_DEFAULT,
  G_NORMALIZE_NFD = G_NORMALIZE_DEFAULT,
  G_NORMALIZE_DEFAULT_COMPOSE,
  G_NORMALIZE_NFC = G_NORMALIZE_DEFAULT_COMPOSE,
  G_NORMALIZE_ALL,
  G_NORMALIZE_NFKD = G_NORMALIZE_ALL,
  G_NORMALIZE_ALL_COMPOSE,
  G_NORMALIZE_NFKC = G_NORMALIZE_ALL_COMPOSE
} GNormalizeMode;

 extern
gchar *g_utf8_normalize (const gchar *str,
                         gssize len,
                         GNormalizeMode mode) __attribute__ ((__malloc__));

 extern
gint g_utf8_collate (const gchar *str1,
                           const gchar *str2) __attribute__((__pure__));
 extern
gchar *g_utf8_collate_key (const gchar *str,
                           gssize len) __attribute__ ((__malloc__));
 extern
gchar *g_utf8_collate_key_for_filename (const gchar *str,
                                        gssize len) __attribute__ ((__malloc__));

 extern
gchar *g_utf8_make_valid (const gchar *str,
                          gssize len) __attribute__ ((__malloc__));
# 36 "/usr/include/glib-2.0/glib/gstring.h" 2

# 1 "/usr/include/glib-2.0/glib/gstrfuncs.h" 1
# 34 "/usr/include/glib-2.0/glib/gstrfuncs.h"
# 1 "/usr/bin/../lib/clang/19/include/stdarg.h" 1 3
# 35 "/usr/include/glib-2.0/glib/gstrfuncs.h" 2
# 45 "/usr/include/glib-2.0/glib/gstrfuncs.h"
typedef enum {
  G_ASCII_ALNUM = 1 << 0,
  G_ASCII_ALPHA = 1 << 1,
  G_ASCII_CNTRL = 1 << 2,
  G_ASCII_DIGIT = 1 << 3,
  G_ASCII_GRAPH = 1 << 4,
  G_ASCII_LOWER = 1 << 5,
  G_ASCII_PRINT = 1 << 6,
  G_ASCII_PUNCT = 1 << 7,
  G_ASCII_SPACE = 1 << 8,
  G_ASCII_UPPER = 1 << 9,
  G_ASCII_XDIGIT = 1 << 10
} GAsciiType;

 extern const guint16 * const g_ascii_table;
# 94 "/usr/include/glib-2.0/glib/gstrfuncs.h"
 extern
gchar g_ascii_tolower (gchar c) __attribute__ ((__const__));
 extern
gchar g_ascii_toupper (gchar c) __attribute__ ((__const__));

 extern
gint g_ascii_digit_value (gchar c) __attribute__ ((__const__));
 extern
gint g_ascii_xdigit_value (gchar c) __attribute__ ((__const__));





 extern
gchar* g_strdelimit (gchar *string,
     const gchar *delimiters,
     gchar new_delimiter);
 extern
gchar* g_strcanon (gchar *string,
     const gchar *valid_chars,
     gchar substitutor);
 extern
const gchar * g_strerror (gint errnum) __attribute__ ((__const__));
 extern
const gchar * g_strsignal (gint signum) __attribute__ ((__const__));
 extern
gchar * g_strreverse (gchar *string);
 extern
gsize g_strlcpy (gchar *dest,
     const gchar *src,
     gsize dest_size);
 extern
gsize g_strlcat (gchar *dest,
     const gchar *src,
     gsize dest_size);
 extern
gchar * g_strstr_len (const gchar *haystack,
     gssize haystack_len,
     const gchar *needle);
 extern
gchar * g_strrstr (const gchar *haystack,
     const gchar *needle);
 extern
gchar * g_strrstr_len (const gchar *haystack,
     gssize haystack_len,
     const gchar *needle);

 extern
gboolean (g_str_has_suffix) (const gchar *str,
                                         const gchar *suffix);
 extern
gboolean (g_str_has_prefix) (const gchar *str,
                                         const gchar *prefix);
# 213 "/usr/include/glib-2.0/glib/gstrfuncs.h"
 extern
gdouble g_strtod (const gchar *nptr,
     gchar **endptr);
 extern
gdouble g_ascii_strtod (const gchar *nptr,
     gchar **endptr);
 extern
guint64 g_ascii_strtoull (const gchar *nptr,
     gchar **endptr,
     guint base);
 extern
gint64 g_ascii_strtoll (const gchar *nptr,
     gchar **endptr,
     guint base);




 extern
gchar * g_ascii_dtostr (gchar *buffer,
     gint buf_len,
     gdouble d);
 extern
gchar * g_ascii_formatd (gchar *buffer,
     gint buf_len,
     const gchar *format,
     gdouble d);


 extern
gchar* g_strchug (gchar *string);

 extern
gchar* g_strchomp (gchar *string);



 extern
gint g_ascii_strcasecmp (const gchar *s1,
        const gchar *s2);
 extern
gint g_ascii_strncasecmp (const gchar *s1,
        const gchar *s2,
        gsize n);
 extern
gchar* g_ascii_strdown (const gchar *str,
        gssize len) __attribute__ ((__malloc__));
 extern
gchar* g_ascii_strup (const gchar *str,
        gssize len) __attribute__ ((__malloc__));

 extern
gboolean g_str_is_ascii (const gchar *str);

__attribute__((__deprecated__)) extern
gint g_strcasecmp (const gchar *s1,
                                        const gchar *s2);
__attribute__((__deprecated__)) extern
gint g_strncasecmp (const gchar *s1,
                                        const gchar *s2,
                                        guint n);
__attribute__((__deprecated__)) extern
gchar* g_strdown (gchar *string);
__attribute__((__deprecated__)) extern
gchar* g_strup (gchar *string);





 extern
gchar* (g_strdup) (const gchar *str) __attribute__ ((__malloc__));
 extern
gchar* g_strdup_printf (const gchar *format,
     ...) __attribute__((__format__ (__printf__, 1, 2))) __attribute__ ((__malloc__));
 extern
gchar* g_strdup_vprintf (const gchar *format,
     va_list args) __attribute__((__format__ (__printf__, 1, 0))) __attribute__ ((__malloc__));
 extern
gchar* g_strndup (const gchar *str,
     gsize n) __attribute__ ((__malloc__));
 extern
gchar* g_strnfill (gsize length,
     gchar fill_char) __attribute__ ((__malloc__));
 extern
gchar* g_strconcat (const gchar *string1,
     ...) __attribute__ ((__malloc__)) __attribute__((__sentinel__));
 extern
gchar* g_strjoin (const gchar *separator,
     ...) __attribute__ ((__malloc__)) __attribute__((__sentinel__));





__attribute__ ((__always_inline__)) static inline char *
g_strdup_inline (const char *str)
{
  if (__builtin_constant_p (!str) && !str)
    return ((void*)0);

  if (__builtin_constant_p (!!str) && !!str && __builtin_constant_p (strlen (str)))
    {
      const size_t len = strlen (str) + 1;
      char *dup_str = (char *) g_malloc (len);
      return (char *) memcpy (dup_str, str, len);
    }

  return g_strdup (str);
}







 extern
gchar* g_strcompress (const gchar *source) __attribute__ ((__malloc__));

 extern
gchar* g_strescape (const gchar *source,
     const gchar *exceptions) __attribute__ ((__malloc__));

__attribute__((__deprecated__("Use '" "g_memdup2" "' instead"))) extern
gpointer g_memdup (gconstpointer mem,
                                        guint byte_size) __attribute__((__alloc_size__(2)));

 extern
gpointer g_memdup2 (gconstpointer mem,
                                        gsize byte_size) __attribute__((__alloc_size__(2)));
# 354 "/usr/include/glib-2.0/glib/gstrfuncs.h"
typedef gchar** GStrv;
 extern
gchar** g_strsplit (const gchar *string,
     const gchar *delimiter,
     gint max_tokens);
 extern
gchar ** g_strsplit_set (const gchar *string,
     const gchar *delimiters,
     gint max_tokens);
 extern
gchar* g_strjoinv (const gchar *separator,
     gchar **str_array) __attribute__ ((__malloc__));
 extern
void g_strfreev (gchar **str_array);
 extern
gchar** g_strdupv (gchar **str_array);
 extern
guint g_strv_length (gchar **str_array);

 extern
gchar* g_stpcpy (gchar *dest,
                                        const char *src);

 extern
gchar * g_str_to_ascii (const gchar *str,
                                                                         const gchar *from_locale);

 extern
gchar ** g_str_tokenize_and_fold (const gchar *string,
                                                                         const gchar *translit_locale,
                                                                         gchar ***ascii_alternates);

 extern
gboolean g_str_match_string (const gchar *search_term,
                                                                         const gchar *potential_hit,
                                                                         gboolean accept_alternates);

 extern
gboolean g_strv_contains (const gchar * const *strv,
                                        const gchar *str);

 extern
gboolean g_strv_equal (const gchar * const *strv1,
                                        const gchar * const *strv2);
# 410 "/usr/include/glib-2.0/glib/gstrfuncs.h"
typedef enum
  {
    G_NUMBER_PARSER_ERROR_INVALID,
    G_NUMBER_PARSER_ERROR_OUT_OF_BOUNDS,
  } GNumberParserError;
# 426 "/usr/include/glib-2.0/glib/gstrfuncs.h"
 extern
GQuark g_number_parser_error_quark (void);

 extern
gboolean g_ascii_string_to_signed (const gchar *str,
                                                    guint base,
                                                    gint64 min,
                                                    gint64 max,
                                                    gint64 *out_num,
                                                    GError **error);

 extern
gboolean g_ascii_string_to_unsigned (const gchar *str,
                                                    guint base,
                                                    guint64 min,
                                                    guint64 max,
                                                    guint64 *out_num,
                                                    GError **error);
# 479 "/usr/include/glib-2.0/glib/gstrfuncs.h"
static inline gboolean
g_set_str (char **str_pointer,
           const char *new_str)
{
  char *copy;

  if (*str_pointer == new_str ||
      (*str_pointer && new_str && strcmp (*str_pointer, new_str) == 0))
    return (0);

  copy = g_strdup_inline (new_str);
  g_free (*str_pointer);
  *str_pointer = copy;

  return (!(0));
}
# 38 "/usr/include/glib-2.0/glib/gstring.h" 2





typedef struct _GString GString;

struct _GString
{
  gchar *str;
  gsize len;
  gsize allocated_len;
};

 extern
GString* g_string_new (const gchar *init);
 extern
GString* g_string_new_take (gchar *init);
 extern
GString* g_string_new_len (const gchar *init,
                                         gssize len);
 extern
GString* g_string_sized_new (gsize dfl_size);
 extern
gchar* (g_string_free) (GString *string,
                                         gboolean free_segment);
 extern
gchar* g_string_free_and_steal (GString *string) __attribute__((warn_unused_result));
# 83 "/usr/include/glib-2.0/glib/gstring.h"
 extern
GBytes* g_string_free_to_bytes (GString *string);
 extern
gboolean g_string_equal (const GString *v,
                                         const GString *v2);
 extern
guint g_string_hash (const GString *str);
 extern
GString* g_string_assign (GString *string,
                                         const gchar *rval);
 extern
GString* g_string_truncate (GString *string,
                                         gsize len);
 extern
GString* g_string_set_size (GString *string,
                                         gsize len);
 extern
GString* g_string_insert_len (GString *string,
                                         gssize pos,
                                         const gchar *val,
                                         gssize len);
 extern
GString* g_string_append (GString *string,
                                         const gchar *val);
 extern
GString* g_string_append_len (GString *string,
                                         const gchar *val,
                                         gssize len);
 extern
GString* g_string_append_c (GString *string,
                                         gchar c);
 extern
GString* g_string_append_unichar (GString *string,
                                         gunichar wc);
 extern
GString* g_string_prepend (GString *string,
                                         const gchar *val);
 extern
GString* g_string_prepend_c (GString *string,
                                         gchar c);
 extern
GString* g_string_prepend_unichar (GString *string,
                                         gunichar wc);
 extern
GString* g_string_prepend_len (GString *string,
                                         const gchar *val,
                                         gssize len);
 extern
GString* g_string_insert (GString *string,
                                         gssize pos,
                                         const gchar *val);
 extern
GString* g_string_insert_c (GString *string,
                                         gssize pos,
                                         gchar c);
 extern
GString* g_string_insert_unichar (GString *string,
                                         gssize pos,
                                         gunichar wc);
 extern
GString* g_string_overwrite (GString *string,
                                         gsize pos,
                                         const gchar *val);
 extern
GString* g_string_overwrite_len (GString *string,
                                         gsize pos,
                                         const gchar *val,
                                         gssize len);
 extern
GString* g_string_erase (GString *string,
                                         gssize pos,
                                         gssize len);
 extern
guint g_string_replace (GString *string,
                                         const gchar *find,
                                         const gchar *replace,
                                         guint limit);
 extern
GString* g_string_ascii_down (GString *string);
 extern
GString* g_string_ascii_up (GString *string);
 extern
void g_string_vprintf (GString *string,
                                         const gchar *format,
                                         va_list args)
                                         __attribute__((__format__ (__printf__, 2, 0)));
 extern
void g_string_printf (GString *string,
                                         const gchar *format,
                                         ...) __attribute__((__format__ (__printf__, 2, 3)));
 extern
void g_string_append_vprintf (GString *string,
                                         const gchar *format,
                                         va_list args)
                                         __attribute__((__format__ (__printf__, 2, 0)));
 extern
void g_string_append_printf (GString *string,
                                         const gchar *format,
                                         ...) __attribute__((__format__ (__printf__, 2, 3)));
 extern
GString* g_string_append_uri_escaped (GString *string,
                                          const gchar *unescaped,
                                          const gchar *reserved_chars_allowed,
                                          gboolean allow_utf8);
# 197 "/usr/include/glib-2.0/glib/gstring.h"
__attribute__ ((__always_inline__))
static inline GString*
g_string_append_c_inline (GString *gstring,
                          gchar c)
{
  if ((__builtin_expect (__extension__ ({ int _g_boolean_var_3; if (gstring != ((void*)0) && gstring->len + 1 < gstring->allocated_len) _g_boolean_var_3 = 1; else _g_boolean_var_3 = 0; _g_boolean_var_3; }), 1)))

    {
      gstring->str[gstring->len++] = c;
      gstring->str[gstring->len] = 0;
    }
  else
    g_string_insert_c (gstring, -1, c);
  return gstring;
}




__attribute__ ((__always_inline__))
static inline GString *
g_string_append_len_inline (GString *gstring,
                            const char *val,
                            gssize len)
{
  gsize len_unsigned;

  if (__builtin_expect (__extension__ ({ int _g_boolean_var_4; if (gstring == ((void*)0)) _g_boolean_var_4 = 1; else _g_boolean_var_4 = 0; _g_boolean_var_4; }), 0))
    return g_string_append_len (gstring, val, len);

  if (__builtin_expect (__extension__ ({ int _g_boolean_var_5; if (val == ((void*)0)) _g_boolean_var_5 = 1; else _g_boolean_var_5 = 0; _g_boolean_var_5; }), 0))
    return (len != 0) ? g_string_append_len (gstring, val, len) : gstring;

  if (len < 0)
    len_unsigned = strlen (val);
  else
    len_unsigned = (gsize) len;

  if ((__builtin_expect (__extension__ ({ int _g_boolean_var_6; if (gstring->len + len_unsigned < gstring->allocated_len) _g_boolean_var_6 = 1; else _g_boolean_var_6 = 0; _g_boolean_var_6; }), 1)))
    {
      char *end = gstring->str + gstring->len;
      if ((__builtin_expect (__extension__ ({ int _g_boolean_var_7; if (val + len_unsigned <= end || val > end + len_unsigned) _g_boolean_var_7 = 1; else _g_boolean_var_7 = 0; _g_boolean_var_7; }), 1)))
        memcpy (end, val, len_unsigned);
      else
        memmove (end, val, len_unsigned);
      gstring->len += len_unsigned;
      gstring->str[gstring->len] = 0;
      return gstring;
    }
  else
    return g_string_insert_len (gstring, -1, val, len);
}




__attribute__ ((__always_inline__))
static inline GString *
g_string_truncate_inline (GString *gstring,
                          gsize len)
{
  gstring->len = (((len) < (gstring->len)) ? (len) : (gstring->len));
  gstring->str[gstring->len] = '\0';
  return gstring;
}
# 290 "/usr/include/glib-2.0/glib/gstring.h"
__attribute__((__deprecated__)) extern
GString *g_string_down (GString *string);
__attribute__((__deprecated__)) extern
GString *g_string_up (GString *string);
# 37 "/usr/include/glib-2.0/glib/giochannel.h" 2






typedef struct _GIOChannel GIOChannel;
typedef struct _GIOFuncs GIOFuncs;

typedef enum
{
  G_IO_ERROR_NONE,
  G_IO_ERROR_AGAIN,
  G_IO_ERROR_INVAL,
  G_IO_ERROR_UNKNOWN
} GIOError;



typedef enum
{

  G_IO_CHANNEL_ERROR_FBIG,
  G_IO_CHANNEL_ERROR_INVAL,
  G_IO_CHANNEL_ERROR_IO,
  G_IO_CHANNEL_ERROR_ISDIR,
  G_IO_CHANNEL_ERROR_NOSPC,
  G_IO_CHANNEL_ERROR_NXIO,
  G_IO_CHANNEL_ERROR_OVERFLOW,
  G_IO_CHANNEL_ERROR_PIPE,

  G_IO_CHANNEL_ERROR_FAILED
} GIOChannelError;

typedef enum
{
  G_IO_STATUS_ERROR,
  G_IO_STATUS_NORMAL,
  G_IO_STATUS_EOF,
  G_IO_STATUS_AGAIN
} GIOStatus;

typedef enum
{
  G_SEEK_CUR,
  G_SEEK_SET,
  G_SEEK_END
} GSeekType;

typedef enum
{
  G_IO_FLAG_NONE = 0,
  G_IO_FLAG_APPEND = 1 << 0,
  G_IO_FLAG_NONBLOCK = 1 << 1,
  G_IO_FLAG_IS_READABLE = 1 << 2,
  G_IO_FLAG_IS_WRITABLE = 1 << 3,
  G_IO_FLAG_IS_WRITEABLE = 1 << 3,
  G_IO_FLAG_IS_SEEKABLE = 1 << 4,
  G_IO_FLAG_MASK = (1 << 5) - 1,
  G_IO_FLAG_GET_MASK = G_IO_FLAG_MASK,
  G_IO_FLAG_SET_MASK = G_IO_FLAG_APPEND | G_IO_FLAG_NONBLOCK
} GIOFlags;

struct _GIOChannel
{

  gint ref_count;
  GIOFuncs *funcs;

  gchar *encoding;
  GIConv read_cd;
  GIConv write_cd;
  gchar *line_term;
  guint line_term_len;

  gsize buf_size;
  GString *read_buf;
  GString *encoded_read_buf;
  GString *write_buf;
  gchar partial_write_buf[6];



  guint use_buffer : 1;
  guint do_encode : 1;
  guint close_on_unref : 1;
  guint is_readable : 1;
  guint is_writeable : 1;
  guint is_seekable : 1;

  gpointer reserved1;
  gpointer reserved2;
};

typedef gboolean (*GIOFunc) (GIOChannel *source,
        GIOCondition condition,
        gpointer data);
struct _GIOFuncs
{
  GIOStatus (*io_read) (GIOChannel *channel,
             gchar *buf,
      gsize count,
      gsize *bytes_read,
      GError **err);
  GIOStatus (*io_write) (GIOChannel *channel,
      const gchar *buf,
      gsize count,
      gsize *bytes_written,
      GError **err);
  GIOStatus (*io_seek) (GIOChannel *channel,
      gint64 offset,
      GSeekType type,
      GError **err);
  GIOStatus (*io_close) (GIOChannel *channel,
      GError **err);
  GSource* (*io_create_watch) (GIOChannel *channel,
      GIOCondition condition);
  void (*io_free) (GIOChannel *channel);
  GIOStatus (*io_set_flags) (GIOChannel *channel,
                                  GIOFlags flags,
      GError **err);
  GIOFlags (*io_get_flags) (GIOChannel *channel);
};

 extern
void g_io_channel_init (GIOChannel *channel);
 extern
GIOChannel *g_io_channel_ref (GIOChannel *channel);
 extern
void g_io_channel_unref (GIOChannel *channel);

__attribute__((__deprecated__("Use '" "g_io_channel_read_chars" "' instead"))) extern
GIOError g_io_channel_read (GIOChannel *channel,
                                 gchar *buf,
                                 gsize count,
                                 gsize *bytes_read);

__attribute__((__deprecated__("Use '" "g_io_channel_write_chars" "' instead"))) extern
GIOError g_io_channel_write (GIOChannel *channel,
                                 const gchar *buf,
                                 gsize count,
                                 gsize *bytes_written);

__attribute__((__deprecated__("Use '" "g_io_channel_seek_position" "' instead"))) extern
GIOError g_io_channel_seek (GIOChannel *channel,
                                 gint64 offset,
                                 GSeekType type);

__attribute__((__deprecated__("Use '" "g_io_channel_shutdown" "' instead"))) extern
void g_io_channel_close (GIOChannel *channel);

 extern
GIOStatus g_io_channel_shutdown (GIOChannel *channel,
     gboolean flush,
     GError **err);
 extern
guint g_io_add_watch_full (GIOChannel *channel,
     gint priority,
     GIOCondition condition,
     GIOFunc func,
     gpointer user_data,
     GDestroyNotify notify);
 extern
GSource * g_io_create_watch (GIOChannel *channel,
     GIOCondition condition);
 extern
guint g_io_add_watch (GIOChannel *channel,
     GIOCondition condition,
     GIOFunc func,
     gpointer user_data);




 extern
void g_io_channel_set_buffer_size (GIOChannel *channel,
        gsize size);
 extern
gsize g_io_channel_get_buffer_size (GIOChannel *channel);
 extern
GIOCondition g_io_channel_get_buffer_condition (GIOChannel *channel);
 extern
GIOStatus g_io_channel_set_flags (GIOChannel *channel,
        GIOFlags flags,
        GError **error);
 extern
GIOFlags g_io_channel_get_flags (GIOChannel *channel);
 extern
void g_io_channel_set_line_term (GIOChannel *channel,
        const gchar *line_term,
        gint length);
 extern
const gchar * g_io_channel_get_line_term (GIOChannel *channel,
        gint *length);
 extern
void g_io_channel_set_buffered (GIOChannel *channel,
        gboolean buffered);
 extern
gboolean g_io_channel_get_buffered (GIOChannel *channel);
 extern
GIOStatus g_io_channel_set_encoding (GIOChannel *channel,
        const gchar *encoding,
        GError **error);
 extern
const gchar * g_io_channel_get_encoding (GIOChannel *channel);
 extern
void g_io_channel_set_close_on_unref (GIOChannel *channel,
        gboolean do_close);
 extern
gboolean g_io_channel_get_close_on_unref (GIOChannel *channel);


 extern
GIOStatus g_io_channel_flush (GIOChannel *channel,
        GError **error);
 extern
GIOStatus g_io_channel_read_line (GIOChannel *channel,
        gchar **str_return,
        gsize *length,
        gsize *terminator_pos,
        GError **error);
 extern
GIOStatus g_io_channel_read_line_string (GIOChannel *channel,
        GString *buffer,
        gsize *terminator_pos,
        GError **error);
 extern
GIOStatus g_io_channel_read_to_end (GIOChannel *channel,
        gchar **str_return,
        gsize *length,
        GError **error);
 extern
GIOStatus g_io_channel_read_chars (GIOChannel *channel,
        gchar *buf,
        gsize count,
        gsize *bytes_read,
        GError **error);
 extern
GIOStatus g_io_channel_read_unichar (GIOChannel *channel,
        gunichar *thechar,
        GError **error);
 extern
GIOStatus g_io_channel_write_chars (GIOChannel *channel,
        const gchar *buf,
        gssize count,
        gsize *bytes_written,
        GError **error);
 extern
GIOStatus g_io_channel_write_unichar (GIOChannel *channel,
        gunichar thechar,
        GError **error);
 extern
GIOStatus g_io_channel_seek_position (GIOChannel *channel,
        gint64 offset,
        GSeekType type,
        GError **error);
 extern
GIOChannel* g_io_channel_new_file (const gchar *filename,
        const gchar *mode,
        GError **error);



 extern
GQuark g_io_channel_error_quark (void);
 extern
GIOChannelError g_io_channel_error_from_errno (gint en);
# 323 "/usr/include/glib-2.0/glib/giochannel.h"
 extern
GIOChannel* g_io_channel_unix_new (int fd);
 extern
gint g_io_channel_unix_get_fd (GIOChannel *channel);



 extern GSourceFuncs g_io_watch_funcs;
# 57 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gkeyfile.h" 1
# 35 "/usr/include/glib-2.0/glib/gkeyfile.h"
typedef enum
{
  G_KEY_FILE_ERROR_UNKNOWN_ENCODING,
  G_KEY_FILE_ERROR_PARSE,
  G_KEY_FILE_ERROR_NOT_FOUND,
  G_KEY_FILE_ERROR_KEY_NOT_FOUND,
  G_KEY_FILE_ERROR_GROUP_NOT_FOUND,
  G_KEY_FILE_ERROR_INVALID_VALUE
} GKeyFileError;



 extern
GQuark g_key_file_error_quark (void);

typedef struct _GKeyFile GKeyFile;

typedef enum
{
  G_KEY_FILE_NONE = 0,
  G_KEY_FILE_KEEP_COMMENTS = 1 << 0,
  G_KEY_FILE_KEEP_TRANSLATIONS = 1 << 1
} GKeyFileFlags;

 extern
GKeyFile *g_key_file_new (void);
 extern
GKeyFile *g_key_file_ref (GKeyFile *key_file);
 extern
void g_key_file_unref (GKeyFile *key_file);
 extern
void g_key_file_free (GKeyFile *key_file);
 extern
void g_key_file_set_list_separator (GKeyFile *key_file,
          gchar separator);
 extern
gboolean g_key_file_load_from_file (GKeyFile *key_file,
          const gchar *file,
          GKeyFileFlags flags,
          GError **error);
 extern
gboolean g_key_file_load_from_data (GKeyFile *key_file,
          const gchar *data,
          gsize length,
          GKeyFileFlags flags,
          GError **error);
 extern
gboolean g_key_file_load_from_bytes (GKeyFile *key_file,
                                             GBytes *bytes,
                                             GKeyFileFlags flags,
                                             GError **error);
 extern
gboolean g_key_file_load_from_dirs (GKeyFile *key_file,
          const gchar *file,
          const gchar **search_dirs,
          gchar **full_path,
          GKeyFileFlags flags,
          GError **error);
 extern
gboolean g_key_file_load_from_data_dirs (GKeyFile *key_file,
          const gchar *file,
          gchar **full_path,
          GKeyFileFlags flags,
          GError **error);
 extern
gchar *g_key_file_to_data (GKeyFile *key_file,
          gsize *length,
          GError **error) __attribute__ ((__malloc__));
 extern
gboolean g_key_file_save_to_file (GKeyFile *key_file,
                                             const gchar *filename,
                                             GError **error);
 extern
gchar *g_key_file_get_start_group (GKeyFile *key_file) __attribute__ ((__malloc__));
 extern
gchar **g_key_file_get_groups (GKeyFile *key_file,
          gsize *length);
 extern
gchar **g_key_file_get_keys (GKeyFile *key_file,
          const gchar *group_name,
          gsize *length,
          GError **error);
 extern
gboolean g_key_file_has_group (GKeyFile *key_file,
          const gchar *group_name);
 extern
gboolean g_key_file_has_key (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
 extern
gchar *g_key_file_get_value (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error) __attribute__ ((__malloc__));
 extern
void g_key_file_set_value (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *value);
 extern
gchar *g_key_file_get_string (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error) __attribute__ ((__malloc__));
 extern
void g_key_file_set_string (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *string);
 extern
gchar *g_key_file_get_locale_string (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *locale,
          GError **error) __attribute__ ((__malloc__));
 extern
gchar *g_key_file_get_locale_for_key (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             const gchar *locale) __attribute__ ((__malloc__));
 extern
void g_key_file_set_locale_string (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *locale,
          const gchar *string);
 extern
gboolean g_key_file_get_boolean (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
 extern
void g_key_file_set_boolean (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gboolean value);
 extern
gint g_key_file_get_integer (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
 extern
void g_key_file_set_integer (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gint value);
 extern
gint64 g_key_file_get_int64 (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
 extern
void g_key_file_set_int64 (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gint64 value);
 extern
guint64 g_key_file_get_uint64 (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
 extern
void g_key_file_set_uint64 (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          guint64 value);
 extern
gdouble g_key_file_get_double (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             GError **error);
 extern
void g_key_file_set_double (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             gdouble value);
 extern
gchar **g_key_file_get_string_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gsize *length,
          GError **error);
 extern
void g_key_file_set_string_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar * const list[],
          gsize length);
 extern
gchar **g_key_file_get_locale_string_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *locale,
          gsize *length,
          GError **error);
 extern
void g_key_file_set_locale_string_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          const gchar *locale,
          const gchar * const list[],
          gsize length);
 extern
gboolean *g_key_file_get_boolean_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gsize *length,
          GError **error) __attribute__ ((__malloc__));
 extern
void g_key_file_set_boolean_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gboolean list[],
          gsize length);
 extern
gint *g_key_file_get_integer_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gsize *length,
          GError **error) __attribute__ ((__malloc__));
 extern
void g_key_file_set_double_list (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             gdouble list[],
                                             gsize length);
 extern
gdouble *g_key_file_get_double_list (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             gsize *length,
                                             GError **error) __attribute__ ((__malloc__));
 extern
void g_key_file_set_integer_list (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          gint list[],
          gsize length);
 extern
gboolean g_key_file_set_comment (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             const gchar *comment,
                                             GError **error);
 extern
gchar *g_key_file_get_comment (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
                                             GError **error) __attribute__ ((__malloc__));

 extern
gboolean g_key_file_remove_comment (GKeyFile *key_file,
                                             const gchar *group_name,
                                             const gchar *key,
          GError **error);
 extern
gboolean g_key_file_remove_key (GKeyFile *key_file,
          const gchar *group_name,
          const gchar *key,
          GError **error);
 extern
gboolean g_key_file_remove_group (GKeyFile *key_file,
          const gchar *group_name,
          GError **error);
# 58 "/usr/include/glib-2.0/glib.h" 2



# 1 "/usr/include/glib-2.0/glib/gmappedfile.h" 1
# 34 "/usr/include/glib-2.0/glib/gmappedfile.h"
typedef struct _GMappedFile GMappedFile;

 extern
GMappedFile *g_mapped_file_new (const gchar *filename,
             gboolean writable,
             GError **error);
 extern
GMappedFile *g_mapped_file_new_from_fd (gint fd,
      gboolean writable,
      GError **error);
 extern
gsize g_mapped_file_get_length (GMappedFile *file);
 extern
gchar *g_mapped_file_get_contents (GMappedFile *file);
 extern
GBytes * g_mapped_file_get_bytes (GMappedFile *file);
 extern
GMappedFile *g_mapped_file_ref (GMappedFile *file);
 extern
void g_mapped_file_unref (GMappedFile *file);

__attribute__((__deprecated__("Use '" "g_mapped_file_unref" "' instead"))) extern
void g_mapped_file_free (GMappedFile *file);
# 62 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gmarkup.h" 1
# 28 "/usr/include/glib-2.0/glib/gmarkup.h"
# 1 "/usr/bin/../lib/clang/19/include/stdarg.h" 1 3
# 29 "/usr/include/glib-2.0/glib/gmarkup.h" 2
# 51 "/usr/include/glib-2.0/glib/gmarkup.h"
typedef enum
{
  G_MARKUP_ERROR_BAD_UTF8,
  G_MARKUP_ERROR_EMPTY,
  G_MARKUP_ERROR_PARSE,



  G_MARKUP_ERROR_UNKNOWN_ELEMENT,
  G_MARKUP_ERROR_UNKNOWN_ATTRIBUTE,
  G_MARKUP_ERROR_INVALID_CONTENT,
  G_MARKUP_ERROR_MISSING_ATTRIBUTE
} GMarkupError;
# 74 "/usr/include/glib-2.0/glib/gmarkup.h"
 extern
GQuark g_markup_error_quark (void);
# 98 "/usr/include/glib-2.0/glib/gmarkup.h"
typedef enum
{
  G_MARKUP_DEFAULT_FLAGS = 0,
  G_MARKUP_DO_NOT_USE_THIS_UNSUPPORTED_FLAG = 1 << 0,
  G_MARKUP_TREAT_CDATA_AS_TEXT = 1 << 1,
  G_MARKUP_PREFIX_ERROR_POSITION = 1 << 2,
  G_MARKUP_IGNORE_QUALIFIED = 1 << 3
} GMarkupParseFlags;
# 116 "/usr/include/glib-2.0/glib/gmarkup.h"
typedef struct _GMarkupParseContext GMarkupParseContext;
typedef struct _GMarkupParser GMarkupParser;
# 147 "/usr/include/glib-2.0/glib/gmarkup.h"
struct _GMarkupParser
{

  void (*start_element) (GMarkupParseContext *context,
                          const gchar *element_name,
                          const gchar **attribute_names,
                          const gchar **attribute_values,
                          gpointer user_data,
                          GError **error);


  void (*end_element) (GMarkupParseContext *context,
                          const gchar *element_name,
                          gpointer user_data,
                          GError **error);



  void (*text) (GMarkupParseContext *context,
                          const gchar *text,
                          gsize text_len,
                          gpointer user_data,
                          GError **error);






  void (*passthrough) (GMarkupParseContext *context,
                          const gchar *passthrough_text,
                          gsize text_len,
                          gpointer user_data,
                          GError **error);




  void (*error) (GMarkupParseContext *context,
                          GError *error,
                          gpointer user_data);
};

 extern
GMarkupParseContext *g_markup_parse_context_new (const GMarkupParser *parser,
                                                   GMarkupParseFlags flags,
                                                   gpointer user_data,
                                                   GDestroyNotify user_data_dnotify);
 extern
GMarkupParseContext *g_markup_parse_context_ref (GMarkupParseContext *context);
 extern
void g_markup_parse_context_unref (GMarkupParseContext *context);
 extern
void g_markup_parse_context_free (GMarkupParseContext *context);
 extern
gboolean g_markup_parse_context_parse (GMarkupParseContext *context,
                                                   const gchar *text,
                                                   gssize text_len,
                                                   GError **error);
 extern
void g_markup_parse_context_push (GMarkupParseContext *context,
                                                   const GMarkupParser *parser,
                                                   gpointer user_data);
 extern
gpointer g_markup_parse_context_pop (GMarkupParseContext *context);

 extern
gboolean g_markup_parse_context_end_parse (GMarkupParseContext *context,
                                                       GError **error);
 extern
const gchar * g_markup_parse_context_get_element (GMarkupParseContext *context);
 extern
const GSList * g_markup_parse_context_get_element_stack (GMarkupParseContext *context);


 extern
void g_markup_parse_context_get_position (GMarkupParseContext *context,
                                                          gint *line_number,
                                                          gint *char_number);
 extern
gpointer g_markup_parse_context_get_user_data (GMarkupParseContext *context);


 extern
gchar* g_markup_escape_text (const gchar *text,
                             gssize length);

 extern
gchar *g_markup_printf_escaped (const char *format,
    ...) __attribute__((__format__ (__printf__, 1, 2)));
 extern
gchar *g_markup_vprintf_escaped (const char *format,
     va_list args) __attribute__((__format__ (__printf__, 1, 0)));

typedef enum
{
  G_MARKUP_COLLECT_INVALID,
  G_MARKUP_COLLECT_STRING,
  G_MARKUP_COLLECT_STRDUP,
  G_MARKUP_COLLECT_BOOLEAN,
  G_MARKUP_COLLECT_TRISTATE,

  G_MARKUP_COLLECT_OPTIONAL = (1 << 16)
} GMarkupCollectType;



 extern
gboolean g_markup_collect_attributes (const gchar *element_name,
                                        const gchar **attribute_names,
                                        const gchar **attribute_values,
                                        GError **error,
                                        GMarkupCollectType first_type,
                                        const gchar *first_attr,
                                        ...);
# 63 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gmessages.h" 1
# 34 "/usr/include/glib-2.0/glib/gmessages.h"
# 1 "/usr/bin/../lib/clang/19/include/stdarg.h" 1 3
# 35 "/usr/include/glib-2.0/glib/gmessages.h" 2



# 1 "/usr/include/glib-2.0/glib/gvariant.h" 1
# 30 "/usr/include/glib-2.0/glib/gvariant.h"
# 1 "/usr/include/glib-2.0/glib/gvarianttype.h" 1
# 34 "/usr/include/glib-2.0/glib/gvarianttype.h"
typedef struct _GVariantType GVariantType;
# 288 "/usr/include/glib-2.0/glib/gvarianttype.h"
 extern
gboolean g_variant_type_string_is_valid (const gchar *type_string);
 extern
gboolean g_variant_type_string_scan (const gchar *string,
                                                                         const gchar *limit,
                                                                         const gchar **endptr);


 extern
void g_variant_type_free (GVariantType *type);
 extern
GVariantType * g_variant_type_copy (const GVariantType *type);
 extern
GVariantType * g_variant_type_new (const gchar *type_string);


 extern
gsize g_variant_type_get_string_length (const GVariantType *type);
 extern
const gchar * g_variant_type_peek_string (const GVariantType *type);
 extern
gchar * g_variant_type_dup_string (const GVariantType *type);


 extern
gboolean g_variant_type_is_definite (const GVariantType *type);
 extern
gboolean g_variant_type_is_container (const GVariantType *type);
 extern
gboolean g_variant_type_is_basic (const GVariantType *type);
 extern
gboolean g_variant_type_is_maybe (const GVariantType *type);
 extern
gboolean g_variant_type_is_array (const GVariantType *type);
 extern
gboolean g_variant_type_is_tuple (const GVariantType *type);
 extern
gboolean g_variant_type_is_dict_entry (const GVariantType *type);
 extern
gboolean g_variant_type_is_variant (const GVariantType *type);


 extern
guint g_variant_type_hash (gconstpointer type);
 extern
gboolean g_variant_type_equal (gconstpointer type1,
                                                                         gconstpointer type2);


 extern
gboolean g_variant_type_is_subtype_of (const GVariantType *type,
                                                                         const GVariantType *supertype);


 extern
const GVariantType * g_variant_type_element (const GVariantType *type);
 extern
const GVariantType * g_variant_type_first (const GVariantType *type);
 extern
const GVariantType * g_variant_type_next (const GVariantType *type);
 extern
gsize g_variant_type_n_items (const GVariantType *type);
 extern
const GVariantType * g_variant_type_key (const GVariantType *type);
 extern
const GVariantType * g_variant_type_value (const GVariantType *type);


 extern
GVariantType * g_variant_type_new_array (const GVariantType *element);
 extern
GVariantType * g_variant_type_new_maybe (const GVariantType *element);
 extern
GVariantType * g_variant_type_new_tuple (const GVariantType * const *items,
                                                                         gint length);
 extern
GVariantType * g_variant_type_new_dict_entry (const GVariantType *key,
                                                                         const GVariantType *value);


 extern
const GVariantType * g_variant_type_checked_ (const gchar *type_string);
 extern
gsize g_variant_type_string_get_depth_ (const gchar *type_string);
# 31 "/usr/include/glib-2.0/glib/gvariant.h" 2





typedef struct _GVariant GVariant;

typedef enum
{
  G_VARIANT_CLASS_BOOLEAN = 'b',
  G_VARIANT_CLASS_BYTE = 'y',
  G_VARIANT_CLASS_INT16 = 'n',
  G_VARIANT_CLASS_UINT16 = 'q',
  G_VARIANT_CLASS_INT32 = 'i',
  G_VARIANT_CLASS_UINT32 = 'u',
  G_VARIANT_CLASS_INT64 = 'x',
  G_VARIANT_CLASS_UINT64 = 't',
  G_VARIANT_CLASS_HANDLE = 'h',
  G_VARIANT_CLASS_DOUBLE = 'd',
  G_VARIANT_CLASS_STRING = 's',
  G_VARIANT_CLASS_OBJECT_PATH = 'o',
  G_VARIANT_CLASS_SIGNATURE = 'g',
  G_VARIANT_CLASS_VARIANT = 'v',
  G_VARIANT_CLASS_MAYBE = 'm',
  G_VARIANT_CLASS_ARRAY = 'a',
  G_VARIANT_CLASS_TUPLE = '(',
  G_VARIANT_CLASS_DICT_ENTRY = '{'
} GVariantClass;

 extern
void g_variant_unref (GVariant *value);
 extern
GVariant * g_variant_ref (GVariant *value);
 extern
GVariant * g_variant_ref_sink (GVariant *value);
 extern
gboolean g_variant_is_floating (GVariant *value);
 extern
GVariant * g_variant_take_ref (GVariant *value);

 extern
const GVariantType * g_variant_get_type (GVariant *value);
 extern
const gchar * g_variant_get_type_string (GVariant *value);
 extern
gboolean g_variant_is_of_type (GVariant *value,
                                                                         const GVariantType *type);
 extern
gboolean g_variant_is_container (GVariant *value);
 extern
GVariantClass g_variant_classify (GVariant *value);
 extern
GVariant * g_variant_new_boolean (gboolean value);
 extern
GVariant * g_variant_new_byte (guint8 value);
 extern
GVariant * g_variant_new_int16 (gint16 value);
 extern
GVariant * g_variant_new_uint16 (guint16 value);
 extern
GVariant * g_variant_new_int32 (gint32 value);
 extern
GVariant * g_variant_new_uint32 (guint32 value);
 extern
GVariant * g_variant_new_int64 (gint64 value);
 extern
GVariant * g_variant_new_uint64 (guint64 value);
 extern
GVariant * g_variant_new_handle (gint32 value);
 extern
GVariant * g_variant_new_double (gdouble value);
 extern
GVariant * g_variant_new_string (const gchar *string);
 extern
GVariant * g_variant_new_take_string (gchar *string);
 extern
GVariant * g_variant_new_printf (const gchar *format_string,
                                                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
 extern
GVariant * g_variant_new_object_path (const gchar *object_path);
 extern
gboolean g_variant_is_object_path (const gchar *string);
 extern
GVariant * g_variant_new_signature (const gchar *signature);
 extern
gboolean g_variant_is_signature (const gchar *string);
 extern
GVariant * g_variant_new_variant (GVariant *value);
 extern
GVariant * g_variant_new_strv (const gchar * const *strv,
                                                                         gssize length);
 extern
GVariant * g_variant_new_objv (const gchar * const *strv,
                                                                         gssize length);
 extern
GVariant * g_variant_new_bytestring (const gchar *string);
 extern
GVariant * g_variant_new_bytestring_array (const gchar * const *strv,
                                                                         gssize length);
 extern
GVariant * g_variant_new_fixed_array (const GVariantType *element_type,
                                                                         gconstpointer elements,
                                                                         gsize n_elements,
                                                                         gsize element_size);
 extern
gboolean g_variant_get_boolean (GVariant *value);
 extern
guint8 g_variant_get_byte (GVariant *value);
 extern
gint16 g_variant_get_int16 (GVariant *value);
 extern
guint16 g_variant_get_uint16 (GVariant *value);
 extern
gint32 g_variant_get_int32 (GVariant *value);
 extern
guint32 g_variant_get_uint32 (GVariant *value);
 extern
gint64 g_variant_get_int64 (GVariant *value);
 extern
guint64 g_variant_get_uint64 (GVariant *value);
 extern
gint32 g_variant_get_handle (GVariant *value);
 extern
gdouble g_variant_get_double (GVariant *value);
 extern
GVariant * g_variant_get_variant (GVariant *value);
 extern
const gchar * g_variant_get_string (GVariant *value,
                                                                         gsize *length);
 extern
gchar * g_variant_dup_string (GVariant *value,
                                                                         gsize *length);
 extern
const gchar ** g_variant_get_strv (GVariant *value,
                                                                         gsize *length);
 extern
gchar ** g_variant_dup_strv (GVariant *value,
                                                                         gsize *length);
 extern
const gchar ** g_variant_get_objv (GVariant *value,
                                                                         gsize *length);
 extern
gchar ** g_variant_dup_objv (GVariant *value,
                                                                         gsize *length);
 extern
const gchar * g_variant_get_bytestring (GVariant *value);
 extern
gchar * g_variant_dup_bytestring (GVariant *value,
                                                                         gsize *length);
 extern
const gchar ** g_variant_get_bytestring_array (GVariant *value,
                                                                         gsize *length);
 extern
gchar ** g_variant_dup_bytestring_array (GVariant *value,
                                                                         gsize *length);

 extern
GVariant * g_variant_new_maybe (const GVariantType *child_type,
                                                                         GVariant *child);
 extern
GVariant * g_variant_new_array (const GVariantType *child_type,
                                                                         GVariant * const *children,
                                                                         gsize n_children);
 extern
GVariant * g_variant_new_tuple (GVariant * const *children,
                                                                         gsize n_children);
 extern
GVariant * g_variant_new_dict_entry (GVariant *key,
                                                                         GVariant *value);

 extern
GVariant * g_variant_get_maybe (GVariant *value);
 extern
gsize g_variant_n_children (GVariant *value);
 extern
void g_variant_get_child (GVariant *value,
                                                                         gsize index_,
                                                                         const gchar *format_string,
                                                                         ...);
 extern
GVariant * g_variant_get_child_value (GVariant *value,
                                                                         gsize index_);
 extern
gboolean g_variant_lookup (GVariant *dictionary,
                                                                         const gchar *key,
                                                                         const gchar *format_string,
                                                                         ...);
 extern
GVariant * g_variant_lookup_value (GVariant *dictionary,
                                                                         const gchar *key,
                                                                         const GVariantType *expected_type);
 extern
gconstpointer g_variant_get_fixed_array (GVariant *value,
                                                                         gsize *n_elements,
                                                                         gsize element_size);

 extern
gsize g_variant_get_size (GVariant *value);
 extern
gconstpointer g_variant_get_data (GVariant *value);
 extern
GBytes * g_variant_get_data_as_bytes (GVariant *value);
 extern
void g_variant_store (GVariant *value,
                                                                         gpointer data);

 extern
gchar * g_variant_print (GVariant *value,
                                                                         gboolean type_annotate);
 extern
GString * g_variant_print_string (GVariant *value,
                                                                         GString *string,
                                                                         gboolean type_annotate);

 extern
guint g_variant_hash (gconstpointer value);
 extern
gboolean g_variant_equal (gconstpointer one,
                                                                         gconstpointer two);

 extern
GVariant * g_variant_get_normal_form (GVariant *value);
 extern
gboolean g_variant_is_normal_form (GVariant *value);
 extern
GVariant * g_variant_byteswap (GVariant *value);

 extern
GVariant * g_variant_new_from_bytes (const GVariantType *type,
                                                                         GBytes *bytes,
                                                                         gboolean trusted);
 extern
GVariant * g_variant_new_from_data (const GVariantType *type,
                                                                         gconstpointer data,
                                                                         gsize size,
                                                                         gboolean trusted,
                                                                         GDestroyNotify notify,
                                                                         gpointer user_data);

typedef struct _GVariantIter GVariantIter;
struct _GVariantIter {

  guintptr x[16];
};

 extern
GVariantIter * g_variant_iter_new (GVariant *value);
 extern
gsize g_variant_iter_init (GVariantIter *iter,
                                                                         GVariant *value);
 extern
GVariantIter * g_variant_iter_copy (GVariantIter *iter);
 extern
gsize g_variant_iter_n_children (GVariantIter *iter);
 extern
void g_variant_iter_free (GVariantIter *iter);
 extern
GVariant * g_variant_iter_next_value (GVariantIter *iter);
 extern
gboolean g_variant_iter_next (GVariantIter *iter,
                                                                         const gchar *format_string,
                                                                         ...);
 extern
gboolean g_variant_iter_loop (GVariantIter *iter,
                                                                         const gchar *format_string,
                                                                         ...);


typedef struct _GVariantBuilder GVariantBuilder;
struct _GVariantBuilder {

  union
  {
    struct {
      gsize partial_magic;
      const GVariantType *type;
      guintptr y[14];
    } s;
    guintptr x[16];
  } u;
};

typedef enum
{
  G_VARIANT_PARSE_ERROR_FAILED,
  G_VARIANT_PARSE_ERROR_BASIC_TYPE_EXPECTED,
  G_VARIANT_PARSE_ERROR_CANNOT_INFER_TYPE,
  G_VARIANT_PARSE_ERROR_DEFINITE_TYPE_EXPECTED,
  G_VARIANT_PARSE_ERROR_INPUT_NOT_AT_END,
  G_VARIANT_PARSE_ERROR_INVALID_CHARACTER,
  G_VARIANT_PARSE_ERROR_INVALID_FORMAT_STRING,
  G_VARIANT_PARSE_ERROR_INVALID_OBJECT_PATH,
  G_VARIANT_PARSE_ERROR_INVALID_SIGNATURE,
  G_VARIANT_PARSE_ERROR_INVALID_TYPE_STRING,
  G_VARIANT_PARSE_ERROR_NO_COMMON_TYPE,
  G_VARIANT_PARSE_ERROR_NUMBER_OUT_OF_RANGE,
  G_VARIANT_PARSE_ERROR_NUMBER_TOO_BIG,
  G_VARIANT_PARSE_ERROR_TYPE_ERROR,
  G_VARIANT_PARSE_ERROR_UNEXPECTED_TOKEN,
  G_VARIANT_PARSE_ERROR_UNKNOWN_KEYWORD,
  G_VARIANT_PARSE_ERROR_UNTERMINATED_STRING_CONSTANT,
  G_VARIANT_PARSE_ERROR_VALUE_EXPECTED,
  G_VARIANT_PARSE_ERROR_RECURSION
} GVariantParseError;


__attribute__((__deprecated__("Use '" "g_variant_parse_error_quark" "' instead"))) extern
GQuark g_variant_parser_get_error_quark (void);

 extern
GQuark g_variant_parse_error_quark (void);
# 376 "/usr/include/glib-2.0/glib/gvariant.h"
 extern
GVariantBuilder * g_variant_builder_new (const GVariantType *type);
 extern
void g_variant_builder_unref (GVariantBuilder *builder);
 extern
GVariantBuilder * g_variant_builder_ref (GVariantBuilder *builder);
 extern
void g_variant_builder_init (GVariantBuilder *builder,
                                                                         const GVariantType *type);
 extern
GVariant * g_variant_builder_end (GVariantBuilder *builder);
 extern
void g_variant_builder_clear (GVariantBuilder *builder);
 extern
void g_variant_builder_open (GVariantBuilder *builder,
                                                                         const GVariantType *type);
 extern
void g_variant_builder_close (GVariantBuilder *builder);
 extern
void g_variant_builder_add_value (GVariantBuilder *builder,
                                                                         GVariant *value);
 extern
void g_variant_builder_add (GVariantBuilder *builder,
                                                                         const gchar *format_string,
                                                                         ...);
 extern
void g_variant_builder_add_parsed (GVariantBuilder *builder,
                                                                         const gchar *format,
                                                                         ...);

 extern
GVariant * g_variant_new (const gchar *format_string,
                                                                         ...);
 extern
void g_variant_get (GVariant *value,
                                                                         const gchar *format_string,
                                                                         ...);
 extern
GVariant * g_variant_new_va (const gchar *format_string,
                                                                         const gchar **endptr,
                                                                         va_list *app);
 extern
void g_variant_get_va (GVariant *value,
                                                                         const gchar *format_string,
                                                                         const gchar **endptr,
                                                                         va_list *app);
 extern
gboolean g_variant_check_format_string (GVariant *value,
                                                                         const gchar *format_string,
                                                                         gboolean copy_only);

 extern
GVariant * g_variant_parse (const GVariantType *type,
                                                                         const gchar *text,
                                                                         const gchar *limit,
                                                                         const gchar **endptr,
                                                                         GError **error);
 extern
GVariant * g_variant_new_parsed (const gchar *format,
                                                                         ...);
 extern
GVariant * g_variant_new_parsed_va (const gchar *format,
                                                                         va_list *app);

 extern
gchar * g_variant_parse_error_print_context (GError *error,
                                                                         const gchar *source_str);

 extern
gint g_variant_compare (gconstpointer one,
                                                                         gconstpointer two);

typedef struct _GVariantDict GVariantDict;
struct _GVariantDict {

  union
  {
    struct {
      GVariant *asv;
      gsize partial_magic;
      guintptr y[14];
    } s;
    guintptr x[16];
  } u;
};
# 499 "/usr/include/glib-2.0/glib/gvariant.h"
 extern
GVariantDict * g_variant_dict_new (GVariant *from_asv);

 extern
void g_variant_dict_init (GVariantDict *dict,
                                                                         GVariant *from_asv);

 extern
gboolean g_variant_dict_lookup (GVariantDict *dict,
                                                                         const gchar *key,
                                                                         const gchar *format_string,
                                                                         ...);
 extern
GVariant * g_variant_dict_lookup_value (GVariantDict *dict,
                                                                         const gchar *key,
                                                                         const GVariantType *expected_type);
 extern
gboolean g_variant_dict_contains (GVariantDict *dict,
                                                                         const gchar *key);
 extern
void g_variant_dict_insert (GVariantDict *dict,
                                                                         const gchar *key,
                                                                         const gchar *format_string,
                                                                         ...);
 extern
void g_variant_dict_insert_value (GVariantDict *dict,
                                                                         const gchar *key,
                                                                         GVariant *value);
 extern
gboolean g_variant_dict_remove (GVariantDict *dict,
                                                                         const gchar *key);
 extern
void g_variant_dict_clear (GVariantDict *dict);
 extern
GVariant * g_variant_dict_end (GVariantDict *dict);
 extern
GVariantDict * g_variant_dict_ref (GVariantDict *dict);
 extern
void g_variant_dict_unref (GVariantDict *dict);
# 39 "/usr/include/glib-2.0/glib/gmessages.h" 2





 extern
gsize g_printf_string_upper_bound (const gchar* format,
         va_list args) __attribute__((__format__ (__printf__, 1, 0)));
# 55 "/usr/include/glib-2.0/glib/gmessages.h"
typedef enum
{

  G_LOG_FLAG_RECURSION = 1 << 0,
  G_LOG_FLAG_FATAL = 1 << 1,


  G_LOG_LEVEL_ERROR = 1 << 2,
  G_LOG_LEVEL_CRITICAL = 1 << 3,
  G_LOG_LEVEL_WARNING = 1 << 4,
  G_LOG_LEVEL_MESSAGE = 1 << 5,
  G_LOG_LEVEL_INFO = 1 << 6,
  G_LOG_LEVEL_DEBUG = 1 << 7,

  G_LOG_LEVEL_MASK = ~(G_LOG_FLAG_RECURSION | G_LOG_FLAG_FATAL)
} GLogLevelFlags;




typedef void (*GLogFunc) (const gchar *log_domain,
                                                 GLogLevelFlags log_level,
                                                 const gchar *message,
                                                 gpointer user_data);



 extern
guint g_log_set_handler (const gchar *log_domain,
                                         GLogLevelFlags log_levels,
                                         GLogFunc log_func,
                                         gpointer user_data);
 extern
guint g_log_set_handler_full (const gchar *log_domain,
                                         GLogLevelFlags log_levels,
                                         GLogFunc log_func,
                                         gpointer user_data,
                                         GDestroyNotify destroy);
 extern
void g_log_remove_handler (const gchar *log_domain,
                                         guint handler_id);
 extern
void g_log_default_handler (const gchar *log_domain,
                                         GLogLevelFlags log_level,
                                         const gchar *message,
                                         gpointer unused_data);
 extern
GLogFunc g_log_set_default_handler (GLogFunc log_func,
        gpointer user_data);
 extern
void g_log (const gchar *log_domain,
                                         GLogLevelFlags log_level,
                                         const gchar *format,
                                         ...) __attribute__((__format__ (__printf__, 3, 4)));
 extern
void g_logv (const gchar *log_domain,
                                         GLogLevelFlags log_level,
                                         const gchar *format,
                                         va_list args) __attribute__((__format__ (__printf__, 3, 0)));
 extern
GLogLevelFlags g_log_set_fatal_mask (const gchar *log_domain,
                                         GLogLevelFlags fatal_mask);
 extern
GLogLevelFlags g_log_set_always_fatal (GLogLevelFlags fatal_mask);
# 136 "/usr/include/glib-2.0/glib/gmessages.h"
typedef enum
{
  G_LOG_WRITER_HANDLED = 1,
  G_LOG_WRITER_UNHANDLED = 0,
} GLogWriterOutput;
# 158 "/usr/include/glib-2.0/glib/gmessages.h"
typedef struct _GLogField GLogField;
struct _GLogField
{
  const gchar *key;
  gconstpointer value;
  gssize length;
};
# 197 "/usr/include/glib-2.0/glib/gmessages.h"
typedef GLogWriterOutput (*GLogWriterFunc) (GLogLevelFlags log_level,
                                                const GLogField *fields,
                                                gsize n_fields,
                                                gpointer user_data);

 extern
void g_log_structured (const gchar *log_domain,
                                                GLogLevelFlags log_level,
                                                ...);
 extern
void g_log_structured_array (GLogLevelFlags log_level,
                                                const GLogField *fields,
                                                gsize n_fields);

 extern
void g_log_variant (const gchar *log_domain,
                                                GLogLevelFlags log_level,
                                                GVariant *fields);

 extern
void g_log_set_writer_func (GLogWriterFunc func,
                                                gpointer user_data,
                                                GDestroyNotify user_data_free);

 extern
gboolean g_log_writer_supports_color (gint output_fd);
 extern
gboolean g_log_writer_is_journald (gint output_fd);

 extern
gchar *g_log_writer_format_fields (GLogLevelFlags log_level,
                                                const GLogField *fields,
                                                gsize n_fields,
                                                gboolean use_color);

 extern
GLogWriterOutput g_log_writer_syslog (GLogLevelFlags log_level,
                                                const GLogField *fields,
                                                gsize n_fields,
                                                gpointer user_data);
 extern
GLogWriterOutput g_log_writer_journald (GLogLevelFlags log_level,
                                                const GLogField *fields,
                                                gsize n_fields,
                                                gpointer user_data);
 extern
GLogWriterOutput g_log_writer_standard_streams (GLogLevelFlags log_level,
                                                const GLogField *fields,
                                                gsize n_fields,
                                                gpointer user_data);
 extern
GLogWriterOutput g_log_writer_default (GLogLevelFlags log_level,
                                                const GLogField *fields,
                                                gsize n_fields,
                                                gpointer user_data);

 extern
void g_log_writer_default_set_use_stderr (gboolean use_stderr);
 extern
gboolean g_log_writer_default_would_drop (GLogLevelFlags log_level,
                                                 const char *log_domain);
 extern
void g_log_writer_default_set_debug_domains (const gchar * const *domains);



 extern
gboolean g_log_get_debug_enabled (void);
 extern
void g_log_set_debug_enabled (gboolean enabled);
# 286 "/usr/include/glib-2.0/glib/gmessages.h"
void _g_log_fallback_handler (const gchar *log_domain,
       GLogLevelFlags log_level,
       const gchar *message,
       gpointer unused_data);


 extern
void g_return_if_fail_warning (const char *log_domain,
          const char *pretty_function,
          const char *expression) ;
 extern
void g_warn_message (const char *domain,
                               const char *file,
                               int line,
                               const char *func,
                               const char *warnexpr) ;
__attribute__ ((__noreturn__))
__attribute__((__deprecated__)) extern
void g_assert_warning (const char *log_domain,
          const char *file,
          const int line,
                 const char *pretty_function,
                 const char *expression);

 extern
void g_log_structured_standard (const gchar *log_domain,
                                GLogLevelFlags log_level,
                                const gchar *file,
                                const gchar *line,
                                const gchar *func,
                                const gchar *message_format,
                                ...) __attribute__((__format__ (__printf__, 6, 7)));
# 525 "/usr/include/glib-2.0/glib/gmessages.h"
typedef void (*GPrintFunc) (const gchar *string);
 extern
void g_print (const gchar *format,
                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
 extern
GPrintFunc g_set_print_handler (GPrintFunc func);
 extern
void g_printerr (const gchar *format,
                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
 extern
GPrintFunc g_set_printerr_handler (GPrintFunc func);
# 65 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/goption.h" 1
# 40 "/usr/include/glib-2.0/glib/goption.h"
typedef struct _GOptionContext GOptionContext;
# 53 "/usr/include/glib-2.0/glib/goption.h"
typedef struct _GOptionGroup GOptionGroup;
typedef struct _GOptionEntry GOptionEntry;
# 84 "/usr/include/glib-2.0/glib/goption.h"
typedef enum
{
  G_OPTION_FLAG_NONE = 0,
  G_OPTION_FLAG_HIDDEN = 1 << 0,
  G_OPTION_FLAG_IN_MAIN = 1 << 1,
  G_OPTION_FLAG_REVERSE = 1 << 2,
  G_OPTION_FLAG_NO_ARG = 1 << 3,
  G_OPTION_FLAG_FILENAME = 1 << 4,
  G_OPTION_FLAG_OPTIONAL_ARG = 1 << 5,
  G_OPTION_FLAG_NOALIAS = 1 << 6
} GOptionFlags;
# 122 "/usr/include/glib-2.0/glib/goption.h"
typedef enum
{
  G_OPTION_ARG_NONE,
  G_OPTION_ARG_STRING,
  G_OPTION_ARG_INT,
  G_OPTION_ARG_CALLBACK,
  G_OPTION_ARG_FILENAME,
  G_OPTION_ARG_STRING_ARRAY,
  G_OPTION_ARG_FILENAME_ARRAY,
  G_OPTION_ARG_DOUBLE,
  G_OPTION_ARG_INT64
} GOptionArg;
# 152 "/usr/include/glib-2.0/glib/goption.h"
typedef gboolean (*GOptionArgFunc) (const gchar *option_name,
        const gchar *value,
        gpointer data,
        GError **error);
# 170 "/usr/include/glib-2.0/glib/goption.h"
typedef gboolean (*GOptionParseFunc) (GOptionContext *context,
          GOptionGroup *group,
          gpointer data,
          GError **error);
# 185 "/usr/include/glib-2.0/glib/goption.h"
typedef void (*GOptionErrorFunc) (GOptionContext *context,
      GOptionGroup *group,
      gpointer data,
      GError **error);
# 209 "/usr/include/glib-2.0/glib/goption.h"
typedef enum
{
  G_OPTION_ERROR_UNKNOWN_OPTION,
  G_OPTION_ERROR_BAD_VALUE,
  G_OPTION_ERROR_FAILED
} GOptionError;

 extern
GQuark g_option_error_quark (void);
# 261 "/usr/include/glib-2.0/glib/goption.h"
struct _GOptionEntry
{
  const gchar *long_name;
  gchar short_name;
  gint flags;

  GOptionArg arg;
  gpointer arg_data;

  const gchar *description;
  const gchar *arg_description;
};
# 310 "/usr/include/glib-2.0/glib/goption.h"
 extern
GOptionContext *g_option_context_new (const gchar *parameter_string);
 extern
void g_option_context_set_summary (GOptionContext *context,
                                                   const gchar *summary);
 extern
const gchar * g_option_context_get_summary (GOptionContext *context);
 extern
void g_option_context_set_description (GOptionContext *context,
                                                   const gchar *description);
 extern
const gchar * g_option_context_get_description (GOptionContext *context);
 extern
void g_option_context_free (GOptionContext *context);
 extern
void g_option_context_set_help_enabled (GOptionContext *context,
         gboolean help_enabled);
 extern
gboolean g_option_context_get_help_enabled (GOptionContext *context);
 extern
void g_option_context_set_ignore_unknown_options (GOptionContext *context,
            gboolean ignore_unknown);
 extern
gboolean g_option_context_get_ignore_unknown_options (GOptionContext *context);

 extern
void g_option_context_set_strict_posix (GOptionContext *context,
                                                             gboolean strict_posix);
 extern
gboolean g_option_context_get_strict_posix (GOptionContext *context);

 extern
void g_option_context_add_main_entries (GOptionContext *context,
         const GOptionEntry *entries,
         const gchar *translation_domain);
 extern
gboolean g_option_context_parse (GOptionContext *context,
         gint *argc,
         gchar ***argv,
         GError **error);
 extern
gboolean g_option_context_parse_strv (GOptionContext *context,
                                                   gchar ***arguments,
                                                   GError **error);
 extern
void g_option_context_set_translate_func (GOptionContext *context,
           GTranslateFunc func,
           gpointer data,
           GDestroyNotify destroy_notify);
 extern
void g_option_context_set_translation_domain (GOptionContext *context,
        const gchar *domain);

 extern
void g_option_context_add_group (GOptionContext *context,
       GOptionGroup *group);
 extern
void g_option_context_set_main_group (GOptionContext *context,
            GOptionGroup *group);
 extern
GOptionGroup *g_option_context_get_main_group (GOptionContext *context);
 extern
gchar *g_option_context_get_help (GOptionContext *context,
                                               gboolean main_help,
                                               GOptionGroup *group);

 extern
GOptionGroup *g_option_group_new (const gchar *name,
           const gchar *description,
           const gchar *help_description,
           gpointer user_data,
           GDestroyNotify destroy);
 extern
void g_option_group_set_parse_hooks (GOptionGroup *group,
           GOptionParseFunc pre_parse_func,
           GOptionParseFunc post_parse_func);
 extern
void g_option_group_set_error_hook (GOptionGroup *group,
           GOptionErrorFunc error_func);
__attribute__((__deprecated__)) extern
void g_option_group_free (GOptionGroup *group);
 extern
GOptionGroup *g_option_group_ref (GOptionGroup *group);
 extern
void g_option_group_unref (GOptionGroup *group);
 extern
void g_option_group_add_entries (GOptionGroup *group,
           const GOptionEntry *entries);
 extern
void g_option_group_set_translate_func (GOptionGroup *group,
           GTranslateFunc func,
           gpointer data,
           GDestroyNotify destroy_notify);
 extern
void g_option_group_set_translation_domain (GOptionGroup *group,
           const gchar *domain);
# 67 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gpathbuf.h" 1
# 17 "/usr/include/glib-2.0/glib/gpathbuf.h"
typedef struct _GPathBuf GPathBuf;

struct _GPathBuf
{

  gpointer dummy[8];
};
# 43 "/usr/include/glib-2.0/glib/gpathbuf.h"
 extern
GPathBuf * g_path_buf_new (void);
 extern
GPathBuf * g_path_buf_new_from_path (const char *path);
 extern
GPathBuf * g_path_buf_init (GPathBuf *buf);
 extern
GPathBuf * g_path_buf_init_from_path (GPathBuf *buf,
                                         const char *path);
 extern
void g_path_buf_clear (GPathBuf *buf);
 extern
char * g_path_buf_clear_to_path (GPathBuf *buf) __attribute__((warn_unused_result));
 extern
void g_path_buf_free (GPathBuf *buf);
 extern
char * g_path_buf_free_to_path (GPathBuf *buf) __attribute__((warn_unused_result));
 extern
GPathBuf * g_path_buf_copy (GPathBuf *buf);

 extern
GPathBuf * g_path_buf_push (GPathBuf *buf,
                                         const char *path);
 extern
gboolean g_path_buf_pop (GPathBuf *buf);

 extern
gboolean g_path_buf_set_filename (GPathBuf *buf,
                                         const char *file_name);
 extern
gboolean g_path_buf_set_extension (GPathBuf *buf,
                                         const char *extension);

 extern
char * g_path_buf_to_path (GPathBuf *buf) __attribute__((warn_unused_result));

 extern
gboolean g_path_buf_equal (gconstpointer v1,
                                         gconstpointer v2);
# 68 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gpattern.h" 1
# 32 "/usr/include/glib-2.0/glib/gpattern.h"
typedef struct _GPatternSpec GPatternSpec;

 extern
GPatternSpec* g_pattern_spec_new (const gchar *pattern);
 extern
void g_pattern_spec_free (GPatternSpec *pspec);
 extern
GPatternSpec *g_pattern_spec_copy (GPatternSpec *pspec);
 extern
gboolean g_pattern_spec_equal (GPatternSpec *pspec1,
     GPatternSpec *pspec2);
 extern
gboolean g_pattern_spec_match (GPatternSpec *pspec,
                               gsize string_length,
                               const gchar *string,
                               const gchar *string_reversed);
 extern
gboolean g_pattern_spec_match_string (GPatternSpec *pspec,
                                      const gchar *string);
__attribute__((__deprecated__("Use '" "g_pattern_spec_match" "' instead"))) extern
gboolean g_pattern_match (GPatternSpec *pspec,
     guint string_length,
     const gchar *string,
     const gchar *string_reversed);
__attribute__((__deprecated__("Use '" "g_pattern_spec_match_string" "' instead"))) extern
gboolean g_pattern_match_string (GPatternSpec *pspec,
     const gchar *string);
 extern
gboolean g_pattern_match_simple (const gchar *pattern,
     const gchar *string);
# 69 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gprimes.h" 1
# 47 "/usr/include/glib-2.0/glib/gprimes.h"
 extern
guint g_spaced_primes_closest (guint num) __attribute__ ((__const__));
# 71 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gqsort.h" 1
# 38 "/usr/include/glib-2.0/glib/gqsort.h"
__attribute__((__deprecated__("Use '" "g_sort_array" "' instead"))) extern
void g_qsort_with_data (gconstpointer pbase,
   gint total_elems,
   gsize size,
   GCompareDataFunc compare_func,
   gpointer user_data);

 extern
void g_sort_array (const void *array,
                   size_t n_elements,
                   size_t element_size,
                   GCompareDataFunc compare_func,
                   void *user_data);
# 72 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gqueue.h" 1
# 38 "/usr/include/glib-2.0/glib/gqueue.h"
typedef struct _GQueue GQueue;
# 49 "/usr/include/glib-2.0/glib/gqueue.h"
struct _GQueue
{
  GList *head;
  GList *tail;
  guint length;
};
# 74 "/usr/include/glib-2.0/glib/gqueue.h"
 extern
GQueue* g_queue_new (void);
 extern
void g_queue_free (GQueue *queue);
 extern
void g_queue_free_full (GQueue *queue,
    GDestroyNotify free_func);
 extern
void g_queue_init (GQueue *queue);
 extern
void g_queue_clear (GQueue *queue);
 extern
gboolean g_queue_is_empty (GQueue *queue);
 extern
void g_queue_clear_full (GQueue *queue,
                                 GDestroyNotify free_func);
 extern
guint g_queue_get_length (GQueue *queue);
 extern
void g_queue_reverse (GQueue *queue);
 extern
GQueue * g_queue_copy (GQueue *queue);
 extern
void g_queue_foreach (GQueue *queue,
                                 GFunc func,
                                 gpointer user_data);
 extern
GList * g_queue_find (GQueue *queue,
                                 gconstpointer data);
 extern
GList * g_queue_find_custom (GQueue *queue,
                                 gconstpointer data,
                                 GCompareFunc func);
 extern
void g_queue_sort (GQueue *queue,
                                 GCompareDataFunc compare_func,
                                 gpointer user_data);

 extern
void g_queue_push_head (GQueue *queue,
                                 gpointer data);
 extern
void g_queue_push_tail (GQueue *queue,
                                 gpointer data);
 extern
void g_queue_push_nth (GQueue *queue,
                                 gpointer data,
                                 gint n);
 extern
gpointer g_queue_pop_head (GQueue *queue);
 extern
gpointer g_queue_pop_tail (GQueue *queue);
 extern
gpointer g_queue_pop_nth (GQueue *queue,
                                 guint n);
 extern
gpointer g_queue_peek_head (GQueue *queue);
 extern
gpointer g_queue_peek_tail (GQueue *queue);
 extern
gpointer g_queue_peek_nth (GQueue *queue,
                                 guint n);
 extern
gint g_queue_index (GQueue *queue,
                                 gconstpointer data);
 extern
gboolean g_queue_remove (GQueue *queue,
                                 gconstpointer data);
 extern
guint g_queue_remove_all (GQueue *queue,
                                 gconstpointer data);
 extern
void g_queue_insert_before (GQueue *queue,
                                 GList *sibling,
                                 gpointer data);
 extern
void g_queue_insert_before_link
                                (GQueue *queue,
                                 GList *sibling,
                                 GList *link_);
 extern
void g_queue_insert_after (GQueue *queue,
                                 GList *sibling,
                                 gpointer data);
 extern
void g_queue_insert_after_link
                                (GQueue *queue,
                                 GList *sibling,
                                 GList *link_);
 extern
void g_queue_insert_sorted (GQueue *queue,
                                 gpointer data,
                                 GCompareDataFunc func,
                                 gpointer user_data);

 extern
void g_queue_push_head_link (GQueue *queue,
                                 GList *link_);
 extern
void g_queue_push_tail_link (GQueue *queue,
                                 GList *link_);
 extern
void g_queue_push_nth_link (GQueue *queue,
                                 gint n,
                                 GList *link_);
 extern
GList* g_queue_pop_head_link (GQueue *queue);
 extern
GList* g_queue_pop_tail_link (GQueue *queue);
 extern
GList* g_queue_pop_nth_link (GQueue *queue,
                                 guint n);
 extern
GList* g_queue_peek_head_link (GQueue *queue);
 extern
GList* g_queue_peek_tail_link (GQueue *queue);
 extern
GList* g_queue_peek_nth_link (GQueue *queue,
                                 guint n);
 extern
gint g_queue_link_index (GQueue *queue,
                                 GList *link_);
 extern
void g_queue_unlink (GQueue *queue,
                                 GList *link_);
 extern
void g_queue_delete_link (GQueue *queue,
                                 GList *link_);
# 74 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/grand.h" 1
# 38 "/usr/include/glib-2.0/glib/grand.h"
typedef struct _GRand GRand;
# 49 "/usr/include/glib-2.0/glib/grand.h"
 extern
GRand* g_rand_new_with_seed (guint32 seed);
 extern
GRand* g_rand_new_with_seed_array (const guint32 *seed,
        guint seed_length);
 extern
GRand* g_rand_new (void);
 extern
void g_rand_free (GRand *rand_);
 extern
GRand* g_rand_copy (GRand *rand_);
 extern
void g_rand_set_seed (GRand *rand_,
          guint32 seed);
 extern
void g_rand_set_seed_array (GRand *rand_,
          const guint32 *seed,
          guint seed_length);



 extern
guint32 g_rand_int (GRand *rand_);
 extern
gint32 g_rand_int_range (GRand *rand_,
          gint32 begin,
          gint32 end);
 extern
gdouble g_rand_double (GRand *rand_);
 extern
gdouble g_rand_double_range (GRand *rand_,
          gdouble begin,
          gdouble end);
 extern
void g_random_set_seed (guint32 seed);



 extern
guint32 g_random_int (void);
 extern
gint32 g_random_int_range (gint32 begin,
          gint32 end);
 extern
gdouble g_random_double (void);
 extern
gdouble g_random_double_range (gdouble begin,
          gdouble end);
# 75 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/grcbox.h" 1
# 32 "/usr/include/glib-2.0/glib/grcbox.h"
 extern
gpointer g_rc_box_alloc (gsize block_size) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_rc_box_alloc0 (gsize block_size) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_rc_box_dup (gsize block_size,
                                                 gconstpointer mem_block) __attribute__((__alloc_size__(1)));
 extern
gpointer g_rc_box_acquire (gpointer mem_block);
 extern
void g_rc_box_release (gpointer mem_block);
 extern
void g_rc_box_release_full (gpointer mem_block,
                                                 GDestroyNotify clear_func);

 extern
gsize g_rc_box_get_size (gpointer mem_block);

 extern
gpointer g_atomic_rc_box_alloc (gsize block_size) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_atomic_rc_box_alloc0 (gsize block_size) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_atomic_rc_box_dup (gsize block_size,
                                                 gconstpointer mem_block) __attribute__((__alloc_size__(1)));
 extern
gpointer g_atomic_rc_box_acquire (gpointer mem_block);
 extern
void g_atomic_rc_box_release (gpointer mem_block);
 extern
void g_atomic_rc_box_release_full (gpointer mem_block,
                                                 GDestroyNotify clear_func);

 extern
gsize g_atomic_rc_box_get_size (gpointer mem_block);
# 76 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/grefcount.h" 1
# 33 "/usr/include/glib-2.0/glib/grefcount.h"
 extern
void g_ref_count_init (grefcount *rc);
 extern
void g_ref_count_inc (grefcount *rc);
 extern
gboolean g_ref_count_dec (grefcount *rc);
 extern
gboolean g_ref_count_compare (grefcount *rc,
                                                 gint val);

 extern
void g_atomic_ref_count_init (gatomicrefcount *arc);
 extern
void g_atomic_ref_count_inc (gatomicrefcount *arc);
 extern
gboolean g_atomic_ref_count_dec (gatomicrefcount *arc);
 extern
gboolean g_atomic_ref_count_compare (gatomicrefcount *arc,
                                                 gint val);
# 77 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/grefstring.h" 1
# 28 "/usr/include/glib-2.0/glib/grefstring.h"
 extern
char * g_ref_string_new (const char *str);
 extern
char * g_ref_string_new_len (const char *str,
                                 gssize len);
 extern
char * g_ref_string_new_intern (const char *str);

 extern
char * g_ref_string_acquire (char *str);
 extern
void g_ref_string_release (char *str);

 extern
gsize g_ref_string_length (char *str);
# 57 "/usr/include/glib-2.0/glib/grefstring.h"
typedef char GRefString;
# 78 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gregex.h" 1
# 142 "/usr/include/glib-2.0/glib/gregex.h"
typedef enum
{
  G_REGEX_ERROR_COMPILE,
  G_REGEX_ERROR_OPTIMIZE,
  G_REGEX_ERROR_REPLACE,
  G_REGEX_ERROR_MATCH,
  G_REGEX_ERROR_INTERNAL,


  G_REGEX_ERROR_STRAY_BACKSLASH = 101,
  G_REGEX_ERROR_MISSING_CONTROL_CHAR = 102,
  G_REGEX_ERROR_UNRECOGNIZED_ESCAPE = 103,
  G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER = 104,
  G_REGEX_ERROR_QUANTIFIER_TOO_BIG = 105,
  G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS = 106,
  G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS = 107,
  G_REGEX_ERROR_RANGE_OUT_OF_ORDER = 108,
  G_REGEX_ERROR_NOTHING_TO_REPEAT = 109,
  G_REGEX_ERROR_UNRECOGNIZED_CHARACTER = 112,
  G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS = 113,
  G_REGEX_ERROR_UNMATCHED_PARENTHESIS = 114,
  G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE = 115,
  G_REGEX_ERROR_UNTERMINATED_COMMENT = 118,
  G_REGEX_ERROR_EXPRESSION_TOO_LARGE = 120,
  G_REGEX_ERROR_MEMORY_ERROR = 121,
  G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND = 125,
  G_REGEX_ERROR_MALFORMED_CONDITION = 126,
  G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES = 127,
  G_REGEX_ERROR_ASSERTION_EXPECTED = 128,
  G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME = 130,
  G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED = 131,
  G_REGEX_ERROR_HEX_CODE_TOO_LARGE = 134,
  G_REGEX_ERROR_INVALID_CONDITION = 135,
  G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND = 136,
  G_REGEX_ERROR_INFINITE_LOOP = 140,
  G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR = 142,
  G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME = 143,
  G_REGEX_ERROR_MALFORMED_PROPERTY = 146,
  G_REGEX_ERROR_UNKNOWN_PROPERTY = 147,
  G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG = 148,
  G_REGEX_ERROR_TOO_MANY_SUBPATTERNS = 149,
  G_REGEX_ERROR_INVALID_OCTAL_VALUE = 151,
  G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE = 154,
  G_REGEX_ERROR_DEFINE_REPETION = 155,
  G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS = 156,
  G_REGEX_ERROR_MISSING_BACK_REFERENCE = 157,
  G_REGEX_ERROR_INVALID_RELATIVE_REFERENCE = 158,
  G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN = 159,
  G_REGEX_ERROR_UNKNOWN_BACKTRACKING_CONTROL_VERB = 160,
  G_REGEX_ERROR_NUMBER_TOO_BIG = 161,
  G_REGEX_ERROR_MISSING_SUBPATTERN_NAME = 162,
  G_REGEX_ERROR_MISSING_DIGIT = 163,
  G_REGEX_ERROR_INVALID_DATA_CHARACTER = 164,
  G_REGEX_ERROR_EXTRA_SUBPATTERN_NAME = 165,
  G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED = 166,
  G_REGEX_ERROR_INVALID_CONTROL_CHAR = 168,
  G_REGEX_ERROR_MISSING_NAME = 169,
  G_REGEX_ERROR_NOT_SUPPORTED_IN_CLASS = 171,
  G_REGEX_ERROR_TOO_MANY_FORWARD_REFERENCES = 172,
  G_REGEX_ERROR_NAME_TOO_LONG = 175,
  G_REGEX_ERROR_CHARACTER_VALUE_TOO_LARGE = 176
} GRegexError;
# 216 "/usr/include/glib-2.0/glib/gregex.h"
 extern
GQuark g_regex_error_quark (void);
# 304 "/usr/include/glib-2.0/glib/gregex.h"
typedef enum
{
  G_REGEX_DEFAULT = 0,
  G_REGEX_CASELESS = 1 << 0,
  G_REGEX_MULTILINE = 1 << 1,
  G_REGEX_DOTALL = 1 << 2,
  G_REGEX_EXTENDED = 1 << 3,
  G_REGEX_ANCHORED = 1 << 4,
  G_REGEX_DOLLAR_ENDONLY = 1 << 5,
  G_REGEX_UNGREEDY = 1 << 9,
  G_REGEX_RAW = 1 << 11,
  G_REGEX_NO_AUTO_CAPTURE = 1 << 12,
  G_REGEX_OPTIMIZE = 1 << 13,
  G_REGEX_FIRSTLINE = 1 << 18,
  G_REGEX_DUPNAMES = 1 << 19,
  G_REGEX_NEWLINE_CR = 1 << 20,
  G_REGEX_NEWLINE_LF = 1 << 21,
  G_REGEX_NEWLINE_CRLF = G_REGEX_NEWLINE_CR | G_REGEX_NEWLINE_LF,
  G_REGEX_NEWLINE_ANYCRLF = G_REGEX_NEWLINE_CR | 1 << 22,
  G_REGEX_BSR_ANYCRLF = 1 << 23,
  G_REGEX_JAVASCRIPT_COMPAT __attribute__((__deprecated__)) = 1 << 25
} GRegexCompileFlags;
# 396 "/usr/include/glib-2.0/glib/gregex.h"
typedef enum
{
  G_REGEX_MATCH_DEFAULT = 0,
  G_REGEX_MATCH_ANCHORED = 1 << 4,
  G_REGEX_MATCH_NOTBOL = 1 << 7,
  G_REGEX_MATCH_NOTEOL = 1 << 8,
  G_REGEX_MATCH_NOTEMPTY = 1 << 10,
  G_REGEX_MATCH_PARTIAL = 1 << 15,
  G_REGEX_MATCH_NEWLINE_CR = 1 << 20,
  G_REGEX_MATCH_NEWLINE_LF = 1 << 21,
  G_REGEX_MATCH_NEWLINE_CRLF = G_REGEX_MATCH_NEWLINE_CR | G_REGEX_MATCH_NEWLINE_LF,
  G_REGEX_MATCH_NEWLINE_ANY = 1 << 22,
  G_REGEX_MATCH_NEWLINE_ANYCRLF = G_REGEX_MATCH_NEWLINE_CR | G_REGEX_MATCH_NEWLINE_ANY,
  G_REGEX_MATCH_BSR_ANYCRLF = 1 << 23,
  G_REGEX_MATCH_BSR_ANY = 1 << 24,
  G_REGEX_MATCH_PARTIAL_SOFT = G_REGEX_MATCH_PARTIAL,
  G_REGEX_MATCH_PARTIAL_HARD = 1 << 27,
  G_REGEX_MATCH_NOTEMPTY_ATSTART = 1 << 28
} GRegexMatchFlags;

typedef struct _GRegex GRegex;
# 425 "/usr/include/glib-2.0/glib/gregex.h"
typedef struct _GMatchInfo GMatchInfo;
# 444 "/usr/include/glib-2.0/glib/gregex.h"
typedef gboolean (*GRegexEvalCallback) (const GMatchInfo *match_info,
       GString *result,
       gpointer user_data);


 extern
GRegex *g_regex_new (const gchar *pattern,
       GRegexCompileFlags compile_options,
       GRegexMatchFlags match_options,
       GError **error);
 extern
GRegex *g_regex_ref (GRegex *regex);
 extern
void g_regex_unref (GRegex *regex);
 extern
const gchar *g_regex_get_pattern (const GRegex *regex);
 extern
gint g_regex_get_max_backref (const GRegex *regex);
 extern
gint g_regex_get_capture_count (const GRegex *regex);
 extern
gboolean g_regex_get_has_cr_or_lf (const GRegex *regex);
 extern
gint g_regex_get_max_lookbehind (const GRegex *regex);
 extern
gint g_regex_get_string_number (const GRegex *regex,
       const gchar *name);
 extern
gchar *g_regex_escape_string (const gchar *string,
       gint length);
 extern
gchar *g_regex_escape_nul (const gchar *string,
       gint length);

 extern
GRegexCompileFlags g_regex_get_compile_flags (const GRegex *regex);
 extern
GRegexMatchFlags g_regex_get_match_flags (const GRegex *regex);


 extern
gboolean g_regex_match_simple (const gchar *pattern,
       const gchar *string,
       GRegexCompileFlags compile_options,
       GRegexMatchFlags match_options);
 extern
gboolean g_regex_match (const GRegex *regex,
       const gchar *string,
       GRegexMatchFlags match_options,
       GMatchInfo **match_info);
 extern
gboolean g_regex_match_full (const GRegex *regex,
       const gchar *string,
       gssize string_len,
       gint start_position,
       GRegexMatchFlags match_options,
       GMatchInfo **match_info,
       GError **error);
 extern
gboolean g_regex_match_all (const GRegex *regex,
       const gchar *string,
       GRegexMatchFlags match_options,
       GMatchInfo **match_info);
 extern
gboolean g_regex_match_all_full (const GRegex *regex,
       const gchar *string,
       gssize string_len,
       gint start_position,
       GRegexMatchFlags match_options,
       GMatchInfo **match_info,
       GError **error);


 extern
gchar **g_regex_split_simple (const gchar *pattern,
       const gchar *string,
       GRegexCompileFlags compile_options,
       GRegexMatchFlags match_options);
 extern
gchar **g_regex_split (const GRegex *regex,
       const gchar *string,
       GRegexMatchFlags match_options);
 extern
gchar **g_regex_split_full (const GRegex *regex,
       const gchar *string,
       gssize string_len,
       gint start_position,
       GRegexMatchFlags match_options,
       gint max_tokens,
       GError **error);


 extern
gchar *g_regex_replace (const GRegex *regex,
       const gchar *string,
       gssize string_len,
       gint start_position,
       const gchar *replacement,
       GRegexMatchFlags match_options,
       GError **error);
 extern
gchar *g_regex_replace_literal (const GRegex *regex,
       const gchar *string,
       gssize string_len,
       gint start_position,
       const gchar *replacement,
       GRegexMatchFlags match_options,
       GError **error);
 extern
gchar *g_regex_replace_eval (const GRegex *regex,
       const gchar *string,
       gssize string_len,
       gint start_position,
       GRegexMatchFlags match_options,
       GRegexEvalCallback eval,
       gpointer user_data,
       GError **error);
 extern
gboolean g_regex_check_replacement (const gchar *replacement,
       gboolean *has_references,
       GError **error);


 extern
GRegex *g_match_info_get_regex (const GMatchInfo *match_info);
 extern
const gchar *g_match_info_get_string (const GMatchInfo *match_info);

 extern
GMatchInfo *g_match_info_ref (GMatchInfo *match_info);
 extern
void g_match_info_unref (GMatchInfo *match_info);
 extern
void g_match_info_free (GMatchInfo *match_info);
 extern
gboolean g_match_info_next (GMatchInfo *match_info,
       GError **error);
 extern
gboolean g_match_info_matches (const GMatchInfo *match_info);
 extern
gint g_match_info_get_match_count (const GMatchInfo *match_info);
 extern
gboolean g_match_info_is_partial_match (const GMatchInfo *match_info);
 extern
gchar *g_match_info_expand_references(const GMatchInfo *match_info,
       const gchar *string_to_expand,
       GError **error);
 extern
gchar *g_match_info_fetch (const GMatchInfo *match_info,
       gint match_num);
 extern
gboolean g_match_info_fetch_pos (const GMatchInfo *match_info,
       gint match_num,
       gint *start_pos,
       gint *end_pos);
 extern
gchar *g_match_info_fetch_named (const GMatchInfo *match_info,
       const gchar *name);
 extern
gboolean g_match_info_fetch_named_pos (const GMatchInfo *match_info,
       const gchar *name,
       gint *start_pos,
       gint *end_pos);
 extern
gchar **g_match_info_fetch_all (const GMatchInfo *match_info);
# 79 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gscanner.h" 1
# 39 "/usr/include/glib-2.0/glib/gscanner.h"
typedef struct _GScanner GScanner;
typedef struct _GScannerConfig GScannerConfig;
typedef union _GTokenValue GTokenValue;

typedef void (*GScannerMsgFunc) (GScanner *scanner,
       gchar *message,
       gboolean error);
# 64 "/usr/include/glib-2.0/glib/gscanner.h"
typedef enum
{
  G_ERR_UNKNOWN,
  G_ERR_UNEXP_EOF,
  G_ERR_UNEXP_EOF_IN_STRING,
  G_ERR_UNEXP_EOF_IN_COMMENT,
  G_ERR_NON_DIGIT_IN_CONST,
  G_ERR_DIGIT_RADIX,
  G_ERR_FLOAT_RADIX,
  G_ERR_FLOAT_MALFORMED
} GErrorType;


typedef enum
{
  G_TOKEN_EOF = 0,

  G_TOKEN_LEFT_PAREN = '(',
  G_TOKEN_RIGHT_PAREN = ')',
  G_TOKEN_LEFT_CURLY = '{',
  G_TOKEN_RIGHT_CURLY = '}',
  G_TOKEN_LEFT_BRACE = '[',
  G_TOKEN_RIGHT_BRACE = ']',
  G_TOKEN_EQUAL_SIGN = '=',
  G_TOKEN_COMMA = ',',

  G_TOKEN_NONE = 256,

  G_TOKEN_ERROR,

  G_TOKEN_CHAR,
  G_TOKEN_BINARY,
  G_TOKEN_OCTAL,
  G_TOKEN_INT,
  G_TOKEN_HEX,
  G_TOKEN_FLOAT,
  G_TOKEN_STRING,

  G_TOKEN_SYMBOL,
  G_TOKEN_IDENTIFIER,
  G_TOKEN_IDENTIFIER_NULL,

  G_TOKEN_COMMENT_SINGLE,
  G_TOKEN_COMMENT_MULTI,


  G_TOKEN_LAST
} GTokenType;

union _GTokenValue
{
  gpointer v_symbol;
  gchar *v_identifier;
  gulong v_binary;
  gulong v_octal;
  gulong v_int;
  guint64 v_int64;
  gdouble v_float;
  gulong v_hex;
  gchar *v_string;
  gchar *v_comment;
  guchar v_char;
  guint v_error;
};

struct _GScannerConfig
{


  gchar *cset_skip_characters;
  gchar *cset_identifier_first;
  gchar *cset_identifier_nth;
  gchar *cpair_comment_single;



  guint case_sensitive : 1;




  guint skip_comment_multi : 1;
  guint skip_comment_single : 1;
  guint scan_comment_multi : 1;
  guint scan_identifier : 1;
  guint scan_identifier_1char : 1;
  guint scan_identifier_NULL : 1;
  guint scan_symbols : 1;
  guint scan_binary : 1;
  guint scan_octal : 1;
  guint scan_float : 1;
  guint scan_hex : 1;
  guint scan_hex_dollar : 1;
  guint scan_string_sq : 1;
  guint scan_string_dq : 1;
  guint numbers_2_int : 1;
  guint int_2_float : 1;
  guint identifier_2_string : 1;
  guint char_2_token : 1;
  guint symbol_2_token : 1;
  guint scope_0_fallback : 1;
  guint store_int64 : 1;


  guint padding_dummy;
};

struct _GScanner
{

  gpointer user_data;
  guint max_parse_errors;


  guint parse_errors;


  const gchar *input_name;


  GData *qdata;


  GScannerConfig *config;


  GTokenType token;
  GTokenValue value;
  guint line;
  guint position;


  GTokenType next_token;
  GTokenValue next_value;
  guint next_line;
  guint next_position;



  GHashTable *symbol_table;
  gint input_fd;
  const gchar *text;
  const gchar *text_end;
  gchar *buffer;
  guint scope_id;



  GScannerMsgFunc msg_handler;
};

 extern
GScanner* g_scanner_new (const GScannerConfig *config_templ);
 extern
void g_scanner_destroy (GScanner *scanner);
 extern
void g_scanner_input_file (GScanner *scanner,
       gint input_fd);
 extern
void g_scanner_sync_file_offset (GScanner *scanner);
 extern
void g_scanner_input_text (GScanner *scanner,
       const gchar *text,
       guint text_len);
 extern
GTokenType g_scanner_get_next_token (GScanner *scanner);
 extern
GTokenType g_scanner_peek_next_token (GScanner *scanner);
 extern
GTokenType g_scanner_cur_token (GScanner *scanner);
 extern
GTokenValue g_scanner_cur_value (GScanner *scanner);
 extern
guint g_scanner_cur_line (GScanner *scanner);
 extern
guint g_scanner_cur_position (GScanner *scanner);
 extern
gboolean g_scanner_eof (GScanner *scanner);
 extern
guint g_scanner_set_scope (GScanner *scanner,
       guint scope_id);
 extern
void g_scanner_scope_add_symbol (GScanner *scanner,
       guint scope_id,
       const gchar *symbol,
       gpointer value);
 extern
void g_scanner_scope_remove_symbol (GScanner *scanner,
       guint scope_id,
       const gchar *symbol);
 extern
gpointer g_scanner_scope_lookup_symbol (GScanner *scanner,
       guint scope_id,
       const gchar *symbol);
 extern
void g_scanner_scope_foreach_symbol (GScanner *scanner,
       guint scope_id,
       GHFunc func,
       gpointer user_data);
 extern
gpointer g_scanner_lookup_symbol (GScanner *scanner,
       const gchar *symbol);
 extern
void g_scanner_unexp_token (GScanner *scanner,
       GTokenType expected_token,
       const gchar *identifier_spec,
       const gchar *symbol_spec,
       const gchar *symbol_name,
       const gchar *message,
       gint is_error);
 extern
void g_scanner_error (GScanner *scanner,
       const gchar *format,
       ...) __attribute__((__format__ (__printf__, 2, 3)));
 extern
void g_scanner_warn (GScanner *scanner,
       const gchar *format,
       ...) __attribute__((__format__ (__printf__, 2, 3)));
# 80 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gsequence.h" 1
# 32 "/usr/include/glib-2.0/glib/gsequence.h"
typedef struct _GSequence GSequence;
typedef struct _GSequenceNode GSequenceIter;

typedef gint (* GSequenceIterCompareFunc) (GSequenceIter *a,
                                           GSequenceIter *b,
                                           gpointer data);



 extern
GSequence * g_sequence_new (GDestroyNotify data_destroy);
 extern
void g_sequence_free (GSequence *seq);
 extern
gint g_sequence_get_length (GSequence *seq);
 extern
void g_sequence_foreach (GSequence *seq,
                                              GFunc func,
                                              gpointer user_data);
 extern
void g_sequence_foreach_range (GSequenceIter *begin,
                                              GSequenceIter *end,
                                              GFunc func,
                                              gpointer user_data);
 extern
void g_sequence_sort (GSequence *seq,
                                              GCompareDataFunc cmp_func,
                                              gpointer cmp_data);
 extern
void g_sequence_sort_iter (GSequence *seq,
                                              GSequenceIterCompareFunc cmp_func,
                                              gpointer cmp_data);
 extern
gboolean g_sequence_is_empty (GSequence *seq);



 extern
GSequenceIter *g_sequence_get_begin_iter (GSequence *seq);
 extern
GSequenceIter *g_sequence_get_end_iter (GSequence *seq);
 extern
GSequenceIter *g_sequence_get_iter_at_pos (GSequence *seq,
                                              gint pos);
 extern
GSequenceIter *g_sequence_append (GSequence *seq,
                                              gpointer data);
 extern
GSequenceIter *g_sequence_prepend (GSequence *seq,
                                              gpointer data);
 extern
GSequenceIter *g_sequence_insert_before (GSequenceIter *iter,
                                              gpointer data);
 extern
void g_sequence_move (GSequenceIter *src,
                                              GSequenceIter *dest);
 extern
void g_sequence_swap (GSequenceIter *a,
                                              GSequenceIter *b);
 extern
GSequenceIter *g_sequence_insert_sorted (GSequence *seq,
                                              gpointer data,
                                              GCompareDataFunc cmp_func,
                                              gpointer cmp_data);
 extern
GSequenceIter *g_sequence_insert_sorted_iter (GSequence *seq,
                                              gpointer data,
                                              GSequenceIterCompareFunc iter_cmp,
                                              gpointer cmp_data);
 extern
void g_sequence_sort_changed (GSequenceIter *iter,
                                              GCompareDataFunc cmp_func,
                                              gpointer cmp_data);
 extern
void g_sequence_sort_changed_iter (GSequenceIter *iter,
                                              GSequenceIterCompareFunc iter_cmp,
                                              gpointer cmp_data);
 extern
void g_sequence_remove (GSequenceIter *iter);
 extern
void g_sequence_remove_range (GSequenceIter *begin,
                                              GSequenceIter *end);
 extern
void g_sequence_move_range (GSequenceIter *dest,
                                              GSequenceIter *begin,
                                              GSequenceIter *end);
 extern
GSequenceIter *g_sequence_search (GSequence *seq,
                                              gpointer data,
                                              GCompareDataFunc cmp_func,
                                              gpointer cmp_data);
 extern
GSequenceIter *g_sequence_search_iter (GSequence *seq,
                                              gpointer data,
                                              GSequenceIterCompareFunc iter_cmp,
                                              gpointer cmp_data);
 extern
GSequenceIter *g_sequence_lookup (GSequence *seq,
                                              gpointer data,
                                              GCompareDataFunc cmp_func,
                                              gpointer cmp_data);
 extern
GSequenceIter *g_sequence_lookup_iter (GSequence *seq,
                                              gpointer data,
                                              GSequenceIterCompareFunc iter_cmp,
                                              gpointer cmp_data);



 extern
gpointer g_sequence_get (GSequenceIter *iter);
 extern
void g_sequence_set (GSequenceIter *iter,
                                              gpointer data);


 extern
gboolean g_sequence_iter_is_begin (GSequenceIter *iter);
 extern
gboolean g_sequence_iter_is_end (GSequenceIter *iter);
 extern
GSequenceIter *g_sequence_iter_next (GSequenceIter *iter);
 extern
GSequenceIter *g_sequence_iter_prev (GSequenceIter *iter);
 extern
gint g_sequence_iter_get_position (GSequenceIter *iter);
 extern
GSequenceIter *g_sequence_iter_move (GSequenceIter *iter,
                                              gint delta);
 extern
GSequence * g_sequence_iter_get_sequence (GSequenceIter *iter);



 extern
gint g_sequence_iter_compare (GSequenceIter *a,
                                              GSequenceIter *b);
 extern
GSequenceIter *g_sequence_range_get_midpoint (GSequenceIter *begin,
                                              GSequenceIter *end);
# 81 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gshell.h" 1
# 34 "/usr/include/glib-2.0/glib/gshell.h"
typedef enum
{

  G_SHELL_ERROR_BAD_QUOTING,

  G_SHELL_ERROR_EMPTY_STRING,
  G_SHELL_ERROR_FAILED
} GShellError;

 extern
GQuark g_shell_error_quark (void);

 extern
gchar* g_shell_quote (const gchar *unquoted_string);
 extern
gchar* g_shell_unquote (const gchar *quoted_string,
                             GError **error);
 extern
gboolean g_shell_parse_argv (const gchar *command_line,
                             gint *argcp,
                             gchar ***argvp,
                             GError **error);
# 82 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gslice.h" 1
# 34 "/usr/include/glib-2.0/glib/gslice.h"
 extern
gpointer g_slice_alloc (gsize block_size) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_slice_alloc0 (gsize block_size) __attribute__ ((__malloc__)) __attribute__((__alloc_size__(1)));
 extern
gpointer g_slice_copy (gsize block_size,
                                         gconstpointer mem_block) __attribute__((__alloc_size__(1)));
 extern
void g_slice_free1 (gsize block_size,
      gpointer mem_block);
 extern
void g_slice_free_chain_with_offset (gsize block_size,
      gpointer mem_chain,
      gsize next_offset);
# 94 "/usr/include/glib-2.0/glib/gslice.h"
typedef enum {
  G_SLICE_CONFIG_ALWAYS_MALLOC = 1,
  G_SLICE_CONFIG_BYPASS_MAGAZINES,
  G_SLICE_CONFIG_WORKING_SET_MSECS,
  G_SLICE_CONFIG_COLOR_INCREMENT,
  G_SLICE_CONFIG_CHUNK_SIZES,
  G_SLICE_CONFIG_CONTENTION_COUNTER
} GSliceConfig;

__attribute__((__deprecated__)) extern
void g_slice_set_config (GSliceConfig ckey, gint64 value);
__attribute__((__deprecated__)) extern
gint64 g_slice_get_config (GSliceConfig ckey);
__attribute__((__deprecated__)) extern
gint64* g_slice_get_config_state (GSliceConfig ckey, gint64 address, guint *n_values);
# 83 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gspawn.h" 1
# 70 "/usr/include/glib-2.0/glib/gspawn.h"
typedef enum
{
  G_SPAWN_ERROR_FORK,
  G_SPAWN_ERROR_READ,
  G_SPAWN_ERROR_CHDIR,
  G_SPAWN_ERROR_ACCES,
  G_SPAWN_ERROR_PERM,
  G_SPAWN_ERROR_TOO_BIG,
  G_SPAWN_ERROR_2BIG __attribute__((__deprecated__("Use '" "G_SPAWN_ERROR_TOO_BIG" "' instead"))) = G_SPAWN_ERROR_TOO_BIG,
  G_SPAWN_ERROR_NOEXEC,
  G_SPAWN_ERROR_NAMETOOLONG,
  G_SPAWN_ERROR_NOENT,
  G_SPAWN_ERROR_NOMEM,
  G_SPAWN_ERROR_NOTDIR,
  G_SPAWN_ERROR_LOOP,
  G_SPAWN_ERROR_TXTBUSY,
  G_SPAWN_ERROR_IO,
  G_SPAWN_ERROR_NFILE,
  G_SPAWN_ERROR_MFILE,
  G_SPAWN_ERROR_INVAL,
  G_SPAWN_ERROR_ISDIR,
  G_SPAWN_ERROR_LIBBAD,
  G_SPAWN_ERROR_FAILED


} GSpawnError;
# 140 "/usr/include/glib-2.0/glib/gspawn.h"
typedef void (* GSpawnChildSetupFunc) (gpointer data);
# 176 "/usr/include/glib-2.0/glib/gspawn.h"
typedef enum
{
  G_SPAWN_DEFAULT = 0,
  G_SPAWN_LEAVE_DESCRIPTORS_OPEN = 1 << 0,
  G_SPAWN_DO_NOT_REAP_CHILD = 1 << 1,

  G_SPAWN_SEARCH_PATH = 1 << 2,

  G_SPAWN_STDOUT_TO_DEV_NULL = 1 << 3,
  G_SPAWN_STDERR_TO_DEV_NULL = 1 << 4,
  G_SPAWN_CHILD_INHERITS_STDIN = 1 << 5,
  G_SPAWN_FILE_AND_ARGV_ZERO = 1 << 6,
  G_SPAWN_SEARCH_PATH_FROM_ENVP = 1 << 7,
  G_SPAWN_CLOEXEC_PIPES = 1 << 8,
# 198 "/usr/include/glib-2.0/glib/gspawn.h"
  G_SPAWN_CHILD_INHERITS_STDOUT = 1 << 9,
# 207 "/usr/include/glib-2.0/glib/gspawn.h"
  G_SPAWN_CHILD_INHERITS_STDERR = 1 << 10,
# 216 "/usr/include/glib-2.0/glib/gspawn.h"
  G_SPAWN_STDIN_FROM_DEV_NULL = 1 << 11
} GSpawnFlags;

 extern
GQuark g_spawn_error_quark (void);
 extern
GQuark g_spawn_exit_error_quark (void);

 extern
gboolean g_spawn_async (const gchar *working_directory,
                        gchar **argv,
                        gchar **envp,
                        GSpawnFlags flags,
                        GSpawnChildSetupFunc child_setup,
                        gpointer user_data,
                        GPid *child_pid,
                        GError **error);





 extern
gboolean g_spawn_async_with_pipes (const gchar *working_directory,
                                   gchar **argv,
                                   gchar **envp,
                                   GSpawnFlags flags,
                                   GSpawnChildSetupFunc child_setup,
                                   gpointer user_data,
                                   GPid *child_pid,
                                   gint *standard_input,
                                   gint *standard_output,
                                   gint *standard_error,
                                   GError **error);

 extern
gboolean g_spawn_async_with_pipes_and_fds (const gchar *working_directory,
                                           const gchar * const *argv,
                                           const gchar * const *envp,
                                           GSpawnFlags flags,
                                           GSpawnChildSetupFunc child_setup,
                                           gpointer user_data,
                                           gint stdin_fd,
                                           gint stdout_fd,
                                           gint stderr_fd,
                                           const gint *source_fds,
                                           const gint *target_fds,
                                           gsize n_fds,
                                           GPid *child_pid_out,
                                           gint *stdin_pipe_out,
                                           gint *stdout_pipe_out,
                                           gint *stderr_pipe_out,
                                           GError **error);


 extern
gboolean g_spawn_async_with_fds (const gchar *working_directory,
                                 gchar **argv,
                                 gchar **envp,
                                 GSpawnFlags flags,
                                 GSpawnChildSetupFunc child_setup,
                                 gpointer user_data,
                                 GPid *child_pid,
                                 gint stdin_fd,
                                 gint stdout_fd,
                                 gint stderr_fd,
                                 GError **error);





 extern
gboolean g_spawn_sync (const gchar *working_directory,
                               gchar **argv,
                               gchar **envp,
                               GSpawnFlags flags,
                               GSpawnChildSetupFunc child_setup,
                               gpointer user_data,
                               gchar **standard_output,
                               gchar **standard_error,
                               gint *wait_status,
                               GError **error);

 extern
gboolean g_spawn_command_line_sync (const gchar *command_line,
                                     gchar **standard_output,
                                     gchar **standard_error,
                                     gint *wait_status,
                                     GError **error);
 extern
gboolean g_spawn_command_line_async (const gchar *command_line,
                                     GError **error);

 extern
gboolean g_spawn_check_wait_status (gint wait_status,
                                    GError **error);

__attribute__((__deprecated__("Use '" "g_spawn_check_wait_status" "' instead"))) extern
gboolean g_spawn_check_exit_status (gint wait_status,
        GError **error);

 extern
void g_spawn_close_pid (GPid pid);
# 85 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gstringchunk.h" 1
# 38 "/usr/include/glib-2.0/glib/gstringchunk.h"
typedef struct _GStringChunk GStringChunk;

 extern
GStringChunk* g_string_chunk_new (gsize size);
 extern
void g_string_chunk_free (GStringChunk *chunk);
 extern
void g_string_chunk_clear (GStringChunk *chunk);
 extern
gchar* g_string_chunk_insert (GStringChunk *chunk,
                                           const gchar *string);
 extern
gchar* g_string_chunk_insert_len (GStringChunk *chunk,
                                           const gchar *string,
                                           gssize len);
 extern
gchar* g_string_chunk_insert_const (GStringChunk *chunk,
                                           const gchar *string);
# 87 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gstrvbuilder.h" 1
# 33 "/usr/include/glib-2.0/glib/gstrvbuilder.h"
typedef struct _GStrvBuilder GStrvBuilder;

 extern
GStrvBuilder *g_strv_builder_new (void);

 extern
void g_strv_builder_unref (GStrvBuilder *builder);

 extern
GStrv g_strv_builder_unref_to_strv (GStrvBuilder *builder);

 extern
GStrvBuilder *g_strv_builder_ref (GStrvBuilder *builder);

 extern
void g_strv_builder_add (GStrvBuilder *builder,
                         const char *value);

 extern
void g_strv_builder_addv (GStrvBuilder *builder,
                          const char **value);

 extern
void g_strv_builder_add_many (GStrvBuilder *builder,
                              ...) __attribute__((__sentinel__));

 extern
void g_strv_builder_take (GStrvBuilder *builder,
                          char *value);

 extern
GStrv g_strv_builder_end (GStrvBuilder *builder);
# 89 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gtestutils.h" 1
# 32 "/usr/include/glib-2.0/glib/gtestutils.h"
# 1 "/usr/include/errno.h" 1 3 4
# 28 "/usr/include/errno.h" 3 4
# 1 "/usr/include/bits/errno.h" 1 3 4
# 26 "/usr/include/bits/errno.h" 3 4
# 1 "/usr/include/linux/errno.h" 1 3 4
# 1 "/usr/include/asm/errno.h" 1 3 4
# 1 "/usr/include/asm-generic/errno.h" 1 3 4




# 1 "/usr/include/asm-generic/errno-base.h" 1 3 4
# 6 "/usr/include/asm-generic/errno.h" 2 3 4
# 2 "/usr/include/asm/errno.h" 2 3 4
# 2 "/usr/include/linux/errno.h" 2 3 4
# 27 "/usr/include/bits/errno.h" 2 3 4
# 29 "/usr/include/errno.h" 2 3 4








extern int *__errno_location (void) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));
# 33 "/usr/include/glib-2.0/glib/gtestutils.h" 2





typedef struct GTestCase GTestCase;
typedef struct GTestSuite GTestSuite;
typedef void (*GTestFunc) (void);
typedef void (*GTestDataFunc) (gconstpointer user_data);
typedef void (*GTestFixtureFunc) (gpointer fixture,
                                  gconstpointer user_data);
# 282 "/usr/include/glib-2.0/glib/gtestutils.h"
 extern
int g_strcmp0 (const char *str1,
                                         const char *str2);


 extern
void g_test_minimized_result (double minimized_quantity,
                                         const char *format,
                                         ...) __attribute__((__format__ (__printf__, 2, 3)));
 extern
void g_test_maximized_result (double maximized_quantity,
                                         const char *format,
                                         ...) __attribute__((__format__ (__printf__, 2, 3)));


 extern
void g_test_init (int *argc,
                                         char ***argv,
                                         ...) __attribute__((__sentinel__));
# 364 "/usr/include/glib-2.0/glib/gtestutils.h"
 extern
gboolean g_test_subprocess (void);


 extern
int g_test_run (void);

 extern
void g_test_add_func (const char *testpath,
                                         GTestFunc test_func);

 extern
void g_test_add_data_func (const char *testpath,
                                         gconstpointer test_data,
                                         GTestDataFunc test_func);

 extern
void g_test_add_data_func_full (const char *testpath,
                                         gpointer test_data,
                                         GTestDataFunc test_func,
                                         GDestroyNotify data_free_func);


 extern
const char * g_test_get_path (void);


 extern
void g_test_fail (void);
 extern
void g_test_fail_printf (const char *format,
                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
 extern
void g_test_incomplete (const gchar *msg);
 extern
void g_test_incomplete_printf (const char *format,
                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
 extern
void g_test_skip (const gchar *msg);
 extern
void g_test_skip_printf (const char *format,
                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
 extern
gboolean g_test_failed (void);
 extern
void g_test_set_nonfatal_assertions (void);
 extern
void g_test_disable_crash_reporting (void);
# 445 "/usr/include/glib-2.0/glib/gtestutils.h"
 extern
void g_test_message (const char *format,
                                         ...) __attribute__((__format__ (__printf__, 1, 2)));
 extern
void g_test_bug_base (const char *uri_pattern);
 extern
void g_test_bug (const char *bug_uri_snippet);
 extern
void g_test_summary (const char *summary);

 extern
void g_test_timer_start (void);
 extern
double g_test_timer_elapsed (void);
 extern
double g_test_timer_last (void);


 extern
void g_test_queue_free (gpointer gfree_pointer);
 extern
void g_test_queue_destroy (GDestroyNotify destroy_func,
                                         gpointer destroy_data);
# 492 "/usr/include/glib-2.0/glib/gtestutils.h"
typedef enum {
  G_TEST_TRAP_DEFAULT = 0,
  G_TEST_TRAP_SILENCE_STDOUT = 1 << 7,
  G_TEST_TRAP_SILENCE_STDERR = 1 << 8,
  G_TEST_TRAP_INHERIT_STDIN = 1 << 9
} GTestTrapFlags __attribute__((__deprecated__("Use '" "GTestSubprocessFlags" "' instead")));

#pragma clang diagnostic push
# 499 "/usr/include/glib-2.0/glib/gtestutils.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

__attribute__((__deprecated__("Use '" "g_test_trap_subprocess" "' instead"))) extern
gboolean g_test_trap_fork (guint64 usec_timeout,
                                         GTestTrapFlags test_trap_flags);

#pragma clang diagnostic pop

typedef enum {
  G_TEST_SUBPROCESS_DEFAULT = 0,
  G_TEST_SUBPROCESS_INHERIT_STDIN = 1 << 0,
  G_TEST_SUBPROCESS_INHERIT_STDOUT = 1 << 1,
  G_TEST_SUBPROCESS_INHERIT_STDERR = 1 << 2
} GTestSubprocessFlags;

 extern
void g_test_trap_subprocess (const char *test_path,
                                         guint64 usec_timeout,
                                         GTestSubprocessFlags test_flags);
 extern
void g_test_trap_subprocess_with_envp (const char *test_path,
                                           const char * const *envp,
                                           guint64 usec_timeout,
                                           GTestSubprocessFlags test_flags);

 extern
gboolean g_test_trap_has_passed (void);
 extern
gboolean g_test_trap_reached_timeout (void);
# 537 "/usr/include/glib-2.0/glib/gtestutils.h"
 extern
gint32 g_test_rand_int (void);
 extern
gint32 g_test_rand_int_range (gint32 begin,
                                         gint32 end);
 extern
double g_test_rand_double (void);
 extern
double g_test_rand_double_range (double range_start,
                                         double range_end);






 extern
GTestCase* g_test_create_case (const char *test_name,
                                         gsize data_size,
                                         gconstpointer test_data,
                                         GTestFixtureFunc data_setup,
                                         GTestFixtureFunc data_test,
                                         GTestFixtureFunc data_teardown);
 extern
GTestSuite* g_test_create_suite (const char *suite_name);
 extern
GTestSuite* g_test_get_root (void);
 extern
void g_test_suite_add (GTestSuite *suite,
                                         GTestCase *test_case);
 extern
void g_test_suite_add_suite (GTestSuite *suite,
                                         GTestSuite *nestedsuite);
 extern
int g_test_run_suite (GTestSuite *suite);

 extern
void g_test_case_free (GTestCase *test_case);

 extern
void g_test_suite_free (GTestSuite *suite);

 extern
void g_test_trap_assertions (const char *domain,
                                         const char *file,
                                         int line,
                                         const char *func,
                                         guint64 assertion_flags,
                                         const char *pattern);
 extern
void g_assertion_message (const char *domain,
                                         const char *file,
                                         int line,
                                         const char *func,
                                         const char *message) ;
__attribute__ ((__noreturn__))
 extern
void g_assertion_message_expr (const char *domain,
                                         const char *file,
                                         int line,
                                         const char *func,
                                         const char *expr);
 extern
void g_assertion_message_cmpstr (const char *domain,
                                         const char *file,
                                         int line,
                                         const char *func,
                                         const char *expr,
                                         const char *arg1,
                                         const char *cmp,
                                         const char *arg2) ;

 extern
void g_assertion_message_cmpstrv (const char *domain,
                                         const char *file,
                                         int line,
                                         const char *func,
                                         const char *expr,
                                         const char * const *arg1,
                                         const char * const *arg2,
                                         gsize first_wrong_idx) ;
 extern
void g_assertion_message_cmpint (const char *domain,
                                         const char *file,
                                         int line,
                                         const char *func,
                                         const char *expr,
                                         guint64 arg1,
                                         const char *cmp,
                                         guint64 arg2,
                                         char numtype) ;
 extern
void g_assertion_message_cmpnum (const char *domain,
                                         const char *file,
                                         int line,
                                         const char *func,
                                         const char *expr,
                                         long double arg1,
                                         const char *cmp,
                                         long double arg2,
                                         char numtype) ;
 extern
void g_assertion_message_error (const char *domain,
                                         const char *file,
                                         int line,
                                         const char *func,
                                         const char *expr,
                                         const GError *error,
                                         GQuark error_domain,
                                         int error_code) ;
 extern
void g_test_add_vtable (const char *testpath,
                                         gsize data_size,
                                         gconstpointer test_data,
                                         GTestFixtureFunc data_setup,
                                         GTestFixtureFunc data_test,
                                         GTestFixtureFunc data_teardown);
typedef struct {
  gboolean test_initialized;
  gboolean test_quick;
  gboolean test_perf;
  gboolean test_verbose;
  gboolean test_quiet;
  gboolean test_undefined;
} GTestConfig;
 extern const GTestConfig * const g_test_config_vars;


typedef enum {
  G_TEST_RUN_SUCCESS,
  G_TEST_RUN_SKIPPED,
  G_TEST_RUN_FAILURE,
  G_TEST_RUN_INCOMPLETE
} GTestResult;

typedef enum {
  G_TEST_LOG_NONE,
  G_TEST_LOG_ERROR,
  G_TEST_LOG_START_BINARY,
  G_TEST_LOG_LIST_CASE,
  G_TEST_LOG_SKIP_CASE,
  G_TEST_LOG_START_CASE,
  G_TEST_LOG_STOP_CASE,
  G_TEST_LOG_MIN_RESULT,
  G_TEST_LOG_MAX_RESULT,
  G_TEST_LOG_MESSAGE,
  G_TEST_LOG_START_SUITE,
  G_TEST_LOG_STOP_SUITE
} GTestLogType;

typedef struct {
  GTestLogType log_type;
  guint n_strings;
  gchar **strings;
  guint n_nums;
  long double *nums;
} GTestLogMsg;
typedef struct {

  GString *data;
  GSList *msgs;
} GTestLogBuffer;

 extern
const char* g_test_log_type_name (GTestLogType log_type);
 extern
GTestLogBuffer* g_test_log_buffer_new (void);
 extern
void g_test_log_buffer_free (GTestLogBuffer *tbuffer);
 extern
void g_test_log_buffer_push (GTestLogBuffer *tbuffer,
                                         guint n_bytes,
                                         const guint8 *bytes);
 extern
GTestLogMsg* g_test_log_buffer_pop (GTestLogBuffer *tbuffer);
 extern
void g_test_log_msg_free (GTestLogMsg *tmsg);
# 728 "/usr/include/glib-2.0/glib/gtestutils.h"
typedef gboolean (*GTestLogFatalFunc) (const gchar *log_domain,
                                                 GLogLevelFlags log_level,
                                                 const gchar *message,
                                                 gpointer user_data);
 extern
void
g_test_log_set_fatal_handler (GTestLogFatalFunc log_func,
                                         gpointer user_data);

 extern
void g_test_expect_message (const gchar *log_domain,
                                                  GLogLevelFlags log_level,
                                                  const gchar *pattern);
 extern
void g_test_assert_expected_messages_internal (const char *domain,
                                                  const char *file,
                                                  int line,
                                                  const char *func);

typedef enum
{
  G_TEST_DIST,
  G_TEST_BUILT
} GTestFileType;

 extern
gchar * g_test_build_filename (GTestFileType file_type,
                                                  const gchar *first_path,
                                                  ...) __attribute__((__sentinel__));
 extern
const gchar *g_test_get_dir (GTestFileType file_type);
 extern
const gchar *g_test_get_filename (GTestFileType file_type,
                                                  const gchar *first_path,
                                                  ...) __attribute__((__sentinel__));
# 90 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gthreadpool.h" 1
# 38 "/usr/include/glib-2.0/glib/gthreadpool.h"
typedef struct _GThreadPool GThreadPool;




struct _GThreadPool
{
  GFunc func;
  gpointer user_data;
  gboolean exclusive;
};

 extern
GThreadPool * g_thread_pool_new (GFunc func,
                                                 gpointer user_data,
                                                 gint max_threads,
                                                 gboolean exclusive,
                                                 GError **error);
 extern
GThreadPool * g_thread_pool_new_full (GFunc func,
                                                 gpointer user_data,
                                                 GDestroyNotify item_free_func,
                                                 gint max_threads,
                                                 gboolean exclusive,
                                                 GError **error);
 extern
void g_thread_pool_free (GThreadPool *pool,
                                                 gboolean immediate,
                                                 gboolean wait_);
 extern
gboolean g_thread_pool_push (GThreadPool *pool,
                                                 gpointer data,
                                                 GError **error);
 extern
guint g_thread_pool_unprocessed (GThreadPool *pool);
 extern
void g_thread_pool_set_sort_function (GThreadPool *pool,
                                                 GCompareDataFunc func,
                                                 gpointer user_data);
 extern
gboolean g_thread_pool_move_to_front (GThreadPool *pool,
                                                 gpointer data);

 extern
gboolean g_thread_pool_set_max_threads (GThreadPool *pool,
                                                 gint max_threads,
                                                 GError **error);
 extern
gint g_thread_pool_get_max_threads (GThreadPool *pool);
 extern
guint g_thread_pool_get_num_threads (GThreadPool *pool);

 extern
void g_thread_pool_set_max_unused_threads (gint max_threads);
 extern
gint g_thread_pool_get_max_unused_threads (void);
 extern
guint g_thread_pool_get_num_unused_threads (void);
 extern
void g_thread_pool_stop_unused_threads (void);
 extern
void g_thread_pool_set_max_idle_time (guint interval);
 extern
guint g_thread_pool_get_max_idle_time (void);
# 92 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gtimer.h" 1
# 42 "/usr/include/glib-2.0/glib/gtimer.h"
typedef struct _GTimer GTimer;



 extern
GTimer* g_timer_new (void);
 extern
void g_timer_destroy (GTimer *timer);
 extern
void g_timer_start (GTimer *timer);
 extern
void g_timer_stop (GTimer *timer);
 extern
void g_timer_reset (GTimer *timer);
 extern
void g_timer_continue (GTimer *timer);
 extern
gdouble g_timer_elapsed (GTimer *timer,
      gulong *microseconds);
 extern
gboolean g_timer_is_active (GTimer *timer);

 extern
void g_usleep (gulong microseconds);

#pragma clang diagnostic push
# 67 "/usr/include/glib-2.0/glib/gtimer.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
__attribute__((__deprecated__)) extern
void g_time_val_add (GTimeVal *time_,
                                  glong microseconds);
__attribute__((__deprecated__("Use '" "g_date_time_new_from_iso8601" "' instead"))) extern
gboolean g_time_val_from_iso8601 (const gchar *iso_date,
      GTimeVal *time_);
__attribute__((__deprecated__("Use '" "g_date_time_format" "' instead"))) extern
gchar* g_time_val_to_iso8601 (GTimeVal *time_) __attribute__ ((__malloc__));
#pragma clang diagnostic pop
# 93 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/gtrashstack.h" 1
# 38 "/usr/include/glib-2.0/glib/gtrashstack.h"
#pragma clang diagnostic push
# 38 "/usr/include/glib-2.0/glib/gtrashstack.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

typedef struct _GTrashStack GTrashStack __attribute__((__deprecated__));
struct _GTrashStack
{
  GTrashStack *next;
} __attribute__((__deprecated__));

__attribute__((__deprecated__)) extern
void g_trash_stack_push (GTrashStack **stack_p,
                                gpointer data_p);
__attribute__((__deprecated__)) extern
gpointer g_trash_stack_pop (GTrashStack **stack_p);
__attribute__((__deprecated__)) extern
gpointer g_trash_stack_peek (GTrashStack **stack_p);
__attribute__((__deprecated__)) extern
guint g_trash_stack_height (GTrashStack **stack_p);

#pragma clang diagnostic pop
# 95 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/gtree.h" 1
# 40 "/usr/include/glib-2.0/glib/gtree.h"
typedef struct _GTree GTree;
# 49 "/usr/include/glib-2.0/glib/gtree.h"
typedef struct _GTreeNode GTreeNode;

typedef gboolean (*GTraverseFunc) (gpointer key,
                                   gpointer value,
                                   gpointer data);
# 68 "/usr/include/glib-2.0/glib/gtree.h"
typedef gboolean (*GTraverseNodeFunc) (GTreeNode *node,
                                       gpointer data);



 extern
GTree* g_tree_new (GCompareFunc key_compare_func);
 extern
GTree* g_tree_new_with_data (GCompareDataFunc key_compare_func,
                                 gpointer key_compare_data);
 extern
GTree* g_tree_new_full (GCompareDataFunc key_compare_func,
                                 gpointer key_compare_data,
                                 GDestroyNotify key_destroy_func,
                                 GDestroyNotify value_destroy_func);
 extern
GTreeNode *g_tree_node_first (GTree *tree);
 extern
GTreeNode *g_tree_node_last (GTree *tree);
 extern
GTreeNode *g_tree_node_previous (GTreeNode *node);
 extern
GTreeNode *g_tree_node_next (GTreeNode *node);
 extern
GTree* g_tree_ref (GTree *tree);
 extern
void g_tree_unref (GTree *tree);
 extern
void g_tree_destroy (GTree *tree);
 extern
GTreeNode *g_tree_insert_node (GTree *tree,
                               gpointer key,
                               gpointer value);
 extern
void g_tree_insert (GTree *tree,
                                 gpointer key,
                                 gpointer value);
 extern
GTreeNode *g_tree_replace_node (GTree *tree,
                                gpointer key,
                                gpointer value);
 extern
void g_tree_replace (GTree *tree,
                                 gpointer key,
                                 gpointer value);
 extern
gboolean g_tree_remove (GTree *tree,
                                 gconstpointer key);

 extern
void g_tree_remove_all (GTree *tree);

 extern
gboolean g_tree_steal (GTree *tree,
                                 gconstpointer key);
 extern
gpointer g_tree_node_key (GTreeNode *node);
 extern
gpointer g_tree_node_value (GTreeNode *node);
 extern
GTreeNode *g_tree_lookup_node (GTree *tree,
                               gconstpointer key);
 extern
gpointer g_tree_lookup (GTree *tree,
                                 gconstpointer key);
 extern
gboolean g_tree_lookup_extended (GTree *tree,
                                 gconstpointer lookup_key,
                                 gpointer *orig_key,
                                 gpointer *value);
 extern
void g_tree_foreach (GTree *tree,
                                 GTraverseFunc func,
                                 gpointer user_data);
 extern
void g_tree_foreach_node (GTree *tree,
                          GTraverseNodeFunc func,
                          gpointer user_data);

__attribute__((__deprecated__)) extern
void g_tree_traverse (GTree *tree,
                                 GTraverseFunc traverse_func,
                                 GTraverseType traverse_type,
                                 gpointer user_data);

 extern
GTreeNode *g_tree_search_node (GTree *tree,
                               GCompareFunc search_func,
                               gconstpointer user_data);
 extern
gpointer g_tree_search (GTree *tree,
                                 GCompareFunc search_func,
                                 gconstpointer user_data);
 extern
GTreeNode *g_tree_lower_bound (GTree *tree,
                               gconstpointer key);
 extern
GTreeNode *g_tree_upper_bound (GTree *tree,
                               gconstpointer key);
 extern
gint g_tree_height (GTree *tree);
 extern
gint g_tree_nnodes (GTree *tree);
# 96 "/usr/include/glib-2.0/glib.h" 2


# 1 "/usr/include/glib-2.0/glib/guri.h" 1
# 31 "/usr/include/glib-2.0/glib/guri.h"
#pragma clang diagnostic push
# 31 "/usr/include/glib-2.0/glib/guri.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

typedef struct _GUri GUri;

 extern
GUri * g_uri_ref (GUri *uri);
 extern
void g_uri_unref (GUri *uri);
# 82 "/usr/include/glib-2.0/glib/guri.h"
typedef enum {
  G_URI_FLAGS_NONE = 0,
  G_URI_FLAGS_PARSE_RELAXED = 1 << 0,
  G_URI_FLAGS_HAS_PASSWORD = 1 << 1,
  G_URI_FLAGS_HAS_AUTH_PARAMS = 1 << 2,
  G_URI_FLAGS_ENCODED = 1 << 3,
  G_URI_FLAGS_NON_DNS = 1 << 4,
  G_URI_FLAGS_ENCODED_QUERY = 1 << 5,
  G_URI_FLAGS_ENCODED_PATH = 1 << 6,
  G_URI_FLAGS_ENCODED_FRAGMENT = 1 << 7,
  G_URI_FLAGS_SCHEME_NORMALIZE = 1 << 8,
} GUriFlags;

 extern
gboolean g_uri_split (const gchar *uri_ref,
                                     GUriFlags flags,
                                     gchar **scheme,
                                     gchar **userinfo,
                                     gchar **host,
                                     gint *port,
                                     gchar **path,
                                     gchar **query,
                                     gchar **fragment,
                                     GError **error);
 extern
gboolean g_uri_split_with_user (const gchar *uri_ref,
                                     GUriFlags flags,
                                     gchar **scheme,
                                     gchar **user,
                                     gchar **password,
                                     gchar **auth_params,
                                     gchar **host,
                                     gint *port,
                                     gchar **path,
                                     gchar **query,
                                     gchar **fragment,
                                     GError **error);
 extern
gboolean g_uri_split_network (const gchar *uri_string,
                                     GUriFlags flags,
                                     gchar **scheme,
                                     gchar **host,
                                     gint *port,
                                     GError **error);

 extern
gboolean g_uri_is_valid (const gchar *uri_string,
                                     GUriFlags flags,
                                     GError **error);

 extern
gchar * g_uri_join (GUriFlags flags,
                                     const gchar *scheme,
                                     const gchar *userinfo,
                                     const gchar *host,
                                     gint port,
                                     const gchar *path,
                                     const gchar *query,
                                     const gchar *fragment);
 extern
gchar * g_uri_join_with_user (GUriFlags flags,
                                     const gchar *scheme,
                                     const gchar *user,
                                     const gchar *password,
                                     const gchar *auth_params,
                                     const gchar *host,
                                     gint port,
                                     const gchar *path,
                                     const gchar *query,
                                     const gchar *fragment);

 extern
GUri * g_uri_parse (const gchar *uri_string,
                                     GUriFlags flags,
                                     GError **error);
 extern
GUri * g_uri_parse_relative (GUri *base_uri,
                                     const gchar *uri_ref,
                                     GUriFlags flags,
                                     GError **error);

 extern
gchar * g_uri_resolve_relative (const gchar *base_uri_string,
                                     const gchar *uri_ref,
                                     GUriFlags flags,
                                     GError **error);

 extern
GUri * g_uri_build (GUriFlags flags,
                                     const gchar *scheme,
                                     const gchar *userinfo,
                                     const gchar *host,
                                     gint port,
                                     const gchar *path,
                                     const gchar *query,
                                     const gchar *fragment);
 extern
GUri * g_uri_build_with_user (GUriFlags flags,
                                     const gchar *scheme,
                                     const gchar *user,
                                     const gchar *password,
                                     const gchar *auth_params,
                                     const gchar *host,
                                     gint port,
                                     const gchar *path,
                                     const gchar *query,
                                     const gchar *fragment);
# 207 "/usr/include/glib-2.0/glib/guri.h"
typedef enum {
  G_URI_HIDE_NONE = 0,
  G_URI_HIDE_USERINFO = 1 << 0,
  G_URI_HIDE_PASSWORD = 1 << 1,
  G_URI_HIDE_AUTH_PARAMS = 1 << 2,
  G_URI_HIDE_QUERY = 1 << 3,
  G_URI_HIDE_FRAGMENT = 1 << 4,
} GUriHideFlags;

 extern
char * g_uri_to_string (GUri *uri);
 extern
char * g_uri_to_string_partial (GUri *uri,
                                      GUriHideFlags flags);

 extern
const gchar *g_uri_get_scheme (GUri *uri);
 extern
const gchar *g_uri_get_userinfo (GUri *uri);
 extern
const gchar *g_uri_get_user (GUri *uri);
 extern
const gchar *g_uri_get_password (GUri *uri);
 extern
const gchar *g_uri_get_auth_params (GUri *uri);
 extern
const gchar *g_uri_get_host (GUri *uri);
 extern
gint g_uri_get_port (GUri *uri);
 extern
const gchar *g_uri_get_path (GUri *uri);
 extern
const gchar *g_uri_get_query (GUri *uri);
 extern
const gchar *g_uri_get_fragment (GUri *uri);
 extern
GUriFlags g_uri_get_flags (GUri *uri);
# 259 "/usr/include/glib-2.0/glib/guri.h"
typedef enum {
  G_URI_PARAMS_NONE = 0,
  G_URI_PARAMS_CASE_INSENSITIVE = 1 << 0,
  G_URI_PARAMS_WWW_FORM = 1 << 1,
  G_URI_PARAMS_PARSE_RELAXED = 1 << 2,
} GUriParamsFlags;

 extern
GHashTable *g_uri_parse_params (const gchar *params,
                                      gssize length,
                                      const gchar *separators,
                                      GUriParamsFlags flags,
                                      GError **error);

typedef struct _GUriParamsIter GUriParamsIter;

struct _GUriParamsIter
{

  gint dummy0;
  gpointer dummy1;
  gpointer dummy2;
  guint8 dummy3[256];
};

 extern
void g_uri_params_iter_init (GUriParamsIter *iter,
                                      const gchar *params,
                                      gssize length,
                                      const gchar *separators,
                                      GUriParamsFlags flags);

 extern
gboolean g_uri_params_iter_next (GUriParamsIter *iter,
                                      gchar **attribute,
                                      gchar **value,
                                      GError **error);
# 307 "/usr/include/glib-2.0/glib/guri.h"
 extern
GQuark g_uri_error_quark (void);
# 328 "/usr/include/glib-2.0/glib/guri.h"
typedef enum {
  G_URI_ERROR_FAILED,
  G_URI_ERROR_BAD_SCHEME,
  G_URI_ERROR_BAD_USER,
  G_URI_ERROR_BAD_PASSWORD,
  G_URI_ERROR_BAD_AUTH_PARAMS,
  G_URI_ERROR_BAD_HOST,
  G_URI_ERROR_BAD_PORT,
  G_URI_ERROR_BAD_PATH,
  G_URI_ERROR_BAD_QUERY,
  G_URI_ERROR_BAD_FRAGMENT,
} GUriError;
# 389 "/usr/include/glib-2.0/glib/guri.h"
 extern
char * g_uri_unescape_string (const char *escaped_string,
                                    const char *illegal_characters);
 extern
char * g_uri_unescape_segment (const char *escaped_string,
                                    const char *escaped_string_end,
                                    const char *illegal_characters);

 extern
char * g_uri_parse_scheme (const char *uri);
 extern
const char *g_uri_peek_scheme (const char *uri);

 extern
char * g_uri_escape_string (const char *unescaped,
                                    const char *reserved_chars_allowed,
                                    gboolean allow_utf8);

 extern
GBytes * g_uri_unescape_bytes (const char *escaped_string,
                                    gssize length,
                                    const char *illegal_characters,
                                    GError **error);

 extern
char * g_uri_escape_bytes (const guint8 *unescaped,
                                    gsize length,
                                    const char *reserved_chars_allowed);

#pragma clang diagnostic pop
# 99 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/guuid.h" 1
# 34 "/usr/include/glib-2.0/glib/guuid.h"
 extern
gboolean g_uuid_string_is_valid (const gchar *str);

 extern
gchar * g_uuid_string_random (void);
# 101 "/usr/include/glib-2.0/glib.h" 2


# 1 "/usr/include/glib-2.0/glib/gversion.h" 1
# 38 "/usr/include/glib-2.0/glib/gversion.h"
 extern const guint glib_major_version;
 extern const guint glib_minor_version;
 extern const guint glib_micro_version;
 extern const guint glib_interface_age;
 extern const guint glib_binary_age;

 extern
const gchar * glib_check_version (guint required_major,
                                  guint required_minor,
                                  guint required_micro);
# 104 "/usr/include/glib-2.0/glib.h" 2






# 1 "/usr/include/glib-2.0/glib/deprecated/gallocator.h" 1
# 27 "/usr/include/glib-2.0/glib/deprecated/gallocator.h"
typedef struct _GAllocator GAllocator;
typedef struct _GMemChunk GMemChunk;
# 42 "/usr/include/glib-2.0/glib/deprecated/gallocator.h"
__attribute__((__deprecated__)) extern
GMemChunk * g_mem_chunk_new (const gchar *name,
                                         gint atom_size,
                                         gsize area_size,
                                         gint type);
__attribute__((__deprecated__)) extern
void g_mem_chunk_destroy (GMemChunk *mem_chunk);
__attribute__((__deprecated__)) extern
gpointer g_mem_chunk_alloc (GMemChunk *mem_chunk);
__attribute__((__deprecated__)) extern
gpointer g_mem_chunk_alloc0 (GMemChunk *mem_chunk);
__attribute__((__deprecated__)) extern
void g_mem_chunk_free (GMemChunk *mem_chunk,
                                         gpointer mem);
__attribute__((__deprecated__)) extern
void g_mem_chunk_clean (GMemChunk *mem_chunk);
__attribute__((__deprecated__)) extern
void g_mem_chunk_reset (GMemChunk *mem_chunk);
__attribute__((__deprecated__)) extern
void g_mem_chunk_print (GMemChunk *mem_chunk);
__attribute__((__deprecated__)) extern
void g_mem_chunk_info (void);
__attribute__((__deprecated__)) extern
void g_blow_chunks (void);


__attribute__((__deprecated__)) extern
GAllocator * g_allocator_new (const gchar *name,
                                         guint n_preallocs);
__attribute__((__deprecated__)) extern
void g_allocator_free (GAllocator *allocator);
__attribute__((__deprecated__)) extern
void g_list_push_allocator (GAllocator *allocator);
__attribute__((__deprecated__)) extern
void g_list_pop_allocator (void);
__attribute__((__deprecated__)) extern
void g_slist_push_allocator (GAllocator *allocator);
__attribute__((__deprecated__)) extern
void g_slist_pop_allocator (void);
__attribute__((__deprecated__)) extern
void g_node_push_allocator (GAllocator *allocator);
__attribute__((__deprecated__)) extern
void g_node_pop_allocator (void);
# 111 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/deprecated/gcache.h" 1
# 38 "/usr/include/glib-2.0/glib/deprecated/gcache.h"
typedef struct _GCache GCache __attribute__((__deprecated__("Use '" "GHashTable" "' instead")));

typedef gpointer (*GCacheNewFunc) (gpointer key) __attribute__((__deprecated__));
typedef gpointer (*GCacheDupFunc) (gpointer value) __attribute__((__deprecated__));
typedef void (*GCacheDestroyFunc) (gpointer value) __attribute__((__deprecated__));

#pragma clang diagnostic push
# 44 "/usr/include/glib-2.0/glib/deprecated/gcache.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"



__attribute__((__deprecated__)) extern
GCache* g_cache_new (GCacheNewFunc value_new_func,
                                GCacheDestroyFunc value_destroy_func,
                                GCacheDupFunc key_dup_func,
                                GCacheDestroyFunc key_destroy_func,
                                GHashFunc hash_key_func,
                                GHashFunc hash_value_func,
                                GEqualFunc key_equal_func);
__attribute__((__deprecated__)) extern
void g_cache_destroy (GCache *cache);
__attribute__((__deprecated__)) extern
gpointer g_cache_insert (GCache *cache,
                                gpointer key);
__attribute__((__deprecated__)) extern
void g_cache_remove (GCache *cache,
                                gconstpointer value);
__attribute__((__deprecated__)) extern
void g_cache_key_foreach (GCache *cache,
                                GHFunc func,
                                gpointer user_data);
__attribute__((__deprecated__)) extern
void g_cache_value_foreach (GCache *cache,
                                GHFunc func,
                                gpointer user_data);

#pragma clang diagnostic pop
# 112 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/deprecated/gcompletion.h" 1
# 38 "/usr/include/glib-2.0/glib/deprecated/gcompletion.h"
typedef struct _GCompletion GCompletion;

typedef gchar* (*GCompletionFunc) (gpointer item);




typedef gint (*GCompletionStrncmpFunc) (const gchar *s1,
                                        const gchar *s2,
                                        gsize n);

struct _GCompletion
{
  GList* items;
  GCompletionFunc func;

  gchar* prefix;
  GList* cache;
  GCompletionStrncmpFunc strncmp_func;
};

__attribute__((__deprecated__)) extern
GCompletion* g_completion_new (GCompletionFunc func);
__attribute__((__deprecated__)) extern
void g_completion_add_items (GCompletion* cmp,
                                         GList* items);
__attribute__((__deprecated__)) extern
void g_completion_remove_items (GCompletion* cmp,
                                         GList* items);
__attribute__((__deprecated__)) extern
void g_completion_clear_items (GCompletion* cmp);
__attribute__((__deprecated__)) extern
GList* g_completion_complete (GCompletion* cmp,
                                         const gchar* prefix,
                                         gchar** new_prefix);
__attribute__((__deprecated__)) extern
GList* g_completion_complete_utf8 (GCompletion *cmp,
                                         const gchar* prefix,
                                         gchar** new_prefix);
__attribute__((__deprecated__)) extern
void g_completion_set_compare (GCompletion *cmp,
                                         GCompletionStrncmpFunc strncmp_func);
__attribute__((__deprecated__)) extern
void g_completion_free (GCompletion* cmp);
# 113 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/deprecated/gmain.h" 1
# 114 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/deprecated/grel.h" 1
# 38 "/usr/include/glib-2.0/glib/deprecated/grel.h"
typedef struct _GRelation GRelation;
typedef struct _GTuples GTuples;

struct _GTuples
{
  guint len;
};

__attribute__((__deprecated__)) extern
GRelation* g_relation_new (gint fields);
__attribute__((__deprecated__)) extern
void g_relation_destroy (GRelation *relation);
__attribute__((__deprecated__)) extern
void g_relation_index (GRelation *relation,
                               gint field,
                               GHashFunc hash_func,
                               GEqualFunc key_equal_func);
__attribute__((__deprecated__)) extern
void g_relation_insert (GRelation *relation,
                               ...);
__attribute__((__deprecated__)) extern
gint g_relation_delete (GRelation *relation,
                               gconstpointer key,
                               gint field);
__attribute__((__deprecated__)) extern
GTuples* g_relation_select (GRelation *relation,
                               gconstpointer key,
                               gint field);
__attribute__((__deprecated__)) extern
gint g_relation_count (GRelation *relation,
                               gconstpointer key,
                               gint field);
__attribute__((__deprecated__)) extern
gboolean g_relation_exists (GRelation *relation,
                               ...);
__attribute__((__deprecated__)) extern
void g_relation_print (GRelation *relation);
__attribute__((__deprecated__)) extern
void g_tuples_destroy (GTuples *tuples);
__attribute__((__deprecated__)) extern
gpointer g_tuples_index (GTuples *tuples,
                               gint index_,
                               gint field);
# 115 "/usr/include/glib-2.0/glib.h" 2
# 1 "/usr/include/glib-2.0/glib/deprecated/gthread.h" 1
# 38 "/usr/include/glib-2.0/glib/deprecated/gthread.h"
#pragma clang diagnostic push
# 38 "/usr/include/glib-2.0/glib/deprecated/gthread.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

typedef enum
{
  G_THREAD_PRIORITY_LOW,
  G_THREAD_PRIORITY_NORMAL,
  G_THREAD_PRIORITY_HIGH,
  G_THREAD_PRIORITY_URGENT
} GThreadPriority __attribute__((__deprecated__));

struct _GThread
{

  GThreadFunc func;
  gpointer data;
  gboolean joinable;
  GThreadPriority priority;
};

typedef struct _GThreadFunctions GThreadFunctions __attribute__((__deprecated__));
struct _GThreadFunctions
{
  GMutex* (*mutex_new) (void);
  void (*mutex_lock) (GMutex *mutex);
  gboolean (*mutex_trylock) (GMutex *mutex);
  void (*mutex_unlock) (GMutex *mutex);
  void (*mutex_free) (GMutex *mutex);
  GCond* (*cond_new) (void);
  void (*cond_signal) (GCond *cond);
  void (*cond_broadcast) (GCond *cond);
  void (*cond_wait) (GCond *cond,
                                   GMutex *mutex);
  gboolean (*cond_timed_wait) (GCond *cond,
                                   GMutex *mutex,
                                   GTimeVal *end_time);
  void (*cond_free) (GCond *cond);
  GPrivate* (*private_new) (GDestroyNotify destructor);
  gpointer (*private_get) (GPrivate *private_key);
  void (*private_set) (GPrivate *private_key,
                                   gpointer data);
  void (*thread_create) (GThreadFunc func,
                                   gpointer data,
                                   gulong stack_size,
                                   gboolean joinable,
                                   gboolean bound,
                                   GThreadPriority priority,
                                   gpointer thread,
                                   GError **error);
  void (*thread_yield) (void);
  void (*thread_join) (gpointer thread);
  void (*thread_exit) (void);
  void (*thread_set_priority)(gpointer thread,
                                   GThreadPriority priority);
  void (*thread_self) (gpointer thread);
  gboolean (*thread_equal) (gpointer thread1,
                                   gpointer thread2);
} __attribute__((__deprecated__));

 extern GThreadFunctions g_thread_functions_for_glib_use;
 extern gboolean g_thread_use_default_impl;

 extern guint64 (*g_thread_gettime) (void);

__attribute__((__deprecated__("Use '" "g_thread_new" "' instead"))) extern
GThread *g_thread_create (GThreadFunc func,
                                gpointer data,
                                gboolean joinable,
                                GError **error);

__attribute__((__deprecated__("Use '" "g_thread_new" "' instead"))) extern
GThread *g_thread_create_full (GThreadFunc func,
                                gpointer data,
                                gulong stack_size,
                                gboolean joinable,
                                gboolean bound,
                                GThreadPriority priority,
                                GError **error);

__attribute__((__deprecated__)) extern
void g_thread_set_priority (GThread *thread,
                                GThreadPriority priority);

__attribute__((__deprecated__)) extern
void g_thread_foreach (GFunc thread_func,
                                gpointer user_data);



# 1 "/usr/include/pthread.h" 1 3 4
# 22 "/usr/include/pthread.h" 3 4
# 1 "/usr/include/sched.h" 1 3 4
# 29 "/usr/include/sched.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 108 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 30 "/usr/include/sched.h" 2 3 4
# 43 "/usr/include/sched.h" 3 4
# 1 "/usr/include/bits/sched.h" 1 3 4
# 80 "/usr/include/bits/sched.h" 3 4
# 1 "/usr/include/bits/types/struct_sched_param.h" 1 3 4
# 23 "/usr/include/bits/types/struct_sched_param.h" 3 4
struct sched_param
{
  int sched_priority;
};
# 81 "/usr/include/bits/sched.h" 2 3 4
# 44 "/usr/include/sched.h" 2 3 4
# 1 "/usr/include/bits/cpu-set.h" 1 3 4
# 32 "/usr/include/bits/cpu-set.h" 3 4
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[1024 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;
# 117 "/usr/include/bits/cpu-set.h" 3 4
extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
     __attribute__ ((__nothrow__ ));
extern cpu_set_t *__sched_cpualloc (size_t __count) __attribute__ ((__nothrow__ )) ;
extern void __sched_cpufree (cpu_set_t *__set) __attribute__ ((__nothrow__ ));
# 45 "/usr/include/sched.h" 2 3 4
# 54 "/usr/include/sched.h" 3 4
extern int sched_setparam (__pid_t __pid, const struct sched_param *__param)
     __attribute__ ((__nothrow__ ));


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) __attribute__ ((__nothrow__ ));


extern int sched_setscheduler (__pid_t __pid, int __policy,
          const struct sched_param *__param) __attribute__ ((__nothrow__ ));


extern int sched_getscheduler (__pid_t __pid) __attribute__ ((__nothrow__ ));


extern int sched_yield (void) __attribute__ ((__nothrow__ ));


extern int sched_get_priority_max (int __algorithm) __attribute__ ((__nothrow__ ));


extern int sched_get_priority_min (int __algorithm) __attribute__ ((__nothrow__ ));



extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) __attribute__ ((__nothrow__ ));
# 23 "/usr/include/pthread.h" 2 3 4




# 1 "/usr/include/bits/setjmp.h" 1 3 4
# 26 "/usr/include/bits/setjmp.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 27 "/usr/include/bits/setjmp.h" 2 3 4




typedef long int __jmp_buf[8];
# 28 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/pthread.h" 2 3 4


# 1 "/usr/include/bits/types/struct___jmp_buf_tag.h" 1 3 4
# 26 "/usr/include/bits/types/struct___jmp_buf_tag.h" 3 4
struct __jmp_buf_tag
  {




    __jmp_buf __jmpbuf;
    int __mask_was_saved;
    __sigset_t __saved_mask;
  };
# 32 "/usr/include/pthread.h" 2 3 4





enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL





};




enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};





enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};
# 104 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};
# 124 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
# 159 "/usr/include/pthread.h" 3 4
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};
# 202 "/usr/include/pthread.h" 3 4
extern int pthread_create (pthread_t *__restrict __newthread,
      const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 3)));





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);
# 269 "/usr/include/pthread.h" 3 4
extern int pthread_detach (pthread_t __th) __attribute__ ((__nothrow__ ));



extern pthread_t pthread_self (void) __attribute__ ((__nothrow__ )) __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2)
  __attribute__ ((__nothrow__ )) __attribute__ ((__const__));







extern int pthread_attr_init (pthread_attr_t *__attr) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getdetachstate (const pthread_attr_t *__attr,
     int *__detachstate)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getguardsize (const pthread_attr_t *__attr,
          size_t *__guardsize)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getschedparam (const pthread_attr_t *__restrict __attr,
           struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           const struct sched_param *__restrict
           __param) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_getschedpolicy (const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getinheritsched (const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getscope (const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getstackaddr (const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getstack (const pthread_attr_t *__restrict __attr,
      void **__restrict __stackaddr,
      size_t *__restrict __stacksize)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
      size_t __stacksize) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 441 "/usr/include/pthread.h" 3 4
extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      const struct sched_param *__param)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (3)));


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2, 3)));


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     __attribute__ ((__nothrow__ ));
# 509 "/usr/include/pthread.h" 3 4
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));
# 521 "/usr/include/pthread.h" 3 4
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




struct __cancel_jmp_buf_tag
{
  __jmp_buf __cancel_jmp_buf;
  int __mask_was_saved;
};

typedef struct
{
  struct __cancel_jmp_buf_tag __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
# 557 "/usr/include/pthread.h" 3 4
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};
# 697 "/usr/include/pthread.h" 3 4
extern void __pthread_register_cancel (__pthread_unwind_buf_t *__buf)
                            ;
# 709 "/usr/include/pthread.h" 3 4
extern void __pthread_unregister_cancel (__pthread_unwind_buf_t *__buf)
                         ;
# 750 "/usr/include/pthread.h" 3 4
extern void __pthread_unwind_next (__pthread_unwind_buf_t *__buf)
                             __attribute__ ((__noreturn__))

     __attribute__ ((__weak__))

     ;
# 773 "/usr/include/pthread.h" 3 4
extern int __sigsetjmp (struct __jmp_buf_tag __env[1],
   int __savemask) __attribute__ ((__nothrow__));






extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          const pthread_mutexattr_t *__mutexattr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));




extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
        const struct timespec *__restrict
        __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
# 835 "/usr/include/pthread.h" 3 4
extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_getprioceiling (const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 3)));




extern int pthread_mutex_consistent (pthread_mutex_t *__mutex)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 874 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getpshared (const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_gettype (const pthread_mutexattr_t *__restrict
          __attr, int *__restrict __kind)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getprotocol (const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprioceiling (const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_getrobust (const pthread_mutexattr_t *__attr,
     int *__robustness)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));
# 946 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
     int __robustness)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 967 "/usr/include/pthread.h" 3 4
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
    const pthread_rwlockattr_t *__restrict
    __attr) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));




extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
# 1023 "/usr/include/pthread.h" 3 4
extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));




extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
           const struct timespec *__restrict
           __abstime) __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1, 2)));
# 1071 "/usr/include/pthread.h" 3 4
extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));





extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getpshared (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pshared)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
       int __pshared)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getkind_np (const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pref)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
       int __pref) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         const pthread_condattr_t *__restrict __cond_attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_signal (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));
# 1145 "/usr/include/pthread.h" 3 4
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       const struct timespec *__restrict __abstime)
     __attribute__ ((__nonnull__ (1, 2, 3)));
# 1194 "/usr/include/pthread.h" 3 4
extern int pthread_condattr_init (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_getpshared (const pthread_condattr_t *
     __restrict __attr,
     int *__restrict __pshared)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
     int __pshared) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int pthread_condattr_getclock (const pthread_condattr_t *
          __restrict __attr,
          __clockid_t *__restrict __clock_id)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
          __clockid_t __clock_id)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 1230 "/usr/include/pthread.h" 3 4
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));






extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     __attribute__ ((__nothrow__)) __attribute__ ((__nonnull__ (1)));



extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_getpshared (const pthread_barrierattr_t *
        __restrict __attr,
        int *__restrict __pshared)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
        int __pshared)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 1297 "/usr/include/pthread.h" 3 4
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern int pthread_key_delete (pthread_key_t __key) __attribute__ ((__nothrow__ ));


extern void *pthread_getspecific (pthread_key_t __key) __attribute__ ((__nothrow__ ));


extern int pthread_setspecific (pthread_key_t __key,
    const void *__pointer)
  __attribute__ ((__nothrow__ )) ;




extern int pthread_getcpuclockid (pthread_t __thread_id,
      __clockid_t *__clock_id)
     __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (2)));
# 1332 "/usr/include/pthread.h" 3 4
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) __attribute__ ((__nothrow__ ));




extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ )) pthread_equal (pthread_t __thread1, pthread_t __thread2)
{
  return __thread1 == __thread2;
}
# 127 "/usr/include/glib-2.0/glib/deprecated/gthread.h" 2








typedef struct
{
  GMutex *mutex;



  pthread_mutex_t unused;


} GStaticMutex __attribute__((__deprecated__("Use '" "GMutex" "' instead")));
# 153 "/usr/include/glib-2.0/glib/deprecated/gthread.h"
__attribute__((__deprecated__("Use '" "g_mutex_init" "' instead"))) extern
void g_static_mutex_init (GStaticMutex *mutex);
__attribute__((__deprecated__("Use '" "g_mutex_clear" "' instead"))) extern
void g_static_mutex_free (GStaticMutex *mutex);
__attribute__((__deprecated__("Use '" "GMutex" "' instead"))) extern
GMutex *g_static_mutex_get_mutex_impl (GStaticMutex *mutex);

typedef struct _GStaticRecMutex GStaticRecMutex __attribute__((__deprecated__("Use '" "GRecMutex" "' instead")));
struct _GStaticRecMutex
{

  GStaticMutex mutex;
  guint depth;



  union {



    pthread_t owner;

    gdouble dummy;
  } unused;

} __attribute__((__deprecated__("Use '" "GRecMutex" "' instead")));


__attribute__((__deprecated__("Use '" "g_rec_mutex_init" "' instead"))) extern
void g_static_rec_mutex_init (GStaticRecMutex *mutex);

__attribute__((__deprecated__("Use '" "g_rec_mutex_lock" "' instead"))) extern
void g_static_rec_mutex_lock (GStaticRecMutex *mutex);

__attribute__((__deprecated__("Use '" "g_rec_mutex_try_lock" "' instead"))) extern
gboolean g_static_rec_mutex_trylock (GStaticRecMutex *mutex);

__attribute__((__deprecated__("Use '" "g_rec_mutex_unlock" "' instead"))) extern
void g_static_rec_mutex_unlock (GStaticRecMutex *mutex);

__attribute__((__deprecated__)) extern
void g_static_rec_mutex_lock_full (GStaticRecMutex *mutex,
                                         guint depth);

__attribute__((__deprecated__)) extern
guint g_static_rec_mutex_unlock_full (GStaticRecMutex *mutex);

__attribute__((__deprecated__("Use '" "g_rec_mutex_free" "' instead"))) extern
void g_static_rec_mutex_free (GStaticRecMutex *mutex);

typedef struct _GStaticRWLock GStaticRWLock __attribute__((__deprecated__("Use '" "GRWLock" "' instead")));
struct _GStaticRWLock
{

  GStaticMutex mutex;
  GCond *read_cond;
  GCond *write_cond;
  guint read_counter;
  gboolean have_writer;
  guint want_to_read;
  guint want_to_write;
} __attribute__((__deprecated__("Use '" "GRWLock" "' instead")));



__attribute__((__deprecated__("Use '" "g_rw_lock_init" "' instead"))) extern
void g_static_rw_lock_init (GStaticRWLock *lock);

__attribute__((__deprecated__("Use '" "g_rw_lock_reader_lock" "' instead"))) extern
void g_static_rw_lock_reader_lock (GStaticRWLock *lock);

__attribute__((__deprecated__("Use '" "g_rw_lock_reader_trylock" "' instead"))) extern
gboolean g_static_rw_lock_reader_trylock (GStaticRWLock *lock);

__attribute__((__deprecated__("Use '" "g_rw_lock_reader_unlock" "' instead"))) extern
void g_static_rw_lock_reader_unlock (GStaticRWLock *lock);

__attribute__((__deprecated__("Use '" "g_rw_lock_writer_lock" "' instead"))) extern
void g_static_rw_lock_writer_lock (GStaticRWLock *lock);

__attribute__((__deprecated__("Use '" "g_rw_lock_writer_trylock" "' instead"))) extern
gboolean g_static_rw_lock_writer_trylock (GStaticRWLock *lock);

__attribute__((__deprecated__("Use '" "g_rw_lock_writer_unlock" "' instead"))) extern
void g_static_rw_lock_writer_unlock (GStaticRWLock *lock);

__attribute__((__deprecated__("Use '" "g_rw_lock_free" "' instead"))) extern
void g_static_rw_lock_free (GStaticRWLock *lock);

__attribute__((__deprecated__)) extern
GPrivate * g_private_new (GDestroyNotify notify);

typedef struct _GStaticPrivate GStaticPrivate __attribute__((__deprecated__("Use '" "GPrivate" "' instead")));
struct _GStaticPrivate
{

  guint index;
} __attribute__((__deprecated__("Use '" "GPrivate" "' instead")));


__attribute__((__deprecated__)) extern
void g_static_private_init (GStaticPrivate *private_key);

__attribute__((__deprecated__("Use '" "g_private_get" "' instead"))) extern
gpointer g_static_private_get (GStaticPrivate *private_key);

__attribute__((__deprecated__("Use '" "g_private_set" "' instead"))) extern
void g_static_private_set (GStaticPrivate *private_key,
                                          gpointer data,
                                          GDestroyNotify notify);

__attribute__((__deprecated__)) extern
void g_static_private_free (GStaticPrivate *private_key);

__attribute__((__deprecated__)) extern
gboolean g_once_init_enter_impl (volatile gsize *location);

__attribute__((__deprecated__)) extern
void g_thread_init (gpointer vtable);
__attribute__((__deprecated__)) extern
void g_thread_init_with_errorcheck_mutexes (gpointer vtable);

__attribute__((__deprecated__)) extern
gboolean g_thread_get_initialized (void);

 extern gboolean g_threads_got_initialized;



__attribute__((__deprecated__)) extern
GMutex * g_mutex_new (void);
__attribute__((__deprecated__)) extern
void g_mutex_free (GMutex *mutex);
__attribute__((__deprecated__)) extern
GCond * g_cond_new (void);
__attribute__((__deprecated__)) extern
void g_cond_free (GCond *cond);
__attribute__((__deprecated__)) extern
gboolean g_cond_timed_wait (GCond *cond,
                                         GMutex *mutex,
                                         GTimeVal *abs_time);

#pragma clang diagnostic pop
# 116 "/usr/include/glib-2.0/glib.h" 2

# 1 "/usr/include/glib-2.0/glib/glib-autocleanups.h" 1
# 28 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
static inline void
g_autoptr_cleanup_generic_gfree (void *p)
{
  void **pp = (void**)p;
  g_free (*pp);
}

static inline void
g_autoptr_cleanup_gstring_free (GString *string)
{
  if (string)
    (__builtin_constant_p ((!(0))) ? (((!(0))) ? (g_string_free) ((string), ((!(0)))) : g_string_free_and_steal (string)) : (g_string_free) ((string), ((!(0)))));
}



#pragma clang diagnostic push
# 44 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"




typedef GAsyncQueue *GAsyncQueue_autoptr; typedef GList *GAsyncQueue_listautoptr; typedef GSList *GAsyncQueue_slistautoptr; typedef GQueue *GAsyncQueue_queueautoptr;
# 49 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 49 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 49 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GAsyncQueue (GAsyncQueue *_ptr) { if (_ptr) (g_async_queue_unref) ((GAsyncQueue *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GAsyncQueue (GAsyncQueue **_ptr) { glib_autoptr_clear_GAsyncQueue (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GAsyncQueue (void *_ptr) { (g_async_queue_unref) ((GAsyncQueue *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GAsyncQueue (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GAsyncQueue); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GAsyncQueue (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GAsyncQueue); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GAsyncQueue (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GAsyncQueue); }
# 49 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GBookmarkFile *GBookmarkFile_autoptr; typedef GList *GBookmarkFile_listautoptr; typedef GSList *GBookmarkFile_slistautoptr; typedef GQueue *GBookmarkFile_queueautoptr;
# 50 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 50 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 50 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GBookmarkFile (GBookmarkFile *_ptr) { if (_ptr) (g_bookmark_file_free) ((GBookmarkFile *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GBookmarkFile (GBookmarkFile **_ptr) { glib_autoptr_clear_GBookmarkFile (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GBookmarkFile (void *_ptr) { (g_bookmark_file_free) ((GBookmarkFile *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GBookmarkFile (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GBookmarkFile); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GBookmarkFile (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GBookmarkFile); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GBookmarkFile (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GBookmarkFile); }
# 50 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GBytes *GBytes_autoptr; typedef GList *GBytes_listautoptr; typedef GSList *GBytes_slistautoptr; typedef GQueue *GBytes_queueautoptr;
# 51 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 51 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 51 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GBytes (GBytes *_ptr) { if (_ptr) (g_bytes_unref) ((GBytes *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GBytes (GBytes **_ptr) { glib_autoptr_clear_GBytes (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GBytes (void *_ptr) { (g_bytes_unref) ((GBytes *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GBytes (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GBytes); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GBytes (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GBytes); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GBytes (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GBytes); }
# 51 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GChecksum *GChecksum_autoptr; typedef GList *GChecksum_listautoptr; typedef GSList *GChecksum_slistautoptr; typedef GQueue *GChecksum_queueautoptr;
# 52 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 52 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 52 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GChecksum (GChecksum *_ptr) { if (_ptr) (g_checksum_free) ((GChecksum *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GChecksum (GChecksum **_ptr) { glib_autoptr_clear_GChecksum (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GChecksum (void *_ptr) { (g_checksum_free) ((GChecksum *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GChecksum (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GChecksum); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GChecksum (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GChecksum); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GChecksum (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GChecksum); }
# 52 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GDateTime *GDateTime_autoptr; typedef GList *GDateTime_listautoptr; typedef GSList *GDateTime_slistautoptr; typedef GQueue *GDateTime_queueautoptr;
# 53 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 53 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 53 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GDateTime (GDateTime *_ptr) { if (_ptr) (g_date_time_unref) ((GDateTime *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GDateTime (GDateTime **_ptr) { glib_autoptr_clear_GDateTime (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GDateTime (void *_ptr) { (g_date_time_unref) ((GDateTime *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GDateTime (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GDateTime); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GDateTime (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GDateTime); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GDateTime (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GDateTime); }
# 53 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GDate *GDate_autoptr; typedef GList *GDate_listautoptr; typedef GSList *GDate_slistautoptr; typedef GQueue *GDate_queueautoptr;
# 54 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 54 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 54 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GDate (GDate *_ptr) { if (_ptr) (g_date_free) ((GDate *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GDate (GDate **_ptr) { glib_autoptr_clear_GDate (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GDate (void *_ptr) { (g_date_free) ((GDate *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GDate (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GDate); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GDate (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GDate); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GDate (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GDate); }
# 54 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GDir *GDir_autoptr; typedef GList *GDir_listautoptr; typedef GSList *GDir_slistautoptr; typedef GQueue *GDir_queueautoptr;
# 55 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 55 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 55 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GDir (GDir *_ptr) { if (_ptr) (g_dir_close) ((GDir *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GDir (GDir **_ptr) { glib_autoptr_clear_GDir (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GDir (void *_ptr) { (g_dir_close) ((GDir *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GDir (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GDir); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GDir (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GDir); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GDir (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GDir); }
# 55 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GError *GError_autoptr; typedef GList *GError_listautoptr; typedef GSList *GError_slistautoptr; typedef GQueue *GError_queueautoptr;
# 56 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 56 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 56 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GError (GError *_ptr) { if (_ptr) (g_error_free) ((GError *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GError (GError **_ptr) { glib_autoptr_clear_GError (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GError (void *_ptr) { (g_error_free) ((GError *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GError (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GError); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GError (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GError); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GError (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GError); }
# 56 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GHashTable *GHashTable_autoptr; typedef GList *GHashTable_listautoptr; typedef GSList *GHashTable_slistautoptr; typedef GQueue *GHashTable_queueautoptr;
# 57 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 57 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 57 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GHashTable (GHashTable *_ptr) { if (_ptr) (g_hash_table_unref) ((GHashTable *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GHashTable (GHashTable **_ptr) { glib_autoptr_clear_GHashTable (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GHashTable (void *_ptr) { (g_hash_table_unref) ((GHashTable *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GHashTable (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GHashTable); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GHashTable (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GHashTable); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GHashTable (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GHashTable); }
# 57 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GHmac *GHmac_autoptr; typedef GList *GHmac_listautoptr; typedef GSList *GHmac_slistautoptr; typedef GQueue *GHmac_queueautoptr;
# 58 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 58 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 58 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GHmac (GHmac *_ptr) { if (_ptr) (g_hmac_unref) ((GHmac *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GHmac (GHmac **_ptr) { glib_autoptr_clear_GHmac (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GHmac (void *_ptr) { (g_hmac_unref) ((GHmac *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GHmac (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GHmac); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GHmac (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GHmac); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GHmac (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GHmac); }
# 58 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GIOChannel *GIOChannel_autoptr; typedef GList *GIOChannel_listautoptr; typedef GSList *GIOChannel_slistautoptr; typedef GQueue *GIOChannel_queueautoptr;
# 59 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 59 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 59 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GIOChannel (GIOChannel *_ptr) { if (_ptr) (g_io_channel_unref) ((GIOChannel *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GIOChannel (GIOChannel **_ptr) { glib_autoptr_clear_GIOChannel (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GIOChannel (void *_ptr) { (g_io_channel_unref) ((GIOChannel *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GIOChannel (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GIOChannel); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GIOChannel (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GIOChannel); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GIOChannel (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GIOChannel); }
# 59 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GKeyFile *GKeyFile_autoptr; typedef GList *GKeyFile_listautoptr; typedef GSList *GKeyFile_slistautoptr; typedef GQueue *GKeyFile_queueautoptr;
# 60 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 60 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 60 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GKeyFile (GKeyFile *_ptr) { if (_ptr) (g_key_file_unref) ((GKeyFile *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GKeyFile (GKeyFile **_ptr) { glib_autoptr_clear_GKeyFile (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GKeyFile (void *_ptr) { (g_key_file_unref) ((GKeyFile *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GKeyFile (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GKeyFile); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GKeyFile (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GKeyFile); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GKeyFile (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GKeyFile); }
# 60 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GList *GList_autoptr; typedef GList *GList_listautoptr; typedef GSList *GList_slistautoptr; typedef GQueue *GList_queueautoptr;
# 61 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 61 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 61 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GList (GList *_ptr) { if (_ptr) (g_list_free) ((GList *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GList (GList **_ptr) { glib_autoptr_clear_GList (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GList (void *_ptr) { (g_list_free) ((GList *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GList (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GList); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GList (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GList); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GList (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GList); }
# 61 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GArray *GArray_autoptr; typedef GList *GArray_listautoptr; typedef GSList *GArray_slistautoptr; typedef GQueue *GArray_queueautoptr;
# 62 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 62 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 62 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GArray (GArray *_ptr) { if (_ptr) (g_array_unref) ((GArray *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GArray (GArray **_ptr) { glib_autoptr_clear_GArray (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GArray (void *_ptr) { (g_array_unref) ((GArray *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GArray (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GArray); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GArray (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GArray); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GArray (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GArray); }
# 62 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GPtrArray *GPtrArray_autoptr; typedef GList *GPtrArray_listautoptr; typedef GSList *GPtrArray_slistautoptr; typedef GQueue *GPtrArray_queueautoptr;
# 63 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 63 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 63 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GPtrArray (GPtrArray *_ptr) { if (_ptr) (g_ptr_array_unref) ((GPtrArray *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GPtrArray (GPtrArray **_ptr) { glib_autoptr_clear_GPtrArray (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GPtrArray (void *_ptr) { (g_ptr_array_unref) ((GPtrArray *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GPtrArray (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GPtrArray); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GPtrArray (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GPtrArray); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GPtrArray (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GPtrArray); }
# 63 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GByteArray *GByteArray_autoptr; typedef GList *GByteArray_listautoptr; typedef GSList *GByteArray_slistautoptr; typedef GQueue *GByteArray_queueautoptr;
# 64 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 64 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 64 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GByteArray (GByteArray *_ptr) { if (_ptr) (g_byte_array_unref) ((GByteArray *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GByteArray (GByteArray **_ptr) { glib_autoptr_clear_GByteArray (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GByteArray (void *_ptr) { (g_byte_array_unref) ((GByteArray *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GByteArray (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GByteArray); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GByteArray (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GByteArray); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GByteArray (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GByteArray); }
# 64 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GMainContext *GMainContext_autoptr; typedef GList *GMainContext_listautoptr; typedef GSList *GMainContext_slistautoptr; typedef GQueue *GMainContext_queueautoptr;
# 65 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 65 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 65 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GMainContext (GMainContext *_ptr) { if (_ptr) (g_main_context_unref) ((GMainContext *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GMainContext (GMainContext **_ptr) { glib_autoptr_clear_GMainContext (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GMainContext (void *_ptr) { (g_main_context_unref) ((GMainContext *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GMainContext (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GMainContext); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GMainContext (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GMainContext); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GMainContext (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GMainContext); }
# 65 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GMainContextPusher *GMainContextPusher_autoptr; typedef GList *GMainContextPusher_listautoptr; typedef GSList *GMainContextPusher_slistautoptr; typedef GQueue *GMainContextPusher_queueautoptr;
# 66 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 66 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 66 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GMainContextPusher (GMainContextPusher *_ptr) { if (_ptr) (g_main_context_pusher_free) ((GMainContextPusher *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GMainContextPusher (GMainContextPusher **_ptr) { glib_autoptr_clear_GMainContextPusher (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GMainContextPusher (void *_ptr) { (g_main_context_pusher_free) ((GMainContextPusher *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GMainContextPusher (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GMainContextPusher); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GMainContextPusher (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GMainContextPusher); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GMainContextPusher (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GMainContextPusher); }
# 66 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GMainLoop *GMainLoop_autoptr; typedef GList *GMainLoop_listautoptr; typedef GSList *GMainLoop_slistautoptr; typedef GQueue *GMainLoop_queueautoptr;
# 67 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 67 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 67 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GMainLoop (GMainLoop *_ptr) { if (_ptr) (g_main_loop_unref) ((GMainLoop *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GMainLoop (GMainLoop **_ptr) { glib_autoptr_clear_GMainLoop (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GMainLoop (void *_ptr) { (g_main_loop_unref) ((GMainLoop *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GMainLoop (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GMainLoop); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GMainLoop (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GMainLoop); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GMainLoop (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GMainLoop); }
# 67 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GSource *GSource_autoptr; typedef GList *GSource_listautoptr; typedef GSList *GSource_slistautoptr; typedef GQueue *GSource_queueautoptr;
# 68 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 68 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 68 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GSource (GSource *_ptr) { if (_ptr) (g_source_unref) ((GSource *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GSource (GSource **_ptr) { glib_autoptr_clear_GSource (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GSource (void *_ptr) { (g_source_unref) ((GSource *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GSource (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GSource); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GSource (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GSource); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GSource (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GSource); }
# 68 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GMappedFile *GMappedFile_autoptr; typedef GList *GMappedFile_listautoptr; typedef GSList *GMappedFile_slistautoptr; typedef GQueue *GMappedFile_queueautoptr;
# 69 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 69 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 69 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GMappedFile (GMappedFile *_ptr) { if (_ptr) (g_mapped_file_unref) ((GMappedFile *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GMappedFile (GMappedFile **_ptr) { glib_autoptr_clear_GMappedFile (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GMappedFile (void *_ptr) { (g_mapped_file_unref) ((GMappedFile *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GMappedFile (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GMappedFile); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GMappedFile (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GMappedFile); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GMappedFile (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GMappedFile); }
# 69 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GMarkupParseContext *GMarkupParseContext_autoptr; typedef GList *GMarkupParseContext_listautoptr; typedef GSList *GMarkupParseContext_slistautoptr; typedef GQueue *GMarkupParseContext_queueautoptr;
# 70 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 70 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 70 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GMarkupParseContext (GMarkupParseContext *_ptr) { if (_ptr) (g_markup_parse_context_unref) ((GMarkupParseContext *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GMarkupParseContext (GMarkupParseContext **_ptr) { glib_autoptr_clear_GMarkupParseContext (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GMarkupParseContext (void *_ptr) { (g_markup_parse_context_unref) ((GMarkupParseContext *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GMarkupParseContext (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GMarkupParseContext); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GMarkupParseContext (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GMarkupParseContext); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GMarkupParseContext (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GMarkupParseContext); }
# 70 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GNode *GNode_autoptr; typedef GList *GNode_listautoptr; typedef GSList *GNode_slistautoptr; typedef GQueue *GNode_queueautoptr;
# 71 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 71 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 71 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GNode (GNode *_ptr) { if (_ptr) (g_node_destroy) ((GNode *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GNode (GNode **_ptr) { glib_autoptr_clear_GNode (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GNode (void *_ptr) { (g_node_destroy) ((GNode *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GNode (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GNode); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GNode (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GNode); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GNode (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GNode); }
# 71 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GOptionContext *GOptionContext_autoptr; typedef GList *GOptionContext_listautoptr; typedef GSList *GOptionContext_slistautoptr; typedef GQueue *GOptionContext_queueautoptr;
# 72 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 72 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 72 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GOptionContext (GOptionContext *_ptr) { if (_ptr) (g_option_context_free) ((GOptionContext *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GOptionContext (GOptionContext **_ptr) { glib_autoptr_clear_GOptionContext (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GOptionContext (void *_ptr) { (g_option_context_free) ((GOptionContext *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GOptionContext (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GOptionContext); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GOptionContext (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GOptionContext); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GOptionContext (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GOptionContext); }
# 72 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GOptionGroup *GOptionGroup_autoptr; typedef GList *GOptionGroup_listautoptr; typedef GSList *GOptionGroup_slistautoptr; typedef GQueue *GOptionGroup_queueautoptr;
# 73 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 73 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 73 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GOptionGroup (GOptionGroup *_ptr) { if (_ptr) (g_option_group_unref) ((GOptionGroup *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GOptionGroup (GOptionGroup **_ptr) { glib_autoptr_clear_GOptionGroup (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GOptionGroup (void *_ptr) { (g_option_group_unref) ((GOptionGroup *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GOptionGroup (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GOptionGroup); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GOptionGroup (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GOptionGroup); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GOptionGroup (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GOptionGroup); }
# 73 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GPatternSpec *GPatternSpec_autoptr; typedef GList *GPatternSpec_listautoptr; typedef GSList *GPatternSpec_slistautoptr; typedef GQueue *GPatternSpec_queueautoptr;
# 74 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 74 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 74 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GPatternSpec (GPatternSpec *_ptr) { if (_ptr) (g_pattern_spec_free) ((GPatternSpec *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GPatternSpec (GPatternSpec **_ptr) { glib_autoptr_clear_GPatternSpec (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GPatternSpec (void *_ptr) { (g_pattern_spec_free) ((GPatternSpec *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GPatternSpec (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GPatternSpec); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GPatternSpec (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GPatternSpec); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GPatternSpec (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GPatternSpec); }
# 74 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GQueue *GQueue_autoptr; typedef GList *GQueue_listautoptr; typedef GSList *GQueue_slistautoptr; typedef GQueue *GQueue_queueautoptr;
# 75 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 75 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 75 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GQueue (GQueue *_ptr) { if (_ptr) (g_queue_free) ((GQueue *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GQueue (GQueue **_ptr) { glib_autoptr_clear_GQueue (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GQueue (void *_ptr) { (g_queue_free) ((GQueue *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GQueue (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GQueue); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GQueue (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GQueue); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GQueue (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GQueue); }
# 75 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
#pragma clang diagnostic push
# 76 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 76 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_auto_cleanup_GQueue (GQueue *_ptr) { (g_queue_clear) (_ptr); }
# 76 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GRand *GRand_autoptr; typedef GList *GRand_listautoptr; typedef GSList *GRand_slistautoptr; typedef GQueue *GRand_queueautoptr;
# 77 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 77 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 77 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GRand (GRand *_ptr) { if (_ptr) (g_rand_free) ((GRand *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GRand (GRand **_ptr) { glib_autoptr_clear_GRand (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GRand (void *_ptr) { (g_rand_free) ((GRand *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GRand (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GRand); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GRand (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GRand); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GRand (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GRand); }
# 77 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GRegex *GRegex_autoptr; typedef GList *GRegex_listautoptr; typedef GSList *GRegex_slistautoptr; typedef GQueue *GRegex_queueautoptr;
# 78 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 78 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 78 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GRegex (GRegex *_ptr) { if (_ptr) (g_regex_unref) ((GRegex *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GRegex (GRegex **_ptr) { glib_autoptr_clear_GRegex (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GRegex (void *_ptr) { (g_regex_unref) ((GRegex *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GRegex (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GRegex); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GRegex (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GRegex); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GRegex (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GRegex); }
# 78 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GMatchInfo *GMatchInfo_autoptr; typedef GList *GMatchInfo_listautoptr; typedef GSList *GMatchInfo_slistautoptr; typedef GQueue *GMatchInfo_queueautoptr;
# 79 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 79 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 79 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GMatchInfo (GMatchInfo *_ptr) { if (_ptr) (g_match_info_unref) ((GMatchInfo *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GMatchInfo (GMatchInfo **_ptr) { glib_autoptr_clear_GMatchInfo (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GMatchInfo (void *_ptr) { (g_match_info_unref) ((GMatchInfo *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GMatchInfo (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GMatchInfo); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GMatchInfo (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GMatchInfo); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GMatchInfo (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GMatchInfo); }
# 79 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GScanner *GScanner_autoptr; typedef GList *GScanner_listautoptr; typedef GSList *GScanner_slistautoptr; typedef GQueue *GScanner_queueautoptr;
# 80 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 80 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 80 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GScanner (GScanner *_ptr) { if (_ptr) (g_scanner_destroy) ((GScanner *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GScanner (GScanner **_ptr) { glib_autoptr_clear_GScanner (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GScanner (void *_ptr) { (g_scanner_destroy) ((GScanner *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GScanner (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GScanner); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GScanner (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GScanner); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GScanner (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GScanner); }
# 80 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GSequence *GSequence_autoptr; typedef GList *GSequence_listautoptr; typedef GSList *GSequence_slistautoptr; typedef GQueue *GSequence_queueautoptr;
# 81 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 81 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 81 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GSequence (GSequence *_ptr) { if (_ptr) (g_sequence_free) ((GSequence *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GSequence (GSequence **_ptr) { glib_autoptr_clear_GSequence (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GSequence (void *_ptr) { (g_sequence_free) ((GSequence *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GSequence (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GSequence); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GSequence (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GSequence); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GSequence (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GSequence); }
# 81 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GSList *GSList_autoptr; typedef GList *GSList_listautoptr; typedef GSList *GSList_slistautoptr; typedef GQueue *GSList_queueautoptr;
# 82 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 82 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 82 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GSList (GSList *_ptr) { if (_ptr) (g_slist_free) ((GSList *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GSList (GSList **_ptr) { glib_autoptr_clear_GSList (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GSList (void *_ptr) { (g_slist_free) ((GSList *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GSList (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GSList); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GSList (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GSList); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GSList (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GSList); }
# 82 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GString *GString_autoptr; typedef GList *GString_listautoptr; typedef GSList *GString_slistautoptr; typedef GQueue *GString_queueautoptr;
# 83 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 83 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 83 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GString (GString *_ptr) { if (_ptr) (g_autoptr_cleanup_gstring_free) ((GString *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GString (GString **_ptr) { glib_autoptr_clear_GString (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GString (void *_ptr) { (g_autoptr_cleanup_gstring_free) ((GString *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GString (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GString); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GString (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GString); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GString (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GString); }
# 83 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GStringChunk *GStringChunk_autoptr; typedef GList *GStringChunk_listautoptr; typedef GSList *GStringChunk_slistautoptr; typedef GQueue *GStringChunk_queueautoptr;
# 84 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 84 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 84 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GStringChunk (GStringChunk *_ptr) { if (_ptr) (g_string_chunk_free) ((GStringChunk *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GStringChunk (GStringChunk **_ptr) { glib_autoptr_clear_GStringChunk (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GStringChunk (void *_ptr) { (g_string_chunk_free) ((GStringChunk *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GStringChunk (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GStringChunk); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GStringChunk (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GStringChunk); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GStringChunk (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GStringChunk); }
# 84 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GStrvBuilder *GStrvBuilder_autoptr; typedef GList *GStrvBuilder_listautoptr; typedef GSList *GStrvBuilder_slistautoptr; typedef GQueue *GStrvBuilder_queueautoptr;
# 85 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 85 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 85 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GStrvBuilder (GStrvBuilder *_ptr) { if (_ptr) (g_strv_builder_unref) ((GStrvBuilder *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GStrvBuilder (GStrvBuilder **_ptr) { glib_autoptr_clear_GStrvBuilder (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GStrvBuilder (void *_ptr) { (g_strv_builder_unref) ((GStrvBuilder *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GStrvBuilder (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GStrvBuilder); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GStrvBuilder (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GStrvBuilder); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GStrvBuilder (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GStrvBuilder); }
# 85 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GThread *GThread_autoptr; typedef GList *GThread_listautoptr; typedef GSList *GThread_slistautoptr; typedef GQueue *GThread_queueautoptr;
# 86 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 86 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 86 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GThread (GThread *_ptr) { if (_ptr) (g_thread_unref) ((GThread *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GThread (GThread **_ptr) { glib_autoptr_clear_GThread (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GThread (void *_ptr) { (g_thread_unref) ((GThread *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GThread (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GThread); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GThread (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GThread); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GThread (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GThread); }
# 86 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
#pragma clang diagnostic push
# 87 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 87 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_auto_cleanup_GMutex (GMutex *_ptr) { (g_mutex_clear) (_ptr); }
# 87 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GMutexLocker *GMutexLocker_autoptr; typedef GList *GMutexLocker_listautoptr; typedef GSList *GMutexLocker_slistautoptr; typedef GQueue *GMutexLocker_queueautoptr;
# 88 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 88 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 88 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GMutexLocker (GMutexLocker *_ptr) { if (_ptr) (g_mutex_locker_free) ((GMutexLocker *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GMutexLocker (GMutexLocker **_ptr) { glib_autoptr_clear_GMutexLocker (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GMutexLocker (void *_ptr) { (g_mutex_locker_free) ((GMutexLocker *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GMutexLocker (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GMutexLocker); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GMutexLocker (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GMutexLocker); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GMutexLocker (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GMutexLocker); }
# 88 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GRecMutexLocker *GRecMutexLocker_autoptr; typedef GList *GRecMutexLocker_listautoptr; typedef GSList *GRecMutexLocker_slistautoptr; typedef GQueue *GRecMutexLocker_queueautoptr;
# 89 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 89 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 89 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GRecMutexLocker (GRecMutexLocker *_ptr) { if (_ptr) (g_rec_mutex_locker_free) ((GRecMutexLocker *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GRecMutexLocker (GRecMutexLocker **_ptr) { glib_autoptr_clear_GRecMutexLocker (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GRecMutexLocker (void *_ptr) { (g_rec_mutex_locker_free) ((GRecMutexLocker *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GRecMutexLocker (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GRecMutexLocker); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GRecMutexLocker (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GRecMutexLocker); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GRecMutexLocker (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GRecMutexLocker); }
# 89 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GRWLockWriterLocker *GRWLockWriterLocker_autoptr; typedef GList *GRWLockWriterLocker_listautoptr; typedef GSList *GRWLockWriterLocker_slistautoptr; typedef GQueue *GRWLockWriterLocker_queueautoptr;
# 90 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 90 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 90 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GRWLockWriterLocker (GRWLockWriterLocker *_ptr) { if (_ptr) (g_rw_lock_writer_locker_free) ((GRWLockWriterLocker *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GRWLockWriterLocker (GRWLockWriterLocker **_ptr) { glib_autoptr_clear_GRWLockWriterLocker (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GRWLockWriterLocker (void *_ptr) { (g_rw_lock_writer_locker_free) ((GRWLockWriterLocker *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GRWLockWriterLocker (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GRWLockWriterLocker); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GRWLockWriterLocker (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GRWLockWriterLocker); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GRWLockWriterLocker (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GRWLockWriterLocker); }
# 90 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GRWLockReaderLocker *GRWLockReaderLocker_autoptr; typedef GList *GRWLockReaderLocker_listautoptr; typedef GSList *GRWLockReaderLocker_slistautoptr; typedef GQueue *GRWLockReaderLocker_queueautoptr;
# 91 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 91 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 91 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GRWLockReaderLocker (GRWLockReaderLocker *_ptr) { if (_ptr) (g_rw_lock_reader_locker_free) ((GRWLockReaderLocker *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GRWLockReaderLocker (GRWLockReaderLocker **_ptr) { glib_autoptr_clear_GRWLockReaderLocker (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GRWLockReaderLocker (void *_ptr) { (g_rw_lock_reader_locker_free) ((GRWLockReaderLocker *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GRWLockReaderLocker (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GRWLockReaderLocker); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GRWLockReaderLocker (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GRWLockReaderLocker); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GRWLockReaderLocker (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GRWLockReaderLocker); }
# 91 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
#pragma clang diagnostic push
# 92 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 92 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_auto_cleanup_GCond (GCond *_ptr) { (g_cond_clear) (_ptr); }
# 92 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GTimer *GTimer_autoptr; typedef GList *GTimer_listautoptr; typedef GSList *GTimer_slistautoptr; typedef GQueue *GTimer_queueautoptr;
# 93 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 93 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 93 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GTimer (GTimer *_ptr) { if (_ptr) (g_timer_destroy) ((GTimer *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GTimer (GTimer **_ptr) { glib_autoptr_clear_GTimer (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GTimer (void *_ptr) { (g_timer_destroy) ((GTimer *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GTimer (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GTimer); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GTimer (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GTimer); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GTimer (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GTimer); }
# 93 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GTimeZone *GTimeZone_autoptr; typedef GList *GTimeZone_listautoptr; typedef GSList *GTimeZone_slistautoptr; typedef GQueue *GTimeZone_queueautoptr;
# 94 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 94 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 94 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GTimeZone (GTimeZone *_ptr) { if (_ptr) (g_time_zone_unref) ((GTimeZone *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GTimeZone (GTimeZone **_ptr) { glib_autoptr_clear_GTimeZone (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GTimeZone (void *_ptr) { (g_time_zone_unref) ((GTimeZone *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GTimeZone (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GTimeZone); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GTimeZone (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GTimeZone); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GTimeZone (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GTimeZone); }
# 94 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GTree *GTree_autoptr; typedef GList *GTree_listautoptr; typedef GSList *GTree_slistautoptr; typedef GQueue *GTree_queueautoptr;
# 95 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 95 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 95 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GTree (GTree *_ptr) { if (_ptr) (g_tree_unref) ((GTree *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GTree (GTree **_ptr) { glib_autoptr_clear_GTree (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GTree (void *_ptr) { (g_tree_unref) ((GTree *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GTree (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GTree); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GTree (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GTree); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GTree (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GTree); }
# 95 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GVariant *GVariant_autoptr; typedef GList *GVariant_listautoptr; typedef GSList *GVariant_slistautoptr; typedef GQueue *GVariant_queueautoptr;
# 96 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 96 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 96 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GVariant (GVariant *_ptr) { if (_ptr) (g_variant_unref) ((GVariant *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GVariant (GVariant **_ptr) { glib_autoptr_clear_GVariant (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GVariant (void *_ptr) { (g_variant_unref) ((GVariant *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GVariant (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GVariant); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GVariant (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GVariant); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GVariant (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GVariant); }
# 96 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GVariantBuilder *GVariantBuilder_autoptr; typedef GList *GVariantBuilder_listautoptr; typedef GSList *GVariantBuilder_slistautoptr; typedef GQueue *GVariantBuilder_queueautoptr;
# 97 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 97 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 97 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GVariantBuilder (GVariantBuilder *_ptr) { if (_ptr) (g_variant_builder_unref) ((GVariantBuilder *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GVariantBuilder (GVariantBuilder **_ptr) { glib_autoptr_clear_GVariantBuilder (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GVariantBuilder (void *_ptr) { (g_variant_builder_unref) ((GVariantBuilder *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GVariantBuilder (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GVariantBuilder); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GVariantBuilder (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GVariantBuilder); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GVariantBuilder (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GVariantBuilder); }
# 97 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
#pragma clang diagnostic push
# 98 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 98 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_auto_cleanup_GVariantBuilder (GVariantBuilder *_ptr) { (g_variant_builder_clear) (_ptr); }
# 98 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GVariantIter *GVariantIter_autoptr; typedef GList *GVariantIter_listautoptr; typedef GSList *GVariantIter_slistautoptr; typedef GQueue *GVariantIter_queueautoptr;
# 99 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 99 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 99 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GVariantIter (GVariantIter *_ptr) { if (_ptr) (g_variant_iter_free) ((GVariantIter *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GVariantIter (GVariantIter **_ptr) { glib_autoptr_clear_GVariantIter (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GVariantIter (void *_ptr) { (g_variant_iter_free) ((GVariantIter *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GVariantIter (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GVariantIter); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GVariantIter (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GVariantIter); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GVariantIter (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GVariantIter); }
# 99 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GVariantDict *GVariantDict_autoptr; typedef GList *GVariantDict_listautoptr; typedef GSList *GVariantDict_slistautoptr; typedef GQueue *GVariantDict_queueautoptr;
# 100 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 100 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 100 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GVariantDict (GVariantDict *_ptr) { if (_ptr) (g_variant_dict_unref) ((GVariantDict *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GVariantDict (GVariantDict **_ptr) { glib_autoptr_clear_GVariantDict (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GVariantDict (void *_ptr) { (g_variant_dict_unref) ((GVariantDict *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GVariantDict (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GVariantDict); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GVariantDict (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GVariantDict); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GVariantDict (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GVariantDict); }
# 100 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
#pragma clang diagnostic push
# 101 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 101 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_auto_cleanup_GVariantDict (GVariantDict *_ptr) { (g_variant_dict_clear) (_ptr); }
# 101 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GVariantType *GVariantType_autoptr; typedef GList *GVariantType_listautoptr; typedef GSList *GVariantType_slistautoptr; typedef GQueue *GVariantType_queueautoptr;
# 102 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 102 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 102 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GVariantType (GVariantType *_ptr) { if (_ptr) (g_variant_type_free) ((GVariantType *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GVariantType (GVariantType **_ptr) { glib_autoptr_clear_GVariantType (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GVariantType (void *_ptr) { (g_variant_type_free) ((GVariantType *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GVariantType (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GVariantType); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GVariantType (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GVariantType); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GVariantType (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GVariantType); }
# 102 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
#pragma clang diagnostic push
# 103 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 103 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_auto_cleanup_GStrv (GStrv *_ptr) { if (*_ptr != ((void*)0)) (g_strfreev) (*_ptr); }
# 103 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GRefString *GRefString_autoptr; typedef GList *GRefString_listautoptr; typedef GSList *GRefString_slistautoptr; typedef GQueue *GRefString_queueautoptr;
# 104 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 104 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 104 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GRefString (GRefString *_ptr) { if (_ptr) (g_ref_string_release) ((GRefString *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GRefString (GRefString **_ptr) { glib_autoptr_clear_GRefString (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GRefString (void *_ptr) { (g_ref_string_release) ((GRefString *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GRefString (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GRefString); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GRefString (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GRefString); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GRefString (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GRefString); }
# 104 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GUri *GUri_autoptr; typedef GList *GUri_listautoptr; typedef GSList *GUri_slistautoptr; typedef GQueue *GUri_queueautoptr;
# 105 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 105 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 105 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GUri (GUri *_ptr) { if (_ptr) (g_uri_unref) ((GUri *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GUri (GUri **_ptr) { glib_autoptr_clear_GUri (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GUri (void *_ptr) { (g_uri_unref) ((GUri *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GUri (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GUri); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GUri (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GUri); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GUri (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GUri); }
# 105 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
typedef GPathBuf *GPathBuf_autoptr; typedef GList *GPathBuf_listautoptr; typedef GSList *GPathBuf_slistautoptr; typedef GQueue *GPathBuf_queueautoptr;
# 106 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic push
# 106 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 106 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_autoptr_clear_GPathBuf (GPathBuf *_ptr) { if (_ptr) (g_path_buf_free) ((GPathBuf *) _ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_cleanup_GPathBuf (GPathBuf **_ptr) { glib_autoptr_clear_GPathBuf (*_ptr); } static __attribute__ ((__unused__)) inline void glib_autoptr_destroy_GPathBuf (void *_ptr) { (g_path_buf_free) ((GPathBuf *) _ptr); } static __attribute__ ((__unused__)) inline void glib_listautoptr_cleanup_GPathBuf (GList **_l) { g_list_free_full (*_l, glib_autoptr_destroy_GPathBuf); } static __attribute__ ((__unused__)) inline void glib_slistautoptr_cleanup_GPathBuf (GSList **_l) { g_slist_free_full (*_l, glib_autoptr_destroy_GPathBuf); } static __attribute__ ((__unused__)) inline void glib_queueautoptr_cleanup_GPathBuf (GQueue **_q) { if (*_q) g_queue_free_full (*_q, glib_autoptr_destroy_GPathBuf); }
# 106 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop
#pragma clang diagnostic push
# 107 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
# 107 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
 static __attribute__ ((__unused__)) inline void glib_auto_cleanup_GPathBuf (GPathBuf *_ptr) { (g_path_buf_clear) (_ptr); }
# 107 "/usr/include/glib-2.0/glib/glib-autocleanups.h"
#pragma clang diagnostic pop

#pragma clang diagnostic pop
# 118 "/usr/include/glib-2.0/glib.h" 2
# 24 "/usr/include/glib-2.0/glib/gi18n.h" 2

# 1 "/usr/include/libintl.h" 1 3 4
# 39 "/usr/include/libintl.h" 3 4
extern char *gettext (const char *__msgid)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (1)));



extern char *dgettext (const char *__domainname, const char *__msgid)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2)));
extern char *__dgettext (const char *__domainname, const char *__msgid)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2)));



extern char *dcgettext (const char *__domainname,
   const char *__msgid, int __category)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2)));
extern char *__dcgettext (const char *__domainname,
     const char *__msgid, int __category)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2)));




extern char *ngettext (const char *__msgid1, const char *__msgid2,
         unsigned long int __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (1))) __attribute__ ((__format_arg__ (2)));



extern char *dngettext (const char *__domainname, const char *__msgid1,
   const char *__msgid2, unsigned long int __n)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2))) __attribute__ ((__format_arg__ (3)));



extern char *dcngettext (const char *__domainname, const char *__msgid1,
    const char *__msgid2, unsigned long int __n,
    int __category)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format_arg__ (2))) __attribute__ ((__format_arg__ (3)));





extern char *textdomain (const char *__domainname) __attribute__ ((__nothrow__ ));



extern char *bindtextdomain (const char *__domainname,
        const char *__dirname) __attribute__ ((__nothrow__ ));



extern char *bind_textdomain_codeset (const char *__domainname,
          const char *__codeset) __attribute__ ((__nothrow__ ));







# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 108 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 101 "/usr/include/libintl.h" 2 3 4


# 1 "/usr/include/locale.h" 1 3 4
# 28 "/usr/include/locale.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 108 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 29 "/usr/include/locale.h" 2 3 4
# 1 "/usr/include/bits/locale.h" 1 3 4
# 30 "/usr/include/locale.h" 2 3 4
# 51 "/usr/include/locale.h" 3 4
struct lconv
{


  char *decimal_point;
  char *thousands_sep;





  char *grouping;





  char *int_curr_symbol;
  char *currency_symbol;
  char *mon_decimal_point;
  char *mon_thousands_sep;
  char *mon_grouping;
  char *positive_sign;
  char *negative_sign;
  char int_frac_digits;
  char frac_digits;

  char p_cs_precedes;

  char p_sep_by_space;

  char n_cs_precedes;

  char n_sep_by_space;






  char p_sign_posn;
  char n_sign_posn;


  char int_p_cs_precedes;

  char int_p_sep_by_space;

  char int_n_cs_precedes;

  char int_n_sep_by_space;






  char int_p_sign_posn;
  char int_n_sign_posn;
# 118 "/usr/include/locale.h" 3 4
};



extern char *setlocale (int __category, const char *__locale) __attribute__ ((__nothrow__ ));


extern struct lconv *localeconv (void) __attribute__ ((__nothrow__ ));
# 141 "/usr/include/locale.h" 3 4
extern locale_t newlocale (int __category_mask, const char *__locale,
      locale_t __base) __attribute__ ((__nothrow__ ));
# 176 "/usr/include/locale.h" 3 4
extern locale_t duplocale (locale_t __dataset) __attribute__ ((__nothrow__ ));



extern void freelocale (locale_t __dataset) __attribute__ ((__nothrow__ ));






extern locale_t uselocale (locale_t __dataset) __attribute__ ((__nothrow__ ));
# 104 "/usr/include/libintl.h" 2 3 4
# 26 "/usr/include/glib-2.0/glib/gi18n.h" 2
# 45 "pluma-spell-checker-language.c" 2
# 1 "/usr/include/libxml2/libxml/xmlreader.h" 1
# 13 "/usr/include/libxml2/libxml/xmlreader.h"
# 1 "/usr/include/libxml2/libxml/xmlversion.h" 1
# 13 "/usr/include/libxml2/libxml/xmlversion.h"
# 1 "/usr/include/libxml2/libxml/xmlexports.h" 1
# 14 "/usr/include/libxml2/libxml/xmlversion.h" 2
# 24 "/usr/include/libxml2/libxml/xmlversion.h"
          void xmlCheckVersion(int version);
# 14 "/usr/include/libxml2/libxml/xmlreader.h" 2
# 1 "/usr/include/libxml2/libxml/tree.h" 1
# 17 "/usr/include/libxml2/libxml/tree.h"
# 1 "/usr/include/libxml2/libxml/parser.h" 1
# 15 "/usr/include/libxml2/libxml/parser.h"
# 1 "/usr/include/libxml2/libxml/tree.h" 1
# 24 "/usr/include/libxml2/libxml/tree.h"
# 1 "/usr/include/stdio.h" 1 3 4
# 28 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/libc-header-start.h" 1 3 4
# 29 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 108 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_null.h" 1 3 4
# 109 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 35 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/bin/../lib/clang/19/include/stdarg.h" 1 3 4
# 38 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/bits/types/__fpos_t.h" 1 3 4




# 1 "/usr/include/bits/types/__mbstate_t.h" 1 3 4
# 13 "/usr/include/bits/types/__mbstate_t.h" 3 4
typedef struct
{
  int __count;
  union
  {
    unsigned int __wch;
    char __wchb[4];
  } __value;
} __mbstate_t;
# 6 "/usr/include/bits/types/__fpos_t.h" 2 3 4




typedef struct _G_fpos_t
{
  __off_t __pos;
  __mbstate_t __state;
} __fpos_t;
# 41 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__fpos64_t.h" 1 3 4
# 10 "/usr/include/bits/types/__fpos64_t.h" 3 4
typedef struct _G_fpos64_t
{
  __off64_t __pos;
  __mbstate_t __state;
} __fpos64_t;
# 42 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/__FILE.h" 1 3 4



struct _IO_FILE;
typedef struct _IO_FILE __FILE;
# 43 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/FILE.h" 1 3 4



struct _IO_FILE;


typedef struct _IO_FILE FILE;
# 44 "/usr/include/stdio.h" 2 3 4
# 1 "/usr/include/bits/types/struct_FILE.h" 1 3 4
# 35 "/usr/include/bits/types/struct_FILE.h" 3 4
struct _IO_FILE;
struct _IO_marker;
struct _IO_codecvt;
struct _IO_wide_data;




typedef void _IO_lock_t;





struct _IO_FILE
{
  int _flags;


  char *_IO_read_ptr;
  char *_IO_read_end;
  char *_IO_read_base;
  char *_IO_write_base;
  char *_IO_write_ptr;
  char *_IO_write_end;
  char *_IO_buf_base;
  char *_IO_buf_end;


  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
  int _flags2;
  __off_t _old_offset;


  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];

  _IO_lock_t *_lock;







  __off64_t _offset;

  struct _IO_codecvt *_codecvt;
  struct _IO_wide_data *_wide_data;
  struct _IO_FILE *_freeres_list;
  void *_freeres_buf;
  struct _IO_FILE **_prevchain;
  int _mode;

  char _unused2[15 * sizeof (int) - 5 * sizeof (void *)];
};
# 45 "/usr/include/stdio.h" 2 3 4


# 1 "/usr/include/bits/types/cookie_io_functions_t.h" 1 3 4
# 27 "/usr/include/bits/types/cookie_io_functions_t.h" 3 4
typedef __ssize_t cookie_read_function_t (void *__cookie, char *__buf,
                                          size_t __nbytes);







typedef __ssize_t cookie_write_function_t (void *__cookie, const char *__buf,
                                           size_t __nbytes);







typedef int cookie_seek_function_t (void *__cookie, __off64_t *__pos, int __w);


typedef int cookie_close_function_t (void *__cookie);






typedef struct _IO_cookie_io_functions_t
{
  cookie_read_function_t *read;
  cookie_write_function_t *write;
  cookie_seek_function_t *seek;
  cookie_close_function_t *close;
} cookie_io_functions_t;
# 48 "/usr/include/stdio.h" 2 3 4





typedef __gnuc_va_list va_list;
# 85 "/usr/include/stdio.h" 3 4
typedef __fpos_t fpos_t;
# 129 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 130 "/usr/include/stdio.h" 2 3 4
# 149 "/usr/include/stdio.h" 3 4
extern FILE *stdin;
extern FILE *stdout;
extern FILE *stderr;






extern int remove (const char *__filename) __attribute__ ((__nothrow__ ));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ ));



extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ ));
# 184 "/usr/include/stdio.h" 3 4
extern int fclose (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 194 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile (void)
  __attribute__ ((__malloc__)) ;
# 211 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char[20]) __attribute__ ((__nothrow__ )) ;




extern char *tmpnam_r (char __s[20]) __attribute__ ((__nothrow__ )) ;
# 228 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
   __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;






extern int fflush (FILE *__stream);
# 245 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 264 "/usr/include/stdio.h" 3 4
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes)
  __attribute__ ((__malloc__)) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) __attribute__ ((__nonnull__ (3)));
# 299 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ ))
  __attribute__ ((__malloc__)) ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     const char *__restrict __modes,
     cookie_io_functions_t __io_funcs) __attribute__ ((__nothrow__ ))
  __attribute__ ((__malloc__)) ;




extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ )) __attribute__ ((__malloc__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ ))
  __attribute__ ((__malloc__)) ;
# 334 "/usr/include/stdio.h" 3 4
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ ))
  __attribute__ ((__nonnull__ (1)));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));




extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...) __attribute__ ((__nonnull__ (1)));




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nonnull__ (1)));




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));



extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));





extern int vasprintf (char **__restrict __ptr, const char *__restrict __f,
        __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       const char *__restrict __fmt, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 2, 3))) ;




extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));







extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) __attribute__ ((__nonnull__ (1)));




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ ));
# 463 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf") __attribute__ ((__nonnull__ (1)));


extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf") ;

extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ ));
# 490 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__nonnull__ (1)));





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ )) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 540 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) __attribute__ ((__nonnull__ (1)));
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ ))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 575 "/usr/include/stdio.h" 3 4
extern int fgetc (FILE *__stream) __attribute__ ((__nonnull__ (1)));
extern int getc (FILE *__stream) __attribute__ ((__nonnull__ (1)));





extern int getchar (void);






extern int getc_unlocked (FILE *__stream) __attribute__ ((__nonnull__ (1)));
extern int getchar_unlocked (void);
# 600 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 611 "/usr/include/stdio.h" 3 4
extern int fputc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));
extern int putc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));





extern int putchar (int __c);
# 627 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));







extern int putc_unlocked (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream) __attribute__ ((__nonnull__ (1)));


extern int putw (int __w, FILE *__stream) __attribute__ ((__nonnull__ (2)));







extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
                                                          __attribute__ ((__nonnull__ (3)));
# 689 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
                             size_t *__restrict __n, int __delimiter,
                             FILE *__restrict __stream) __attribute__ ((__nonnull__ (4)));
extern __ssize_t getdelim (char **__restrict __lineptr,
                           size_t *__restrict __n, int __delimiter,
                           FILE *__restrict __stream) __attribute__ ((__nonnull__ (4)));


extern __ssize_t getline (char **__restrict __lineptr,
                          size_t *__restrict __n,
                          FILE *__restrict __stream) __attribute__ ((__nonnull__ (3)));







extern int fputs (const char *__restrict __s, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (2)));





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream) __attribute__ ((__nonnull__ (2)));






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) __attribute__ ((__nonnull__ (4)));
# 756 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream)
  __attribute__ ((__nonnull__ (4)));







extern int fseek (FILE *__stream, long int __off, int __whence)
  __attribute__ ((__nonnull__ (1)));




extern long int ftell (FILE *__stream) __attribute__ ((__nonnull__ (1)));




extern void rewind (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 793 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence)
  __attribute__ ((__nonnull__ (1)));




extern __off_t ftello (FILE *__stream) __attribute__ ((__nonnull__ (1)));
# 819 "/usr/include/stdio.h" 3 4
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos)
  __attribute__ ((__nonnull__ (1)));




extern int fsetpos (FILE *__stream, const fpos_t *__pos) __attribute__ ((__nonnull__ (1)));
# 850 "/usr/include/stdio.h" 3 4
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));







extern void perror (const char *__s) __attribute__ ((__cold__));




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 887 "/usr/include/stdio.h" 3 4
extern int pclose (FILE *__stream) __attribute__ ((__nonnull__ (1)));





extern FILE *popen (const char *__command, const char *__modes)
  __attribute__ ((__malloc__)) ;






extern char *ctermid (char *__s) __attribute__ ((__nothrow__ ))
                                     ;
# 931 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ )) __attribute__ ((__nonnull__ (1)));
# 949 "/usr/include/stdio.h" 3 4
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);
# 966 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio.h" 1 3 4
# 38 "/usr/include/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
vprintf (const char *__restrict __fmt, __gnuc_va_list __arg)
{
  return vfprintf (stdout, __fmt, __arg);
}



extern __inline __attribute__ ((__gnu_inline__)) int
getchar (void)
{
  return getc (stdin);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fgetc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}





extern __inline __attribute__ ((__gnu_inline__)) int
getc_unlocked (FILE *__fp)
{
  return (__builtin_expect (((__fp)->_IO_read_ptr >= (__fp)->_IO_read_end), 0) ? __uflow (__fp) : *(unsigned char *) (__fp)->_IO_read_ptr++);
}


extern __inline __attribute__ ((__gnu_inline__)) int
getchar_unlocked (void)
{
  return (__builtin_expect (((stdin)->_IO_read_ptr >= (stdin)->_IO_read_end), 0) ? __uflow (stdin) : *(unsigned char *) (stdin)->_IO_read_ptr++);
}




extern __inline __attribute__ ((__gnu_inline__)) int
putchar (int __c)
{
  return putc (__c, stdout);
}




extern __inline __attribute__ ((__gnu_inline__)) int
fputc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}





extern __inline __attribute__ ((__gnu_inline__)) int
putc_unlocked (int __c, FILE *__stream)
{
  return (__builtin_expect (((__stream)->_IO_write_ptr >= (__stream)->_IO_write_end), 0) ? __overflow (__stream, (unsigned char) (__c)) : (unsigned char) (*(__stream)->_IO_write_ptr++ = (__c)));
}


extern __inline __attribute__ ((__gnu_inline__)) int
putchar_unlocked (int __c)
{
  return (__builtin_expect (((stdout)->_IO_write_ptr >= (stdout)->_IO_write_end), 0) ? __overflow (stdout, (unsigned char) (__c)) : (unsigned char) (*(stdout)->_IO_write_ptr++ = (__c)));
}
# 127 "/usr/include/bits/stdio.h" 3 4
extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ )) feof_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0010) != 0);
}


extern __inline __attribute__ ((__gnu_inline__)) int
__attribute__ ((__nothrow__ )) ferror_unlocked (FILE *__stream)
{
  return (((__stream)->_flags & 0x0020) != 0);
}
# 967 "/usr/include/stdio.h" 2 3 4
# 25 "/usr/include/libxml2/libxml/tree.h" 2


# 1 "/usr/include/libxml2/libxml/xmlstring.h" 1
# 14 "/usr/include/libxml2/libxml/xmlstring.h"
# 1 "/usr/bin/../lib/clang/19/include/stdarg.h" 1 3
# 15 "/usr/include/libxml2/libxml/xmlstring.h" 2
# 28 "/usr/include/libxml2/libxml/xmlstring.h"
typedef unsigned char xmlChar;
# 40 "/usr/include/libxml2/libxml/xmlstring.h"
          xmlChar *
                xmlStrdup (const xmlChar *cur);
          xmlChar *
                xmlStrndup (const xmlChar *cur,
                                         int len);
          xmlChar *
                xmlCharStrndup (const char *cur,
                                         int len);
          xmlChar *
                xmlCharStrdup (const char *cur);
          xmlChar *
                xmlStrsub (const xmlChar *str,
                                         int start,
                                         int len);
          const xmlChar *
                xmlStrchr (const xmlChar *str,
                                         xmlChar val);
          const xmlChar *
                xmlStrstr (const xmlChar *str,
                                         const xmlChar *val);
          const xmlChar *
                xmlStrcasestr (const xmlChar *str,
                                         const xmlChar *val);
          int
                xmlStrcmp (const xmlChar *str1,
                                         const xmlChar *str2);
          int
                xmlStrncmp (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
          int
                xmlStrcasecmp (const xmlChar *str1,
                                         const xmlChar *str2);
          int
                xmlStrncasecmp (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
          int
                xmlStrEqual (const xmlChar *str1,
                                         const xmlChar *str2);
          int
                xmlStrQEqual (const xmlChar *pref,
                                         const xmlChar *name,
                                         const xmlChar *str);
          int
                xmlStrlen (const xmlChar *str);
          xmlChar *
                xmlStrcat (xmlChar *cur,
                                         const xmlChar *add);
          xmlChar *
                xmlStrncat (xmlChar *cur,
                                         const xmlChar *add,
                                         int len);
          xmlChar *
                xmlStrncatNew (const xmlChar *str1,
                                         const xmlChar *str2,
                                         int len);
          int
                xmlStrPrintf (xmlChar *buf,
                                         int len,
                                         const char *msg,
                                         ...) __attribute__((__format__(__printf__,3,4)));
          int
                xmlStrVPrintf (xmlChar *buf,
                                         int len,
                                         const char *msg,
                                         va_list ap) __attribute__((__format__(__printf__,3,0)));

          int
        xmlGetUTF8Char (const unsigned char *utf,
                                         int *len);
          int
        xmlCheckUTF8 (const unsigned char *utf);
          int
        xmlUTF8Strsize (const xmlChar *utf,
                                         int len);
          xmlChar *
        xmlUTF8Strndup (const xmlChar *utf,
                                         int len);
          const xmlChar *
        xmlUTF8Strpos (const xmlChar *utf,
                                         int pos);
          int
        xmlUTF8Strloc (const xmlChar *utf,
                                         const xmlChar *utfchar);
          xmlChar *
        xmlUTF8Strsub (const xmlChar *utf,
                                         int start,
                                         int len);
          int
        xmlUTF8Strlen (const xmlChar *utf);
          int
        xmlUTF8Size (const xmlChar *utf);
          int
        xmlUTF8Charcmp (const xmlChar *utf1,
                                         const xmlChar *utf2);
# 28 "/usr/include/libxml2/libxml/tree.h" 2
# 1 "/usr/include/libxml2/libxml/xmlmemory.h" 1
# 31 "/usr/include/libxml2/libxml/xmlmemory.h"
typedef void (*xmlFreeFunc)(void *mem);
# 40 "/usr/include/libxml2/libxml/xmlmemory.h"
typedef void *( *xmlMallocFunc)(size_t size);
# 51 "/usr/include/libxml2/libxml/xmlmemory.h"
typedef void *(*xmlReallocFunc)(void *mem, size_t size);
# 61 "/usr/include/libxml2/libxml/xmlmemory.h"
typedef char *(*xmlStrdupFunc)(const char *str);
# 93 "/usr/include/libxml2/libxml/xmlmemory.h"
  extern xmlMallocFunc xmlMalloc;
  extern xmlMallocFunc xmlMallocAtomic;
  extern xmlReallocFunc xmlRealloc;
  extern xmlFreeFunc xmlFree;
  extern xmlStrdupFunc xmlMemStrdup;







          int
 xmlMemSetup (xmlFreeFunc freeFunc,
    xmlMallocFunc mallocFunc,
    xmlReallocFunc reallocFunc,
    xmlStrdupFunc strdupFunc);
          int
 xmlMemGet (xmlFreeFunc *freeFunc,
    xmlMallocFunc *mallocFunc,
    xmlReallocFunc *reallocFunc,
    xmlStrdupFunc *strdupFunc);
          int
 xmlGcMemSetup (xmlFreeFunc freeFunc,
    xmlMallocFunc mallocFunc,
    xmlMallocFunc mallocAtomicFunc,
    xmlReallocFunc reallocFunc,
    xmlStrdupFunc strdupFunc);
          int
 xmlGcMemGet (xmlFreeFunc *freeFunc,
    xmlMallocFunc *mallocFunc,
    xmlMallocFunc *mallocAtomicFunc,
    xmlReallocFunc *reallocFunc,
    xmlStrdupFunc *strdupFunc);




__attribute__((deprecated))
          int
 xmlInitMemory (void);




__attribute__((deprecated))
          void
                xmlCleanupMemory (void);



          size_t
 xmlMemSize (void *ptr);
          int
 xmlMemUsed (void);
          int
 xmlMemBlocks (void);
          void
 xmlMemDisplay (FILE *fp);
          void
 xmlMemDisplayLast(FILE *fp, long nbBytes);
          void
 xmlMemShow (FILE *fp, int nr);
          void
 xmlMemoryDump (void);
          void *
 xmlMemMalloc (size_t size) ;
          void *
 xmlMemRealloc (void *ptr,size_t size);
          void
 xmlMemFree (void *ptr);
          char *
 xmlMemoryStrdup (const char *str);
          void *
 xmlMallocLoc (size_t size, const char *file, int line) ;
          void *
 xmlReallocLoc (void *ptr, size_t size, const char *file, int line);
          void *
 xmlMallocAtomicLoc (size_t size, const char *file, int line) ;
          char *
 xmlMemStrdupLoc (const char *str, const char *file, int line);
# 29 "/usr/include/libxml2/libxml/tree.h" 2
# 1 "/usr/include/libxml2/libxml/xmlregexp.h" 1
# 30 "/usr/include/libxml2/libxml/xmlregexp.h"
typedef struct _xmlRegexp xmlRegexp;
typedef xmlRegexp *xmlRegexpPtr;






typedef struct _xmlRegExecCtxt xmlRegExecCtxt;
typedef xmlRegExecCtxt *xmlRegExecCtxtPtr;




          xmlRegexpPtr
      xmlRegexpCompile (const xmlChar *regexp);
          void xmlRegFreeRegexp(xmlRegexpPtr regexp);
          int
      xmlRegexpExec (xmlRegexpPtr comp,
      const xmlChar *value);
          void
      xmlRegexpPrint (FILE *output,
      xmlRegexpPtr regexp);
          int
      xmlRegexpIsDeterminist(xmlRegexpPtr comp);
# 65 "/usr/include/libxml2/libxml/xmlregexp.h"
typedef void (*xmlRegExecCallbacks) (xmlRegExecCtxtPtr exec,
                              const xmlChar *token,
         void *transdata,
         void *inputdata);




          xmlRegExecCtxtPtr
      xmlRegNewExecCtxt (xmlRegexpPtr comp,
      xmlRegExecCallbacks callback,
      void *data);
          void
      xmlRegFreeExecCtxt (xmlRegExecCtxtPtr exec);
          int
      xmlRegExecPushString(xmlRegExecCtxtPtr exec,
      const xmlChar *value,
      void *data);
          int
      xmlRegExecPushString2(xmlRegExecCtxtPtr exec,
      const xmlChar *value,
      const xmlChar *value2,
      void *data);

          int
      xmlRegExecNextValues(xmlRegExecCtxtPtr exec,
      int *nbval,
      int *nbneg,
      xmlChar **values,
      int *terminal);
          int
      xmlRegExecErrInfo (xmlRegExecCtxtPtr exec,
      const xmlChar **string,
      int *nbval,
      int *nbneg,
      xmlChar **values,
      int *terminal);
# 30 "/usr/include/libxml2/libxml/tree.h" 2
# 39 "/usr/include/libxml2/libxml/tree.h"
typedef struct _xmlParserInputBuffer xmlParserInputBuffer;
typedef xmlParserInputBuffer *xmlParserInputBufferPtr;

typedef struct _xmlOutputBuffer xmlOutputBuffer;
typedef xmlOutputBuffer *xmlOutputBufferPtr;


typedef struct _xmlParserInput xmlParserInput;
typedef xmlParserInput *xmlParserInputPtr;

typedef struct _xmlParserCtxt xmlParserCtxt;
typedef xmlParserCtxt *xmlParserCtxtPtr;

typedef struct _xmlSAXLocator xmlSAXLocator;
typedef xmlSAXLocator *xmlSAXLocatorPtr;

typedef struct _xmlSAXHandler xmlSAXHandler;
typedef xmlSAXHandler *xmlSAXHandlerPtr;


typedef struct _xmlEntity xmlEntity;
typedef xmlEntity *xmlEntityPtr;
# 85 "/usr/include/libxml2/libxml/tree.h"
typedef enum {
    XML_BUFFER_ALLOC_DOUBLEIT,
    XML_BUFFER_ALLOC_EXACT,
    XML_BUFFER_ALLOC_IMMUTABLE,
    XML_BUFFER_ALLOC_IO,
    XML_BUFFER_ALLOC_HYBRID,
    XML_BUFFER_ALLOC_BOUNDED
} xmlBufferAllocationScheme;







typedef struct _xmlBuffer xmlBuffer;
typedef xmlBuffer *xmlBufferPtr;
struct _xmlBuffer {
    xmlChar *content;
    unsigned int use;
    unsigned int size;
    xmlBufferAllocationScheme alloc;
    xmlChar *contentIO;
};







typedef struct _xmlBuf xmlBuf;
# 125 "/usr/include/libxml2/libxml/tree.h"
typedef xmlBuf *xmlBufPtr;





          xmlChar* xmlBufContent (const xmlBuf* buf);
          xmlChar* xmlBufEnd (xmlBufPtr buf);
          size_t xmlBufUse (const xmlBufPtr buf);
          size_t xmlBufShrink (xmlBufPtr buf, size_t len);
# 170 "/usr/include/libxml2/libxml/tree.h"
typedef enum {
    XML_ELEMENT_NODE= 1,
    XML_ATTRIBUTE_NODE= 2,
    XML_TEXT_NODE= 3,
    XML_CDATA_SECTION_NODE= 4,
    XML_ENTITY_REF_NODE= 5,
    XML_ENTITY_NODE= 6,
    XML_PI_NODE= 7,
    XML_COMMENT_NODE= 8,
    XML_DOCUMENT_NODE= 9,
    XML_DOCUMENT_TYPE_NODE= 10,
    XML_DOCUMENT_FRAG_NODE= 11,
    XML_NOTATION_NODE= 12,
    XML_HTML_DOCUMENT_NODE= 13,
    XML_DTD_NODE= 14,
    XML_ELEMENT_DECL= 15,
    XML_ATTRIBUTE_DECL= 16,
    XML_ENTITY_DECL= 17,
    XML_NAMESPACE_DECL= 18,
    XML_XINCLUDE_START= 19,
    XML_XINCLUDE_END= 20

} xmlElementType;
# 205 "/usr/include/libxml2/libxml/tree.h"
typedef struct _xmlNotation xmlNotation;
typedef xmlNotation *xmlNotationPtr;
struct _xmlNotation {
    const xmlChar *name;
    const xmlChar *PublicID;
    const xmlChar *SystemID;
};







typedef enum {
    XML_ATTRIBUTE_CDATA = 1,
    XML_ATTRIBUTE_ID,
    XML_ATTRIBUTE_IDREF ,
    XML_ATTRIBUTE_IDREFS,
    XML_ATTRIBUTE_ENTITY,
    XML_ATTRIBUTE_ENTITIES,
    XML_ATTRIBUTE_NMTOKEN,
    XML_ATTRIBUTE_NMTOKENS,
    XML_ATTRIBUTE_ENUMERATION,
    XML_ATTRIBUTE_NOTATION
} xmlAttributeType;







typedef enum {
    XML_ATTRIBUTE_NONE = 1,
    XML_ATTRIBUTE_REQUIRED,
    XML_ATTRIBUTE_IMPLIED,
    XML_ATTRIBUTE_FIXED
} xmlAttributeDefault;







typedef struct _xmlEnumeration xmlEnumeration;
typedef xmlEnumeration *xmlEnumerationPtr;
struct _xmlEnumeration {
    struct _xmlEnumeration *next;
    const xmlChar *name;
};







typedef struct _xmlAttribute xmlAttribute;
typedef xmlAttribute *xmlAttributePtr;
struct _xmlAttribute {
    void *_private;
    xmlElementType type;
    const xmlChar *name;
    struct _xmlNode *children;
    struct _xmlNode *last;
    struct _xmlDtd *parent;
    struct _xmlNode *next;
    struct _xmlNode *prev;
    struct _xmlDoc *doc;

    struct _xmlAttribute *nexth;
    xmlAttributeType atype;
    xmlAttributeDefault def;
    const xmlChar *defaultValue;
    xmlEnumerationPtr tree;
    const xmlChar *prefix;
    const xmlChar *elem;
};






typedef enum {
    XML_ELEMENT_CONTENT_PCDATA = 1,
    XML_ELEMENT_CONTENT_ELEMENT,
    XML_ELEMENT_CONTENT_SEQ,
    XML_ELEMENT_CONTENT_OR
} xmlElementContentType;






typedef enum {
    XML_ELEMENT_CONTENT_ONCE = 1,
    XML_ELEMENT_CONTENT_OPT,
    XML_ELEMENT_CONTENT_MULT,
    XML_ELEMENT_CONTENT_PLUS
} xmlElementContentOccur;
# 317 "/usr/include/libxml2/libxml/tree.h"
typedef struct _xmlElementContent xmlElementContent;
typedef xmlElementContent *xmlElementContentPtr;
struct _xmlElementContent {
    xmlElementContentType type;
    xmlElementContentOccur ocur;
    const xmlChar *name;
    struct _xmlElementContent *c1;
    struct _xmlElementContent *c2;
    struct _xmlElementContent *parent;
    const xmlChar *prefix;
};







typedef enum {
    XML_ELEMENT_TYPE_UNDEFINED = 0,
    XML_ELEMENT_TYPE_EMPTY = 1,
    XML_ELEMENT_TYPE_ANY,
    XML_ELEMENT_TYPE_MIXED,
    XML_ELEMENT_TYPE_ELEMENT
} xmlElementTypeVal;







typedef struct _xmlElement xmlElement;
typedef xmlElement *xmlElementPtr;
struct _xmlElement {
    void *_private;
    xmlElementType type;
    const xmlChar *name;
    struct _xmlNode *children;
    struct _xmlNode *last;
    struct _xmlDtd *parent;
    struct _xmlNode *next;
    struct _xmlNode *prev;
    struct _xmlDoc *doc;

    xmlElementTypeVal etype;
    xmlElementContentPtr content;
    xmlAttributePtr attributes;
    const xmlChar *prefix;

    xmlRegexpPtr contModel;



};
# 380 "/usr/include/libxml2/libxml/tree.h"
typedef xmlElementType xmlNsType;
# 392 "/usr/include/libxml2/libxml/tree.h"
typedef struct _xmlNs xmlNs;
typedef xmlNs *xmlNsPtr;
struct _xmlNs {
    struct _xmlNs *next;
    xmlNsType type;
    const xmlChar *href;
    const xmlChar *prefix;
    void *_private;
    struct _xmlDoc *context;
};







typedef struct _xmlDtd xmlDtd;
typedef xmlDtd *xmlDtdPtr;
struct _xmlDtd {
    void *_private;
    xmlElementType type;
    const xmlChar *name;
    struct _xmlNode *children;
    struct _xmlNode *last;
    struct _xmlDoc *parent;
    struct _xmlNode *next;
    struct _xmlNode *prev;
    struct _xmlDoc *doc;


    void *notations;
    void *elements;
    void *attributes;
    void *entities;
    const xmlChar *ExternalID;
    const xmlChar *SystemID;
    void *pentities;
};






typedef struct _xmlAttr xmlAttr;
typedef xmlAttr *xmlAttrPtr;
struct _xmlAttr {
    void *_private;
    xmlElementType type;
    const xmlChar *name;
    struct _xmlNode *children;
    struct _xmlNode *last;
    struct _xmlNode *parent;
    struct _xmlAttr *next;
    struct _xmlAttr *prev;
    struct _xmlDoc *doc;
    xmlNs *ns;
    xmlAttributeType atype;
    void *psvi;
};







typedef struct _xmlID xmlID;
typedef xmlID *xmlIDPtr;
struct _xmlID {
    struct _xmlID *next;
    const xmlChar *value;
    xmlAttrPtr attr;
    const xmlChar *name;
    int lineno;
    struct _xmlDoc *doc;
};







typedef struct _xmlRef xmlRef;
typedef xmlRef *xmlRefPtr;
struct _xmlRef {
    struct _xmlRef *next;
    const xmlChar *value;
    xmlAttrPtr attr;
    const xmlChar *name;
    int lineno;
};






typedef struct _xmlNode xmlNode;
typedef xmlNode *xmlNodePtr;
struct _xmlNode {
    void *_private;
    xmlElementType type;
    const xmlChar *name;
    struct _xmlNode *children;
    struct _xmlNode *last;
    struct _xmlNode *parent;
    struct _xmlNode *next;
    struct _xmlNode *prev;
    struct _xmlDoc *doc;


    xmlNs *ns;
    xmlChar *content;
    struct _xmlAttr *properties;
    xmlNs *nsDef;
    void *psvi;
    unsigned short line;
    unsigned short extra;
};
# 537 "/usr/include/libxml2/libxml/tree.h"
typedef enum {
    XML_DOC_WELLFORMED = 1<<0,
    XML_DOC_NSVALID = 1<<1,
    XML_DOC_OLD10 = 1<<2,
    XML_DOC_DTDVALID = 1<<3,
    XML_DOC_XINCLUDE = 1<<4,
    XML_DOC_USERBUILT = 1<<5,

    XML_DOC_INTERNAL = 1<<6,
    XML_DOC_HTML = 1<<7
} xmlDocProperties;






typedef struct _xmlDoc xmlDoc;
typedef xmlDoc *xmlDocPtr;
struct _xmlDoc {
    void *_private;
    xmlElementType type;
    char *name;
    struct _xmlNode *children;
    struct _xmlNode *last;
    struct _xmlNode *parent;
    struct _xmlNode *next;
    struct _xmlNode *prev;
    struct _xmlDoc *doc;


    int compression;
    int standalone;





    struct _xmlDtd *intSubset;
    struct _xmlDtd *extSubset;
    struct _xmlNs *oldNs;
    const xmlChar *version;
    const xmlChar *encoding;
    void *ids;
    void *refs;
    const xmlChar *URL;
    int charset;
    struct _xmlDict *dict;
    void *psvi;
    int parseFlags;

    int properties;

};


typedef struct _xmlDOMWrapCtxt xmlDOMWrapCtxt;
typedef xmlDOMWrapCtxt *xmlDOMWrapCtxtPtr;
# 607 "/usr/include/libxml2/libxml/tree.h"
typedef xmlNsPtr (*xmlDOMWrapAcquireNsFunction) (xmlDOMWrapCtxtPtr ctxt,
       xmlNodePtr node,
       const xmlChar *nsName,
       const xmlChar *nsPrefix);






struct _xmlDOMWrapCtxt {
    void * _private;




    int type;



    void * namespaceMap;




    xmlDOMWrapAcquireNsFunction getNsForNodeFunc;
};







typedef void (*xmlRegisterNodeFunc) (xmlNodePtr node);







typedef void (*xmlDeregisterNodeFunc) (xmlNodePtr node);
# 684 "/usr/include/libxml2/libxml/tree.h"
__attribute__((deprecated)) xmlBufferAllocationScheme *__xmlBufferAllocScheme(void); __attribute__((deprecated)) int *__xmlDefaultBufferSize(void); __attribute__((deprecated)) xmlRegisterNodeFunc *__xmlRegisterNodeDefaultValue(void); __attribute__((deprecated)) xmlDeregisterNodeFunc *__xmlDeregisterNodeDefaultValue(void);
# 700 "/usr/include/libxml2/libxml/tree.h"
          int
  xmlValidateNCName (const xmlChar *value,
      int space);


          int
  xmlValidateQName (const xmlChar *value,
      int space);
          int
  xmlValidateName (const xmlChar *value,
      int space);
          int
  xmlValidateNMToken (const xmlChar *value,
      int space);


          xmlChar *
  xmlBuildQName (const xmlChar *ncname,
      const xmlChar *prefix,
      xmlChar *memory,
      int len);
          xmlChar *
  xmlSplitQName2 (const xmlChar *name,
      xmlChar **prefix);
          const xmlChar *
  xmlSplitQName3 (const xmlChar *name,
      int *len);





          void
  xmlSetBufferAllocationScheme(xmlBufferAllocationScheme scheme);
          xmlBufferAllocationScheme
  xmlGetBufferAllocationScheme(void);

          xmlBufferPtr
  xmlBufferCreate (void);
          xmlBufferPtr
  xmlBufferCreateSize (size_t size);
          xmlBufferPtr
  xmlBufferCreateStatic (void *mem,
      size_t size);
          int
  xmlBufferResize (xmlBufferPtr buf,
      unsigned int size);
          void
  xmlBufferFree (xmlBufferPtr buf);
          int
  xmlBufferDump (FILE *file,
      xmlBufferPtr buf);
          int
  xmlBufferAdd (xmlBufferPtr buf,
      const xmlChar *str,
      int len);
          int
  xmlBufferAddHead (xmlBufferPtr buf,
      const xmlChar *str,
      int len);
          int
  xmlBufferCat (xmlBufferPtr buf,
      const xmlChar *str);
          int
  xmlBufferCCat (xmlBufferPtr buf,
      const char *str);
          int
  xmlBufferShrink (xmlBufferPtr buf,
      unsigned int len);
          int
  xmlBufferGrow (xmlBufferPtr buf,
      unsigned int len);
          void
  xmlBufferEmpty (xmlBufferPtr buf);
          const xmlChar*
  xmlBufferContent (const xmlBuffer *buf);
          xmlChar*
  xmlBufferDetach (xmlBufferPtr buf);
          void
  xmlBufferSetAllocationScheme(xmlBufferPtr buf,
      xmlBufferAllocationScheme scheme);
          int
  xmlBufferLength (const xmlBuffer *buf);




          xmlDtdPtr
  xmlCreateIntSubset (xmlDocPtr doc,
      const xmlChar *name,
      const xmlChar *ExternalID,
      const xmlChar *SystemID);
          xmlDtdPtr
  xmlNewDtd (xmlDocPtr doc,
      const xmlChar *name,
      const xmlChar *ExternalID,
      const xmlChar *SystemID);
          xmlDtdPtr
  xmlGetIntSubset (const xmlDoc *doc);
          void
  xmlFreeDtd (xmlDtdPtr cur);

__attribute__((deprecated))
          xmlNsPtr
  xmlNewGlobalNs (xmlDocPtr doc,
      const xmlChar *href,
      const xmlChar *prefix);

          xmlNsPtr
  xmlNewNs (xmlNodePtr node,
      const xmlChar *href,
      const xmlChar *prefix);
          void
  xmlFreeNs (xmlNsPtr cur);
          void
  xmlFreeNsList (xmlNsPtr cur);
          xmlDocPtr
  xmlNewDoc (const xmlChar *version);
          void
  xmlFreeDoc (xmlDocPtr cur);
          xmlAttrPtr
  xmlNewDocProp (xmlDocPtr doc,
      const xmlChar *name,
      const xmlChar *value);


          xmlAttrPtr
  xmlNewProp (xmlNodePtr node,
      const xmlChar *name,
      const xmlChar *value);

          xmlAttrPtr
  xmlNewNsProp (xmlNodePtr node,
      xmlNsPtr ns,
      const xmlChar *name,
      const xmlChar *value);
          xmlAttrPtr
  xmlNewNsPropEatName (xmlNodePtr node,
      xmlNsPtr ns,
      xmlChar *name,
      const xmlChar *value);
          void
  xmlFreePropList (xmlAttrPtr cur);
          void
  xmlFreeProp (xmlAttrPtr cur);
          xmlAttrPtr
  xmlCopyProp (xmlNodePtr target,
      xmlAttrPtr cur);
          xmlAttrPtr
  xmlCopyPropList (xmlNodePtr target,
      xmlAttrPtr cur);

          xmlDtdPtr
  xmlCopyDtd (xmlDtdPtr dtd);


          xmlDocPtr
  xmlCopyDoc (xmlDocPtr doc,
      int recursive);




          xmlNodePtr
  xmlNewDocNode (xmlDocPtr doc,
      xmlNsPtr ns,
      const xmlChar *name,
      const xmlChar *content);
          xmlNodePtr
  xmlNewDocNodeEatName (xmlDocPtr doc,
      xmlNsPtr ns,
      xmlChar *name,
      const xmlChar *content);
          xmlNodePtr
  xmlNewNode (xmlNsPtr ns,
      const xmlChar *name);
          xmlNodePtr
  xmlNewNodeEatName (xmlNsPtr ns,
      xmlChar *name);

          xmlNodePtr
  xmlNewChild (xmlNodePtr parent,
      xmlNsPtr ns,
      const xmlChar *name,
      const xmlChar *content);

          xmlNodePtr
  xmlNewDocText (const xmlDoc *doc,
      const xmlChar *content);
          xmlNodePtr
  xmlNewText (const xmlChar *content);
          xmlNodePtr
  xmlNewDocPI (xmlDocPtr doc,
      const xmlChar *name,
      const xmlChar *content);
          xmlNodePtr
  xmlNewPI (const xmlChar *name,
      const xmlChar *content);
          xmlNodePtr
  xmlNewDocTextLen (xmlDocPtr doc,
      const xmlChar *content,
      int len);
          xmlNodePtr
  xmlNewTextLen (const xmlChar *content,
      int len);
          xmlNodePtr
  xmlNewDocComment (xmlDocPtr doc,
      const xmlChar *content);
          xmlNodePtr
  xmlNewComment (const xmlChar *content);
          xmlNodePtr
  xmlNewCDataBlock (xmlDocPtr doc,
      const xmlChar *content,
      int len);
          xmlNodePtr
  xmlNewCharRef (xmlDocPtr doc,
      const xmlChar *name);
          xmlNodePtr
  xmlNewReference (const xmlDoc *doc,
      const xmlChar *name);
          xmlNodePtr
  xmlCopyNode (xmlNodePtr node,
      int recursive);
          xmlNodePtr
  xmlDocCopyNode (xmlNodePtr node,
      xmlDocPtr doc,
      int recursive);
          xmlNodePtr
  xmlDocCopyNodeList (xmlDocPtr doc,
      xmlNodePtr node);
          xmlNodePtr
  xmlCopyNodeList (xmlNodePtr node);

          xmlNodePtr
  xmlNewTextChild (xmlNodePtr parent,
      xmlNsPtr ns,
      const xmlChar *name,
      const xmlChar *content);
          xmlNodePtr
  xmlNewDocRawNode (xmlDocPtr doc,
      xmlNsPtr ns,
      const xmlChar *name,
      const xmlChar *content);
          xmlNodePtr
  xmlNewDocFragment (xmlDocPtr doc);





          long
  xmlGetLineNo (const xmlNode *node);

          xmlChar *
  xmlGetNodePath (const xmlNode *node);

          xmlNodePtr
  xmlDocGetRootElement (const xmlDoc *doc);
          xmlNodePtr
  xmlGetLastChild (const xmlNode *parent);
          int
  xmlNodeIsText (const xmlNode *node);
          int
  xmlIsBlankNode (const xmlNode *node);





          xmlNodePtr
  xmlDocSetRootElement (xmlDocPtr doc,
      xmlNodePtr root);


          void
  xmlNodeSetName (xmlNodePtr cur,
      const xmlChar *name);

          xmlNodePtr
  xmlAddChild (xmlNodePtr parent,
      xmlNodePtr cur);
          xmlNodePtr
  xmlAddChildList (xmlNodePtr parent,
      xmlNodePtr cur);

          xmlNodePtr
  xmlReplaceNode (xmlNodePtr old,
      xmlNodePtr cur);



          xmlNodePtr
  xmlAddPrevSibling (xmlNodePtr cur,
      xmlNodePtr elem);

          xmlNodePtr
  xmlAddSibling (xmlNodePtr cur,
      xmlNodePtr elem);
          xmlNodePtr
  xmlAddNextSibling (xmlNodePtr cur,
      xmlNodePtr elem);
          void
  xmlUnlinkNode (xmlNodePtr cur);
          xmlNodePtr
  xmlTextMerge (xmlNodePtr first,
      xmlNodePtr second);
          int
  xmlTextConcat (xmlNodePtr node,
      const xmlChar *content,
      int len);
          void
  xmlFreeNodeList (xmlNodePtr cur);
          void
  xmlFreeNode (xmlNodePtr cur);
          void
  xmlSetTreeDoc (xmlNodePtr tree,
      xmlDocPtr doc);
          void
  xmlSetListDoc (xmlNodePtr list,
      xmlDocPtr doc);



          xmlNsPtr
  xmlSearchNs (xmlDocPtr doc,
      xmlNodePtr node,
      const xmlChar *nameSpace);
          xmlNsPtr
  xmlSearchNsByHref (xmlDocPtr doc,
      xmlNodePtr node,
      const xmlChar *href);


          xmlNsPtr *
  xmlGetNsList (const xmlDoc *doc,
      const xmlNode *node);


          void
  xmlSetNs (xmlNodePtr node,
      xmlNsPtr ns);
          xmlNsPtr
  xmlCopyNamespace (xmlNsPtr cur);
          xmlNsPtr
  xmlCopyNamespaceList (xmlNsPtr cur);






          xmlAttrPtr
  xmlSetProp (xmlNodePtr node,
      const xmlChar *name,
      const xmlChar *value);
          xmlAttrPtr
  xmlSetNsProp (xmlNodePtr node,
      xmlNsPtr ns,
      const xmlChar *name,
      const xmlChar *value);


          xmlChar *
  xmlGetNoNsProp (const xmlNode *node,
      const xmlChar *name);
          xmlChar *
  xmlGetProp (const xmlNode *node,
      const xmlChar *name);
          xmlAttrPtr
  xmlHasProp (const xmlNode *node,
      const xmlChar *name);
          xmlAttrPtr
  xmlHasNsProp (const xmlNode *node,
      const xmlChar *name,
      const xmlChar *nameSpace);
          xmlChar *
  xmlGetNsProp (const xmlNode *node,
      const xmlChar *name,
      const xmlChar *nameSpace);
          xmlNodePtr
  xmlStringGetNodeList (const xmlDoc *doc,
      const xmlChar *value);
          xmlNodePtr
  xmlStringLenGetNodeList (const xmlDoc *doc,
      const xmlChar *value,
      int len);
          xmlChar *
  xmlNodeListGetString (xmlDocPtr doc,
      const xmlNode *list,
      int inLine);

          xmlChar *
  xmlNodeListGetRawString (const xmlDoc *doc,
      const xmlNode *list,
      int inLine);

          void
  xmlNodeSetContent (xmlNodePtr cur,
      const xmlChar *content);

          void
  xmlNodeSetContentLen (xmlNodePtr cur,
      const xmlChar *content,
      int len);

          void
  xmlNodeAddContent (xmlNodePtr cur,
      const xmlChar *content);
          void
  xmlNodeAddContentLen (xmlNodePtr cur,
      const xmlChar *content,
      int len);
          xmlChar *
  xmlNodeGetContent (const xmlNode *cur);

          int
  xmlNodeBufGetContent (xmlBufferPtr buffer,
      const xmlNode *cur);
          int
  xmlBufGetNodeContent (xmlBufPtr buf,
      const xmlNode *cur);

          xmlChar *
  xmlNodeGetLang (const xmlNode *cur);
          int
  xmlNodeGetSpacePreserve (const xmlNode *cur);

          void
  xmlNodeSetLang (xmlNodePtr cur,
      const xmlChar *lang);
          void
  xmlNodeSetSpacePreserve (xmlNodePtr cur,
      int val);

          xmlChar *
  xmlNodeGetBase (const xmlDoc *doc,
      const xmlNode *cur);

          void
  xmlNodeSetBase (xmlNodePtr cur,
      const xmlChar *uri);





          int
  xmlRemoveProp (xmlAttrPtr cur);

          int
  xmlUnsetNsProp (xmlNodePtr node,
      xmlNsPtr ns,
      const xmlChar *name);
          int
  xmlUnsetProp (xmlNodePtr node,
      const xmlChar *name);





          void
  xmlBufferWriteCHAR (xmlBufferPtr buf,
      const xmlChar *string);
          void
  xmlBufferWriteChar (xmlBufferPtr buf,
      const char *string);
          void
  xmlBufferWriteQuotedString(xmlBufferPtr buf,
      const xmlChar *string);


          void xmlAttrSerializeTxtContent(xmlBufferPtr buf,
      xmlDocPtr doc,
      xmlAttrPtr attr,
      const xmlChar *string);






          int
  xmlReconciliateNs (xmlDocPtr doc,
      xmlNodePtr tree);






          void
  xmlDocDumpFormatMemory (xmlDocPtr cur,
      xmlChar **mem,
      int *size,
      int format);
          void
  xmlDocDumpMemory (xmlDocPtr cur,
      xmlChar **mem,
      int *size);
          void
  xmlDocDumpMemoryEnc (xmlDocPtr out_doc,
      xmlChar **doc_txt_ptr,
      int * doc_txt_len,
      const char *txt_encoding);
          void
  xmlDocDumpFormatMemoryEnc(xmlDocPtr out_doc,
      xmlChar **doc_txt_ptr,
      int * doc_txt_len,
      const char *txt_encoding,
      int format);
          int
  xmlDocFormatDump (FILE *f,
      xmlDocPtr cur,
      int format);
          int
  xmlDocDump (FILE *f,
      xmlDocPtr cur);
          void
  xmlElemDump (FILE *f,
      xmlDocPtr doc,
      xmlNodePtr cur);
          int
  xmlSaveFile (const char *filename,
      xmlDocPtr cur);
          int
  xmlSaveFormatFile (const char *filename,
      xmlDocPtr cur,
      int format);
          size_t
  xmlBufNodeDump (xmlBufPtr buf,
      xmlDocPtr doc,
      xmlNodePtr cur,
      int level,
      int format);
          int
  xmlNodeDump (xmlBufferPtr buf,
      xmlDocPtr doc,
      xmlNodePtr cur,
      int level,
      int format);

          int
  xmlSaveFileTo (xmlOutputBufferPtr buf,
      xmlDocPtr cur,
      const char *encoding);
          int
  xmlSaveFormatFileTo (xmlOutputBufferPtr buf,
      xmlDocPtr cur,
             const char *encoding,
             int format);
          void
  xmlNodeDumpOutput (xmlOutputBufferPtr buf,
      xmlDocPtr doc,
      xmlNodePtr cur,
      int level,
      int format,
      const char *encoding);

          int
  xmlSaveFormatFileEnc (const char *filename,
      xmlDocPtr cur,
      const char *encoding,
      int format);

          int
  xmlSaveFileEnc (const char *filename,
      xmlDocPtr cur,
      const char *encoding);





          int
  xmlIsXHTML (const xmlChar *systemID,
      const xmlChar *publicID);




          int
  xmlGetDocCompressMode (const xmlDoc *doc);
          void
  xmlSetDocCompressMode (xmlDocPtr doc,
      int mode);
          int
  xmlGetCompressMode (void);
          void
  xmlSetCompressMode (int mode);




          xmlDOMWrapCtxtPtr
  xmlDOMWrapNewCtxt (void);
          void
  xmlDOMWrapFreeCtxt (xmlDOMWrapCtxtPtr ctxt);
          int
     xmlDOMWrapReconcileNamespaces(xmlDOMWrapCtxtPtr ctxt,
      xmlNodePtr elem,
      int options);
          int
     xmlDOMWrapAdoptNode (xmlDOMWrapCtxtPtr ctxt,
      xmlDocPtr sourceDoc,
      xmlNodePtr node,
      xmlDocPtr destDoc,
      xmlNodePtr destParent,
      int options);
          int
     xmlDOMWrapRemoveNode (xmlDOMWrapCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr node,
      int options);
          int
     xmlDOMWrapCloneNode (xmlDOMWrapCtxtPtr ctxt,
      xmlDocPtr sourceDoc,
      xmlNodePtr node,
      xmlNodePtr *clonedNode,
      xmlDocPtr destDoc,
      xmlNodePtr destParent,
      int deep,
      int options);






          unsigned long
            xmlChildElementCount (xmlNodePtr parent);
          xmlNodePtr
            xmlNextElementSibling (xmlNodePtr node);
          xmlNodePtr
            xmlFirstElementChild (xmlNodePtr parent);
          xmlNodePtr
            xmlLastElementChild (xmlNodePtr parent);
          xmlNodePtr
            xmlPreviousElementSibling (xmlNodePtr node);


          xmlRegisterNodeFunc
     xmlRegisterNodeDefault (xmlRegisterNodeFunc func);
          xmlDeregisterNodeFunc
     xmlDeregisterNodeDefault (xmlDeregisterNodeFunc func);
          xmlRegisterNodeFunc
            xmlThrDefRegisterNodeDefault(xmlRegisterNodeFunc func);
          xmlDeregisterNodeFunc
            xmlThrDefDeregisterNodeDefault(xmlDeregisterNodeFunc func);

__attribute__((deprecated)) xmlBufferAllocationScheme
            xmlThrDefBufferAllocScheme (xmlBufferAllocationScheme v);
__attribute__((deprecated)) int
            xmlThrDefDefaultBufferSize (int v);
# 16 "/usr/include/libxml2/libxml/parser.h" 2

# 1 "/usr/include/libxml2/libxml/dict.h" 1
# 14 "/usr/include/libxml2/libxml/dict.h"
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3
# 88 "/usr/bin/../lib/clang/19/include/stddef.h" 3
# 1 "/usr/bin/../lib/clang/19/include/__stddef_ptrdiff_t.h" 1 3
# 89 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3




# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3
# 103 "/usr/bin/../lib/clang/19/include/stddef.h" 3
# 1 "/usr/bin/../lib/clang/19/include/__stddef_wchar_t.h" 1 3
# 104 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3
# 128 "/usr/bin/../lib/clang/19/include/stddef.h" 3
# 1 "/usr/bin/../lib/clang/19/include/__stddef_offsetof.h" 1 3
# 129 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3
# 15 "/usr/include/libxml2/libxml/dict.h" 2
# 25 "/usr/include/libxml2/libxml/dict.h"
typedef struct _xmlDict xmlDict;
typedef xmlDict *xmlDictPtr;




__attribute__((deprecated))
          int xmlInitializeDict(void);




          xmlDictPtr
   xmlDictCreate (void);
          size_t
   xmlDictSetLimit (xmlDictPtr dict,
                                         size_t limit);
          size_t
   xmlDictGetUsage (xmlDictPtr dict);
          xmlDictPtr
   xmlDictCreateSub(xmlDictPtr sub);
          int
   xmlDictReference(xmlDictPtr dict);
          void
   xmlDictFree (xmlDictPtr dict);




          const xmlChar *
   xmlDictLookup (xmlDictPtr dict,
                           const xmlChar *name,
                           int len);
          const xmlChar *
   xmlDictExists (xmlDictPtr dict,
                           const xmlChar *name,
                           int len);
          const xmlChar *
   xmlDictQLookup (xmlDictPtr dict,
                           const xmlChar *prefix,
                           const xmlChar *name);
          int
   xmlDictOwns (xmlDictPtr dict,
      const xmlChar *str);
          int
   xmlDictSize (xmlDictPtr dict);




__attribute__((deprecated))
          void
                        xmlDictCleanup (void);
# 18 "/usr/include/libxml2/libxml/parser.h" 2
# 1 "/usr/include/libxml2/libxml/hash.h" 1
# 25 "/usr/include/libxml2/libxml/hash.h"
typedef struct _xmlHashTable xmlHashTable;
typedef xmlHashTable *xmlHashTablePtr;
# 60 "/usr/include/libxml2/libxml/hash.h"
typedef void (*xmlHashDeallocator)(void *payload, const xmlChar *name);
# 70 "/usr/include/libxml2/libxml/hash.h"
typedef void *(*xmlHashCopier)(void *payload, const xmlChar *name);
# 79 "/usr/include/libxml2/libxml/hash.h"
typedef void (*xmlHashScanner)(void *payload, void *data, const xmlChar *name);
# 90 "/usr/include/libxml2/libxml/hash.h"
typedef void (*xmlHashScannerFull)(void *payload, void *data,
       const xmlChar *name, const xmlChar *name2,
       const xmlChar *name3);




          xmlHashTablePtr
  xmlHashCreate (int size);
          xmlHashTablePtr
  xmlHashCreateDict (int size,
      xmlDictPtr dict);
          void
  xmlHashFree (xmlHashTablePtr hash,
      xmlHashDeallocator dealloc);
          void
  xmlHashDefaultDeallocator(void *entry,
      const xmlChar *name);




          int
  xmlHashAddEntry (xmlHashTablePtr hash,
                           const xmlChar *name,
                           void *userdata);
          int
  xmlHashUpdateEntry (xmlHashTablePtr hash,
                           const xmlChar *name,
                           void *userdata,
      xmlHashDeallocator dealloc);
          int
  xmlHashAddEntry2 (xmlHashTablePtr hash,
                           const xmlChar *name,
                           const xmlChar *name2,
                           void *userdata);
          int
  xmlHashUpdateEntry2 (xmlHashTablePtr hash,
                           const xmlChar *name,
                           const xmlChar *name2,
                           void *userdata,
      xmlHashDeallocator dealloc);
          int
  xmlHashAddEntry3 (xmlHashTablePtr hash,
                           const xmlChar *name,
                           const xmlChar *name2,
                           const xmlChar *name3,
                           void *userdata);
          int
  xmlHashUpdateEntry3 (xmlHashTablePtr hash,
                           const xmlChar *name,
                           const xmlChar *name2,
                           const xmlChar *name3,
                           void *userdata,
      xmlHashDeallocator dealloc);




          int
  xmlHashRemoveEntry (xmlHashTablePtr hash,
      const xmlChar *name,
      xmlHashDeallocator dealloc);
          int
  xmlHashRemoveEntry2 (xmlHashTablePtr hash,
      const xmlChar *name,
      const xmlChar *name2,
      xmlHashDeallocator dealloc);
          int
  xmlHashRemoveEntry3 (xmlHashTablePtr hash,
      const xmlChar *name,
      const xmlChar *name2,
      const xmlChar *name3,
      xmlHashDeallocator dealloc);




          void *
  xmlHashLookup (xmlHashTablePtr hash,
      const xmlChar *name);
          void *
  xmlHashLookup2 (xmlHashTablePtr hash,
      const xmlChar *name,
      const xmlChar *name2);
          void *
  xmlHashLookup3 (xmlHashTablePtr hash,
      const xmlChar *name,
      const xmlChar *name2,
      const xmlChar *name3);
          void *
  xmlHashQLookup (xmlHashTablePtr hash,
      const xmlChar *prefix,
      const xmlChar *name);
          void *
  xmlHashQLookup2 (xmlHashTablePtr hash,
      const xmlChar *prefix,
      const xmlChar *name,
      const xmlChar *prefix2,
      const xmlChar *name2);
          void *
  xmlHashQLookup3 (xmlHashTablePtr hash,
      const xmlChar *prefix,
      const xmlChar *name,
      const xmlChar *prefix2,
      const xmlChar *name2,
      const xmlChar *prefix3,
      const xmlChar *name3);




          xmlHashTablePtr
  xmlHashCopy (xmlHashTablePtr hash,
      xmlHashCopier copy);
          int
  xmlHashSize (xmlHashTablePtr hash);
          void
  xmlHashScan (xmlHashTablePtr hash,
      xmlHashScanner scan,
      void *data);
          void
  xmlHashScan3 (xmlHashTablePtr hash,
      const xmlChar *name,
      const xmlChar *name2,
      const xmlChar *name3,
      xmlHashScanner scan,
      void *data);
          void
  xmlHashScanFull (xmlHashTablePtr hash,
      xmlHashScannerFull scan,
      void *data);
          void
  xmlHashScanFull3 (xmlHashTablePtr hash,
      const xmlChar *name,
      const xmlChar *name2,
      const xmlChar *name3,
      xmlHashScannerFull scan,
      void *data);
# 19 "/usr/include/libxml2/libxml/parser.h" 2
# 1 "/usr/include/libxml2/libxml/valid.h" 1
# 15 "/usr/include/libxml2/libxml/valid.h"
# 1 "/usr/include/libxml2/libxml/xmlerror.h" 1
# 24 "/usr/include/libxml2/libxml/xmlerror.h"
typedef enum {
    XML_ERR_NONE = 0,
    XML_ERR_WARNING = 1,
    XML_ERR_ERROR = 2,
    XML_ERR_FATAL = 3
} xmlErrorLevel;






typedef enum {
    XML_FROM_NONE = 0,
    XML_FROM_PARSER,
    XML_FROM_TREE,
    XML_FROM_NAMESPACE,
    XML_FROM_DTD,
    XML_FROM_HTML,
    XML_FROM_MEMORY,
    XML_FROM_OUTPUT,
    XML_FROM_IO,
    XML_FROM_FTP,
    XML_FROM_HTTP,
    XML_FROM_XINCLUDE,
    XML_FROM_XPATH,
    XML_FROM_XPOINTER,
    XML_FROM_REGEXP,
    XML_FROM_DATATYPE,
    XML_FROM_SCHEMASP,
    XML_FROM_SCHEMASV,
    XML_FROM_RELAXNGP,
    XML_FROM_RELAXNGV,
    XML_FROM_CATALOG,
    XML_FROM_C14N,
    XML_FROM_XSLT,
    XML_FROM_VALID,
    XML_FROM_CHECK,
    XML_FROM_WRITER,
    XML_FROM_MODULE,
    XML_FROM_I18N,
    XML_FROM_SCHEMATRONV,
    XML_FROM_BUFFER,
    XML_FROM_URI
} xmlErrorDomain;







typedef struct _xmlError xmlError;
typedef xmlError *xmlErrorPtr;
struct _xmlError {
    int domain;
    int code;
    char *message;
    xmlErrorLevel level;
    char *file;
    int line;
    char *str1;
    char *str2;
    char *str3;
    int int1;
    int int2;
    void *ctxt;
    void *node;
};






typedef enum {
    XML_ERR_OK = 0,
    XML_ERR_INTERNAL_ERROR,
    XML_ERR_NO_MEMORY,
    XML_ERR_DOCUMENT_START,
    XML_ERR_DOCUMENT_EMPTY,
    XML_ERR_DOCUMENT_END,
    XML_ERR_INVALID_HEX_CHARREF,
    XML_ERR_INVALID_DEC_CHARREF,
    XML_ERR_INVALID_CHARREF,
    XML_ERR_INVALID_CHAR,
    XML_ERR_CHARREF_AT_EOF,
    XML_ERR_CHARREF_IN_PROLOG,
    XML_ERR_CHARREF_IN_EPILOG,
    XML_ERR_CHARREF_IN_DTD,
    XML_ERR_ENTITYREF_AT_EOF,
    XML_ERR_ENTITYREF_IN_PROLOG,
    XML_ERR_ENTITYREF_IN_EPILOG,
    XML_ERR_ENTITYREF_IN_DTD,
    XML_ERR_PEREF_AT_EOF,
    XML_ERR_PEREF_IN_PROLOG,
    XML_ERR_PEREF_IN_EPILOG,
    XML_ERR_PEREF_IN_INT_SUBSET,
    XML_ERR_ENTITYREF_NO_NAME,
    XML_ERR_ENTITYREF_SEMICOL_MISSING,
    XML_ERR_PEREF_NO_NAME,
    XML_ERR_PEREF_SEMICOL_MISSING,
    XML_ERR_UNDECLARED_ENTITY,
    XML_WAR_UNDECLARED_ENTITY,
    XML_ERR_UNPARSED_ENTITY,
    XML_ERR_ENTITY_IS_EXTERNAL,
    XML_ERR_ENTITY_IS_PARAMETER,
    XML_ERR_UNKNOWN_ENCODING,
    XML_ERR_UNSUPPORTED_ENCODING,
    XML_ERR_STRING_NOT_STARTED,
    XML_ERR_STRING_NOT_CLOSED,
    XML_ERR_NS_DECL_ERROR,
    XML_ERR_ENTITY_NOT_STARTED,
    XML_ERR_ENTITY_NOT_FINISHED,
    XML_ERR_LT_IN_ATTRIBUTE,
    XML_ERR_ATTRIBUTE_NOT_STARTED,
    XML_ERR_ATTRIBUTE_NOT_FINISHED,
    XML_ERR_ATTRIBUTE_WITHOUT_VALUE,
    XML_ERR_ATTRIBUTE_REDEFINED,
    XML_ERR_LITERAL_NOT_STARTED,
    XML_ERR_LITERAL_NOT_FINISHED,
    XML_ERR_COMMENT_NOT_FINISHED,
    XML_ERR_PI_NOT_STARTED,
    XML_ERR_PI_NOT_FINISHED,
    XML_ERR_NOTATION_NOT_STARTED,
    XML_ERR_NOTATION_NOT_FINISHED,
    XML_ERR_ATTLIST_NOT_STARTED,
    XML_ERR_ATTLIST_NOT_FINISHED,
    XML_ERR_MIXED_NOT_STARTED,
    XML_ERR_MIXED_NOT_FINISHED,
    XML_ERR_ELEMCONTENT_NOT_STARTED,
    XML_ERR_ELEMCONTENT_NOT_FINISHED,
    XML_ERR_XMLDECL_NOT_STARTED,
    XML_ERR_XMLDECL_NOT_FINISHED,
    XML_ERR_CONDSEC_NOT_STARTED,
    XML_ERR_CONDSEC_NOT_FINISHED,
    XML_ERR_EXT_SUBSET_NOT_FINISHED,
    XML_ERR_DOCTYPE_NOT_FINISHED,
    XML_ERR_MISPLACED_CDATA_END,
    XML_ERR_CDATA_NOT_FINISHED,
    XML_ERR_RESERVED_XML_NAME,
    XML_ERR_SPACE_REQUIRED,
    XML_ERR_SEPARATOR_REQUIRED,
    XML_ERR_NMTOKEN_REQUIRED,
    XML_ERR_NAME_REQUIRED,
    XML_ERR_PCDATA_REQUIRED,
    XML_ERR_URI_REQUIRED,
    XML_ERR_PUBID_REQUIRED,
    XML_ERR_LT_REQUIRED,
    XML_ERR_GT_REQUIRED,
    XML_ERR_LTSLASH_REQUIRED,
    XML_ERR_EQUAL_REQUIRED,
    XML_ERR_TAG_NAME_MISMATCH,
    XML_ERR_TAG_NOT_FINISHED,
    XML_ERR_STANDALONE_VALUE,
    XML_ERR_ENCODING_NAME,
    XML_ERR_HYPHEN_IN_COMMENT,
    XML_ERR_INVALID_ENCODING,
    XML_ERR_EXT_ENTITY_STANDALONE,
    XML_ERR_CONDSEC_INVALID,
    XML_ERR_VALUE_REQUIRED,
    XML_ERR_NOT_WELL_BALANCED,
    XML_ERR_EXTRA_CONTENT,
    XML_ERR_ENTITY_CHAR_ERROR,
    XML_ERR_ENTITY_PE_INTERNAL,
    XML_ERR_ENTITY_LOOP,
    XML_ERR_ENTITY_BOUNDARY,
    XML_ERR_INVALID_URI,
    XML_ERR_URI_FRAGMENT,
    XML_WAR_CATALOG_PI,
    XML_ERR_NO_DTD,
    XML_ERR_CONDSEC_INVALID_KEYWORD,
    XML_ERR_VERSION_MISSING,
    XML_WAR_UNKNOWN_VERSION,
    XML_WAR_LANG_VALUE,
    XML_WAR_NS_URI,
    XML_WAR_NS_URI_RELATIVE,
    XML_ERR_MISSING_ENCODING,
    XML_WAR_SPACE_VALUE,
    XML_ERR_NOT_STANDALONE,
    XML_ERR_ENTITY_PROCESSING,
    XML_ERR_NOTATION_PROCESSING,
    XML_WAR_NS_COLUMN,
    XML_WAR_ENTITY_REDEFINED,
    XML_ERR_UNKNOWN_VERSION,
    XML_ERR_VERSION_MISMATCH,
    XML_ERR_NAME_TOO_LONG,
    XML_ERR_USER_STOP,
    XML_ERR_COMMENT_ABRUPTLY_ENDED,
    XML_WAR_ENCODING_MISMATCH,
    XML_NS_ERR_XML_NAMESPACE = 200,
    XML_NS_ERR_UNDEFINED_NAMESPACE,
    XML_NS_ERR_QNAME,
    XML_NS_ERR_ATTRIBUTE_REDEFINED,
    XML_NS_ERR_EMPTY,
    XML_NS_ERR_COLON,
    XML_DTD_ATTRIBUTE_DEFAULT = 500,
    XML_DTD_ATTRIBUTE_REDEFINED,
    XML_DTD_ATTRIBUTE_VALUE,
    XML_DTD_CONTENT_ERROR,
    XML_DTD_CONTENT_MODEL,
    XML_DTD_CONTENT_NOT_DETERMINIST,
    XML_DTD_DIFFERENT_PREFIX,
    XML_DTD_ELEM_DEFAULT_NAMESPACE,
    XML_DTD_ELEM_NAMESPACE,
    XML_DTD_ELEM_REDEFINED,
    XML_DTD_EMPTY_NOTATION,
    XML_DTD_ENTITY_TYPE,
    XML_DTD_ID_FIXED,
    XML_DTD_ID_REDEFINED,
    XML_DTD_ID_SUBSET,
    XML_DTD_INVALID_CHILD,
    XML_DTD_INVALID_DEFAULT,
    XML_DTD_LOAD_ERROR,
    XML_DTD_MISSING_ATTRIBUTE,
    XML_DTD_MIXED_CORRUPT,
    XML_DTD_MULTIPLE_ID,
    XML_DTD_NO_DOC,
    XML_DTD_NO_DTD,
    XML_DTD_NO_ELEM_NAME,
    XML_DTD_NO_PREFIX,
    XML_DTD_NO_ROOT,
    XML_DTD_NOTATION_REDEFINED,
    XML_DTD_NOTATION_VALUE,
    XML_DTD_NOT_EMPTY,
    XML_DTD_NOT_PCDATA,
    XML_DTD_NOT_STANDALONE,
    XML_DTD_ROOT_NAME,
    XML_DTD_STANDALONE_WHITE_SPACE,
    XML_DTD_UNKNOWN_ATTRIBUTE,
    XML_DTD_UNKNOWN_ELEM,
    XML_DTD_UNKNOWN_ENTITY,
    XML_DTD_UNKNOWN_ID,
    XML_DTD_UNKNOWN_NOTATION,
    XML_DTD_STANDALONE_DEFAULTED,
    XML_DTD_XMLID_VALUE,
    XML_DTD_XMLID_TYPE,
    XML_DTD_DUP_TOKEN,
    XML_HTML_STRUCURE_ERROR = 800,
    XML_HTML_UNKNOWN_TAG,
    XML_HTML_INCORRECTLY_OPENED_COMMENT,
    XML_RNGP_ANYNAME_ATTR_ANCESTOR = 1000,
    XML_RNGP_ATTR_CONFLICT,
    XML_RNGP_ATTRIBUTE_CHILDREN,
    XML_RNGP_ATTRIBUTE_CONTENT,
    XML_RNGP_ATTRIBUTE_EMPTY,
    XML_RNGP_ATTRIBUTE_NOOP,
    XML_RNGP_CHOICE_CONTENT,
    XML_RNGP_CHOICE_EMPTY,
    XML_RNGP_CREATE_FAILURE,
    XML_RNGP_DATA_CONTENT,
    XML_RNGP_DEF_CHOICE_AND_INTERLEAVE,
    XML_RNGP_DEFINE_CREATE_FAILED,
    XML_RNGP_DEFINE_EMPTY,
    XML_RNGP_DEFINE_MISSING,
    XML_RNGP_DEFINE_NAME_MISSING,
    XML_RNGP_ELEM_CONTENT_EMPTY,
    XML_RNGP_ELEM_CONTENT_ERROR,
    XML_RNGP_ELEMENT_EMPTY,
    XML_RNGP_ELEMENT_CONTENT,
    XML_RNGP_ELEMENT_NAME,
    XML_RNGP_ELEMENT_NO_CONTENT,
    XML_RNGP_ELEM_TEXT_CONFLICT,
    XML_RNGP_EMPTY,
    XML_RNGP_EMPTY_CONSTRUCT,
    XML_RNGP_EMPTY_CONTENT,
    XML_RNGP_EMPTY_NOT_EMPTY,
    XML_RNGP_ERROR_TYPE_LIB,
    XML_RNGP_EXCEPT_EMPTY,
    XML_RNGP_EXCEPT_MISSING,
    XML_RNGP_EXCEPT_MULTIPLE,
    XML_RNGP_EXCEPT_NO_CONTENT,
    XML_RNGP_EXTERNALREF_EMTPY,
    XML_RNGP_EXTERNAL_REF_FAILURE,
    XML_RNGP_EXTERNALREF_RECURSE,
    XML_RNGP_FORBIDDEN_ATTRIBUTE,
    XML_RNGP_FOREIGN_ELEMENT,
    XML_RNGP_GRAMMAR_CONTENT,
    XML_RNGP_GRAMMAR_EMPTY,
    XML_RNGP_GRAMMAR_MISSING,
    XML_RNGP_GRAMMAR_NO_START,
    XML_RNGP_GROUP_ATTR_CONFLICT,
    XML_RNGP_HREF_ERROR,
    XML_RNGP_INCLUDE_EMPTY,
    XML_RNGP_INCLUDE_FAILURE,
    XML_RNGP_INCLUDE_RECURSE,
    XML_RNGP_INTERLEAVE_ADD,
    XML_RNGP_INTERLEAVE_CREATE_FAILED,
    XML_RNGP_INTERLEAVE_EMPTY,
    XML_RNGP_INTERLEAVE_NO_CONTENT,
    XML_RNGP_INVALID_DEFINE_NAME,
    XML_RNGP_INVALID_URI,
    XML_RNGP_INVALID_VALUE,
    XML_RNGP_MISSING_HREF,
    XML_RNGP_NAME_MISSING,
    XML_RNGP_NEED_COMBINE,
    XML_RNGP_NOTALLOWED_NOT_EMPTY,
    XML_RNGP_NSNAME_ATTR_ANCESTOR,
    XML_RNGP_NSNAME_NO_NS,
    XML_RNGP_PARAM_FORBIDDEN,
    XML_RNGP_PARAM_NAME_MISSING,
    XML_RNGP_PARENTREF_CREATE_FAILED,
    XML_RNGP_PARENTREF_NAME_INVALID,
    XML_RNGP_PARENTREF_NO_NAME,
    XML_RNGP_PARENTREF_NO_PARENT,
    XML_RNGP_PARENTREF_NOT_EMPTY,
    XML_RNGP_PARSE_ERROR,
    XML_RNGP_PAT_ANYNAME_EXCEPT_ANYNAME,
    XML_RNGP_PAT_ATTR_ATTR,
    XML_RNGP_PAT_ATTR_ELEM,
    XML_RNGP_PAT_DATA_EXCEPT_ATTR,
    XML_RNGP_PAT_DATA_EXCEPT_ELEM,
    XML_RNGP_PAT_DATA_EXCEPT_EMPTY,
    XML_RNGP_PAT_DATA_EXCEPT_GROUP,
    XML_RNGP_PAT_DATA_EXCEPT_INTERLEAVE,
    XML_RNGP_PAT_DATA_EXCEPT_LIST,
    XML_RNGP_PAT_DATA_EXCEPT_ONEMORE,
    XML_RNGP_PAT_DATA_EXCEPT_REF,
    XML_RNGP_PAT_DATA_EXCEPT_TEXT,
    XML_RNGP_PAT_LIST_ATTR,
    XML_RNGP_PAT_LIST_ELEM,
    XML_RNGP_PAT_LIST_INTERLEAVE,
    XML_RNGP_PAT_LIST_LIST,
    XML_RNGP_PAT_LIST_REF,
    XML_RNGP_PAT_LIST_TEXT,
    XML_RNGP_PAT_NSNAME_EXCEPT_ANYNAME,
    XML_RNGP_PAT_NSNAME_EXCEPT_NSNAME,
    XML_RNGP_PAT_ONEMORE_GROUP_ATTR,
    XML_RNGP_PAT_ONEMORE_INTERLEAVE_ATTR,
    XML_RNGP_PAT_START_ATTR,
    XML_RNGP_PAT_START_DATA,
    XML_RNGP_PAT_START_EMPTY,
    XML_RNGP_PAT_START_GROUP,
    XML_RNGP_PAT_START_INTERLEAVE,
    XML_RNGP_PAT_START_LIST,
    XML_RNGP_PAT_START_ONEMORE,
    XML_RNGP_PAT_START_TEXT,
    XML_RNGP_PAT_START_VALUE,
    XML_RNGP_PREFIX_UNDEFINED,
    XML_RNGP_REF_CREATE_FAILED,
    XML_RNGP_REF_CYCLE,
    XML_RNGP_REF_NAME_INVALID,
    XML_RNGP_REF_NO_DEF,
    XML_RNGP_REF_NO_NAME,
    XML_RNGP_REF_NOT_EMPTY,
    XML_RNGP_START_CHOICE_AND_INTERLEAVE,
    XML_RNGP_START_CONTENT,
    XML_RNGP_START_EMPTY,
    XML_RNGP_START_MISSING,
    XML_RNGP_TEXT_EXPECTED,
    XML_RNGP_TEXT_HAS_CHILD,
    XML_RNGP_TYPE_MISSING,
    XML_RNGP_TYPE_NOT_FOUND,
    XML_RNGP_TYPE_VALUE,
    XML_RNGP_UNKNOWN_ATTRIBUTE,
    XML_RNGP_UNKNOWN_COMBINE,
    XML_RNGP_UNKNOWN_CONSTRUCT,
    XML_RNGP_UNKNOWN_TYPE_LIB,
    XML_RNGP_URI_FRAGMENT,
    XML_RNGP_URI_NOT_ABSOLUTE,
    XML_RNGP_VALUE_EMPTY,
    XML_RNGP_VALUE_NO_CONTENT,
    XML_RNGP_XMLNS_NAME,
    XML_RNGP_XML_NS,
    XML_XPATH_EXPRESSION_OK = 1200,
    XML_XPATH_NUMBER_ERROR,
    XML_XPATH_UNFINISHED_LITERAL_ERROR,
    XML_XPATH_START_LITERAL_ERROR,
    XML_XPATH_VARIABLE_REF_ERROR,
    XML_XPATH_UNDEF_VARIABLE_ERROR,
    XML_XPATH_INVALID_PREDICATE_ERROR,
    XML_XPATH_EXPR_ERROR,
    XML_XPATH_UNCLOSED_ERROR,
    XML_XPATH_UNKNOWN_FUNC_ERROR,
    XML_XPATH_INVALID_OPERAND,
    XML_XPATH_INVALID_TYPE,
    XML_XPATH_INVALID_ARITY,
    XML_XPATH_INVALID_CTXT_SIZE,
    XML_XPATH_INVALID_CTXT_POSITION,
    XML_XPATH_MEMORY_ERROR,
    XML_XPTR_SYNTAX_ERROR,
    XML_XPTR_RESOURCE_ERROR,
    XML_XPTR_SUB_RESOURCE_ERROR,
    XML_XPATH_UNDEF_PREFIX_ERROR,
    XML_XPATH_ENCODING_ERROR,
    XML_XPATH_INVALID_CHAR_ERROR,
    XML_TREE_INVALID_HEX = 1300,
    XML_TREE_INVALID_DEC,
    XML_TREE_UNTERMINATED_ENTITY,
    XML_TREE_NOT_UTF8,
    XML_SAVE_NOT_UTF8 = 1400,
    XML_SAVE_CHAR_INVALID,
    XML_SAVE_NO_DOCTYPE,
    XML_SAVE_UNKNOWN_ENCODING,
    XML_REGEXP_COMPILE_ERROR = 1450,
    XML_IO_UNKNOWN = 1500,
    XML_IO_EACCES,
    XML_IO_EAGAIN,
    XML_IO_EBADF,
    XML_IO_EBADMSG,
    XML_IO_EBUSY,
    XML_IO_ECANCELED,
    XML_IO_ECHILD,
    XML_IO_EDEADLK,
    XML_IO_EDOM,
    XML_IO_EEXIST,
    XML_IO_EFAULT,
    XML_IO_EFBIG,
    XML_IO_EINPROGRESS,
    XML_IO_EINTR,
    XML_IO_EINVAL,
    XML_IO_EIO,
    XML_IO_EISDIR,
    XML_IO_EMFILE,
    XML_IO_EMLINK,
    XML_IO_EMSGSIZE,
    XML_IO_ENAMETOOLONG,
    XML_IO_ENFILE,
    XML_IO_ENODEV,
    XML_IO_ENOENT,
    XML_IO_ENOEXEC,
    XML_IO_ENOLCK,
    XML_IO_ENOMEM,
    XML_IO_ENOSPC,
    XML_IO_ENOSYS,
    XML_IO_ENOTDIR,
    XML_IO_ENOTEMPTY,
    XML_IO_ENOTSUP,
    XML_IO_ENOTTY,
    XML_IO_ENXIO,
    XML_IO_EPERM,
    XML_IO_EPIPE,
    XML_IO_ERANGE,
    XML_IO_EROFS,
    XML_IO_ESPIPE,
    XML_IO_ESRCH,
    XML_IO_ETIMEDOUT,
    XML_IO_EXDEV,
    XML_IO_NETWORK_ATTEMPT,
    XML_IO_ENCODER,
    XML_IO_FLUSH,
    XML_IO_WRITE,
    XML_IO_NO_INPUT,
    XML_IO_BUFFER_FULL,
    XML_IO_LOAD_ERROR,
    XML_IO_ENOTSOCK,
    XML_IO_EISCONN,
    XML_IO_ECONNREFUSED,
    XML_IO_ENETUNREACH,
    XML_IO_EADDRINUSE,
    XML_IO_EALREADY,
    XML_IO_EAFNOSUPPORT,
    XML_XINCLUDE_RECURSION=1600,
    XML_XINCLUDE_PARSE_VALUE,
    XML_XINCLUDE_ENTITY_DEF_MISMATCH,
    XML_XINCLUDE_NO_HREF,
    XML_XINCLUDE_NO_FALLBACK,
    XML_XINCLUDE_HREF_URI,
    XML_XINCLUDE_TEXT_FRAGMENT,
    XML_XINCLUDE_TEXT_DOCUMENT,
    XML_XINCLUDE_INVALID_CHAR,
    XML_XINCLUDE_BUILD_FAILED,
    XML_XINCLUDE_UNKNOWN_ENCODING,
    XML_XINCLUDE_MULTIPLE_ROOT,
    XML_XINCLUDE_XPTR_FAILED,
    XML_XINCLUDE_XPTR_RESULT,
    XML_XINCLUDE_INCLUDE_IN_INCLUDE,
    XML_XINCLUDE_FALLBACKS_IN_INCLUDE,
    XML_XINCLUDE_FALLBACK_NOT_IN_INCLUDE,
    XML_XINCLUDE_DEPRECATED_NS,
    XML_XINCLUDE_FRAGMENT_ID,
    XML_CATALOG_MISSING_ATTR = 1650,
    XML_CATALOG_ENTRY_BROKEN,
    XML_CATALOG_PREFER_VALUE,
    XML_CATALOG_NOT_CATALOG,
    XML_CATALOG_RECURSION,
    XML_SCHEMAP_PREFIX_UNDEFINED = 1700,
    XML_SCHEMAP_ATTRFORMDEFAULT_VALUE,
    XML_SCHEMAP_ATTRGRP_NONAME_NOREF,
    XML_SCHEMAP_ATTR_NONAME_NOREF,
    XML_SCHEMAP_COMPLEXTYPE_NONAME_NOREF,
    XML_SCHEMAP_ELEMFORMDEFAULT_VALUE,
    XML_SCHEMAP_ELEM_NONAME_NOREF,
    XML_SCHEMAP_EXTENSION_NO_BASE,
    XML_SCHEMAP_FACET_NO_VALUE,
    XML_SCHEMAP_FAILED_BUILD_IMPORT,
    XML_SCHEMAP_GROUP_NONAME_NOREF,
    XML_SCHEMAP_IMPORT_NAMESPACE_NOT_URI,
    XML_SCHEMAP_IMPORT_REDEFINE_NSNAME,
    XML_SCHEMAP_IMPORT_SCHEMA_NOT_URI,
    XML_SCHEMAP_INVALID_BOOLEAN,
    XML_SCHEMAP_INVALID_ENUM,
    XML_SCHEMAP_INVALID_FACET,
    XML_SCHEMAP_INVALID_FACET_VALUE,
    XML_SCHEMAP_INVALID_MAXOCCURS,
    XML_SCHEMAP_INVALID_MINOCCURS,
    XML_SCHEMAP_INVALID_REF_AND_SUBTYPE,
    XML_SCHEMAP_INVALID_WHITE_SPACE,
    XML_SCHEMAP_NOATTR_NOREF,
    XML_SCHEMAP_NOTATION_NO_NAME,
    XML_SCHEMAP_NOTYPE_NOREF,
    XML_SCHEMAP_REF_AND_SUBTYPE,
    XML_SCHEMAP_RESTRICTION_NONAME_NOREF,
    XML_SCHEMAP_SIMPLETYPE_NONAME,
    XML_SCHEMAP_TYPE_AND_SUBTYPE,
    XML_SCHEMAP_UNKNOWN_ALL_CHILD,
    XML_SCHEMAP_UNKNOWN_ANYATTRIBUTE_CHILD,
    XML_SCHEMAP_UNKNOWN_ATTR_CHILD,
    XML_SCHEMAP_UNKNOWN_ATTRGRP_CHILD,
    XML_SCHEMAP_UNKNOWN_ATTRIBUTE_GROUP,
    XML_SCHEMAP_UNKNOWN_BASE_TYPE,
    XML_SCHEMAP_UNKNOWN_CHOICE_CHILD,
    XML_SCHEMAP_UNKNOWN_COMPLEXCONTENT_CHILD,
    XML_SCHEMAP_UNKNOWN_COMPLEXTYPE_CHILD,
    XML_SCHEMAP_UNKNOWN_ELEM_CHILD,
    XML_SCHEMAP_UNKNOWN_EXTENSION_CHILD,
    XML_SCHEMAP_UNKNOWN_FACET_CHILD,
    XML_SCHEMAP_UNKNOWN_FACET_TYPE,
    XML_SCHEMAP_UNKNOWN_GROUP_CHILD,
    XML_SCHEMAP_UNKNOWN_IMPORT_CHILD,
    XML_SCHEMAP_UNKNOWN_LIST_CHILD,
    XML_SCHEMAP_UNKNOWN_NOTATION_CHILD,
    XML_SCHEMAP_UNKNOWN_PROCESSCONTENT_CHILD,
    XML_SCHEMAP_UNKNOWN_REF,
    XML_SCHEMAP_UNKNOWN_RESTRICTION_CHILD,
    XML_SCHEMAP_UNKNOWN_SCHEMAS_CHILD,
    XML_SCHEMAP_UNKNOWN_SEQUENCE_CHILD,
    XML_SCHEMAP_UNKNOWN_SIMPLECONTENT_CHILD,
    XML_SCHEMAP_UNKNOWN_SIMPLETYPE_CHILD,
    XML_SCHEMAP_UNKNOWN_TYPE,
    XML_SCHEMAP_UNKNOWN_UNION_CHILD,
    XML_SCHEMAP_ELEM_DEFAULT_FIXED,
    XML_SCHEMAP_REGEXP_INVALID,
    XML_SCHEMAP_FAILED_LOAD,
    XML_SCHEMAP_NOTHING_TO_PARSE,
    XML_SCHEMAP_NOROOT,
    XML_SCHEMAP_REDEFINED_GROUP,
    XML_SCHEMAP_REDEFINED_TYPE,
    XML_SCHEMAP_REDEFINED_ELEMENT,
    XML_SCHEMAP_REDEFINED_ATTRGROUP,
    XML_SCHEMAP_REDEFINED_ATTR,
    XML_SCHEMAP_REDEFINED_NOTATION,
    XML_SCHEMAP_FAILED_PARSE,
    XML_SCHEMAP_UNKNOWN_PREFIX,
    XML_SCHEMAP_DEF_AND_PREFIX,
    XML_SCHEMAP_UNKNOWN_INCLUDE_CHILD,
    XML_SCHEMAP_INCLUDE_SCHEMA_NOT_URI,
    XML_SCHEMAP_INCLUDE_SCHEMA_NO_URI,
    XML_SCHEMAP_NOT_SCHEMA,
    XML_SCHEMAP_UNKNOWN_MEMBER_TYPE,
    XML_SCHEMAP_INVALID_ATTR_USE,
    XML_SCHEMAP_RECURSIVE,
    XML_SCHEMAP_SUPERNUMEROUS_LIST_ITEM_TYPE,
    XML_SCHEMAP_INVALID_ATTR_COMBINATION,
    XML_SCHEMAP_INVALID_ATTR_INLINE_COMBINATION,
    XML_SCHEMAP_MISSING_SIMPLETYPE_CHILD,
    XML_SCHEMAP_INVALID_ATTR_NAME,
    XML_SCHEMAP_REF_AND_CONTENT,
    XML_SCHEMAP_CT_PROPS_CORRECT_1,
    XML_SCHEMAP_CT_PROPS_CORRECT_2,
    XML_SCHEMAP_CT_PROPS_CORRECT_3,
    XML_SCHEMAP_CT_PROPS_CORRECT_4,
    XML_SCHEMAP_CT_PROPS_CORRECT_5,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_1,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_1,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_2,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_2,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_3,
    XML_SCHEMAP_WILDCARD_INVALID_NS_MEMBER,
    XML_SCHEMAP_INTERSECTION_NOT_EXPRESSIBLE,
    XML_SCHEMAP_UNION_NOT_EXPRESSIBLE,
    XML_SCHEMAP_SRC_IMPORT_3_1,
    XML_SCHEMAP_SRC_IMPORT_3_2,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_1,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_2,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_3,
    XML_SCHEMAP_COS_CT_EXTENDS_1_3,
    XML_SCHEMAV_NOROOT = 1801,
    XML_SCHEMAV_UNDECLAREDELEM,
    XML_SCHEMAV_NOTTOPLEVEL,
    XML_SCHEMAV_MISSING,
    XML_SCHEMAV_WRONGELEM,
    XML_SCHEMAV_NOTYPE,
    XML_SCHEMAV_NOROLLBACK,
    XML_SCHEMAV_ISABSTRACT,
    XML_SCHEMAV_NOTEMPTY,
    XML_SCHEMAV_ELEMCONT,
    XML_SCHEMAV_HAVEDEFAULT,
    XML_SCHEMAV_NOTNILLABLE,
    XML_SCHEMAV_EXTRACONTENT,
    XML_SCHEMAV_INVALIDATTR,
    XML_SCHEMAV_INVALIDELEM,
    XML_SCHEMAV_NOTDETERMINIST,
    XML_SCHEMAV_CONSTRUCT,
    XML_SCHEMAV_INTERNAL,
    XML_SCHEMAV_NOTSIMPLE,
    XML_SCHEMAV_ATTRUNKNOWN,
    XML_SCHEMAV_ATTRINVALID,
    XML_SCHEMAV_VALUE,
    XML_SCHEMAV_FACET,
    XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_1,
    XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_2,
    XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_3,
    XML_SCHEMAV_CVC_TYPE_3_1_1,
    XML_SCHEMAV_CVC_TYPE_3_1_2,
    XML_SCHEMAV_CVC_FACET_VALID,
    XML_SCHEMAV_CVC_LENGTH_VALID,
    XML_SCHEMAV_CVC_MINLENGTH_VALID,
    XML_SCHEMAV_CVC_MAXLENGTH_VALID,
    XML_SCHEMAV_CVC_MININCLUSIVE_VALID,
    XML_SCHEMAV_CVC_MAXINCLUSIVE_VALID,
    XML_SCHEMAV_CVC_MINEXCLUSIVE_VALID,
    XML_SCHEMAV_CVC_MAXEXCLUSIVE_VALID,
    XML_SCHEMAV_CVC_TOTALDIGITS_VALID,
    XML_SCHEMAV_CVC_FRACTIONDIGITS_VALID,
    XML_SCHEMAV_CVC_PATTERN_VALID,
    XML_SCHEMAV_CVC_ENUMERATION_VALID,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_2_1,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_2_2,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_2_3,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_2_4,
    XML_SCHEMAV_CVC_ELT_1,
    XML_SCHEMAV_CVC_ELT_2,
    XML_SCHEMAV_CVC_ELT_3_1,
    XML_SCHEMAV_CVC_ELT_3_2_1,
    XML_SCHEMAV_CVC_ELT_3_2_2,
    XML_SCHEMAV_CVC_ELT_4_1,
    XML_SCHEMAV_CVC_ELT_4_2,
    XML_SCHEMAV_CVC_ELT_4_3,
    XML_SCHEMAV_CVC_ELT_5_1_1,
    XML_SCHEMAV_CVC_ELT_5_1_2,
    XML_SCHEMAV_CVC_ELT_5_2_1,
    XML_SCHEMAV_CVC_ELT_5_2_2_1,
    XML_SCHEMAV_CVC_ELT_5_2_2_2_1,
    XML_SCHEMAV_CVC_ELT_5_2_2_2_2,
    XML_SCHEMAV_CVC_ELT_6,
    XML_SCHEMAV_CVC_ELT_7,
    XML_SCHEMAV_CVC_ATTRIBUTE_1,
    XML_SCHEMAV_CVC_ATTRIBUTE_2,
    XML_SCHEMAV_CVC_ATTRIBUTE_3,
    XML_SCHEMAV_CVC_ATTRIBUTE_4,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_3_1,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_1,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_2,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_4,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_5_1,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_5_2,
    XML_SCHEMAV_ELEMENT_CONTENT,
    XML_SCHEMAV_DOCUMENT_ELEMENT_MISSING,
    XML_SCHEMAV_CVC_COMPLEX_TYPE_1,
    XML_SCHEMAV_CVC_AU,
    XML_SCHEMAV_CVC_TYPE_1,
    XML_SCHEMAV_CVC_TYPE_2,
    XML_SCHEMAV_CVC_IDC,
    XML_SCHEMAV_CVC_WILDCARD,
    XML_SCHEMAV_MISC,
    XML_XPTR_UNKNOWN_SCHEME = 1900,
    XML_XPTR_CHILDSEQ_START,
    XML_XPTR_EVAL_FAILED,
    XML_XPTR_EXTRA_OBJECTS,
    XML_C14N_CREATE_CTXT = 1950,
    XML_C14N_REQUIRES_UTF8,
    XML_C14N_CREATE_STACK,
    XML_C14N_INVALID_NODE,
    XML_C14N_UNKNOW_NODE,
    XML_C14N_RELATIVE_NAMESPACE,
    XML_FTP_PASV_ANSWER = 2000,
    XML_FTP_EPSV_ANSWER,
    XML_FTP_ACCNT,
    XML_FTP_URL_SYNTAX,
    XML_HTTP_URL_SYNTAX = 2020,
    XML_HTTP_USE_IP,
    XML_HTTP_UNKNOWN_HOST,
    XML_SCHEMAP_SRC_SIMPLE_TYPE_1 = 3000,
    XML_SCHEMAP_SRC_SIMPLE_TYPE_2,
    XML_SCHEMAP_SRC_SIMPLE_TYPE_3,
    XML_SCHEMAP_SRC_SIMPLE_TYPE_4,
    XML_SCHEMAP_SRC_RESOLVE,
    XML_SCHEMAP_SRC_RESTRICTION_BASE_OR_SIMPLETYPE,
    XML_SCHEMAP_SRC_LIST_ITEMTYPE_OR_SIMPLETYPE,
    XML_SCHEMAP_SRC_UNION_MEMBERTYPES_OR_SIMPLETYPES,
    XML_SCHEMAP_ST_PROPS_CORRECT_1,
    XML_SCHEMAP_ST_PROPS_CORRECT_2,
    XML_SCHEMAP_ST_PROPS_CORRECT_3,
    XML_SCHEMAP_COS_ST_RESTRICTS_1_1,
    XML_SCHEMAP_COS_ST_RESTRICTS_1_2,
    XML_SCHEMAP_COS_ST_RESTRICTS_1_3_1,
    XML_SCHEMAP_COS_ST_RESTRICTS_1_3_2,
    XML_SCHEMAP_COS_ST_RESTRICTS_2_1,
    XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_1,
    XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_2,
    XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_1,
    XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_2,
    XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_3,
    XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_4,
    XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_5,
    XML_SCHEMAP_COS_ST_RESTRICTS_3_1,
    XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1,
    XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1_2,
    XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_2,
    XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_1,
    XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_3,
    XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_4,
    XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_5,
    XML_SCHEMAP_COS_ST_DERIVED_OK_2_1,
    XML_SCHEMAP_COS_ST_DERIVED_OK_2_2,
    XML_SCHEMAP_S4S_ELEM_NOT_ALLOWED,
    XML_SCHEMAP_S4S_ELEM_MISSING,
    XML_SCHEMAP_S4S_ATTR_NOT_ALLOWED,
    XML_SCHEMAP_S4S_ATTR_MISSING,
    XML_SCHEMAP_S4S_ATTR_INVALID_VALUE,
    XML_SCHEMAP_SRC_ELEMENT_1,
    XML_SCHEMAP_SRC_ELEMENT_2_1,
    XML_SCHEMAP_SRC_ELEMENT_2_2,
    XML_SCHEMAP_SRC_ELEMENT_3,
    XML_SCHEMAP_P_PROPS_CORRECT_1,
    XML_SCHEMAP_P_PROPS_CORRECT_2_1,
    XML_SCHEMAP_P_PROPS_CORRECT_2_2,
    XML_SCHEMAP_E_PROPS_CORRECT_2,
    XML_SCHEMAP_E_PROPS_CORRECT_3,
    XML_SCHEMAP_E_PROPS_CORRECT_4,
    XML_SCHEMAP_E_PROPS_CORRECT_5,
    XML_SCHEMAP_E_PROPS_CORRECT_6,
    XML_SCHEMAP_SRC_INCLUDE,
    XML_SCHEMAP_SRC_ATTRIBUTE_1,
    XML_SCHEMAP_SRC_ATTRIBUTE_2,
    XML_SCHEMAP_SRC_ATTRIBUTE_3_1,
    XML_SCHEMAP_SRC_ATTRIBUTE_3_2,
    XML_SCHEMAP_SRC_ATTRIBUTE_4,
    XML_SCHEMAP_NO_XMLNS,
    XML_SCHEMAP_NO_XSI,
    XML_SCHEMAP_COS_VALID_DEFAULT_1,
    XML_SCHEMAP_COS_VALID_DEFAULT_2_1,
    XML_SCHEMAP_COS_VALID_DEFAULT_2_2_1,
    XML_SCHEMAP_COS_VALID_DEFAULT_2_2_2,
    XML_SCHEMAP_CVC_SIMPLE_TYPE,
    XML_SCHEMAP_COS_CT_EXTENDS_1_1,
    XML_SCHEMAP_SRC_IMPORT_1_1,
    XML_SCHEMAP_SRC_IMPORT_1_2,
    XML_SCHEMAP_SRC_IMPORT_2,
    XML_SCHEMAP_SRC_IMPORT_2_1,
    XML_SCHEMAP_SRC_IMPORT_2_2,
    XML_SCHEMAP_INTERNAL,
    XML_SCHEMAP_NOT_DETERMINISTIC,
    XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_1,
    XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_2,
    XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_3,
    XML_SCHEMAP_MG_PROPS_CORRECT_1,
    XML_SCHEMAP_MG_PROPS_CORRECT_2,
    XML_SCHEMAP_SRC_CT_1,
    XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_3,
    XML_SCHEMAP_AU_PROPS_CORRECT_2,
    XML_SCHEMAP_A_PROPS_CORRECT_2,
    XML_SCHEMAP_C_PROPS_CORRECT,
    XML_SCHEMAP_SRC_REDEFINE,
    XML_SCHEMAP_SRC_IMPORT,
    XML_SCHEMAP_WARN_SKIP_SCHEMA,
    XML_SCHEMAP_WARN_UNLOCATED_SCHEMA,
    XML_SCHEMAP_WARN_ATTR_REDECL_PROH,
    XML_SCHEMAP_WARN_ATTR_POINTLESS_PROH,
    XML_SCHEMAP_AG_PROPS_CORRECT,
    XML_SCHEMAP_COS_CT_EXTENDS_1_2,
    XML_SCHEMAP_AU_PROPS_CORRECT,
    XML_SCHEMAP_A_PROPS_CORRECT_3,
    XML_SCHEMAP_COS_ALL_LIMITED,
    XML_SCHEMATRONV_ASSERT = 4000,
    XML_SCHEMATRONV_REPORT,
    XML_MODULE_OPEN = 4900,
    XML_MODULE_CLOSE,
    XML_CHECK_FOUND_ELEMENT = 5000,
    XML_CHECK_FOUND_ATTRIBUTE,
    XML_CHECK_FOUND_TEXT,
    XML_CHECK_FOUND_CDATA,
    XML_CHECK_FOUND_ENTITYREF,
    XML_CHECK_FOUND_ENTITY,
    XML_CHECK_FOUND_PI,
    XML_CHECK_FOUND_COMMENT,
    XML_CHECK_FOUND_DOCTYPE,
    XML_CHECK_FOUND_FRAGMENT,
    XML_CHECK_FOUND_NOTATION,
    XML_CHECK_UNKNOWN_NODE,
    XML_CHECK_ENTITY_TYPE,
    XML_CHECK_NO_PARENT,
    XML_CHECK_NO_DOC,
    XML_CHECK_NO_NAME,
    XML_CHECK_NO_ELEM,
    XML_CHECK_WRONG_DOC,
    XML_CHECK_NO_PREV,
    XML_CHECK_WRONG_PREV,
    XML_CHECK_NO_NEXT,
    XML_CHECK_WRONG_NEXT,
    XML_CHECK_NOT_DTD,
    XML_CHECK_NOT_ATTR,
    XML_CHECK_NOT_ATTR_DECL,
    XML_CHECK_NOT_ELEM_DECL,
    XML_CHECK_NOT_ENTITY_DECL,
    XML_CHECK_NOT_NS_DECL,
    XML_CHECK_NO_HREF,
    XML_CHECK_WRONG_PARENT,
    XML_CHECK_NS_SCOPE,
    XML_CHECK_NS_ANCESTOR,
    XML_CHECK_NOT_UTF8,
    XML_CHECK_NO_DICT,
    XML_CHECK_NOT_NCNAME,
    XML_CHECK_OUTSIDE_DICT,
    XML_CHECK_WRONG_NAME,
    XML_CHECK_NAME_NOT_NULL,
    XML_I18N_NO_NAME = 6000,
    XML_I18N_NO_HANDLER,
    XML_I18N_EXCESS_HANDLER,
    XML_I18N_CONV_FAILED,
    XML_I18N_NO_OUTPUT,
    XML_BUF_OVERFLOW = 7000
} xmlParserErrors;
# 848 "/usr/include/libxml2/libxml/xmlerror.h"
typedef void (*xmlGenericErrorFunc) (void *ctx,
     const char *msg,
     ...) __attribute__((__format__(__printf__,2,3)));
# 859 "/usr/include/libxml2/libxml/xmlerror.h"
typedef void (*xmlStructuredErrorFunc) (void *userData, const xmlError *error);
# 870 "/usr/include/libxml2/libxml/xmlerror.h"
__attribute__((deprecated)) xmlError *__xmlLastError(void); xmlGenericErrorFunc *__xmlGenericError(void); void * *__xmlGenericErrorContext(void); xmlStructuredErrorFunc *__xmlStructuredError(void); void * *__xmlStructuredErrorContext(void);
# 886 "/usr/include/libxml2/libxml/xmlerror.h"
          void
    xmlSetGenericErrorFunc (void *ctx,
     xmlGenericErrorFunc handler);
          void
    xmlThrDefSetGenericErrorFunc(void *ctx,
                                 xmlGenericErrorFunc handler);
__attribute__((deprecated))
          void
    initGenericErrorDefaultFunc (xmlGenericErrorFunc *handler);

          void
    xmlSetStructuredErrorFunc (void *ctx,
     xmlStructuredErrorFunc handler);
          void
    xmlThrDefSetStructuredErrorFunc(void *ctx,
                                 xmlStructuredErrorFunc handler);




          void
    xmlParserError (void *ctx,
     const char *msg,
     ...) __attribute__((__format__(__printf__,2,3)));
          void
    xmlParserWarning (void *ctx,
     const char *msg,
     ...) __attribute__((__format__(__printf__,2,3)));
          void
    xmlParserValidityError (void *ctx,
     const char *msg,
     ...) __attribute__((__format__(__printf__,2,3)));
          void
    xmlParserValidityWarning (void *ctx,
     const char *msg,
     ...) __attribute__((__format__(__printf__,2,3)));
struct _xmlParserInput;
          void
    xmlParserPrintFileInfo (struct _xmlParserInput *input);
          void
    xmlParserPrintFileContext (struct _xmlParserInput *input);




          const xmlError *
    xmlGetLastError (void);
          void
    xmlResetLastError (void);
          const xmlError *
    xmlCtxtGetLastError (void *ctx);
          void
    xmlCtxtResetLastError (void *ctx);
          void
    xmlResetError (xmlErrorPtr err);
          int
    xmlCopyError (const xmlError *from,
     xmlErrorPtr to);
# 16 "/usr/include/libxml2/libxml/valid.h" 2

# 1 "/usr/include/libxml2/libxml/tree.h" 1
# 18 "/usr/include/libxml2/libxml/valid.h" 2

# 1 "/usr/include/libxml2/libxml/list.h" 1
# 20 "/usr/include/libxml2/libxml/list.h"
typedef struct _xmlLink xmlLink;
typedef xmlLink *xmlLinkPtr;

typedef struct _xmlList xmlList;
typedef xmlList *xmlListPtr;







typedef void (*xmlListDeallocator) (xmlLinkPtr lk);
# 42 "/usr/include/libxml2/libxml/list.h"
typedef int (*xmlListDataCompare) (const void *data0, const void *data1);
# 52 "/usr/include/libxml2/libxml/list.h"
typedef int (*xmlListWalker) (const void *data, void *user);


          xmlListPtr
  xmlListCreate (xmlListDeallocator deallocator,
                                  xmlListDataCompare compare);
          void
  xmlListDelete (xmlListPtr l);


          void *
  xmlListSearch (xmlListPtr l,
      void *data);
          void *
  xmlListReverseSearch (xmlListPtr l,
      void *data);
          int
  xmlListInsert (xmlListPtr l,
      void *data) ;
          int
  xmlListAppend (xmlListPtr l,
      void *data) ;
          int
  xmlListRemoveFirst (xmlListPtr l,
      void *data);
          int
  xmlListRemoveLast (xmlListPtr l,
      void *data);
          int
  xmlListRemoveAll (xmlListPtr l,
      void *data);
          void
  xmlListClear (xmlListPtr l);
          int
  xmlListEmpty (xmlListPtr l);
          xmlLinkPtr
  xmlListFront (xmlListPtr l);
          xmlLinkPtr
  xmlListEnd (xmlListPtr l);
          int
  xmlListSize (xmlListPtr l);

          void
  xmlListPopFront (xmlListPtr l);
          void
  xmlListPopBack (xmlListPtr l);
          int
  xmlListPushFront (xmlListPtr l,
      void *data);
          int
  xmlListPushBack (xmlListPtr l,
      void *data);


          void
  xmlListReverse (xmlListPtr l);
          void
  xmlListSort (xmlListPtr l);
          void
  xmlListWalk (xmlListPtr l,
      xmlListWalker walker,
      void *user);
          void
  xmlListReverseWalk (xmlListPtr l,
      xmlListWalker walker,
      void *user);
          void
  xmlListMerge (xmlListPtr l1,
      xmlListPtr l2);
          xmlListPtr
  xmlListDup (const xmlListPtr old);
          int
  xmlListCopy (xmlListPtr cur,
      const xmlListPtr old);

          void *
  xmlLinkGetData (xmlLinkPtr lk);
# 20 "/usr/include/libxml2/libxml/valid.h" 2
# 1 "/usr/include/libxml2/libxml/xmlautomata.h" 1
# 29 "/usr/include/libxml2/libxml/xmlautomata.h"
typedef struct _xmlAutomata xmlAutomata;
typedef xmlAutomata *xmlAutomataPtr;






typedef struct _xmlAutomataState xmlAutomataState;
typedef xmlAutomataState *xmlAutomataStatePtr;




          xmlAutomataPtr
      xmlNewAutomata (void);
          void
      xmlFreeAutomata (xmlAutomataPtr am);

          xmlAutomataStatePtr
      xmlAutomataGetInitState (xmlAutomataPtr am);
          int
      xmlAutomataSetFinalState (xmlAutomataPtr am,
       xmlAutomataStatePtr state);
          xmlAutomataStatePtr
      xmlAutomataNewState (xmlAutomataPtr am);
          xmlAutomataStatePtr
      xmlAutomataNewTransition (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       const xmlChar *token,
       void *data);
          xmlAutomataStatePtr
      xmlAutomataNewTransition2 (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       const xmlChar *token,
       const xmlChar *token2,
       void *data);
          xmlAutomataStatePtr
                    xmlAutomataNewNegTrans (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       const xmlChar *token,
       const xmlChar *token2,
       void *data);

          xmlAutomataStatePtr
      xmlAutomataNewCountTrans (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       const xmlChar *token,
       int min,
       int max,
       void *data);
          xmlAutomataStatePtr
      xmlAutomataNewCountTrans2 (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       const xmlChar *token,
       const xmlChar *token2,
       int min,
       int max,
       void *data);
          xmlAutomataStatePtr
      xmlAutomataNewOnceTrans (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       const xmlChar *token,
       int min,
       int max,
       void *data);
          xmlAutomataStatePtr
      xmlAutomataNewOnceTrans2 (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       const xmlChar *token,
       const xmlChar *token2,
       int min,
       int max,
       void *data);
          xmlAutomataStatePtr
      xmlAutomataNewAllTrans (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       int lax);
          xmlAutomataStatePtr
      xmlAutomataNewEpsilon (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to);
          xmlAutomataStatePtr
      xmlAutomataNewCountedTrans (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       int counter);
          xmlAutomataStatePtr
      xmlAutomataNewCounterTrans (xmlAutomataPtr am,
       xmlAutomataStatePtr from,
       xmlAutomataStatePtr to,
       int counter);
          int
      xmlAutomataNewCounter (xmlAutomataPtr am,
       int min,
       int max);

          struct _xmlRegexp *
      xmlAutomataCompile (xmlAutomataPtr am);
          int
      xmlAutomataIsDeterminist (xmlAutomataPtr am);
# 21 "/usr/include/libxml2/libxml/valid.h" 2
# 30 "/usr/include/libxml2/libxml/valid.h"
typedef struct _xmlValidState xmlValidState;
typedef xmlValidState *xmlValidStatePtr;
# 44 "/usr/include/libxml2/libxml/valid.h"
typedef void (*xmlValidityErrorFunc) (void *ctx,
        const char *msg,
        ...) __attribute__((__format__(__printf__,2,3)));
# 59 "/usr/include/libxml2/libxml/valid.h"
typedef void (*xmlValidityWarningFunc) (void *ctx,
          const char *msg,
          ...) __attribute__((__format__(__printf__,2,3)));





typedef struct _xmlValidCtxt xmlValidCtxt;
typedef xmlValidCtxt *xmlValidCtxtPtr;
struct _xmlValidCtxt {
    void *userData;
    xmlValidityErrorFunc error;
    xmlValidityWarningFunc warning;


    xmlNodePtr node;
    int nodeNr;
    int nodeMax;
    xmlNodePtr *nodeTab;

    unsigned int flags;
    xmlDocPtr doc;
    int valid;


    xmlValidState *vstate;
    int vstateNr;
    int vstateMax;
    xmlValidState *vstateTab;


    xmlAutomataPtr am;
    xmlAutomataStatePtr state;




};






typedef struct _xmlHashTable xmlNotationTable;
typedef xmlNotationTable *xmlNotationTablePtr;






typedef struct _xmlHashTable xmlElementTable;
typedef xmlElementTable *xmlElementTablePtr;






typedef struct _xmlHashTable xmlAttributeTable;
typedef xmlAttributeTable *xmlAttributeTablePtr;






typedef struct _xmlHashTable xmlIDTable;
typedef xmlIDTable *xmlIDTablePtr;






typedef struct _xmlHashTable xmlRefTable;
typedef xmlRefTable *xmlRefTablePtr;


          xmlNotationPtr
  xmlAddNotationDecl (xmlValidCtxtPtr ctxt,
      xmlDtdPtr dtd,
      const xmlChar *name,
      const xmlChar *PublicID,
      const xmlChar *SystemID);

          xmlNotationTablePtr
  xmlCopyNotationTable (xmlNotationTablePtr table);

          void
  xmlFreeNotationTable (xmlNotationTablePtr table);

          void
  xmlDumpNotationDecl (xmlBufferPtr buf,
      xmlNotationPtr nota);
          void
  xmlDumpNotationTable (xmlBufferPtr buf,
      xmlNotationTablePtr table);




          xmlElementContentPtr
  xmlNewElementContent (const xmlChar *name,
      xmlElementContentType type);
          xmlElementContentPtr
  xmlCopyElementContent (xmlElementContentPtr content);
          void
  xmlFreeElementContent (xmlElementContentPtr cur);

          xmlElementContentPtr
  xmlNewDocElementContent (xmlDocPtr doc,
      const xmlChar *name,
      xmlElementContentType type);
          xmlElementContentPtr
  xmlCopyDocElementContent(xmlDocPtr doc,
      xmlElementContentPtr content);
          void
  xmlFreeDocElementContent(xmlDocPtr doc,
      xmlElementContentPtr cur);
          void
  xmlSnprintfElementContent(char *buf,
      int size,
                                  xmlElementContentPtr content,
      int englob);


          void
  xmlSprintfElementContent(char *buf,
                                  xmlElementContentPtr content,
      int englob);




          xmlElementPtr
  xmlAddElementDecl (xmlValidCtxtPtr ctxt,
      xmlDtdPtr dtd,
      const xmlChar *name,
      xmlElementTypeVal type,
      xmlElementContentPtr content);

          xmlElementTablePtr
  xmlCopyElementTable (xmlElementTablePtr table);

          void
  xmlFreeElementTable (xmlElementTablePtr table);

          void
  xmlDumpElementTable (xmlBufferPtr buf,
      xmlElementTablePtr table);
          void
  xmlDumpElementDecl (xmlBufferPtr buf,
      xmlElementPtr elem);



          xmlEnumerationPtr
  xmlCreateEnumeration (const xmlChar *name);
          void
  xmlFreeEnumeration (xmlEnumerationPtr cur);

          xmlEnumerationPtr
  xmlCopyEnumeration (xmlEnumerationPtr cur);



          xmlAttributePtr
  xmlAddAttributeDecl (xmlValidCtxtPtr ctxt,
      xmlDtdPtr dtd,
      const xmlChar *elem,
      const xmlChar *name,
      const xmlChar *ns,
      xmlAttributeType type,
      xmlAttributeDefault def,
      const xmlChar *defaultValue,
      xmlEnumerationPtr tree);

          xmlAttributeTablePtr
  xmlCopyAttributeTable (xmlAttributeTablePtr table);

          void
  xmlFreeAttributeTable (xmlAttributeTablePtr table);

          void
  xmlDumpAttributeTable (xmlBufferPtr buf,
     xmlAttributeTablePtr table);
          void
  xmlDumpAttributeDecl (xmlBufferPtr buf,
     xmlAttributePtr attr);



          xmlIDPtr
  xmlAddID (xmlValidCtxtPtr ctxt,
     xmlDocPtr doc,
     const xmlChar *value,
     xmlAttrPtr attr);
          void
  xmlFreeIDTable (xmlIDTablePtr table);
          xmlAttrPtr
  xmlGetID (xmlDocPtr doc,
     const xmlChar *ID);
          int
  xmlIsID (xmlDocPtr doc,
     xmlNodePtr elem,
     xmlAttrPtr attr);
          int
  xmlRemoveID (xmlDocPtr doc,
     xmlAttrPtr attr);


__attribute__((deprecated))
          xmlRefPtr
  xmlAddRef (xmlValidCtxtPtr ctxt,
     xmlDocPtr doc,
     const xmlChar *value,
     xmlAttrPtr attr);
__attribute__((deprecated))
          void
  xmlFreeRefTable (xmlRefTablePtr table);
__attribute__((deprecated))
          int
  xmlIsRef (xmlDocPtr doc,
     xmlNodePtr elem,
     xmlAttrPtr attr);
__attribute__((deprecated))
          int
  xmlRemoveRef (xmlDocPtr doc,
     xmlAttrPtr attr);
__attribute__((deprecated))
          xmlListPtr
  xmlGetRefs (xmlDocPtr doc,
     const xmlChar *ID);






          xmlValidCtxtPtr
  xmlNewValidCtxt(void);
          void
  xmlFreeValidCtxt(xmlValidCtxtPtr);

          int
  xmlValidateRoot (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc);
          int
  xmlValidateElementDecl (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
                           xmlElementPtr elem);
          xmlChar *
  xmlValidNormalizeAttributeValue(xmlDocPtr doc,
      xmlNodePtr elem,
      const xmlChar *name,
      const xmlChar *value);
          xmlChar *
  xmlValidCtxtNormalizeAttributeValue(xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem,
      const xmlChar *name,
      const xmlChar *value);
          int
  xmlValidateAttributeDecl(xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
                           xmlAttributePtr attr);
          int
  xmlValidateAttributeValue(xmlAttributeType type,
      const xmlChar *value);
          int
  xmlValidateNotationDecl (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
                           xmlNotationPtr nota);
          int
  xmlValidateDtd (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlDtdPtr dtd);
          int
  xmlValidateDtdFinal (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc);
          int
  xmlValidateDocument (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc);
          int
  xmlValidateElement (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem);
          int
  xmlValidateOneElement (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
                           xmlNodePtr elem);
          int
  xmlValidateOneAttribute (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem,
      xmlAttrPtr attr,
      const xmlChar *value);
          int
  xmlValidateOneNamespace (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem,
      const xmlChar *prefix,
      xmlNsPtr ns,
      const xmlChar *value);
          int
  xmlValidateDocumentFinal(xmlValidCtxtPtr ctxt,
      xmlDocPtr doc);



          int
  xmlValidateNotationUse (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
      const xmlChar *notationName);


          int
  xmlIsMixedElement (xmlDocPtr doc,
      const xmlChar *name);
          xmlAttributePtr
  xmlGetDtdAttrDesc (xmlDtdPtr dtd,
      const xmlChar *elem,
      const xmlChar *name);
          xmlAttributePtr
  xmlGetDtdQAttrDesc (xmlDtdPtr dtd,
      const xmlChar *elem,
      const xmlChar *name,
      const xmlChar *prefix);
          xmlNotationPtr
  xmlGetDtdNotationDesc (xmlDtdPtr dtd,
      const xmlChar *name);
          xmlElementPtr
  xmlGetDtdQElementDesc (xmlDtdPtr dtd,
      const xmlChar *name,
      const xmlChar *prefix);
          xmlElementPtr
  xmlGetDtdElementDesc (xmlDtdPtr dtd,
      const xmlChar *name);



          int
  xmlValidGetPotentialChildren(xmlElementContent *ctree,
      const xmlChar **names,
      int *len,
      int max);

          int
  xmlValidGetValidElements(xmlNode *prev,
      xmlNode *next,
      const xmlChar **names,
      int max);
          int
  xmlValidateNameValue (const xmlChar *value);
          int
  xmlValidateNamesValue (const xmlChar *value);
          int
  xmlValidateNmtokenValue (const xmlChar *value);
          int
  xmlValidateNmtokensValue(const xmlChar *value);





          int
  xmlValidBuildContentModel(xmlValidCtxtPtr ctxt,
      xmlElementPtr elem);

          int
  xmlValidatePushElement (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem,
      const xmlChar *qname);
          int
  xmlValidatePushCData (xmlValidCtxtPtr ctxt,
      const xmlChar *data,
      int len);
          int
  xmlValidatePopElement (xmlValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem,
      const xmlChar *qname);
# 20 "/usr/include/libxml2/libxml/parser.h" 2
# 1 "/usr/include/libxml2/libxml/entities.h" 1
# 16 "/usr/include/libxml2/libxml/entities.h"
# 1 "/usr/include/libxml2/libxml/tree.h" 1
# 17 "/usr/include/libxml2/libxml/entities.h" 2
# 26 "/usr/include/libxml2/libxml/entities.h"
typedef enum {
    XML_INTERNAL_GENERAL_ENTITY = 1,
    XML_EXTERNAL_GENERAL_PARSED_ENTITY = 2,
    XML_EXTERNAL_GENERAL_UNPARSED_ENTITY = 3,
    XML_INTERNAL_PARAMETER_ENTITY = 4,
    XML_EXTERNAL_PARAMETER_ENTITY = 5,
    XML_INTERNAL_PREDEFINED_ENTITY = 6
} xmlEntityType;






struct _xmlEntity {
    void *_private;
    xmlElementType type;
    const xmlChar *name;
    struct _xmlNode *children;
    struct _xmlNode *last;
    struct _xmlDtd *parent;
    struct _xmlNode *next;
    struct _xmlNode *prev;
    struct _xmlDoc *doc;

    xmlChar *orig;
    xmlChar *content;
    int length;
    xmlEntityType etype;
    const xmlChar *ExternalID;
    const xmlChar *SystemID;

    struct _xmlEntity *nexte;
    const xmlChar *URI;
    int owner;
    int flags;
    unsigned long expandedSize;
};






typedef struct _xmlHashTable xmlEntitiesTable;
typedef xmlEntitiesTable *xmlEntitiesTablePtr;






__attribute__((deprecated))
          void
  xmlInitializePredefinedEntities (void);


          xmlEntityPtr
   xmlNewEntity (xmlDocPtr doc,
       const xmlChar *name,
       int type,
       const xmlChar *ExternalID,
       const xmlChar *SystemID,
       const xmlChar *content);
          void
   xmlFreeEntity (xmlEntityPtr entity);
          xmlEntityPtr
   xmlAddDocEntity (xmlDocPtr doc,
       const xmlChar *name,
       int type,
       const xmlChar *ExternalID,
       const xmlChar *SystemID,
       const xmlChar *content);
          xmlEntityPtr
   xmlAddDtdEntity (xmlDocPtr doc,
       const xmlChar *name,
       int type,
       const xmlChar *ExternalID,
       const xmlChar *SystemID,
       const xmlChar *content);
          xmlEntityPtr
   xmlGetPredefinedEntity (const xmlChar *name);
          xmlEntityPtr
   xmlGetDocEntity (const xmlDoc *doc,
       const xmlChar *name);
          xmlEntityPtr
   xmlGetDtdEntity (xmlDocPtr doc,
       const xmlChar *name);
          xmlEntityPtr
   xmlGetParameterEntity (xmlDocPtr doc,
       const xmlChar *name);

__attribute__((deprecated))
          const xmlChar *
   xmlEncodeEntities (xmlDocPtr doc,
       const xmlChar *input);

          xmlChar *
   xmlEncodeEntitiesReentrant(xmlDocPtr doc,
       const xmlChar *input);
          xmlChar *
   xmlEncodeSpecialChars (const xmlDoc *doc,
       const xmlChar *input);
          xmlEntitiesTablePtr
   xmlCreateEntitiesTable (void);

          xmlEntitiesTablePtr
   xmlCopyEntitiesTable (xmlEntitiesTablePtr table);

          void
   xmlFreeEntitiesTable (xmlEntitiesTablePtr table);

          void
   xmlDumpEntitiesTable (xmlBufferPtr buf,
       xmlEntitiesTablePtr table);
          void
   xmlDumpEntityDecl (xmlBufferPtr buf,
       xmlEntityPtr ent);


          void
   xmlCleanupPredefinedEntities(void);
# 21 "/usr/include/libxml2/libxml/parser.h" 2



# 1 "/usr/include/libxml2/libxml/encoding.h" 1
# 28 "/usr/include/libxml2/libxml/encoding.h"
# 1 "/usr/include/iconv.h" 1 3 4
# 23 "/usr/include/iconv.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/stddef.h" 1 3 4
# 93 "/usr/bin/../lib/clang/19/include/stddef.h" 3 4
# 1 "/usr/bin/../lib/clang/19/include/__stddef_size_t.h" 1 3 4
# 94 "/usr/bin/../lib/clang/19/include/stddef.h" 2 3 4
# 24 "/usr/include/iconv.h" 2 3 4





typedef void *iconv_t;






extern int iconv_close (iconv_t __cd);






extern iconv_t iconv_open (const char *__tocode, const char *__fromcode)
 __attribute__ ((__malloc__)) ;




extern size_t iconv (iconv_t __cd, char **__restrict __inbuf,
       size_t *__restrict __inbytesleft,
       char **__restrict __outbuf,
       size_t *__restrict __outbytesleft);
# 29 "/usr/include/libxml2/libxml/encoding.h" 2






typedef enum {
    XML_ENC_ERR_SUCCESS = 0,
    XML_ENC_ERR_SPACE = -1,
    XML_ENC_ERR_INPUT = -2,
    XML_ENC_ERR_PARTIAL = -3,
    XML_ENC_ERR_INTERNAL = -4,
    XML_ENC_ERR_MEMORY = -5
} xmlCharEncError;
# 65 "/usr/include/libxml2/libxml/encoding.h"
typedef enum {
    XML_CHAR_ENCODING_ERROR= -1,
    XML_CHAR_ENCODING_NONE= 0,
    XML_CHAR_ENCODING_UTF8= 1,
    XML_CHAR_ENCODING_UTF16LE= 2,
    XML_CHAR_ENCODING_UTF16BE= 3,
    XML_CHAR_ENCODING_UCS4LE= 4,
    XML_CHAR_ENCODING_UCS4BE= 5,
    XML_CHAR_ENCODING_EBCDIC= 6,
    XML_CHAR_ENCODING_UCS4_2143=7,
    XML_CHAR_ENCODING_UCS4_3412=8,
    XML_CHAR_ENCODING_UCS2= 9,
    XML_CHAR_ENCODING_8859_1= 10,
    XML_CHAR_ENCODING_8859_2= 11,
    XML_CHAR_ENCODING_8859_3= 12,
    XML_CHAR_ENCODING_8859_4= 13,
    XML_CHAR_ENCODING_8859_5= 14,
    XML_CHAR_ENCODING_8859_6= 15,
    XML_CHAR_ENCODING_8859_7= 16,
    XML_CHAR_ENCODING_8859_8= 17,
    XML_CHAR_ENCODING_8859_9= 18,
    XML_CHAR_ENCODING_2022_JP= 19,
    XML_CHAR_ENCODING_SHIFT_JIS=20,
    XML_CHAR_ENCODING_EUC_JP= 21,
    XML_CHAR_ENCODING_ASCII= 22
} xmlCharEncoding;
# 108 "/usr/include/libxml2/libxml/encoding.h"
typedef int (* xmlCharEncodingInputFunc)(unsigned char *out, int *outlen,
                                         const unsigned char *in, int *inlen);
# 130 "/usr/include/libxml2/libxml/encoding.h"
typedef int (* xmlCharEncodingOutputFunc)(unsigned char *out, int *outlen,
                                          const unsigned char *in, int *inlen);






typedef struct _xmlCharEncodingHandler xmlCharEncodingHandler;
typedef xmlCharEncodingHandler *xmlCharEncodingHandlerPtr;
struct _xmlCharEncodingHandler {
    char *name;
    xmlCharEncodingInputFunc input;
    xmlCharEncodingOutputFunc output;

    iconv_t iconv_in;
    iconv_t iconv_out;





};




__attribute__((deprecated))
          void
 xmlInitCharEncodingHandlers (void);
__attribute__((deprecated))
          void
 xmlCleanupCharEncodingHandlers (void);
          void
 xmlRegisterCharEncodingHandler (xmlCharEncodingHandlerPtr handler);
          xmlCharEncodingHandlerPtr
 xmlGetCharEncodingHandler (xmlCharEncoding enc);
          xmlCharEncodingHandlerPtr
 xmlFindCharEncodingHandler (const char *name);
          xmlCharEncodingHandlerPtr
 xmlNewCharEncodingHandler (const char *name,
      xmlCharEncodingInputFunc input,
      xmlCharEncodingOutputFunc output);




          int
 xmlAddEncodingAlias (const char *name,
      const char *alias);
          int
 xmlDelEncodingAlias (const char *alias);
          const char *
 xmlGetEncodingAlias (const char *alias);
          void
 xmlCleanupEncodingAliases (void);
          xmlCharEncoding
 xmlParseCharEncoding (const char *name);
          const char *
 xmlGetCharEncodingName (xmlCharEncoding enc);




          xmlCharEncoding
 xmlDetectCharEncoding (const unsigned char *in,
      int len);

struct _xmlBuffer;
          int
 xmlCharEncOutFunc (xmlCharEncodingHandler *handler,
      struct _xmlBuffer *out,
      struct _xmlBuffer *in);

          int
 xmlCharEncInFunc (xmlCharEncodingHandler *handler,
      struct _xmlBuffer *out,
      struct _xmlBuffer *in);
__attribute__((deprecated))
          int
 xmlCharEncFirstLine (xmlCharEncodingHandler *handler,
      struct _xmlBuffer *out,
      struct _xmlBuffer *in);
          int
 xmlCharEncCloseFunc (xmlCharEncodingHandler *handler);





          int
 UTF8Toisolat1 (unsigned char *out,
      int *outlen,
      const unsigned char *in,
      int *inlen);

          int
 isolat1ToUTF8 (unsigned char *out,
      int *outlen,
      const unsigned char *in,
      int *inlen);
# 25 "/usr/include/libxml2/libxml/parser.h" 2
# 1 "/usr/include/libxml2/libxml/xmlIO.h" 1
# 17 "/usr/include/libxml2/libxml/xmlIO.h"
# 1 "/usr/include/libxml2/libxml/tree.h" 1
# 18 "/usr/include/libxml2/libxml/xmlIO.h" 2
# 38 "/usr/include/libxml2/libxml/xmlIO.h"
typedef int (*xmlInputMatchCallback) (char const *filename);
# 47 "/usr/include/libxml2/libxml/xmlIO.h"
typedef void * (*xmlInputOpenCallback) (char const *filename);
# 58 "/usr/include/libxml2/libxml/xmlIO.h"
typedef int (*xmlInputReadCallback) (void * context, char * buffer, int len);
# 67 "/usr/include/libxml2/libxml/xmlIO.h"
typedef int (*xmlInputCloseCallback) (void * context);
# 84 "/usr/include/libxml2/libxml/xmlIO.h"
typedef int (*xmlOutputMatchCallback) (char const *filename);
# 93 "/usr/include/libxml2/libxml/xmlIO.h"
typedef void * (*xmlOutputOpenCallback) (char const *filename);
# 104 "/usr/include/libxml2/libxml/xmlIO.h"
typedef int (*xmlOutputWriteCallback) (void * context, const char * buffer,
                                       int len);
# 114 "/usr/include/libxml2/libxml/xmlIO.h"
typedef int (*xmlOutputCloseCallback) (void * context);
# 128 "/usr/include/libxml2/libxml/xmlIO.h"
typedef xmlParserInputBufferPtr
(*xmlParserInputBufferCreateFilenameFunc)(const char *URI, xmlCharEncoding enc);
# 142 "/usr/include/libxml2/libxml/xmlIO.h"
typedef xmlOutputBufferPtr
(*xmlOutputBufferCreateFilenameFunc)(const char *URI,
        xmlCharEncodingHandlerPtr encoder, int compression);

struct _xmlParserInputBuffer {
    void* context;
    xmlInputReadCallback readcallback;
    xmlInputCloseCallback closecallback;

    xmlCharEncodingHandlerPtr encoder;

    xmlBufPtr buffer;
    xmlBufPtr raw;
    int compressed;
    int error;
    unsigned long rawconsumed;
};



struct _xmlOutputBuffer {
    void* context;
    xmlOutputWriteCallback writecallback;
    xmlOutputCloseCallback closecallback;

    xmlCharEncodingHandlerPtr encoder;

    xmlBufPtr buffer;
    xmlBufPtr conv;
    int written;
    int error;
};
# 184 "/usr/include/libxml2/libxml/xmlIO.h"
__attribute__((deprecated)) xmlParserInputBufferCreateFilenameFunc *__xmlParserInputBufferCreateFilenameValue(void); __attribute__((deprecated)) xmlOutputBufferCreateFilenameFunc *__xmlOutputBufferCreateFilenameValue(void);
# 198 "/usr/include/libxml2/libxml/xmlIO.h"
          void
 xmlCleanupInputCallbacks (void);

          int
 xmlPopInputCallbacks (void);

          void
 xmlRegisterDefaultInputCallbacks (void);
          xmlParserInputBufferPtr
 xmlAllocParserInputBuffer (xmlCharEncoding enc);

          xmlParserInputBufferPtr
 xmlParserInputBufferCreateFilename (const char *URI,
                                                 xmlCharEncoding enc);
          xmlParserInputBufferPtr
 xmlParserInputBufferCreateFile (FILE *file,
                                                 xmlCharEncoding enc);
          xmlParserInputBufferPtr
 xmlParserInputBufferCreateFd (int fd,
                                          xmlCharEncoding enc);
          xmlParserInputBufferPtr
 xmlParserInputBufferCreateMem (const char *mem, int size,
                                          xmlCharEncoding enc);
          xmlParserInputBufferPtr
 xmlParserInputBufferCreateStatic (const char *mem, int size,
                                          xmlCharEncoding enc);
          xmlParserInputBufferPtr
 xmlParserInputBufferCreateIO (xmlInputReadCallback ioread,
       xmlInputCloseCallback ioclose,
       void *ioctx,
                                          xmlCharEncoding enc);
          int
 xmlParserInputBufferRead (xmlParserInputBufferPtr in,
       int len);
          int
 xmlParserInputBufferGrow (xmlParserInputBufferPtr in,
       int len);
          int
 xmlParserInputBufferPush (xmlParserInputBufferPtr in,
       int len,
       const char *buf);
          void
 xmlFreeParserInputBuffer (xmlParserInputBufferPtr in);
          char *
 xmlParserGetDirectory (const char *filename);

          int
 xmlRegisterInputCallbacks (xmlInputMatchCallback matchFunc,
       xmlInputOpenCallback openFunc,
       xmlInputReadCallback readFunc,
       xmlInputCloseCallback closeFunc);

xmlParserInputBufferPtr
 __xmlParserInputBufferCreateFilename(const char *URI,
      xmlCharEncoding enc);





          void
 xmlCleanupOutputCallbacks (void);
          int
 xmlPopOutputCallbacks (void);
          void
 xmlRegisterDefaultOutputCallbacks(void);
          xmlOutputBufferPtr
 xmlAllocOutputBuffer (xmlCharEncodingHandlerPtr encoder);

          xmlOutputBufferPtr
 xmlOutputBufferCreateFilename (const char *URI,
      xmlCharEncodingHandlerPtr encoder,
      int compression);

          xmlOutputBufferPtr
 xmlOutputBufferCreateFile (FILE *file,
      xmlCharEncodingHandlerPtr encoder);

          xmlOutputBufferPtr
 xmlOutputBufferCreateBuffer (xmlBufferPtr buffer,
      xmlCharEncodingHandlerPtr encoder);

          xmlOutputBufferPtr
 xmlOutputBufferCreateFd (int fd,
      xmlCharEncodingHandlerPtr encoder);

          xmlOutputBufferPtr
 xmlOutputBufferCreateIO (xmlOutputWriteCallback iowrite,
      xmlOutputCloseCallback ioclose,
      void *ioctx,
      xmlCharEncodingHandlerPtr encoder);


          const xmlChar *
        xmlOutputBufferGetContent (xmlOutputBufferPtr out);
          size_t
        xmlOutputBufferGetSize (xmlOutputBufferPtr out);

          int
 xmlOutputBufferWrite (xmlOutputBufferPtr out,
      int len,
      const char *buf);
          int
 xmlOutputBufferWriteString (xmlOutputBufferPtr out,
      const char *str);
          int
 xmlOutputBufferWriteEscape (xmlOutputBufferPtr out,
      const xmlChar *str,
      xmlCharEncodingOutputFunc escaping);

          int
 xmlOutputBufferFlush (xmlOutputBufferPtr out);
          int
 xmlOutputBufferClose (xmlOutputBufferPtr out);

          int
 xmlRegisterOutputCallbacks (xmlOutputMatchCallback matchFunc,
      xmlOutputOpenCallback openFunc,
      xmlOutputWriteCallback writeFunc,
      xmlOutputCloseCallback closeFunc);

xmlOutputBufferPtr
 __xmlOutputBufferCreateFilename(const char *URI,
                              xmlCharEncodingHandlerPtr encoder,
                              int compression);



          void
 xmlRegisterHTTPPostCallbacks (void );




          xmlParserInputPtr
 xmlCheckHTTPInput (xmlParserCtxtPtr ctxt,
      xmlParserInputPtr ret);




          xmlParserInputPtr
 xmlNoNetExternalEntityLoader (const char *URL,
      const char *ID,
      xmlParserCtxtPtr ctxt);





          xmlChar *
 xmlNormalizeWindowsPath (const xmlChar *path);

          int
 xmlCheckFilename (const char *path);



          int
 xmlFileMatch (const char *filename);
          void *
 xmlFileOpen (const char *filename);
          int
 xmlFileRead (void * context,
      char * buffer,
      int len);
          int
 xmlFileClose (void * context);





          int
 xmlIOHTTPMatch (const char *filename);
          void *
 xmlIOHTTPOpen (const char *filename);

          void *
 xmlIOHTTPOpenW (const char * post_uri,
      int compression );

          int
 xmlIOHTTPRead (void * context,
      char * buffer,
      int len);
          int
 xmlIOHTTPClose (void * context);






          int
 xmlIOFTPMatch (const char *filename);
          void *
 xmlIOFTPOpen (const char *filename);
          int
 xmlIOFTPRead (void * context,
      char * buffer,
      int len);
          int
 xmlIOFTPClose (void * context);


          xmlParserInputBufferCreateFilenameFunc
 xmlParserInputBufferCreateFilenameDefault(
  xmlParserInputBufferCreateFilenameFunc func);
          xmlOutputBufferCreateFilenameFunc
 xmlOutputBufferCreateFilenameDefault(
  xmlOutputBufferCreateFilenameFunc func);
          xmlOutputBufferCreateFilenameFunc
 xmlThrDefOutputBufferCreateFilenameDefault(
  xmlOutputBufferCreateFilenameFunc func);
          xmlParserInputBufferCreateFilenameFunc
 xmlThrDefParserInputBufferCreateFilenameDefault(
  xmlParserInputBufferCreateFilenameFunc func);
# 26 "/usr/include/libxml2/libxml/parser.h" 2

# 1 "/usr/include/libxml2/libxml/SAX2.h" 1
# 16 "/usr/include/libxml2/libxml/SAX2.h"
# 1 "/usr/include/libxml2/libxml/parser.h" 1
# 17 "/usr/include/libxml2/libxml/SAX2.h" 2




          const xmlChar *
  xmlSAX2GetPublicId (void *ctx);
          const xmlChar *
  xmlSAX2GetSystemId (void *ctx);
          void
  xmlSAX2SetDocumentLocator (void *ctx,
       xmlSAXLocatorPtr loc);

          int
  xmlSAX2GetLineNumber (void *ctx);
          int
  xmlSAX2GetColumnNumber (void *ctx);

          int
  xmlSAX2IsStandalone (void *ctx);
          int
  xmlSAX2HasInternalSubset (void *ctx);
          int
  xmlSAX2HasExternalSubset (void *ctx);

          void
  xmlSAX2InternalSubset (void *ctx,
       const xmlChar *name,
       const xmlChar *ExternalID,
       const xmlChar *SystemID);
          void
  xmlSAX2ExternalSubset (void *ctx,
       const xmlChar *name,
       const xmlChar *ExternalID,
       const xmlChar *SystemID);
          xmlEntityPtr
  xmlSAX2GetEntity (void *ctx,
       const xmlChar *name);
          xmlEntityPtr
  xmlSAX2GetParameterEntity (void *ctx,
       const xmlChar *name);
          xmlParserInputPtr
  xmlSAX2ResolveEntity (void *ctx,
       const xmlChar *publicId,
       const xmlChar *systemId);

          void
  xmlSAX2EntityDecl (void *ctx,
       const xmlChar *name,
       int type,
       const xmlChar *publicId,
       const xmlChar *systemId,
       xmlChar *content);
          void
  xmlSAX2AttributeDecl (void *ctx,
       const xmlChar *elem,
       const xmlChar *fullname,
       int type,
       int def,
       const xmlChar *defaultValue,
       xmlEnumerationPtr tree);
          void
  xmlSAX2ElementDecl (void *ctx,
       const xmlChar *name,
       int type,
       xmlElementContentPtr content);
          void
  xmlSAX2NotationDecl (void *ctx,
       const xmlChar *name,
       const xmlChar *publicId,
       const xmlChar *systemId);
          void
  xmlSAX2UnparsedEntityDecl (void *ctx,
       const xmlChar *name,
       const xmlChar *publicId,
       const xmlChar *systemId,
       const xmlChar *notationName);

          void
  xmlSAX2StartDocument (void *ctx);
          void
  xmlSAX2EndDocument (void *ctx);


          void
  xmlSAX2StartElement (void *ctx,
       const xmlChar *fullname,
       const xmlChar **atts);
          void
  xmlSAX2EndElement (void *ctx,
       const xmlChar *name);

          void
  xmlSAX2StartElementNs (void *ctx,
       const xmlChar *localname,
       const xmlChar *prefix,
       const xmlChar *URI,
       int nb_namespaces,
       const xmlChar **namespaces,
       int nb_attributes,
       int nb_defaulted,
       const xmlChar **attributes);
          void
  xmlSAX2EndElementNs (void *ctx,
       const xmlChar *localname,
       const xmlChar *prefix,
       const xmlChar *URI);
          void
  xmlSAX2Reference (void *ctx,
       const xmlChar *name);
          void
  xmlSAX2Characters (void *ctx,
       const xmlChar *ch,
       int len);
          void
  xmlSAX2IgnorableWhitespace (void *ctx,
       const xmlChar *ch,
       int len);
          void
  xmlSAX2ProcessingInstruction (void *ctx,
       const xmlChar *target,
       const xmlChar *data);
          void
  xmlSAX2Comment (void *ctx,
       const xmlChar *value);
          void
  xmlSAX2CDataBlock (void *ctx,
       const xmlChar *value,
       int len);


__attribute__((deprecated))
          int
  xmlSAXDefaultVersion (int version);


          int
  xmlSAXVersion (xmlSAXHandler *hdlr,
       int version);
          void
  xmlSAX2InitDefaultSAXHandler (xmlSAXHandler *hdlr,
       int warning);

          void
  xmlSAX2InitHtmlDefaultSAXHandler(xmlSAXHandler *hdlr);
__attribute__((deprecated))
          void
  htmlDefaultSAXHandlerInit (void);

__attribute__((deprecated))
          void
  xmlDefaultSAXHandlerInit (void);
# 28 "/usr/include/libxml2/libxml/parser.h" 2
# 1 "/usr/include/libxml2/libxml/threads.h" 1
# 23 "/usr/include/libxml2/libxml/threads.h"
typedef struct _xmlMutex xmlMutex;
typedef xmlMutex *xmlMutexPtr;




typedef struct _xmlRMutex xmlRMutex;
typedef xmlRMutex *xmlRMutexPtr;

          int
   xmlCheckThreadLocalStorage(void);

          xmlMutexPtr
   xmlNewMutex (void);
          void
   xmlMutexLock (xmlMutexPtr tok);
          void
   xmlMutexUnlock (xmlMutexPtr tok);
          void
   xmlFreeMutex (xmlMutexPtr tok);

          xmlRMutexPtr
   xmlNewRMutex (void);
          void
   xmlRMutexLock (xmlRMutexPtr tok);
          void
   xmlRMutexUnlock (xmlRMutexPtr tok);
          void
   xmlFreeRMutex (xmlRMutexPtr tok);




__attribute__((deprecated))
          void
   xmlInitThreads (void);
          void
   xmlLockLibrary (void);
          void
   xmlUnlockLibrary(void);
__attribute__((deprecated))
          int
   xmlGetThreadId (void);
__attribute__((deprecated))
          int
   xmlIsMainThread (void);
__attribute__((deprecated))
          void
   xmlCleanupThreads(void);
# 29 "/usr/include/libxml2/libxml/parser.h" 2
# 58 "/usr/include/libxml2/libxml/parser.h"
typedef void (* xmlParserInputDeallocate)(xmlChar *str);

struct _xmlParserInput {

    xmlParserInputBufferPtr buf;

    const char *filename;
    const char *directory;
    const xmlChar *base;
    const xmlChar *cur;
    const xmlChar *end;
    int length;
    int line;
    int col;
    unsigned long consumed;
    xmlParserInputDeallocate free;
    const xmlChar *encoding;
    const xmlChar *version;
    int flags;
    int id;
    unsigned long parentConsumed;
    xmlEntityPtr entity;
};
# 89 "/usr/include/libxml2/libxml/parser.h"
typedef struct _xmlParserNodeInfo xmlParserNodeInfo;
typedef xmlParserNodeInfo *xmlParserNodeInfoPtr;

struct _xmlParserNodeInfo {
  const struct _xmlNode* node;

  unsigned long begin_pos;
  unsigned long begin_line;
  unsigned long end_pos;
  unsigned long end_line;
};

typedef struct _xmlParserNodeInfoSeq xmlParserNodeInfoSeq;
typedef xmlParserNodeInfoSeq *xmlParserNodeInfoSeqPtr;
struct _xmlParserNodeInfoSeq {
  unsigned long maximum;
  unsigned long length;
  xmlParserNodeInfo* buffer;
};







typedef enum {
    XML_PARSER_EOF = -1,
    XML_PARSER_START = 0,
    XML_PARSER_MISC,
    XML_PARSER_PI,
    XML_PARSER_DTD,
    XML_PARSER_PROLOG,
    XML_PARSER_COMMENT,
    XML_PARSER_START_TAG,
    XML_PARSER_CONTENT,
    XML_PARSER_CDATA_SECTION,
    XML_PARSER_END_TAG,
    XML_PARSER_ENTITY_DECL,
    XML_PARSER_ENTITY_VALUE,
    XML_PARSER_ATTRIBUTE_VALUE,
    XML_PARSER_SYSTEM_LITERAL,
    XML_PARSER_EPILOG,
    XML_PARSER_IGNORE,
    XML_PARSER_PUBLIC_LITERAL,
    XML_PARSER_XML_DECL
} xmlParserInputState;
# 167 "/usr/include/libxml2/libxml/parser.h"
typedef enum {
    XML_PARSE_UNKNOWN = 0,
    XML_PARSE_DOM = 1,
    XML_PARSE_SAX = 2,
    XML_PARSE_PUSH_DOM = 3,
    XML_PARSE_PUSH_SAX = 4,
    XML_PARSE_READER = 5
} xmlParserMode;

typedef struct _xmlStartTag xmlStartTag;
typedef struct _xmlParserNsData xmlParserNsData;
typedef struct _xmlAttrHashBucket xmlAttrHashBucket;
# 192 "/usr/include/libxml2/libxml/parser.h"
struct _xmlParserCtxt {
    struct _xmlSAXHandler *sax;
    void *userData;
    xmlDocPtr myDoc;
    int wellFormed;
    int replaceEntities;
    const xmlChar *version;
    const xmlChar *encoding;
    int standalone;
    int html;





    xmlParserInputPtr input;
    int inputNr;
    int inputMax;
    xmlParserInputPtr *inputTab;


    xmlNodePtr node;
    int nodeNr;
    int nodeMax;
    xmlNodePtr *nodeTab;

    int record_info;
    xmlParserNodeInfoSeq node_seq;

    int errNo;

    int hasExternalSubset;
    int hasPErefs;
    int external;

    int valid;
    int validate;
    xmlValidCtxt vctxt;

    xmlParserInputState instate;
    int token;

    char *directory;


    const xmlChar *name;
    int nameNr;
    int nameMax;
    const xmlChar * *nameTab;

    long nbChars;
    long checkIndex;
    int keepBlanks;
    int disableSAX;
    int inSubset;
    const xmlChar * intSubName;
    xmlChar * extSubURI;
    xmlChar * extSubSystem;


    int * space;
    int spaceNr;
    int spaceMax;
    int * spaceTab;

    int depth;
    xmlParserInputPtr entity;
    int charset;
    int nodelen;
    int nodemem;
    int pedantic;
    void *_private;

    int loadsubset;
    int linenumbers;
    void *catalogs;
    int recovery;
    int progressive;
    xmlDictPtr dict;
    const xmlChar * *atts;
    int maxatts;
    int docdict;




    const xmlChar *str_xml;
    const xmlChar *str_xmlns;
    const xmlChar *str_xml_ns;




    int sax2;
    int nsNr;
    int nsMax;
    const xmlChar * *nsTab;
    unsigned *attallocs;
    xmlStartTag *pushTab;
    xmlHashTablePtr attsDefault;
    xmlHashTablePtr attsSpecial;
    int nsWellFormed;
    int options;




    int dictNames;
    int freeElemsNr;
    xmlNodePtr freeElems;
    int freeAttrsNr;
    xmlAttrPtr freeAttrs;




    xmlError lastError;
    xmlParserMode parseMode;
    unsigned long nbentities;
    unsigned long sizeentities;


    xmlParserNodeInfo *nodeInfo;
    int nodeInfoNr;
    int nodeInfoMax;
    xmlParserNodeInfo *nodeInfoTab;

    int input_id;
    unsigned long sizeentcopy;

    int endCheckState;
    unsigned short nbErrors;
    unsigned short nbWarnings;
    unsigned maxAmpl;

    xmlParserNsData *nsdb;
    unsigned attrHashMax;
    xmlAttrHashBucket *attrHash;
};






struct _xmlSAXLocator {
    const xmlChar *(*getPublicId)(void *ctx);
    const xmlChar *(*getSystemId)(void *ctx);
    int (*getLineNumber)(void *ctx);
    int (*getColumnNumber)(void *ctx);
};
# 366 "/usr/include/libxml2/libxml/parser.h"
typedef xmlParserInputPtr (*resolveEntitySAXFunc) (void *ctx,
    const xmlChar *publicId,
    const xmlChar *systemId);
# 378 "/usr/include/libxml2/libxml/parser.h"
typedef void (*internalSubsetSAXFunc) (void *ctx,
    const xmlChar *name,
    const xmlChar *ExternalID,
    const xmlChar *SystemID);
# 391 "/usr/include/libxml2/libxml/parser.h"
typedef void (*externalSubsetSAXFunc) (void *ctx,
    const xmlChar *name,
    const xmlChar *ExternalID,
    const xmlChar *SystemID);
# 404 "/usr/include/libxml2/libxml/parser.h"
typedef xmlEntityPtr (*getEntitySAXFunc) (void *ctx,
    const xmlChar *name);
# 415 "/usr/include/libxml2/libxml/parser.h"
typedef xmlEntityPtr (*getParameterEntitySAXFunc) (void *ctx,
    const xmlChar *name);
# 428 "/usr/include/libxml2/libxml/parser.h"
typedef void (*entityDeclSAXFunc) (void *ctx,
    const xmlChar *name,
    int type,
    const xmlChar *publicId,
    const xmlChar *systemId,
    xmlChar *content);
# 443 "/usr/include/libxml2/libxml/parser.h"
typedef void (*notationDeclSAXFunc)(void *ctx,
    const xmlChar *name,
    const xmlChar *publicId,
    const xmlChar *systemId);
# 459 "/usr/include/libxml2/libxml/parser.h"
typedef void (*attributeDeclSAXFunc)(void *ctx,
    const xmlChar *elem,
    const xmlChar *fullname,
    int type,
    int def,
    const xmlChar *defaultValue,
    xmlEnumerationPtr tree);
# 475 "/usr/include/libxml2/libxml/parser.h"
typedef void (*elementDeclSAXFunc)(void *ctx,
    const xmlChar *name,
    int type,
    xmlElementContentPtr content);
# 489 "/usr/include/libxml2/libxml/parser.h"
typedef void (*unparsedEntityDeclSAXFunc)(void *ctx,
    const xmlChar *name,
    const xmlChar *publicId,
    const xmlChar *systemId,
    const xmlChar *notationName);
# 502 "/usr/include/libxml2/libxml/parser.h"
typedef void (*setDocumentLocatorSAXFunc) (void *ctx,
    xmlSAXLocatorPtr loc);






typedef void (*startDocumentSAXFunc) (void *ctx);






typedef void (*endDocumentSAXFunc) (void *ctx);
# 526 "/usr/include/libxml2/libxml/parser.h"
typedef void (*startElementSAXFunc) (void *ctx,
    const xmlChar *name,
    const xmlChar **atts);







typedef void (*endElementSAXFunc) (void *ctx,
    const xmlChar *name);
# 549 "/usr/include/libxml2/libxml/parser.h"
typedef void (*attributeSAXFunc) (void *ctx,
    const xmlChar *name,
    const xmlChar *value);







typedef void (*referenceSAXFunc) (void *ctx,
    const xmlChar *name);
# 569 "/usr/include/libxml2/libxml/parser.h"
typedef void (*charactersSAXFunc) (void *ctx,
    const xmlChar *ch,
    int len);
# 581 "/usr/include/libxml2/libxml/parser.h"
typedef void (*ignorableWhitespaceSAXFunc) (void *ctx,
    const xmlChar *ch,
    int len);
# 592 "/usr/include/libxml2/libxml/parser.h"
typedef void (*processingInstructionSAXFunc) (void *ctx,
    const xmlChar *target,
    const xmlChar *data);







typedef void (*commentSAXFunc) (void *ctx,
    const xmlChar *value);
# 612 "/usr/include/libxml2/libxml/parser.h"
typedef void (*cdataBlockSAXFunc) (
                         void *ctx,
    const xmlChar *value,
    int len);
# 624 "/usr/include/libxml2/libxml/parser.h"
typedef void (*warningSAXFunc) (void *ctx,
    const char *msg, ...) __attribute__((__format__(__printf__,2,3)));
# 634 "/usr/include/libxml2/libxml/parser.h"
typedef void (*errorSAXFunc) (void *ctx,
    const char *msg, ...) __attribute__((__format__(__printf__,2,3)));
# 646 "/usr/include/libxml2/libxml/parser.h"
typedef void (*fatalErrorSAXFunc) (void *ctx,
    const char *msg, ...) __attribute__((__format__(__printf__,2,3)));
# 656 "/usr/include/libxml2/libxml/parser.h"
typedef int (*isStandaloneSAXFunc) (void *ctx);
# 665 "/usr/include/libxml2/libxml/parser.h"
typedef int (*hasInternalSubsetSAXFunc) (void *ctx);
# 675 "/usr/include/libxml2/libxml/parser.h"
typedef int (*hasExternalSubsetSAXFunc) (void *ctx);
# 708 "/usr/include/libxml2/libxml/parser.h"
typedef void (*startElementNsSAX2Func) (void *ctx,
     const xmlChar *localname,
     const xmlChar *prefix,
     const xmlChar *URI,
     int nb_namespaces,
     const xmlChar **namespaces,
     int nb_attributes,
     int nb_defaulted,
     const xmlChar **attributes);
# 729 "/usr/include/libxml2/libxml/parser.h"
typedef void (*endElementNsSAX2Func) (void *ctx,
     const xmlChar *localname,
     const xmlChar *prefix,
     const xmlChar *URI);


struct _xmlSAXHandler {
    internalSubsetSAXFunc internalSubset;
    isStandaloneSAXFunc isStandalone;
    hasInternalSubsetSAXFunc hasInternalSubset;
    hasExternalSubsetSAXFunc hasExternalSubset;
    resolveEntitySAXFunc resolveEntity;
    getEntitySAXFunc getEntity;
    entityDeclSAXFunc entityDecl;
    notationDeclSAXFunc notationDecl;
    attributeDeclSAXFunc attributeDecl;
    elementDeclSAXFunc elementDecl;
    unparsedEntityDeclSAXFunc unparsedEntityDecl;
    setDocumentLocatorSAXFunc setDocumentLocator;
    startDocumentSAXFunc startDocument;
    endDocumentSAXFunc endDocument;
# 763 "/usr/include/libxml2/libxml/parser.h"
    startElementSAXFunc startElement;
    endElementSAXFunc endElement;
    referenceSAXFunc reference;
    charactersSAXFunc characters;
    ignorableWhitespaceSAXFunc ignorableWhitespace;
    processingInstructionSAXFunc processingInstruction;
    commentSAXFunc comment;
    warningSAXFunc warning;
    errorSAXFunc error;
    fatalErrorSAXFunc fatalError;
    getParameterEntitySAXFunc getParameterEntity;
    cdataBlockSAXFunc cdataBlock;
    externalSubsetSAXFunc externalSubset;




    unsigned int initialized;



    void *_private;
    startElementNsSAX2Func startElementNs;
    endElementNsSAX2Func endElementNs;
    xmlStructuredErrorFunc serror;
};




typedef struct _xmlSAXHandlerV1 xmlSAXHandlerV1;
typedef xmlSAXHandlerV1 *xmlSAXHandlerV1Ptr;
struct _xmlSAXHandlerV1 {
    internalSubsetSAXFunc internalSubset;
    isStandaloneSAXFunc isStandalone;
    hasInternalSubsetSAXFunc hasInternalSubset;
    hasExternalSubsetSAXFunc hasExternalSubset;
    resolveEntitySAXFunc resolveEntity;
    getEntitySAXFunc getEntity;
    entityDeclSAXFunc entityDecl;
    notationDeclSAXFunc notationDecl;
    attributeDeclSAXFunc attributeDecl;
    elementDeclSAXFunc elementDecl;
    unparsedEntityDeclSAXFunc unparsedEntityDecl;
    setDocumentLocatorSAXFunc setDocumentLocator;
    startDocumentSAXFunc startDocument;
    endDocumentSAXFunc endDocument;
    startElementSAXFunc startElement;
    endElementSAXFunc endElement;
    referenceSAXFunc reference;
    charactersSAXFunc characters;
    ignorableWhitespaceSAXFunc ignorableWhitespace;
    processingInstructionSAXFunc processingInstruction;
    commentSAXFunc comment;
    warningSAXFunc warning;
    errorSAXFunc error;
    fatalErrorSAXFunc fatalError;
    getParameterEntitySAXFunc getParameterEntity;
    cdataBlockSAXFunc cdataBlock;
    externalSubsetSAXFunc externalSubset;
    unsigned int initialized;
};
# 837 "/usr/include/libxml2/libxml/parser.h"
typedef xmlParserInputPtr (*xmlExternalEntityLoader) (const char *URL,
      const char *ID,
      xmlParserCtxtPtr context);





 extern const char *const xmlParserVersion;


          const char *const *__xmlParserVersion(void);
# 886 "/usr/include/libxml2/libxml/parser.h"
__attribute__((deprecated)) int *__oldXMLWDcompatibility(void); __attribute__((deprecated)) xmlSAXLocator *__xmlDefaultSAXLocator(void); __attribute__((deprecated)) int *__xmlDoValidityCheckingDefaultValue(void); __attribute__((deprecated)) int *__xmlGetWarningsDefaultValue(void); __attribute__((deprecated)) int *__xmlKeepBlanksDefaultValue(void); __attribute__((deprecated)) int *__xmlLineNumbersDefaultValue(void); __attribute__((deprecated)) int *__xmlLoadExtDtdDefaultValue(void); __attribute__((deprecated)) int *__xmlParserDebugEntities(void); __attribute__((deprecated)) int *__xmlPedanticParserDefaultValue(void); __attribute__((deprecated)) int *__xmlSubstituteEntitiesDefaultValue(void); int *__xmlIndentTreeOutput(void); const char * *__xmlTreeIndentString(void); int *__xmlSaveNoEmptyTags(void); __attribute__((deprecated)) xmlSAXHandlerV1 *__xmlDefaultSAXHandler(void);
# 917 "/usr/include/libxml2/libxml/parser.h"
          void
  xmlInitParser (void);
          void
  xmlCleanupParser (void);
__attribute__((deprecated))
          void
  xmlInitGlobals (void);
__attribute__((deprecated))
          void
  xmlCleanupGlobals (void);




__attribute__((deprecated))
          int
  xmlParserInputRead (xmlParserInputPtr in,
      int len);
__attribute__((deprecated))
          int
  xmlParserInputGrow (xmlParserInputPtr in,
      int len);





          xmlDocPtr
  xmlParseDoc (const xmlChar *cur);
          xmlDocPtr
  xmlParseFile (const char *filename);
          xmlDocPtr
  xmlParseMemory (const char *buffer,
      int size);

__attribute__((deprecated)) int
  xmlSubstituteEntitiesDefault(int val);
__attribute__((deprecated)) int
                xmlThrDefSubstituteEntitiesDefaultValue(int v);
__attribute__((deprecated)) int
  xmlKeepBlanksDefault (int val);
__attribute__((deprecated)) int
  xmlThrDefKeepBlanksDefaultValue(int v);
          void
  xmlStopParser (xmlParserCtxtPtr ctxt);
__attribute__((deprecated)) int
  xmlPedanticParserDefault(int val);
__attribute__((deprecated)) int
                xmlThrDefPedanticParserDefaultValue(int v);
__attribute__((deprecated)) int
  xmlLineNumbersDefault (int val);
__attribute__((deprecated)) int
                xmlThrDefLineNumbersDefaultValue(int v);
__attribute__((deprecated)) int
                xmlThrDefDoValidityCheckingDefaultValue(int v);
__attribute__((deprecated)) int
                xmlThrDefGetWarningsDefaultValue(int v);
__attribute__((deprecated)) int
                xmlThrDefLoadExtDtdDefaultValue(int v);
__attribute__((deprecated)) int
                xmlThrDefParserDebugEntities(int v);





__attribute__((deprecated))
          xmlDocPtr
  xmlRecoverDoc (const xmlChar *cur);
__attribute__((deprecated))
          xmlDocPtr
  xmlRecoverMemory (const char *buffer,
      int size);
__attribute__((deprecated))
          xmlDocPtr
  xmlRecoverFile (const char *filename);





          int
  xmlParseDocument (xmlParserCtxtPtr ctxt);
          int
  xmlParseExtParsedEnt (xmlParserCtxtPtr ctxt);

__attribute__((deprecated))
          int
  xmlSAXUserParseFile (xmlSAXHandlerPtr sax,
      void *user_data,
      const char *filename);
__attribute__((deprecated))
          int
  xmlSAXUserParseMemory (xmlSAXHandlerPtr sax,
      void *user_data,
      const char *buffer,
      int size);
__attribute__((deprecated))
          xmlDocPtr
  xmlSAXParseDoc (xmlSAXHandlerPtr sax,
      const xmlChar *cur,
      int recovery);
__attribute__((deprecated))
          xmlDocPtr
  xmlSAXParseMemory (xmlSAXHandlerPtr sax,
      const char *buffer,
      int size,
      int recovery);
__attribute__((deprecated))
          xmlDocPtr
  xmlSAXParseMemoryWithData (xmlSAXHandlerPtr sax,
      const char *buffer,
      int size,
      int recovery,
      void *data);
__attribute__((deprecated))
          xmlDocPtr
  xmlSAXParseFile (xmlSAXHandlerPtr sax,
      const char *filename,
      int recovery);
__attribute__((deprecated))
          xmlDocPtr
  xmlSAXParseFileWithData (xmlSAXHandlerPtr sax,
      const char *filename,
      int recovery,
      void *data);
__attribute__((deprecated))
          xmlDocPtr
  xmlSAXParseEntity (xmlSAXHandlerPtr sax,
      const char *filename);
__attribute__((deprecated))
          xmlDocPtr
  xmlParseEntity (const char *filename);



__attribute__((deprecated))
          xmlDtdPtr
  xmlSAXParseDTD (xmlSAXHandlerPtr sax,
      const xmlChar *ExternalID,
      const xmlChar *SystemID);
          xmlDtdPtr
  xmlParseDTD (const xmlChar *ExternalID,
      const xmlChar *SystemID);
          xmlDtdPtr
  xmlIOParseDTD (xmlSAXHandlerPtr sax,
      xmlParserInputBufferPtr input,
      xmlCharEncoding enc);


          int
  xmlParseBalancedChunkMemory(xmlDocPtr doc,
      xmlSAXHandlerPtr sax,
      void *user_data,
      int depth,
      const xmlChar *string,
      xmlNodePtr *lst);

          xmlParserErrors
  xmlParseInNodeContext (xmlNodePtr node,
      const char *data,
      int datalen,
      int options,
      xmlNodePtr *lst);

          int
  xmlParseBalancedChunkMemoryRecover(xmlDocPtr doc,
                     xmlSAXHandlerPtr sax,
                     void *user_data,
                     int depth,
                     const xmlChar *string,
                     xmlNodePtr *lst,
                     int recover);
__attribute__((deprecated))
          int
  xmlParseExternalEntity (xmlDocPtr doc,
      xmlSAXHandlerPtr sax,
      void *user_data,
      int depth,
      const xmlChar *URL,
      const xmlChar *ID,
      xmlNodePtr *lst);

          int
  xmlParseCtxtExternalEntity(xmlParserCtxtPtr ctx,
      const xmlChar *URL,
      const xmlChar *ID,
      xmlNodePtr *lst);




          xmlParserCtxtPtr
  xmlNewParserCtxt (void);
          xmlParserCtxtPtr
  xmlNewSAXParserCtxt (const xmlSAXHandler *sax,
      void *userData);
          int
  xmlInitParserCtxt (xmlParserCtxtPtr ctxt);
          void
  xmlClearParserCtxt (xmlParserCtxtPtr ctxt);
          void
  xmlFreeParserCtxt (xmlParserCtxtPtr ctxt);

__attribute__((deprecated))
          void
  xmlSetupParserForBuffer (xmlParserCtxtPtr ctxt,
      const xmlChar* buffer,
      const char *filename);

          xmlParserCtxtPtr
  xmlCreateDocParserCtxt (const xmlChar *cur);





__attribute__((deprecated))
          int
  xmlGetFeaturesList (int *len,
      const char **result);
__attribute__((deprecated))
          int
  xmlGetFeature (xmlParserCtxtPtr ctxt,
      const char *name,
      void *result);
__attribute__((deprecated))
          int
  xmlSetFeature (xmlParserCtxtPtr ctxt,
      const char *name,
      void *value);






          xmlParserCtxtPtr
  xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax,
      void *user_data,
      const char *chunk,
      int size,
      const char *filename);
          int
  xmlParseChunk (xmlParserCtxtPtr ctxt,
      const char *chunk,
      int size,
      int terminate);






          xmlParserCtxtPtr
  xmlCreateIOParserCtxt (xmlSAXHandlerPtr sax,
      void *user_data,
      xmlInputReadCallback ioread,
      xmlInputCloseCallback ioclose,
      void *ioctx,
      xmlCharEncoding enc);

          xmlParserInputPtr
  xmlNewIOInputStream (xmlParserCtxtPtr ctxt,
      xmlParserInputBufferPtr input,
      xmlCharEncoding enc);




          const xmlParserNodeInfo*
  xmlParserFindNodeInfo (const xmlParserCtxtPtr ctxt,
             const xmlNodePtr node);
          void
  xmlInitNodeInfoSeq (xmlParserNodeInfoSeqPtr seq);
          void
  xmlClearNodeInfoSeq (xmlParserNodeInfoSeqPtr seq);
          unsigned long
  xmlParserFindNodeInfoIndex(const xmlParserNodeInfoSeqPtr seq,
                                         const xmlNodePtr node);
          void
  xmlParserAddNodeInfo (xmlParserCtxtPtr ctxt,
      const xmlParserNodeInfoPtr info);





          void
  xmlSetExternalEntityLoader(xmlExternalEntityLoader f);
          xmlExternalEntityLoader
  xmlGetExternalEntityLoader(void);
          xmlParserInputPtr
  xmlLoadExternalEntity (const char *URL,
      const char *ID,
      xmlParserCtxtPtr ctxt);




          long
  xmlByteConsumed (xmlParserCtxtPtr ctxt);
# 1229 "/usr/include/libxml2/libxml/parser.h"
typedef enum {
    XML_PARSE_RECOVER = 1<<0,
    XML_PARSE_NOENT = 1<<1,
    XML_PARSE_DTDLOAD = 1<<2,
    XML_PARSE_DTDATTR = 1<<3,
    XML_PARSE_DTDVALID = 1<<4,
    XML_PARSE_NOERROR = 1<<5,
    XML_PARSE_NOWARNING = 1<<6,
    XML_PARSE_PEDANTIC = 1<<7,
    XML_PARSE_NOBLANKS = 1<<8,
    XML_PARSE_SAX1 = 1<<9,
    XML_PARSE_XINCLUDE = 1<<10,
    XML_PARSE_NONET = 1<<11,
    XML_PARSE_NODICT = 1<<12,
    XML_PARSE_NSCLEAN = 1<<13,
    XML_PARSE_NOCDATA = 1<<14,
    XML_PARSE_NOXINCNODE= 1<<15,
    XML_PARSE_COMPACT = 1<<16,


    XML_PARSE_OLD10 = 1<<17,
    XML_PARSE_NOBASEFIX = 1<<18,
    XML_PARSE_HUGE = 1<<19,
    XML_PARSE_OLDSAX = 1<<20,
    XML_PARSE_IGNORE_ENC= 1<<21,
    XML_PARSE_BIG_LINES = 1<<22
} xmlParserOption;

          void
  xmlCtxtReset (xmlParserCtxtPtr ctxt);
          int
  xmlCtxtResetPush (xmlParserCtxtPtr ctxt,
      const char *chunk,
      int size,
      const char *filename,
      const char *encoding);
          int
  xmlCtxtUseOptions (xmlParserCtxtPtr ctxt,
      int options);
          void
  xmlCtxtSetMaxAmplification(xmlParserCtxtPtr ctxt,
      unsigned maxAmpl);
          xmlDocPtr
  xmlReadDoc (const xmlChar *cur,
      const char *URL,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlReadFile (const char *URL,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlReadMemory (const char *buffer,
      int size,
      const char *URL,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlReadFd (int fd,
      const char *URL,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlReadIO (xmlInputReadCallback ioread,
      xmlInputCloseCallback ioclose,
      void *ioctx,
      const char *URL,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlCtxtReadDoc (xmlParserCtxtPtr ctxt,
      const xmlChar *cur,
      const char *URL,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlCtxtReadFile (xmlParserCtxtPtr ctxt,
      const char *filename,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlCtxtReadMemory (xmlParserCtxtPtr ctxt,
      const char *buffer,
      int size,
      const char *URL,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlCtxtReadFd (xmlParserCtxtPtr ctxt,
      int fd,
      const char *URL,
      const char *encoding,
      int options);
          xmlDocPtr
  xmlCtxtReadIO (xmlParserCtxtPtr ctxt,
      xmlInputReadCallback ioread,
      xmlInputCloseCallback ioclose,
      void *ioctx,
      const char *URL,
      const char *encoding,
      int options);
# 1341 "/usr/include/libxml2/libxml/parser.h"
typedef enum {
    XML_WITH_THREAD = 1,
    XML_WITH_TREE = 2,
    XML_WITH_OUTPUT = 3,
    XML_WITH_PUSH = 4,
    XML_WITH_READER = 5,
    XML_WITH_PATTERN = 6,
    XML_WITH_WRITER = 7,
    XML_WITH_SAX1 = 8,
    XML_WITH_FTP = 9,
    XML_WITH_HTTP = 10,
    XML_WITH_VALID = 11,
    XML_WITH_HTML = 12,
    XML_WITH_LEGACY = 13,
    XML_WITH_C14N = 14,
    XML_WITH_CATALOG = 15,
    XML_WITH_XPATH = 16,
    XML_WITH_XPTR = 17,
    XML_WITH_XINCLUDE = 18,
    XML_WITH_ICONV = 19,
    XML_WITH_ISO8859X = 20,
    XML_WITH_UNICODE = 21,
    XML_WITH_REGEXP = 22,
    XML_WITH_AUTOMATA = 23,
    XML_WITH_EXPR = 24,
    XML_WITH_SCHEMAS = 25,
    XML_WITH_SCHEMATRON = 26,
    XML_WITH_MODULES = 27,
    XML_WITH_DEBUG = 28,
    XML_WITH_DEBUG_MEM = 29,
    XML_WITH_DEBUG_RUN = 30,
    XML_WITH_ZLIB = 31,
    XML_WITH_ICU = 32,
    XML_WITH_LZMA = 33,
    XML_WITH_NONE = 99999
} xmlFeature;

          int
  xmlHasFeature (xmlFeature feature);
# 18 "/usr/include/libxml2/libxml/tree.h" 2
# 15 "/usr/include/libxml2/libxml/xmlreader.h" 2



# 1 "/usr/include/libxml2/libxml/relaxng.h" 1
# 16 "/usr/include/libxml2/libxml/relaxng.h"
# 1 "/usr/include/libxml2/libxml/tree.h" 1
# 17 "/usr/include/libxml2/libxml/relaxng.h" 2







typedef struct _xmlRelaxNG xmlRelaxNG;
typedef xmlRelaxNG *xmlRelaxNGPtr;
# 36 "/usr/include/libxml2/libxml/relaxng.h"
typedef void (*xmlRelaxNGValidityErrorFunc) (void *ctx,
            const char *msg,
            ...) __attribute__((__format__(__printf__,2,3)));
# 48 "/usr/include/libxml2/libxml/relaxng.h"
typedef void (*xmlRelaxNGValidityWarningFunc) (void *ctx,
       const char *msg,
       ...) __attribute__((__format__(__printf__,2,3)));




typedef struct _xmlRelaxNGParserCtxt xmlRelaxNGParserCtxt;
typedef xmlRelaxNGParserCtxt *xmlRelaxNGParserCtxtPtr;

typedef struct _xmlRelaxNGValidCtxt xmlRelaxNGValidCtxt;
typedef xmlRelaxNGValidCtxt *xmlRelaxNGValidCtxtPtr;






typedef enum {
    XML_RELAXNG_OK = 0,
    XML_RELAXNG_ERR_MEMORY,
    XML_RELAXNG_ERR_TYPE,
    XML_RELAXNG_ERR_TYPEVAL,
    XML_RELAXNG_ERR_DUPID,
    XML_RELAXNG_ERR_TYPECMP,
    XML_RELAXNG_ERR_NOSTATE,
    XML_RELAXNG_ERR_NODEFINE,
    XML_RELAXNG_ERR_LISTEXTRA,
    XML_RELAXNG_ERR_LISTEMPTY,
    XML_RELAXNG_ERR_INTERNODATA,
    XML_RELAXNG_ERR_INTERSEQ,
    XML_RELAXNG_ERR_INTEREXTRA,
    XML_RELAXNG_ERR_ELEMNAME,
    XML_RELAXNG_ERR_ATTRNAME,
    XML_RELAXNG_ERR_ELEMNONS,
    XML_RELAXNG_ERR_ATTRNONS,
    XML_RELAXNG_ERR_ELEMWRONGNS,
    XML_RELAXNG_ERR_ATTRWRONGNS,
    XML_RELAXNG_ERR_ELEMEXTRANS,
    XML_RELAXNG_ERR_ATTREXTRANS,
    XML_RELAXNG_ERR_ELEMNOTEMPTY,
    XML_RELAXNG_ERR_NOELEM,
    XML_RELAXNG_ERR_NOTELEM,
    XML_RELAXNG_ERR_ATTRVALID,
    XML_RELAXNG_ERR_CONTENTVALID,
    XML_RELAXNG_ERR_EXTRACONTENT,
    XML_RELAXNG_ERR_INVALIDATTR,
    XML_RELAXNG_ERR_DATAELEM,
    XML_RELAXNG_ERR_VALELEM,
    XML_RELAXNG_ERR_LISTELEM,
    XML_RELAXNG_ERR_DATATYPE,
    XML_RELAXNG_ERR_VALUE,
    XML_RELAXNG_ERR_LIST,
    XML_RELAXNG_ERR_NOGRAMMAR,
    XML_RELAXNG_ERR_EXTRADATA,
    XML_RELAXNG_ERR_LACKDATA,
    XML_RELAXNG_ERR_INTERNAL,
    XML_RELAXNG_ERR_ELEMWRONG,
    XML_RELAXNG_ERR_TEXTWRONG
} xmlRelaxNGValidErr;






typedef enum {
    XML_RELAXNGP_NONE = 0,
    XML_RELAXNGP_FREE_DOC = 1,
    XML_RELAXNGP_CRNG = 2
} xmlRelaxNGParserFlag;

          int
      xmlRelaxNGInitTypes (void);
__attribute__((deprecated))
          void
      xmlRelaxNGCleanupTypes (void);




          xmlRelaxNGParserCtxtPtr
      xmlRelaxNGNewParserCtxt (const char *URL);
          xmlRelaxNGParserCtxtPtr
      xmlRelaxNGNewMemParserCtxt (const char *buffer,
       int size);
          xmlRelaxNGParserCtxtPtr
      xmlRelaxNGNewDocParserCtxt (xmlDocPtr doc);

          int
      xmlRelaxParserSetFlag (xmlRelaxNGParserCtxtPtr ctxt,
       int flag);

          void
      xmlRelaxNGFreeParserCtxt (xmlRelaxNGParserCtxtPtr ctxt);
          void
      xmlRelaxNGSetParserErrors(xmlRelaxNGParserCtxtPtr ctxt,
      xmlRelaxNGValidityErrorFunc err,
      xmlRelaxNGValidityWarningFunc warn,
      void *ctx);
          int
      xmlRelaxNGGetParserErrors(xmlRelaxNGParserCtxtPtr ctxt,
      xmlRelaxNGValidityErrorFunc *err,
      xmlRelaxNGValidityWarningFunc *warn,
      void **ctx);
          void
      xmlRelaxNGSetParserStructuredErrors(
      xmlRelaxNGParserCtxtPtr ctxt,
      xmlStructuredErrorFunc serror,
      void *ctx);
          xmlRelaxNGPtr
      xmlRelaxNGParse (xmlRelaxNGParserCtxtPtr ctxt);
          void
      xmlRelaxNGFree (xmlRelaxNGPtr schema);

          void
      xmlRelaxNGDump (FILE *output,
      xmlRelaxNGPtr schema);
          void
      xmlRelaxNGDumpTree (FILE * output,
      xmlRelaxNGPtr schema);




          void
      xmlRelaxNGSetValidErrors(xmlRelaxNGValidCtxtPtr ctxt,
      xmlRelaxNGValidityErrorFunc err,
      xmlRelaxNGValidityWarningFunc warn,
      void *ctx);
          int
      xmlRelaxNGGetValidErrors(xmlRelaxNGValidCtxtPtr ctxt,
      xmlRelaxNGValidityErrorFunc *err,
      xmlRelaxNGValidityWarningFunc *warn,
      void **ctx);
          void
   xmlRelaxNGSetValidStructuredErrors(xmlRelaxNGValidCtxtPtr ctxt,
       xmlStructuredErrorFunc serror, void *ctx);
          xmlRelaxNGValidCtxtPtr
      xmlRelaxNGNewValidCtxt (xmlRelaxNGPtr schema);
          void
      xmlRelaxNGFreeValidCtxt (xmlRelaxNGValidCtxtPtr ctxt);
          int
      xmlRelaxNGValidateDoc (xmlRelaxNGValidCtxtPtr ctxt,
       xmlDocPtr doc);



          int
      xmlRelaxNGValidatePushElement (xmlRelaxNGValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem);
          int
      xmlRelaxNGValidatePushCData (xmlRelaxNGValidCtxtPtr ctxt,
      const xmlChar *data,
      int len);
          int
      xmlRelaxNGValidatePopElement (xmlRelaxNGValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem);
          int
      xmlRelaxNGValidateFullElement (xmlRelaxNGValidCtxtPtr ctxt,
      xmlDocPtr doc,
      xmlNodePtr elem);
# 19 "/usr/include/libxml2/libxml/xmlreader.h" 2
# 1 "/usr/include/libxml2/libxml/xmlschemas.h" 1
# 21 "/usr/include/libxml2/libxml/xmlschemas.h"
# 1 "/usr/include/libxml2/libxml/tree.h" 1
# 22 "/usr/include/libxml2/libxml/xmlschemas.h" 2
# 31 "/usr/include/libxml2/libxml/xmlschemas.h"
typedef enum {
    XML_SCHEMAS_ERR_OK = 0,
    XML_SCHEMAS_ERR_NOROOT = 1,
    XML_SCHEMAS_ERR_UNDECLAREDELEM,
    XML_SCHEMAS_ERR_NOTTOPLEVEL,
    XML_SCHEMAS_ERR_MISSING,
    XML_SCHEMAS_ERR_WRONGELEM,
    XML_SCHEMAS_ERR_NOTYPE,
    XML_SCHEMAS_ERR_NOROLLBACK,
    XML_SCHEMAS_ERR_ISABSTRACT,
    XML_SCHEMAS_ERR_NOTEMPTY,
    XML_SCHEMAS_ERR_ELEMCONT,
    XML_SCHEMAS_ERR_HAVEDEFAULT,
    XML_SCHEMAS_ERR_NOTNILLABLE,
    XML_SCHEMAS_ERR_EXTRACONTENT,
    XML_SCHEMAS_ERR_INVALIDATTR,
    XML_SCHEMAS_ERR_INVALIDELEM,
    XML_SCHEMAS_ERR_NOTDETERMINIST,
    XML_SCHEMAS_ERR_CONSTRUCT,
    XML_SCHEMAS_ERR_INTERNAL,
    XML_SCHEMAS_ERR_NOTSIMPLE,
    XML_SCHEMAS_ERR_ATTRUNKNOWN,
    XML_SCHEMAS_ERR_ATTRINVALID,
    XML_SCHEMAS_ERR_VALUE,
    XML_SCHEMAS_ERR_FACET,
    XML_SCHEMAS_ERR_,
    XML_SCHEMAS_ERR_XXX
} xmlSchemaValidError;
# 70 "/usr/include/libxml2/libxml/xmlschemas.h"
typedef enum {
    XML_SCHEMA_VAL_VC_I_CREATE = 1<<0



} xmlSchemaValidOption;
# 87 "/usr/include/libxml2/libxml/xmlschemas.h"
typedef struct _xmlSchema xmlSchema;
typedef xmlSchema *xmlSchemaPtr;
# 98 "/usr/include/libxml2/libxml/xmlschemas.h"
typedef void (*xmlSchemaValidityErrorFunc)
                 (void *ctx, const char *msg, ...) __attribute__((__format__(__printf__,2,3)));
# 109 "/usr/include/libxml2/libxml/xmlschemas.h"
typedef void (*xmlSchemaValidityWarningFunc)
                 (void *ctx, const char *msg, ...) __attribute__((__format__(__printf__,2,3)));




typedef struct _xmlSchemaParserCtxt xmlSchemaParserCtxt;
typedef xmlSchemaParserCtxt *xmlSchemaParserCtxtPtr;

typedef struct _xmlSchemaValidCtxt xmlSchemaValidCtxt;
typedef xmlSchemaValidCtxt *xmlSchemaValidCtxtPtr;
# 134 "/usr/include/libxml2/libxml/xmlschemas.h"
typedef int (*xmlSchemaValidityLocatorFunc) (void *ctx,
                           const char **file, unsigned long *line);




          xmlSchemaParserCtxtPtr
     xmlSchemaNewParserCtxt (const char *URL);
          xmlSchemaParserCtxtPtr
     xmlSchemaNewMemParserCtxt (const char *buffer,
      int size);
          xmlSchemaParserCtxtPtr
     xmlSchemaNewDocParserCtxt (xmlDocPtr doc);
          void
     xmlSchemaFreeParserCtxt (xmlSchemaParserCtxtPtr ctxt);
          void
     xmlSchemaSetParserErrors (xmlSchemaParserCtxtPtr ctxt,
      xmlSchemaValidityErrorFunc err,
      xmlSchemaValidityWarningFunc warn,
      void *ctx);
          void
     xmlSchemaSetParserStructuredErrors(xmlSchemaParserCtxtPtr ctxt,
      xmlStructuredErrorFunc serror,
      void *ctx);
          int
  xmlSchemaGetParserErrors(xmlSchemaParserCtxtPtr ctxt,
     xmlSchemaValidityErrorFunc * err,
     xmlSchemaValidityWarningFunc * warn,
     void **ctx);
          int
  xmlSchemaIsValid (xmlSchemaValidCtxtPtr ctxt);

          xmlSchemaPtr
     xmlSchemaParse (xmlSchemaParserCtxtPtr ctxt);
          void
     xmlSchemaFree (xmlSchemaPtr schema);

          void
     xmlSchemaDump (FILE *output,
      xmlSchemaPtr schema);




          void
     xmlSchemaSetValidErrors (xmlSchemaValidCtxtPtr ctxt,
      xmlSchemaValidityErrorFunc err,
      xmlSchemaValidityWarningFunc warn,
      void *ctx);
          void
     xmlSchemaSetValidStructuredErrors(xmlSchemaValidCtxtPtr ctxt,
      xmlStructuredErrorFunc serror,
      void *ctx);
          int
     xmlSchemaGetValidErrors (xmlSchemaValidCtxtPtr ctxt,
      xmlSchemaValidityErrorFunc *err,
      xmlSchemaValidityWarningFunc *warn,
      void **ctx);
          int
     xmlSchemaSetValidOptions (xmlSchemaValidCtxtPtr ctxt,
      int options);
          void
            xmlSchemaValidateSetFilename(xmlSchemaValidCtxtPtr vctxt,
                                  const char *filename);
          int
     xmlSchemaValidCtxtGetOptions(xmlSchemaValidCtxtPtr ctxt);

          xmlSchemaValidCtxtPtr
     xmlSchemaNewValidCtxt (xmlSchemaPtr schema);
          void
     xmlSchemaFreeValidCtxt (xmlSchemaValidCtxtPtr ctxt);
          int
     xmlSchemaValidateDoc (xmlSchemaValidCtxtPtr ctxt,
      xmlDocPtr instance);
          int
            xmlSchemaValidateOneElement (xmlSchemaValidCtxtPtr ctxt,
                    xmlNodePtr elem);
          int
     xmlSchemaValidateStream (xmlSchemaValidCtxtPtr ctxt,
      xmlParserInputBufferPtr input,
      xmlCharEncoding enc,
      xmlSAXHandlerPtr sax,
      void *user_data);
          int
     xmlSchemaValidateFile (xmlSchemaValidCtxtPtr ctxt,
      const char * filename,
      int options);

          xmlParserCtxtPtr
     xmlSchemaValidCtxtGetParserCtxt(xmlSchemaValidCtxtPtr ctxt);




typedef struct _xmlSchemaSAXPlug xmlSchemaSAXPlugStruct;
typedef xmlSchemaSAXPlugStruct *xmlSchemaSAXPlugPtr;

          xmlSchemaSAXPlugPtr
            xmlSchemaSAXPlug (xmlSchemaValidCtxtPtr ctxt,
      xmlSAXHandlerPtr *sax,
      void **user_data);
          int
            xmlSchemaSAXUnplug (xmlSchemaSAXPlugPtr plug);


          void
            xmlSchemaValidateSetLocator (xmlSchemaValidCtxtPtr vctxt,
      xmlSchemaValidityLocatorFunc f,
      void *ctxt);
# 20 "/usr/include/libxml2/libxml/xmlreader.h" 2
# 34 "/usr/include/libxml2/libxml/xmlreader.h"
typedef enum {
    XML_PARSER_SEVERITY_VALIDITY_WARNING = 1,
    XML_PARSER_SEVERITY_VALIDITY_ERROR = 2,
    XML_PARSER_SEVERITY_WARNING = 3,
    XML_PARSER_SEVERITY_ERROR = 4
} xmlParserSeverities;
# 48 "/usr/include/libxml2/libxml/xmlreader.h"
typedef enum {
    XML_TEXTREADER_MODE_INITIAL = 0,
    XML_TEXTREADER_MODE_INTERACTIVE = 1,
    XML_TEXTREADER_MODE_ERROR = 2,
    XML_TEXTREADER_MODE_EOF =3,
    XML_TEXTREADER_MODE_CLOSED = 4,
    XML_TEXTREADER_MODE_READING = 5
} xmlTextReaderMode;
# 64 "/usr/include/libxml2/libxml/xmlreader.h"
typedef enum {
    XML_PARSER_LOADDTD = 1,
    XML_PARSER_DEFAULTATTRS = 2,
    XML_PARSER_VALIDATE = 3,
    XML_PARSER_SUBST_ENTITIES = 4
} xmlParserProperties;






typedef enum {
    XML_READER_TYPE_NONE = 0,
    XML_READER_TYPE_ELEMENT = 1,
    XML_READER_TYPE_ATTRIBUTE = 2,
    XML_READER_TYPE_TEXT = 3,
    XML_READER_TYPE_CDATA = 4,
    XML_READER_TYPE_ENTITY_REFERENCE = 5,
    XML_READER_TYPE_ENTITY = 6,
    XML_READER_TYPE_PROCESSING_INSTRUCTION = 7,
    XML_READER_TYPE_COMMENT = 8,
    XML_READER_TYPE_DOCUMENT = 9,
    XML_READER_TYPE_DOCUMENT_TYPE = 10,
    XML_READER_TYPE_DOCUMENT_FRAGMENT = 11,
    XML_READER_TYPE_NOTATION = 12,
    XML_READER_TYPE_WHITESPACE = 13,
    XML_READER_TYPE_SIGNIFICANT_WHITESPACE = 14,
    XML_READER_TYPE_END_ELEMENT = 15,
    XML_READER_TYPE_END_ENTITY = 16,
    XML_READER_TYPE_XML_DECLARATION = 17
} xmlReaderTypes;






typedef struct _xmlTextReader xmlTextReader;






typedef xmlTextReader *xmlTextReaderPtr;




          xmlTextReaderPtr
   xmlNewTextReader (xmlParserInputBufferPtr input,
                                          const char *URI);
          xmlTextReaderPtr
   xmlNewTextReaderFilename(const char *URI);

          void
   xmlFreeTextReader (xmlTextReaderPtr reader);

          int
            xmlTextReaderSetup(xmlTextReaderPtr reader,
                   xmlParserInputBufferPtr input, const char *URL,
                   const char *encoding, int options);
          void
            xmlTextReaderSetMaxAmplification(xmlTextReaderPtr reader,
                   unsigned maxAmpl);




          int
   xmlTextReaderRead (xmlTextReaderPtr reader);


          xmlChar *
   xmlTextReaderReadInnerXml(xmlTextReaderPtr reader);

          xmlChar *
   xmlTextReaderReadOuterXml(xmlTextReaderPtr reader);


          xmlChar *
   xmlTextReaderReadString (xmlTextReaderPtr reader);
          int
   xmlTextReaderReadAttributeValue(xmlTextReaderPtr reader);




          int
   xmlTextReaderAttributeCount(xmlTextReaderPtr reader);
          int
   xmlTextReaderDepth (xmlTextReaderPtr reader);
          int
   xmlTextReaderHasAttributes(xmlTextReaderPtr reader);
          int
   xmlTextReaderHasValue(xmlTextReaderPtr reader);
          int
   xmlTextReaderIsDefault (xmlTextReaderPtr reader);
          int
   xmlTextReaderIsEmptyElement(xmlTextReaderPtr reader);
          int
   xmlTextReaderNodeType (xmlTextReaderPtr reader);
          int
   xmlTextReaderQuoteChar (xmlTextReaderPtr reader);
          int
   xmlTextReaderReadState (xmlTextReaderPtr reader);
          int
                        xmlTextReaderIsNamespaceDecl(xmlTextReaderPtr reader);

          const xmlChar *
      xmlTextReaderConstBaseUri (xmlTextReaderPtr reader);
          const xmlChar *
      xmlTextReaderConstLocalName (xmlTextReaderPtr reader);
          const xmlChar *
      xmlTextReaderConstName (xmlTextReaderPtr reader);
          const xmlChar *
      xmlTextReaderConstNamespaceUri(xmlTextReaderPtr reader);
          const xmlChar *
      xmlTextReaderConstPrefix (xmlTextReaderPtr reader);
          const xmlChar *
      xmlTextReaderConstXmlLang (xmlTextReaderPtr reader);
          const xmlChar *
      xmlTextReaderConstString (xmlTextReaderPtr reader,
       const xmlChar *str);
          const xmlChar *
      xmlTextReaderConstValue (xmlTextReaderPtr reader);





          xmlChar *
   xmlTextReaderBaseUri (xmlTextReaderPtr reader);
          xmlChar *
   xmlTextReaderLocalName (xmlTextReaderPtr reader);
          xmlChar *
   xmlTextReaderName (xmlTextReaderPtr reader);
          xmlChar *
   xmlTextReaderNamespaceUri(xmlTextReaderPtr reader);
          xmlChar *
   xmlTextReaderPrefix (xmlTextReaderPtr reader);
          xmlChar *
   xmlTextReaderXmlLang (xmlTextReaderPtr reader);
          xmlChar *
   xmlTextReaderValue (xmlTextReaderPtr reader);




          int
      xmlTextReaderClose (xmlTextReaderPtr reader);
          xmlChar *
      xmlTextReaderGetAttributeNo (xmlTextReaderPtr reader,
       int no);
          xmlChar *
      xmlTextReaderGetAttribute (xmlTextReaderPtr reader,
       const xmlChar *name);
          xmlChar *
      xmlTextReaderGetAttributeNs (xmlTextReaderPtr reader,
       const xmlChar *localName,
       const xmlChar *namespaceURI);
          xmlParserInputBufferPtr
      xmlTextReaderGetRemainder (xmlTextReaderPtr reader);
          xmlChar *
      xmlTextReaderLookupNamespace(xmlTextReaderPtr reader,
       const xmlChar *prefix);
          int
      xmlTextReaderMoveToAttributeNo(xmlTextReaderPtr reader,
       int no);
          int
      xmlTextReaderMoveToAttribute(xmlTextReaderPtr reader,
       const xmlChar *name);
          int
      xmlTextReaderMoveToAttributeNs(xmlTextReaderPtr reader,
       const xmlChar *localName,
       const xmlChar *namespaceURI);
          int
      xmlTextReaderMoveToFirstAttribute(xmlTextReaderPtr reader);
          int
      xmlTextReaderMoveToNextAttribute(xmlTextReaderPtr reader);
          int
      xmlTextReaderMoveToElement (xmlTextReaderPtr reader);
          int
      xmlTextReaderNormalization (xmlTextReaderPtr reader);
          const xmlChar *
      xmlTextReaderConstEncoding (xmlTextReaderPtr reader);




          int
      xmlTextReaderSetParserProp (xmlTextReaderPtr reader,
       int prop,
       int value);
          int
      xmlTextReaderGetParserProp (xmlTextReaderPtr reader,
       int prop);
          xmlNodePtr
      xmlTextReaderCurrentNode (xmlTextReaderPtr reader);

          int
            xmlTextReaderGetParserLineNumber(xmlTextReaderPtr reader);

          int
            xmlTextReaderGetParserColumnNumber(xmlTextReaderPtr reader);

          xmlNodePtr
      xmlTextReaderPreserve (xmlTextReaderPtr reader);

          int
      xmlTextReaderPreservePattern(xmlTextReaderPtr reader,
       const xmlChar *pattern,
       const xmlChar **namespaces);

          xmlDocPtr
      xmlTextReaderCurrentDoc (xmlTextReaderPtr reader);
          xmlNodePtr
      xmlTextReaderExpand (xmlTextReaderPtr reader);
          int
      xmlTextReaderNext (xmlTextReaderPtr reader);
          int
      xmlTextReaderNextSibling (xmlTextReaderPtr reader);
          int
      xmlTextReaderIsValid (xmlTextReaderPtr reader);

          int
      xmlTextReaderRelaxNGValidate(xmlTextReaderPtr reader,
       const char *rng);
          int
      xmlTextReaderRelaxNGValidateCtxt(xmlTextReaderPtr reader,
       xmlRelaxNGValidCtxtPtr ctxt,
       int options);

          int
      xmlTextReaderRelaxNGSetSchema(xmlTextReaderPtr reader,
       xmlRelaxNGPtr schema);
          int
      xmlTextReaderSchemaValidate (xmlTextReaderPtr reader,
       const char *xsd);
          int
      xmlTextReaderSchemaValidateCtxt(xmlTextReaderPtr reader,
       xmlSchemaValidCtxtPtr ctxt,
       int options);
          int
      xmlTextReaderSetSchema (xmlTextReaderPtr reader,
       xmlSchemaPtr schema);

          const xmlChar *
      xmlTextReaderConstXmlVersion(xmlTextReaderPtr reader);
          int
      xmlTextReaderStandalone (xmlTextReaderPtr reader);





          long
  xmlTextReaderByteConsumed (xmlTextReaderPtr reader);




          xmlTextReaderPtr
  xmlReaderWalker (xmlDocPtr doc);
          xmlTextReaderPtr
  xmlReaderForDoc (const xmlChar * cur,
      const char *URL,
      const char *encoding,
      int options);
          xmlTextReaderPtr
  xmlReaderForFile (const char *filename,
      const char *encoding,
      int options);
          xmlTextReaderPtr
  xmlReaderForMemory (const char *buffer,
      int size,
      const char *URL,
      const char *encoding,
      int options);
          xmlTextReaderPtr
  xmlReaderForFd (int fd,
      const char *URL,
      const char *encoding,
      int options);
          xmlTextReaderPtr
  xmlReaderForIO (xmlInputReadCallback ioread,
      xmlInputCloseCallback ioclose,
      void *ioctx,
      const char *URL,
      const char *encoding,
      int options);

          int
  xmlReaderNewWalker (xmlTextReaderPtr reader,
      xmlDocPtr doc);
          int
  xmlReaderNewDoc (xmlTextReaderPtr reader,
      const xmlChar * cur,
      const char *URL,
      const char *encoding,
      int options);
          int
  xmlReaderNewFile (xmlTextReaderPtr reader,
      const char *filename,
      const char *encoding,
      int options);
          int
  xmlReaderNewMemory (xmlTextReaderPtr reader,
      const char *buffer,
      int size,
      const char *URL,
      const char *encoding,
      int options);
          int
  xmlReaderNewFd (xmlTextReaderPtr reader,
      int fd,
      const char *URL,
      const char *encoding,
      int options);
          int
  xmlReaderNewIO (xmlTextReaderPtr reader,
      xmlInputReadCallback ioread,
      xmlInputCloseCallback ioclose,
      void *ioctx,
      const char *URL,
      const char *encoding,
      int options);



typedef void * xmlTextReaderLocatorPtr;
# 406 "/usr/include/libxml2/libxml/xmlreader.h"
typedef void (*xmlTextReaderErrorFunc)(void *arg,
            const char *msg,
            xmlParserSeverities severity,
            xmlTextReaderLocatorPtr locator);
          int
     xmlTextReaderLocatorLineNumber(xmlTextReaderLocatorPtr locator);
          xmlChar *
     xmlTextReaderLocatorBaseURI (xmlTextReaderLocatorPtr locator);
          void
     xmlTextReaderSetErrorHandler(xmlTextReaderPtr reader,
      xmlTextReaderErrorFunc f,
      void *arg);
          void
     xmlTextReaderSetStructuredErrorHandler(xmlTextReaderPtr reader,
         xmlStructuredErrorFunc f,
         void *arg);
          void
     xmlTextReaderGetErrorHandler(xmlTextReaderPtr reader,
      xmlTextReaderErrorFunc *f,
      void **arg);
# 46 "pluma-spell-checker-language.c" 2

# 1 "./pluma-spell-checker-language.h" 1
# 38 "./pluma-spell-checker-language.h"
typedef struct _PlumaSpellCheckerLanguage PlumaSpellCheckerLanguage;

const gchar *pluma_spell_checker_language_to_string (const PlumaSpellCheckerLanguage *lang);

const gchar *pluma_spell_checker_language_to_key (const PlumaSpellCheckerLanguage *lang);

const PlumaSpellCheckerLanguage *pluma_spell_checker_language_from_key (const gchar *key);


const GSList *pluma_spell_checker_get_available_languages
         (void);
# 48 "pluma-spell-checker-language.c" 2

# 1 "../../pluma/pluma-debug.h" 1
# 44 "../../pluma/pluma-debug.h"
typedef enum {
 PLUMA_NO_DEBUG = 0,
 PLUMA_DEBUG_VIEW = 1 << 0,
 PLUMA_DEBUG_SEARCH = 1 << 1,
 PLUMA_DEBUG_PRINT = 1 << 2,
 PLUMA_DEBUG_PREFS = 1 << 3,
 PLUMA_DEBUG_PLUGINS = 1 << 4,
 PLUMA_DEBUG_TAB = 1 << 5,
 PLUMA_DEBUG_DOCUMENT = 1 << 6,
 PLUMA_DEBUG_COMMANDS = 1 << 7,
 PLUMA_DEBUG_APP = 1 << 8,
 PLUMA_DEBUG_SESSION = 1 << 9,
 PLUMA_DEBUG_UTILS = 1 << 10,
 PLUMA_DEBUG_METADATA = 1 << 11,
 PLUMA_DEBUG_WINDOW = 1 << 12,
 PLUMA_DEBUG_LOADER = 1 << 13,
 PLUMA_DEBUG_SAVER = 1 << 14
} PlumaDebugSection;
# 81 "../../pluma/pluma-debug.h"
void pluma_debug_init (void);

void pluma_debug (PlumaDebugSection section,
    const gchar *file,
    gint line,
    const gchar *function);

void pluma_debug_message (PlumaDebugSection section,
     const gchar *file,
     gint line,
     const gchar *function,
     const gchar *format, ...) __attribute__((__format__ (__printf__, 5, 6)));
# 50 "pluma-spell-checker-language.c" 2






struct _PlumaSpellCheckerLanguage
{
 gchar *abrev;
 gchar *name;
};

static gboolean available_languages_initialized = (0);
static GSList *available_languages = ((void*)0);

static GHashTable *iso_639_table = ((void*)0);
static GHashTable *iso_3166_table = ((void*)0);

static void
bind_iso_domains (void)
{
 static gboolean bound = (0);

 if (bound == (0))
 {
         bindtextdomain ("iso_639", "/usr" "/share/locale");
         bind_textdomain_codeset ("iso_639", "UTF-8");

         bindtextdomain("iso_3166", "/usr" "/share/locale");
         bind_textdomain_codeset ("iso_3166", "UTF-8");

  bound = (!(0));
 }
}

static void
read_iso_639_entry (xmlTextReaderPtr reader,
      GHashTable *table)
{
 xmlChar *code, *name;

 code = xmlTextReaderGetAttribute (reader, (const xmlChar *) "iso_639_1_code");
 name = xmlTextReaderGetAttribute (reader, (const xmlChar *) "name");


 if (code == ((void*)0) || code[0] == '\0')
 {
  xmlFree (code);

  code = xmlTextReaderGetAttribute (reader, (const xmlChar *) "iso_639_2T_code");
 }

 if (code != ((void*)0) && code[0] != '\0' && name != ((void*)0) && name[0] != '\0')
 {
  g_hash_table_insert (table, code, name);
 }
 else
 {
  xmlFree (code);
  xmlFree (name);
 }
}

static void
read_iso_3166_entry (xmlTextReaderPtr reader,
       GHashTable *table)
{
 xmlChar *code, *name;

 code = xmlTextReaderGetAttribute (reader, (const xmlChar *) "alpha_2_code");
 name = xmlTextReaderGetAttribute (reader, (const xmlChar *) "name");

 if (code != ((void*)0) && code[0] != '\0' && name != ((void*)0) && name[0] != '\0')
 {
  char *lcode;

  lcode = g_ascii_strdown ((char *) code, -1);
  xmlFree (code);



  g_hash_table_insert (table, lcode, name);
 }
 else
 {
  xmlFree (code);
  xmlFree (name);
 }
}

typedef enum
{
 STATE_START,
 STATE_STOP,
 STATE_ENTRIES,
} ParserState;

static void
load_iso_entries (int iso,
    GFunc read_entry_func,
    gpointer user_data)
{
 xmlTextReaderPtr reader;
 ParserState state = STATE_START;
 xmlChar iso_entries[32], iso_entry[32];
 char *filename;
 int ret = -1;

 pluma_debug_message (PLUMA_DEBUG_PLUGINS, "pluma-spell-checker-language.c", 158, ((const char*) (__func__)), "Loading ISO-%d codes", iso);

 filename = g_strdup_printf ("/usr" "/share/xml/iso-codes/iso_%d.xml", iso);
 reader = xmlNewTextReaderFilename (filename);
 if (reader == ((void*)0)) goto out;

 xmlStrPrintf (iso_entries, sizeof (iso_entries), (const char *)"iso_%d_entries", iso);
 xmlStrPrintf (iso_entry, sizeof (iso_entry), (const char *)"iso_%d_entry", iso);

 ret = xmlTextReaderRead (reader);

 while (ret == 1)
 {
  const xmlChar *tag;
  xmlReaderTypes type;

  tag = xmlTextReaderConstName (reader);
  type = xmlTextReaderNodeType (reader);

  if (state == STATE_ENTRIES &&
      type == XML_READER_TYPE_ELEMENT &&
      xmlStrEqual (tag, iso_entry))
  {
   read_entry_func (reader, user_data);
  }
  else if (state == STATE_START &&
    type == XML_READER_TYPE_ELEMENT &&
    xmlStrEqual (tag, iso_entries))
  {
   state = STATE_ENTRIES;
  }
  else if (state == STATE_ENTRIES &&
    type == XML_READER_TYPE_END_ELEMENT &&
    xmlStrEqual (tag, iso_entries))
  {
   state = STATE_STOP;
  }
  else if (type == XML_READER_TYPE_SIGNIFICANT_WHITESPACE ||
    type == XML_READER_TYPE_WHITESPACE ||
    type == XML_READER_TYPE_TEXT ||
    type == XML_READER_TYPE_COMMENT)
  {

  }
  else
  {

  }

  ret = xmlTextReaderRead (reader);
 }

 xmlFreeTextReader (reader);

out:
 if (ret < 0 || state != STATE_STOP)
 {
  g_log (((gchar*) 0), G_LOG_LEVEL_WARNING, "Failed to load ISO-%d codes from %s!\n", iso, filename);

 }

 g_free (filename);
}

static GHashTable *
create_iso_639_table (void)
{
 GHashTable *table;

 bind_iso_domains ();
 table = g_hash_table_new_full (g_str_hash, g_str_equal,
           (GDestroyNotify) xmlFree,
           (GDestroyNotify) xmlFree);

 load_iso_entries (639, (GFunc) read_iso_639_entry, table);

 return table;
}

static GHashTable *
create_iso_3166_table (void)
{
 GHashTable *table;

 bind_iso_domains ();
 table = g_hash_table_new_full (g_str_hash, g_str_equal,
           (GDestroyNotify) g_free,
           (GDestroyNotify) xmlFree);

 load_iso_entries (3166, (GFunc) read_iso_3166_entry, table);

 return table;
}

static char *
create_name_for_language (const char *code)
{
 char **str;
 char *name = ((void*)0);
 const char *langname, *localename;
 int len;

 do { if ((__builtin_expect (__extension__ ({ int _g_boolean_var_8; if (iso_639_table != ((void*)0)) _g_boolean_var_8 = 1; else _g_boolean_var_8 = 0; _g_boolean_var_8; }), 1))) { } else { g_return_if_fail_warning (((gchar*) 0), ((const char*) (__func__)), "iso_639_table != NULL"); return (((void*)0)); } } while (0);
 do { if ((__builtin_expect (__extension__ ({ int _g_boolean_var_9; if (iso_3166_table != ((void*)0)) _g_boolean_var_9 = 1; else _g_boolean_var_9 = 0; _g_boolean_var_9; }), 1))) { } else { g_return_if_fail_warning (((gchar*) 0), ((const char*) (__func__)), "iso_3166_table != NULL"); return (((void*)0)); } } while (0);

 str = g_strsplit (code, "_", -1);
 len = g_strv_length (str);
 do { if ((__builtin_expect (__extension__ ({ int _g_boolean_var_10; if (len != 0) _g_boolean_var_10 = 1; else _g_boolean_var_10 = 0; _g_boolean_var_10; }), 1))) { } else { g_return_if_fail_warning (((gchar*) 0), ((const char*) (__func__)), "len != 0"); return (((void*)0)); } } while (0);

 langname = (const char *) g_hash_table_lookup (iso_639_table, str[0]);

 if (len == 1 && langname != ((void*)0))
 {
  name = g_strdup_inline (dcgettext ("iso_639", langname, 5));
 }
 else if (len == 2 && langname != ((void*)0))
 {
  gchar *locale_code = g_ascii_strdown (str[1], -1);

  localename = (const char *) g_hash_table_lookup (iso_3166_table, locale_code);
  g_free (locale_code);

  if (localename != ((void*)0))
  {




   name = g_strdup_printf (g_dpgettext (((void*)0), "language" "\004" "%s (%s)", strlen ("language") + 1),
      dcgettext ("iso_639", langname, 5),
      dcgettext ("iso_3166", localename, 5));
  }
  else
  {
   name = g_strdup_printf (g_dpgettext (((void*)0), "language" "\004" "%s (%s)", strlen ("language") + 1),
      dcgettext ("iso_639", langname, 5), str[1]);
  }
 }
 else
 {



  name = g_strdup_printf (g_dpgettext (((void*)0), "language" "\004" "Unknown (%s)", strlen ("language") + 1), code);
 }

 g_strfreev (str);

 return name;
}

static void
enumerate_dicts (const char * const lang_tag,
   const char * const provider_name,
   const char * const provider_desc,
   const char * const provider_file,
   void * user_data)
{
 gchar *lang_name;

 GTree *dicts = (GTree *)user_data;

 lang_name = create_name_for_language (lang_tag);
 do { if ((__builtin_expect (__extension__ ({ int _g_boolean_var_11; if (lang_name != ((void*)0)) _g_boolean_var_11 = 1; else _g_boolean_var_11 = 0; _g_boolean_var_11; }), 1))) { } else { g_return_if_fail_warning (((gchar*) 0), ((const char*) (__func__)), "lang_name != NULL"); return; } } while (0);



 g_tree_replace (dicts, g_strdup_inline (lang_tag), lang_name);
}

static gint
key_cmp (gconstpointer a, gconstpointer b, gpointer user_data)
{
 return strcmp (a, b);
}

static gint
lang_cmp (const PlumaSpellCheckerLanguage *a,
          const PlumaSpellCheckerLanguage *b)
{
 return g_utf8_collate (a->name, b->name);
}

static gboolean
build_langs_list (const gchar *key,
    const gchar *value,
    gpointer data)
{
 PlumaSpellCheckerLanguage *lang = (PlumaSpellCheckerLanguage *) (__extension__ ({ gsize __n = (gsize) (1); gsize __s = sizeof (PlumaSpellCheckerLanguage); gpointer __p; if (__s == 1) __p = g_malloc (__n); else if (__builtin_constant_p (__n) && (__s == 0 || __n <= (9223372036854775807L *2UL+1UL) / __s)) __p = g_malloc (__n * __s); else __p = g_malloc_n (__n, __s); __p; }));

 lang->abrev = g_strdup_inline (key);
 lang->name = g_strdup_inline (value);

 available_languages = g_slist_insert_sorted (available_languages,
           lang,
           (GCompareFunc)lang_cmp);

 return (0);
}

const GSList *
pluma_spell_checker_get_available_languages (void)
{
 EnchantBroker *broker;
 GTree *dicts;

 if (available_languages_initialized)
  return available_languages;

 do { if ((__builtin_expect (__extension__ ({ int _g_boolean_var_12; if (available_languages == ((void*)0)) _g_boolean_var_12 = 1; else _g_boolean_var_12 = 0; _g_boolean_var_12; }), 1))) { } else { g_return_if_fail_warning (((gchar*) 0), ((const char*) (__func__)), "available_languages == NULL"); return (((void*)0)); } } while (0);

 available_languages_initialized = (!(0));

 broker = enchant_broker_init ();
 do { if ((__builtin_expect (__extension__ ({ int _g_boolean_var_13; if (broker != ((void*)0)) _g_boolean_var_13 = 1; else _g_boolean_var_13 = 0; _g_boolean_var_13; }), 1))) { } else { g_return_if_fail_warning (((gchar*) 0), ((const char*) (__func__)), "broker != NULL"); return (((void*)0)); } } while (0);


 dicts = g_tree_new_full (key_cmp,
     ((void*)0),
     (GDestroyNotify)g_free,
     (GDestroyNotify)g_free);

 iso_639_table = create_iso_639_table ();
 iso_3166_table = create_iso_3166_table ();

 enchant_broker_list_dicts (broker, enumerate_dicts, dicts);

 enchant_broker_free (broker);

 g_hash_table_destroy (iso_639_table);
 g_hash_table_destroy (iso_3166_table);

 iso_639_table = ((void*)0);
 iso_3166_table = ((void*)0);

 g_tree_foreach (dicts, (GTraverseFunc)build_langs_list, ((void*)0));

 g_tree_destroy (dicts);

 return available_languages;
}

const gchar *
pluma_spell_checker_language_to_string (const PlumaSpellCheckerLanguage *lang)
{
 if (lang == ((void*)0))



  return g_dpgettext (((void*)0), "language" "\004" "Default", strlen ("language") + 1);

 return lang->name;
}

const gchar *
pluma_spell_checker_language_to_key (const PlumaSpellCheckerLanguage *lang)
{
 do { if ((__builtin_expect (__extension__ ({ int _g_boolean_var_14; if (lang != ((void*)0)) _g_boolean_var_14 = 1; else _g_boolean_var_14 = 0; _g_boolean_var_14; }), 1))) { } else { g_return_if_fail_warning (((gchar*) 0), ((const char*) (__func__)), "lang != NULL"); return (((void*)0)); } } while (0);

 return lang->abrev;
}

const PlumaSpellCheckerLanguage *
pluma_spell_checker_language_from_key (const gchar *key)
{
 const GSList *langs;

 do { if ((__builtin_expect (__extension__ ({ int _g_boolean_var_15; if (key != ((void*)0)) _g_boolean_var_15 = 1; else _g_boolean_var_15 = 0; _g_boolean_var_15; }), 1))) { } else { g_return_if_fail_warning (((gchar*) 0), ((const char*) (__func__)), "key != NULL"); return (((void*)0)); } } while (0);

 langs = pluma_spell_checker_get_available_languages ();

 while (langs != ((void*)0))
 {
  const PlumaSpellCheckerLanguage *l = (const PlumaSpellCheckerLanguage *)langs->data;

  if (g_ascii_strcasecmp (key, l->abrev) == 0)
   return l;

  langs = ((langs) ? (((GSList *)(langs))->next) : ((void*)0));
 }

 return ((void*)0);
}
