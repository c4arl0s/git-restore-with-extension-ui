#include <stdio.h>

int getSystemStatus(void);
int (*functionPointerCompute)(int, int);
int add(int, int, int);

int main(int argc, const char * argv[]) {
    if (getSystemStatus == 0) {
        printf("Status is 0\n");
    } else {
        printf("Status is not 0\n");
    }
    functionPointerCompute = add;
    functionPointerCompute(2,5);
    printf("result %d \n", functionPointerCompute(2,5));
    return 0;
}

int getSystemStatus(void) {
    int status;
    status = 0;
    return status;
}

int add(int n1, int n2, int n3) {
    return n1+n2+n3;
}