#include "TitleState.hpp"

#include "../Kuko/managers/ImageManager.hpp"
#include "../Kuko/managers/InputManager.hpp"
#include "../Kuko/managers/FontManager.hpp"
#include "../Kuko/managers/LanguageManager.hpp"
#include "../Kuko/managers/SoundManager.hpp"
#include "../Kuko/managers/ConfigManager.hpp"
#include "../Kuko/utilities/Logger.hpp"
#include "../Kuko/base/Application.hpp"
#include "../Kuko/utilities/StringUtil.hpp"

TitleState::~TitleState()
{
}

void TitleState::Setup()
{
    Logger::Out( "Setup", "TitleState" );
    kuko::IState::Setup();

    // Is this the first launch of the game?
    SetupMenu_TitleScreen();
}

void TitleState::Cleanup()
{
    kuko::ImageManager::ClearTextures();
    kuko::FontManager::ClearFonts();
}

void TitleState::Update()
{
    kuko::InputManager::Update();

    std::map<kuko::CommandButton, kuko::TriggerInfo> input = kuko::InputManager::GetTriggerInfo();

    if ( input[ kuko::TAP ].down )
    {
        int x = input[ kuko::TAP ].actionX, y = input[ kuko::TAP ].actionY;

        if ( menuManager.IsButtonClicked( "button_options", x, y ) )
        {
            menuManager.NextPage();
            m_gotoState = "options";
        }

        else if ( menuManager.IsButtonClicked( "button_new_game", x, y ) )
        {
            m_gotoState = "newgame";
        }

        else if ( menuManager.IsButtonClicked( "button_cancel", x, y ) )
        {
            SetupMenu_TitleScreen();
        }

        if ( m_state == "title_screen" )
        {
            //SetupMenu_SelectGame();
        }

        for ( int i = 0; i < m_lstSaveGames.size(); i++ )
        {
            if ( menuManager.IsButtonClicked( "button-" + m_lstSaveGames[i], x, y ) )
            {
                Logger::Out( "Load savegame " + m_lstSaveGames[i], "TitleState::Update" );
            }
        }
    }
    else if ( input[ kuko::SECONDARY_TAP ].down )
    {
        m_gotoState = "quit";
    }
    else
    {
        menuManager.ResetMouse();
    }
    menuManager.Update();
}

void TitleState::Draw()
{
    menuManager.Draw();
}

void TitleState::SetupMenu_TitleScreen()
{
    kuko::ImageManager::AddTexture( "btn_new",      "gfx/ui/btn_new.png" );
    kuko::ImageManager::AddTexture( "btn_load",     "gfx/ui/btn_load.png" );
    kuko::ImageManager::AddTexture( "btn_options",  "gfx/ui/btn_options.png" );

    kuko::ImageManager::AddTexture( "title_art", "gfx/ui/title_art.png" );

    menuManager.SetupMenu( "menus/title_screen.lua" );
    m_state = "title_screen";
}



