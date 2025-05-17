#!/usr/bin/env make
#
# mansion - Mystery Mansion game from the HP3000 FORTRAN ported to C
#
# Copyright (c) 2004,2023 by Landon Curt Noll.  All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# chongo (Landon Curt Noll, http://www.isthe.com/chongo/index.html) /\oo/\
#
# Share and enjoy! :-)


SHELL= bash
CC= cc
CP= cp
RM= rm

# the version we build and install
#
VERSION= mansion-19.2

SRC= ${VERSION}

TOPNAME= game
INSTALL= install
DESTDIR= /usr/local/bin
MAN6DIR= /usr/local/man/man6

all: mansion

mansion: ${SRC}/mansion ${SRC}/mansion.6
	${CP} -f ${SRC}/mansion $@

${SRC}/mansion:
	cd ${SRC}; ${MAKE} mansion-unix

clean:
	cd ${SRC}; ${MAKE} $@
	${RM} -f ${SRC}/mansion

distclean: clean

install: all
	${INSTALL} -d -m 0755 ${DESTDIR}
	${INSTALL} -m 0555 ${SRC}/mansion ${DESTDIR}
	${INSTALL} -d -m 0755 ${MAN6DIR}
	${INSTALL} -m 0444 ${SRC}/mansion.6 ${MAN6DIR}

clobber:
	cd ${SRC}; ${MAKE} clean
	${RM} -f ${SRC}/mansion mansion
	${RM} -rf ${VERSION}/mansion.dSYM

configure:
	@echo nothing to configure

quick_clean: clean

quick_clobber: clobber

quick_distclean: distclean
