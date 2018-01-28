//
// Created by milerius on 28/01/18.
//

#include <iostream>
#include <memory>
#include <functional>
#include <cassert>
#include <boost/filesystem.hpp>
#include <boost/dll.hpp>
#include "IPlugin.hpp"

namespace fs = boost::filesystem;
namespace dll = boost::dll;

template <typename T>
void do_release(const boost::shared_ptr<T> &, T *)
{
}

template <typename T>
typename std::shared_ptr<T> to_std_ptr(const boost::shared_ptr<T> &p)
{
    return std::shared_ptr<T>(p.get(), std::bind(&do_release<T>, p, std::placeholders::_1));
}

namespace slr
{
    class System
    {
    };

    class SFMLGraphics : public IGraphics
    {

    public:
        SFMLGraphics()
        {
            std::cout << "SFMLGraphics constructor" << std::endl;
        }

        virtual ~SFMLGraphics()
        {
            std::cout << "SFMLGraphics destructor" << std::endl;
        }

        virtual std::string name() const
        {
            return "SFMLGraphics";
        }
    };

    class Game
    {
    public:
        template <typename ...GameArgs>
        static std::shared_ptr<Game> create_game(GameArgs &&...args)
        {
            return std::make_shared<Game>(std::forward<GameArgs>(args)...);
        }

        template <typename GraphicAPI, typename ...GraphicsAPIArgs>
        Game &with_graphic(GraphicsAPIArgs &&...args)
        {
            assert(_graphic == nullptr);
            _graphic = std::make_shared<GraphicAPI>(std::forward<GraphicsAPIArgs>(args)...);
            return *this;
        };

        Game &with_graphic_dll(const fs::path &dll_directory_path)
        {
            assert(_graphic == nullptr);
            _graphic = to_std_ptr(
                dll::import<IGraphics>(dll_directory_path, "plugin", dll::load_mode::append_decorations));
            return *this;
        };

        explicit Game(std::string game_title) : _game_title(std::move(game_title))
        {
            std::cout << "GameTitle: " << _game_title << std::endl;
        }

    private:
        std::string _game_title;
        std::shared_ptr<IGraphics> _graphic{nullptr};
    };
}

int main()
{
    auto game = slr::Game::create_game("SlyrisGame")->with_graphic_dll(fs::path("lib/graphics"));
    return 0;
}