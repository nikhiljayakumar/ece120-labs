#include <stdio.h>
int main() {

    int c1i, c2i, c3i, c4i, c5i;
    unsigned int c1ui, c2ui, c3ui;
    float c1f, c2f, c3f;
    double c1d, c2d, c3d;

    c1i = -22 * 33;
    c2i = 12 / 3;
    c3i = 10 / 3;
    c4i = 12 % 3;
    c5i = -11 % 3;

    c1ui = -22 * 33;
    c2ui = 12 / 3;
    c3ui = 10 / 3;

    c1f = -22 * 33;
    c2f = 12 / 3;
    c3f = 10 / 3;

    c1d = -22 * 33;
    c2d = 12 / 3;
    c3d = 10 / 3;


    printf("Int: %d, %d, %d, %d, %d\nUnsigned Int: %u, %u, %u\nFloat: %f, %f, %f\nDouble: %f, %f, %f\n", c1i, c2i, c3i, c4i, c5i, c1ui, c2ui, c3ui, c1f, c2f, c3f, c1d, c2d, c3d);

    return 0;
}