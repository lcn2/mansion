# mansion

## TL;DR


### To install:

```sh
make clobber all
sudo make install
```

### To use, for example:

```sh
/usr/local/games/mansion
```

### FYI:

After installing, try:

```sh
man 6 mansion
```

or from the source tree:

```sh
man mansion-19.2/mansion.6
```


## Notes from James Garnett

I started this port in 1998 while finishing my Master's thesis, or, that is,
in an effort to avoid thinking about finishing it.  I approached it by
performing a dejanews search for anyone else who'd attempted anything like
it.

Jeff Greenberg was the first I found who had tried it.  His attempted port
to BASIC, and our subsequent conversations, clarified several issues.  He
also gave me a copy of the Fortran IV source from which he worked.

Roy Buzdor gave me a second copy of the source for comparison's sake, and
described the system-call semantics of a variety of HP1000 syscalls which
enabled me to really get the port going.

Tracy Johnson actually gave me no-strings access to an HP3000 running the
original Mystery Mansion, invaluable for consistency checks!

Mark von Minden and Alia Rayl found the bulk of the bugs in early versions.
Rebecca Zane discovered some seriously nasty ones that only someone who
remembered the game could have found.


## Notes from Landon Curt Noll

The C code was ported to be able to compiler under a c17 standard C compiler.
This mainly included using more modern C function declarations instead K&R style function declarations.

Trailing whitespace was removed from the source.

In doing so, 3 bugs were discovered and corrected.

* The `IMZ` array needs to be of length 4 (it was 3) as references to `IMZ[3]` are made in the code.

* The impossible to satisfy C conditional:

```c
      if ((IWRD[2][9] == 65) && (IWRD[2][9] == 66)){
```

was changed to:

```c
      if ((IWRD[2][9] == 65) || (IWRD[2][9] == 66)){
```

* The impossible to satisfy C conditional:

```c
      if ((IWRD[2][9] == 97) && (IWRD[2][9] == 98)){
```

was changed to:

```c
      if ((IWRD[2][9] == 97) || (IWRD[2][9] == 98)){
```

It is hoped that these obvious bugs are not "`features`" and that the game does
not depend in the above C code mistakes.


# Reporting Security Issues

To report a security issue, please visit "[Reporting Security Issues](https://github.com/lcn2/mansion/security/policy)".
