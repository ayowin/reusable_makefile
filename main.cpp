
#include <iostream>

#include "Dog.h"
#include "Cat.h"

int main(int argc,char** argv)
{
    printf("==============makefile test=============\n");

    Dog dog("wangcai");
    dog.behave();

    Cat cat("laifu");
    cat.behave();
    
    return 0;
}