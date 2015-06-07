#include <SDL.h>
#include "SDL_image.h"

#include "Kuko/base/Application.hpp"
#include "Kuko/base/Sprite.hpp"
#include "Kuko/utilities/Logger.hpp"
#include "Kuko/managers/ImageManager.hpp"
#include "Kuko/managers/StateManager.hpp"
#include "Kuko/managers/InputManager.hpp"
#include "Kuko/managers/FontManager.hpp"
#include "Kuko/managers/LanguageManager.hpp"
#include "Kuko/managers/LuaManager.hpp"
#include "Kuko/managers/SoundManager.hpp"
#include "Kuko/managers/ConfigManager.hpp"

#include <iostream>
#include <string>

#include "states/TitleState.hpp"

void SetupStaticManagers();
void CleanupStaticManagers();

int main()
{
    Logger::Setup();
    //Logger::SetLogLevel( 0 );
    //Logger::SetFilterWord( "config|menu|character_creator" );

    kuko::LuaManager::Setup();

    std::vector<std::string> configSettings;
    configSettings.push_back( "language" );
    bool firstRun = ( kuko::ConfigManager::LoadConfig( configSettings ) == false );
    Logger::Out( "Language is set to \"" + kuko::ConfigManager::GetOption( "language" ) + "\"", "main" );
    kuko::LanguageManager::AddLanguage( "primary", "languages/" + kuko::ConfigManager::GetOption( "language" ) + ".lua" );

    Logger::Out( kuko::LanguageManager::Text( "game_title" ) );
    kuko::Application::Start( kuko::LanguageManager::Text( "game_title" ), 480, 480 );
    SetupStaticManagers();

    kuko::StateManager stateManager;
    stateManager.PushState( "title", new TitleState() );
    stateManager.SwitchState( "title" );


    while ( !stateManager.IsDone() )
    {
        kuko::Application::TimerStart();
        stateManager.UpdateCurrentState();

        kuko::Application::BeginDraw();
        stateManager.DrawCurrentState();

        kuko::Application::EndDraw();
        kuko::Application::TimerUpdate();
    }

    CleanupStaticManagers();
    Logger::Cleanup();
    kuko::Application::End();

    return 0;
}

void SetupStaticManagers()
{
    kuko::InputManager::Setup();
    // ToDo: Clean this up so we're not loading the same font multiple times.
    kuko::FontManager::AddFont( "helper", "font/" + kuko::LanguageManager::GetSuggestedFont(), 28 );
}

void CleanupStaticManagers()
{
    kuko::LuaManager::Cleanup();
    kuko::FontManager::Cleanup();
    kuko::ImageManager::Cleanup();
    kuko::SoundManager::Cleanup();
    kuko::Application::End();
}
