
#ifndef __DOG_H__
#define __DOG_H__

#include "Animal.h"

#include <iostream>

class Dog: public Animal
{
public:
    Dog(const std::string& name);
    ~Dog();
    virtual void behave();
private:
    std::string name;
};

#endif