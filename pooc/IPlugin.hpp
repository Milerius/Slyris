//
// Created by milerius on 28/01/18.
//

#ifndef SLYRIS_IPLUGIN_HPP
#define SLYRIS_IPLUGIN_HPP

#include <iostream>
#include <string>

class IGraphics
{
public:

    IGraphics()
    {
        std::cout << "IGraphics constructor" << std::endl;
    }

    virtual ~IGraphics()
    {
        std::cout << "IGraphics destructor" << std::endl;
    }

    virtual std::string name() const = 0;
};

#endif //SLYRIS_IPLUGIN_HPP
