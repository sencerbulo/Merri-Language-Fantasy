#ifndef _TITLESTATE
#define _TITLESTATE

#include "../Kuko/states/IState.hpp"
#include "../Kuko/managers/MenuManager.hpp"

#include <vector>
#include <string>

class TitleState : public kuko::IState
{
    public:
    virtual ~TitleState();

    virtual void Setup();
    virtual void Cleanup();
    virtual void Update();
    virtual void Draw();

    private:
    kuko::MenuManager menuManager;

    void SetupMenu_TitleScreen();

    std::string m_state;
    std::vector< std::string > m_lstSaveGames;
};

#endif
