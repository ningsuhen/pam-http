CFLAGS += -Werror -Wall
all: test pam_http.so

clean:
	$(RM) test pam_http.so *.o

pam_http.so: src/pam_http.c
	$(CC) $(CFLAGS) -fPIC -shared -Xlinker -x -o $@ $< -lcurl

test: src/test.c
	$(CC) $(CFLAGS) -o $@ $< -lpam -lpam_misc
