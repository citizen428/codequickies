CC ?= clang
CFLAGS = -std=c23 -Wall -Werror

run: clean serve
	@./html

serve:
	@$(CC) $(CFLAGS) -I. -o html html.c

clean:
	@rm -f ./html

.PHONY: clean serve
