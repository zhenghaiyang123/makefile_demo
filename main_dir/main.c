#include <stdio.h>
#include "../include/common.h"

int main()
{
    printf("code version: %s\n", CODE_VERSION);
    printf("main IN\n");

    int sum = add(5, 6);
    printf("sum = %d \n",sum);

    printf("main OUT\n");
    return 0;
}