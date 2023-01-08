# Makefile for micro_inetd

ARCHS   = -arch i386 -arch m68k -arch hppa -arch sparc
STRIP   = /bin/strip
CC      = cc
CFLAGS  = -O3 -posix -D_POSIX_SOURCE
LDFLAGS = -lposix -lNeXT_p

all: carl

carl: carl.c
	$(CC) $(CFLAGS) carl.c $(LDFLAGS) $(ARCHS) -o carl

install: all
	@echo "Setting up for PkgBuilder"
	-mkdir bin
	-mkdir man
	-mkdir man/man1
	rm -f bin/carl
	cp carl bin/carl
	rm -f man/man1/carl.1
	cp carl.1 man/man1
	$(STRIP) bin/carl

clean:
	rm -rf carl *.o core bin man
