
#include "../include/foo.h"

__attribute__ ((visibility ("default")))
extern "C"
const char * foo() {
    return "Hello from Foo!";
}

