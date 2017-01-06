all: cdecrypt

cdecrypt: main.o
	$(CXX) -o $@ -lcrypto $<
	
clean:
	rm cdecrypt main.o
