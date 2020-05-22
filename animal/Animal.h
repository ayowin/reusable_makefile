
#ifndef _ANIMAL_H__
#define _ANIMAL_H__

class Animal
{
public:
    Animal();
    virtual ~Animal();

    virtual void behave() = 0;
};

#endif