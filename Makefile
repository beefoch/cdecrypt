CXX := $(CROSS_COMPILE)$(CXX)
PKGCONFIG := $(CROSS_COMPILE)pkg-config

CXXFLAGS := -std=c++11 -Wall -O3
CPPFLAGS := $(shell $(PKGCONFIG) openssl --static --cflags) -D_BUILDER_="\"$(BUILDER)\""
LDFLAGS := -static -s
LDLIBS := $(shell $(PKGCONFIG) openssl --static --libs)

cdecrypt: main.o
	$(CXX) $(LDFLAGS) -o $@ $< $(LDLIBS)
	
clean:
	rm -vf cdecrypt main.o
