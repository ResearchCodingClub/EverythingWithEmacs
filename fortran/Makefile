F90 = gfortran

SOURCE = hello_mod.f90 hello.f90
OBJECTS = $(SOURCE:.f90=.o)

FFLAGS = -I. -g -O0

all: hello

hello: $(OBJECTS)
	$(F90) $(FFLAGS) -o hello $^

%.o: %.f90
	$(F90) $(FFLAGS) -c $^ -o $@

.PHONY: clean tags

clean:
	rm -rf ./*.o ./hello

tags: TAGS

TAGS:
	etags *.f90

check: hello
	./test.sh
