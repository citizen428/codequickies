#include <netinet/in.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include "macros.h"

// clang-format off
#define WATER_CSS "https://cdn.jsdelivr.net/npm/water.css@2/out/water.css"

#define HTML                                                              \
  head(                                                                   \
    tag(title, C Preprocessor Abuse)                                      \
    link(_(rel="stylesheet" href=WATER_CSS))                              \
  )                                                                       \
  body(                                                                   \
    div(attr(class, "container"),                                         \
      h1(, C Preprocessor Abuse)                                          \
      hr                                                                  \
      p(, This page was generated entirely by the C preprocessor.)        \
      p(, HTML tags are defined as function-like macros that expand to    \
          angle-bracket syntax. The entire page is a single string        \
          literal assembled at compile time via token stringification.)   \
      tag(blockquote, tag(em, The compiler is the template engine.))      \
      hr                                                                  \
    )                                                                     \
  )
// clang-format on

int main(void) {
  char *response = "HTTP/1.1 200 OK\r\n"
                   "Content-Type: text/html\r\n"
                   "\r\n" html(HTML);

  int fd = socket(AF_INET, SOCK_STREAM, 0);
  int opt = 1;
  setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(opt));

  struct sockaddr_in addr = {
      .sin_family = AF_INET,
      .sin_port = htons(8080),
      .sin_addr.s_addr = htonl(INADDR_LOOPBACK),
  };
  bind(fd, (struct sockaddr *)&addr, sizeof(addr));
  listen(fd, 1);

  puts("Listening on http://localhost:8080");

  while (true) {
    int client = accept(fd, NULL, NULL);
    char buf[1024];
    read(client, buf, sizeof(buf));
    write(client, response, strlen(response));
    close(client);
  }
}
