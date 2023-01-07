# Makefile for micro_inetd

# CONFIGURE: If you are using a SystemV-based operating system, such as
# Solaris, you will need to uncomment this definition.
#SYSV_LIBS =	-lnsl -lsocket

ARCHS   = -arch i386 -arch m68k -arch hppa -arch sparc
STRIP   = /bin/strip
CC      = cc
CFLAGS  = -O3 -posix -D_POSIX_SOURCE
LDFLAGS = -lposix -lNeXT_p

all: micro_inetd carl

micro_inetd: micro_inetd.c
	$(CC) $(CFLAGS) micro_inetd.c $(LDFLAGS) $(ARCHS) -o micro_inetd

carl: carl.c
	$(CC) $(CFLAGS) carl.c $(LDFLAGS) $(ARCHS) -o carl

install: all
	@echo "Setting up for PkgBuilder"
	-mkdir bin
	-mkdir man
	-mkdir man/man1
	$(STRIP) carl
	$(STRIP) micro_inetd
	rm -f bin/carl
	rm -f bin/micro_inetd
	cp micro_inetd bin/micro_inetd
	cp carl bin/carl
	rm -f man/man1/micro_inetd.1
	rm -f man/man1/carl.1
	cp micro_inetd.1 man/man1
	cp carl.1 man/man1

clean:
	rm -rf micro_inetd carl *.o core bin man
