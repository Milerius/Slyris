//
// Created by milerius on 28/01/18.
//

#include <boost/filesystem.hpp>
#include <boost/dll.hpp>
#include "IPlugin.hpp"

namespace my_namespace
{

    class SFMLPlugin : public IGraphics
    {
    public:
        SFMLPlugin()
        {
            std::cout << "SFMLPlugin constructor" << std::endl;
        }

        explicit SFMLPlugin(unsigned int i)
        {

        }

        ~SFMLPlugin()
        {
            std::cout << "SFMLPlugin destructor" << std::endl;
        }

    public:
        std::string name() const
        {
            return "SFMLPlugin";
        }
    };

    extern "C" BOOST_SYMBOL_EXPORT SFMLPlugin plugin;
    SFMLPlugin plugin;
}