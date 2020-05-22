
#include "Cat.h"

Cat::Cat(const std::string& name)
{
    this->name = name;
}

Cat::~Cat()
{

}

void Cat::behave()
{
    printf("%s miao miao!\n",name.c_str());
}