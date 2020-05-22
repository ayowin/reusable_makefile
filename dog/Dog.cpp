
#include "Dog.h"

Dog::Dog(const std::string& name)
{
    this->name = name;
}

Dog::~Dog()
{

}

void Dog::behave()
{
    printf("%s wang wang!\n",name.c_str());
}