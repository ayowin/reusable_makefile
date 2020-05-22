
#ifndef __CAT_H__
#define __CAT_H__

#include "Animal.h"

#include <iostream>

class Cat: public Animal
{
public:
    Cat(const std::string& name);
    ~Cat();
    virtual void behave();
private:
    std::string name;
};

#endif