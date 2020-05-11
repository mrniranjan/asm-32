bin_PROGRAMS = hello
hello_SOURCES = hello.s 
ASFLAGS = -gstabs+ 
AS = /usr/bin/as
LD = /usr/bin/ld
LINK = $(LD) $(RAWLDFLAGS) -o $@

.s.o:
	$(AS) $(ASFLAGS) -o $@ $<
