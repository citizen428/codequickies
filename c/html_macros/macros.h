#define _(...) __VA_ARGS__

#define html_(x) "<html>" #x "</html>"
#define html(x) html_(x)

#define tag(name, x) <name>x</name>
#define tag_attr(name, attrs, x) <name attrs>x</name>
#define tag_void(name, attrs) <name attrs>
#define attr(name, value) name = value

#define head(x) tag(head, x)
#define link(attrs) tag_void(link, attrs)

#define body(x) tag(body, x)
#define div(attrs, x) tag_attr(div, attrs, x)
#define h1(attrs, x) tag_attr(h1, attrs, x)
#define hr <hr />
#define p(attrs, x) tag_attr(p, attrs, x)
