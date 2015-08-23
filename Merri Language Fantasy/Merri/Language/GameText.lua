GameText  = Core.class()

function GameText:init( options )
end

function GameText:Setup( options )
    GameText.HelperText = {}
    GameText.TargetText = {}
    GameText:SetupLanguages()
end

function GameText:GetFromLanguage( cat, lang, id )
    local language = lang
    local category = ""
    if ( cat == "helper" ) then
        category = "HelperText"

    else
        category = "TargetText"

    end

    if ( GameText[ category ] == nil ) then
        return "Invalid category " .. category

    elseif ( GameText[ category ][ language ] == nil ) then
        return "Invalid language " .. language

    elseif ( GameText[ category ][ language ][ id ] == nil ) then
        return "Invalid id " .. id

    else
        return GameText[ category ][ language ][ id ]

    end
end

function GameText:Get( cat, id )
    local language = ""
    local category = ""
    if ( cat == "helper" ) then
        language = GLOBAL_CONFIG.HELPER_LANGUAGE
        category = "HelperText"

    else
        language = GLOBAL_CONFIG.TARGET_LANGUAGE
        category = "TargetText"

    end

    if ( GameText[ category ] == nil ) then
        return "Invalid category " .. category

    elseif ( GameText[ category ][ language ] == nil ) then
        return "Invalid language " .. language

    elseif ( GameText[ category ][ language ][ id ] == nil ) then
        return "Invalid id " .. id

    else
        return GameText[ category ][ language ][ id ]

    end
end

function GameText:SetupLanguages()
    GameText.HelperText.English = {}
    GameText.HelperText.Esperanto = {}
    GameText.HelperText.Ido = {}
    GameText.HelperText.Spanish = {}
    GameText.HelperText.Ithkuil = {}
    GameText.HelperText.German = {}
    GameText.TargetText.French = {}

    GameText.TargetText.English = {}
    GameText.TargetText.Esperanto = {}
    GameText.TargetText.Ido = {}
    GameText.TargetText.Spanish = {}
    GameText.TargetText.Ithkuil = {}
    GameText.TargetText.German = {}
    GameText.HelperText.French = {}

-- Credits --
GameText.HelperText.English     [ "Translators" ]   = "Translators"
GameText.HelperText.Esperanto   [ "Translators" ]   = "Tradukistoj"
GameText.HelperText.Ido         [ "Translators" ]   = "Tradukisti"
GameText.HelperText.Spanish     [ "Translators" ]   = "Traductores"
GameText.HelperText.Ithkuil     [ "Translators" ]   = "Translators"
GameText.HelperText.German      [ "Translators" ]   = "Übersetzer"
GameText.HelperText.French      [ "Translators" ]   = "Traducteurs"

-- Name of the language --
GameText.HelperText.English     [ "language-name" ]     = "English"
GameText.HelperText.Esperanto   [ "language-name" ]     = "Esperanto"
GameText.HelperText.Ido         [ "language-name" ]     = "Ido"
GameText.HelperText.Spanish     [ "language-name" ]     = "Español"
GameText.HelperText.Ithkuil     [ "language-name" ]     = "Ithkuil"
GameText.HelperText.German      [ "language-name" ]     = "Deutsch"
GameText.HelperText.French      [ "language-name" ]     = "Français"

-- Put your name in here
GameText.HelperText.English     [ "Translation Credits" ]   = "Rachel J. Morris"
GameText.HelperText.Esperanto   [ "Translation Credits" ]   = "Rachel J. Morris"
GameText.HelperText.Ido         [ "Translation Credits" ]   = "Rachel J. Morris"
GameText.HelperText.Spanish     [ "Translation Credits" ]   = "Tea Coba"
GameText.HelperText.Ithkuil     [ "Translation Credits" ]   = "Chikaodinaka 'dkawirl' Oluigbo"
GameText.HelperText.German      [ "Translation Credits" ]   = "Marius Stärk"
GameText.TargetText.French      [ "Translation Credits" ]   = "Vanege"

-- Common --

GameText.TargetText.English     [ "game title" ]    = "English Fantasy"
GameText.TargetText.Esperanto   [ "game title" ]    = "Fantazio de Esperanto"
GameText.TargetText.Ido         [ "game title" ]    = "Fantazio di Ido"
GameText.TargetText.Spanish     [ "game title" ]    = "Fantasía de Español"
GameText.TargetText.Ithkuil     [ "game title" ]    = "Ithkaiwîl ubzál"
GameText.TargetText.German      [ "game title" ]    = "Deutsche Fantasie"
GameText.TargetText.French      [ "game title" ]    = "Fantaisie du Français"

GameText.HelperText.English     [ "website" ]   = "Website:"
GameText.HelperText.Esperanto   [ "website" ]   = "Retejo:"
GameText.HelperText.Ido         [ "website" ]   = "Retosituo:"
GameText.HelperText.Spanish     [ "website" ]   = "Página web:"
GameText.HelperText.Ithkuil     [ "website" ]    = "Website:"
GameText.HelperText.German      [ "website" ]    = "Internetseite:"
GameText.HelperText.French      [ "website" ]    = "Site web :"

GameText.HelperText.English     [ "facebook" ]  = "Facebook:"
GameText.HelperText.Esperanto   [ "facebook" ]  = "Facebook:"
GameText.HelperText.Ido         [ "facebook" ]  = "Facebook:"
GameText.HelperText.Spanish     [ "facebook" ]  = "Facebook:"
GameText.HelperText.Ithkuil     [ "facebook" ]    = "Facebook:"
GameText.HelperText.German      [ "facebook" ]    = "Facebook:"
GameText.HelperText.French      [ "facebook" ]    = "Facebook :"

GameText.HelperText.English     [ "twitter" ]   = "Twitter:"
GameText.HelperText.Esperanto   [ "twitter" ]   = "Twitter:"
GameText.HelperText.Ido         [ "twitter" ]   = "Twitter:"
GameText.HelperText.Spanish     [ "twitter" ]   = "Twitter:"
GameText.HelperText.Ithkuil     [ "twitter" ]    = "Twitter:"
GameText.HelperText.German      [ "twitter" ]    = "Twitter:"
GameText.HelperText.French      [ "twitter" ]    = "Twitter :"


-- LanguageSelectState --

-- Helper Languages --
-- These only need to be translated into the specific language, there don't need to be multiple translations --
GameText.HelperText.English     [ "I know English" ]    = "I know English."
GameText.HelperText.Esperanto   [ "I know Esperanto" ]  = "Mi konas Esperanton."
GameText.HelperText.Ido         [ "I know Ido" ]        = "Me konas Ido."
GameText.HelperText.Spanish     [ "I know Spanish" ]    = "Yo sé Español."
GameText.HelperText.Ithkuil     [ "I know Ithkuil" ]    = "I know Ithkuil."
GameText.HelperText.German      [ "I know German" ]     = "Ich kann Deutsch."
GameText.HelperText.French      [ "I know French" ]     = "Je connais le français."

-- Target Languages --
GameText.HelperText.English     [ "I am learning English" ]     = "I am learning English"
GameText.HelperText.Esperanto   [ "I am learning English" ]     = "Mi lernas la anglan lingvon"
GameText.HelperText.Ido         [ "I am learning English" ]     = "Me lernas la angla linguo"
GameText.HelperText.Spanish     [ "I am learning English" ]     = "Estoy aprendiendo Inglés"
GameText.HelperText.Ithkuil     [ "I am learning English" ]     = "Upinglišpel xháwîl"
GameText.HelperText.German      [ "I am learning English" ]     = "Ich lerne Englisch"

GameText.HelperText.English     [ "I am learning Esperanto" ]   = "I am learning Esperanto"
GameText.HelperText.Esperanto   [ "I am learning Esperanto" ]   = "Mi lernas Esperanton"
GameText.HelperText.Ido         [ "I am learning Esperanto" ]   = "Me lernas Esperanto"
GameText.HelperText.Spanish     [ "I am learning Esperanto" ]   = "Estoy aprendiendo Esperanto"
GameText.HelperText.Ithkuil     [ "I am learning Esperanto" ]   = "Upesperantopel xháwîl"
GameText.HelperText.German      [ "I am learning Esperanto" ]   = "Ich lerne Esperanto"

GameText.HelperText.English     [ "I am learning Ido" ]         = "I am learning Ido"
GameText.HelperText.Esperanto   [ "I am learning Ido" ]         = "Mi lernas Idon"
GameText.HelperText.Ido         [ "I am learning Ido" ]         = "Me lernas Ido"
GameText.HelperText.Spanish     [ "I am learning Ido" ]         = "Estoy aprendiendo Ido"
GameText.HelperText.Ithkuil     [ "I am learning Ido" ]         = "Upidopel xháwîl"
GameText.HelperText.German      [ "I am learning Ido" ]         = "Ich lerne Ido"

GameText.HelperText.English     [ "I am learning Spanish" ]     = "I am learning Spanish"
GameText.HelperText.Esperanto   [ "I am learning Spanish" ]     = "Mi lernas la hispanan lingvon"
GameText.HelperText.Ido         [ "I am learning Spanish" ]     = "Me lernas la hispana linguo"
GameText.HelperText.Spanish     [ "I am learning Spanish" ]     = "Estoy aprendiendo Español"
GameText.HelperText.Ithkuil     [ "I am learning Spanish" ]     = "Upspanišpel xháwîl"
GameText.HelperText.German      [ "I am learning Spanish" ]     = "Ich lerne Spanisch"

GameText.HelperText.English     [ "I am learning Ithkuil" ]     = "I am learning Ithkuil"
GameText.HelperText.Esperanto   [ "I am learning Ithkuil" ]     = "Mi lernas Ifkuilon"
GameText.HelperText.Ido         [ "I am learning Ithkuil" ]     = "Me lernas Ifkuilo"
GameText.HelperText.Spanish     [ "I am learning Ithkuil" ]     = "Estoy aprendiendo Ithkuil"
GameText.HelperText.Ithkuil     [ "I am learning Ithkuil" ]     = "Ithkel xháwîl"
GameText.HelperText.German      [ "I am learning Ithkuil" ]     = "Ich lerne Ithkuil"

-- Menu Buttons --
-- If there are standards that computer user interfaces use
-- for your language, please keep it close to what is normally found

GameText.HelperText.English     [ "Play" ]  = "Play"
GameText.HelperText.Esperanto   [ "Play" ]  = "Ludi"
GameText.HelperText.Ido         [ "Play" ]  = "Ludar"
GameText.HelperText.Spanish     [ "Play" ]  = "Jugar"
GameText.HelperText.Ithkuil     [ "Play" ]  = "Ováweš!"
GameText.HelperText.German      [ "Play" ]  = "Spielen"
GameText.HelperText.French      [ "Play" ]  = "Jouer"

-- Previous / Next - flipping through pages in a menu
GameText.HelperText.English     [ "Next" ]  = "Continue"
GameText.HelperText.Esperanto   [ "Next" ]  = "Daŭri"
GameText.HelperText.Ido         [ "Next" ]  = "Durar"
GameText.HelperText.Spanish     [ "Next" ]  = "Continuar"
GameText.HelperText.Ithkuil     [ "Next" ]  = "Continue"
GameText.HelperText.German      [ "Next" ]  = "Fortsetzen"
GameText.HelperText.French      [ "Next" ]  = "Suivant"

GameText.HelperText.English     [ "Previous" ]  = "Previous"
GameText.HelperText.Esperanto   [ "Previous" ]  = "Antaŭa"
GameText.HelperText.Ido         [ "Previous" ]  = "Antea"
GameText.HelperText.Spanish     [ "Previous" ]  = "Atrás"
GameText.HelperText.Ithkuil     [ "Previous" ]  = "Previous"
GameText.HelperText.German      [ "Previous" ]  = "Vorherige"
GameText.HelperText.French      [ "Previous" ]  = "Précédent"

GameText.HelperText.English     [ "Options" ]   = "Options"
GameText.HelperText.Esperanto   [ "Options" ]   = "Agordoj"
GameText.HelperText.Ido         [ "Options" ]   = "Agordi"
GameText.HelperText.Spanish     [ "Options" ]   = "Opciones"
GameText.HelperText.Ithkuil     [ "Options" ]   = "Ênyar"
GameText.HelperText.German      [ "Options" ]   = "Optionen"
GameText.HelperText.French      [ "Options" ]   = "Options"

GameText.HelperText.English     [ "Help" ]  = "Help"
GameText.HelperText.Esperanto   [ "Help" ]  = "Helpo"
GameText.HelperText.Ido         [ "Help" ]  = "Helpo"
GameText.HelperText.Spanish     [ "Help" ]  = "Ayuda"
GameText.HelperText.Ithkuil     [ "Help" ]  = "Âdnan"
GameText.HelperText.German      [ "Help" ]  = "Hilfe"
GameText.HelperText.French      [ "Help" ]  = "Aide"

-- Go back to the previous menu
GameText.HelperText.English     [ "Back" ]  = "Back"
GameText.HelperText.Esperanto   [ "Back" ]  = "Reveni"
GameText.HelperText.Ido         [ "Back" ]  = "Revenar"
GameText.HelperText.Spanish     [ "Back" ]  = "Volver"
GameText.HelperText.Ithkuil     [ "Back" ]  = "Rçarļ"
GameText.HelperText.German      [ "Back" ]  = "Zurück"
GameText.HelperText.French      [ "Back" ]  = "Retour"

-- In-game screen with buttons and text
GameText.HelperText.English     [ "Menu" ]  = "Menu"
GameText.HelperText.Esperanto   [ "Menu" ]  = "Menuo"
GameText.HelperText.Ido         [ "Menu" ]  = "Revenar"
GameText.HelperText.Spanish     [ "Menu" ]  = "Menú"
GameText.HelperText.Ithkuil     [ "Menu" ]  = "Rçarļ"
GameText.HelperText.German      [ "Menu" ]  = "Menü"
GameText.HelperText.French      [ "Menu" ]  = "Menu"

-- Demo Information Text

GameText.HelperText.English     [ "Thank you for trying out Merri" ]    = "Thank you for trying out Merri!"
GameText.HelperText.Esperanto   [ "Thank you for trying out Merri" ]    = "Dankon pro provi je Merri!"
GameText.HelperText.Ido         [ "Thank you for trying out Merri" ]    = "Danko pro probar Merri!"
GameText.HelperText.Spanish     [ "Thank you for trying out Merri" ]    = "¡Gracias por probar Merri!"
GameText.HelperText.Ithkuil     [ "Thank you for trying out Merri" ]    = "Thank you for trying out Merri!"
GameText.HelperText.German      [ "Thank you for trying out Merri" ]    = "Danke, dass du Merri ausprobierst!"
GameText.HelperText.French      [ "Thank you for trying out Merri" ]    = "Merci d'avoir essayé Merri !"

GameText.HelperText.English     [ "This is still a work in progress" ]  = "This is still a work in progress."
GameText.HelperText.Esperanto   [ "This is still a work in progress" ]  = "Tio ĉi ankoraŭ ne estas kompleta."
GameText.HelperText.Ido         [ "This is still a work in progress" ]  = "Ica ankore esas nekompleta."
GameText.HelperText.Spanish     [ "This is still a work in progress" ]  = "Esto es un trabajo en progreso."
GameText.HelperText.Ithkuil     [ "This is still a work in progress" ]  = "This is still a work in progress."
GameText.HelperText.German      [ "This is still a work in progress" ]  = "Dieses Spiel befindet sich derzeit noch in Entwicklung."
GameText.HelperText.French      [ "This is still a work in progress" ]  = "Le jeu est encore en développement."

GameText.HelperText.English     [ "There may be errors or bugs" ]       = "There may be errors or bugs."
GameText.HelperText.Esperanto   [ "There may be errors or bugs" ]       = "Eble ekzistas eraroj aŭ cimoj."
GameText.HelperText.Ido         [ "There may be errors or bugs" ]       = "Forsan existas erori o cimi."
GameText.HelperText.Spanish     [ "There may be errors or bugs" ]       = "Este software puede contener errores o bugs."
GameText.HelperText.Ithkuil     [ "There may be errors or bugs" ]       = "There may be errors or bugs."
GameText.HelperText.German      [ "There may be errors or bugs" ]       = "Es gibt wahrscheinlich noch Fehler."
GameText.HelperText.French      [ "There may be errors or bugs" ]       = "Il peut y avoir des erreurs ou des bug."

GameText.HelperText.English     [ "Report problems at EMAIL" ]          = "Report problems at Rachel@Moosader.com ."
GameText.HelperText.Esperanto   [ "Report problems at EMAIL" ]          = "Raportu problemojn al Rachel@Moosader.com ."
GameText.HelperText.Ido         [ "Report problems at EMAIL" ]          = "Raportez problemi ad Rachel@Moosader.com ."
GameText.HelperText.Spanish     [ "Report problems at EMAIL" ]          = "Por favor, reporta cualquier problema a Rachel@Moosader.com ."
GameText.HelperText.Ithkuil     [ "Report problems at EMAIL" ]          = "Report problems at Rachel@Moosader.com ."
GameText.HelperText.German      [ "Report problems at EMAIL" ]          = "Problemberichte können an Rachel@Moosader.com gesendet werden."
GameText.HelperText.French      [ "Report problems at EMAIL" ]          = "Signalez les problèmes à Rachel@Moosader.com ."

GameText.HelperText.English     [ "Want to keep up with this game's progress?" ]    = "Want to keep up with this game's progress?"
GameText.HelperText.Esperanto   [ "Want to keep up with this game's progress?" ]    = "Ĉu vi volas sekvi novaĵojn pri la ludo?"
GameText.HelperText.Ido         [ "Want to keep up with this game's progress?" ]    = "Ka vu volas sequar informo pri la ludo?"
GameText.HelperText.Spanish     [ "Want to keep up with this game's progress?" ]    = "¿Quieres mantenerte al día sobre el desarrollo de este videojuego?"
GameText.HelperText.Ithkuil     [ "Want to keep up with this game's progress?" ]    = "Want to keep up with this game's progress?"
GameText.HelperText.German      [ "Want to keep up with this game's progress?" ]    = "Möchtest du über die Entwicklung dieses Spiels informiert werden?"
GameText.HelperText.French      [ "Want to keep up with this game's progress?" ]    = "Souhaitez-vous suivre le développement du jeu ?"

-- Don't translate these, they're being set based on the notes above.
GameText.TargetText.English     [ "Thank you for trying out Merri" ]    = GameText.HelperText.English[ "Thank you for trying out Merri" ]
GameText.TargetText.Esperanto   [ "Thank you for trying out Merri" ]    = GameText.HelperText.Esperanto[ "Thank you for trying out Merri" ]
GameText.TargetText.Ido         [ "Thank you for trying out Merri" ]    = GameText.HelperText.Ido[ "Thank you for trying out Merri" ]
GameText.TargetText.Spanish     [ "Thank you for trying out Merri" ]    = GameText.HelperText.Spanish[ "Thank you for trying out Merri" ]
GameText.TargetText.Ithkuil     [ "Thank you for trying out Merri" ]    = GameText.HelperText.Ithkuil[ "Thank you for trying out Merri" ]
GameText.TargetText.German      [ "Thank you for trying out Merri" ]    = GameText.HelperText.German[ "Thank you for trying out Merri" ]
GameText.TargetText.French      [ "Thank you for trying out Merri" ]    = GameText.HelperText.French[ "Thank you for trying out Merri" ]

GameText.TargetText.English     [ "This is still a work in progress" ]  = GameText.HelperText.English[ "This is still a work in progress" ]
GameText.TargetText.Esperanto   [ "This is still a work in progress" ]  = GameText.HelperText.Esperanto[ "This is still a work in progress" ]
GameText.TargetText.Ido         [ "This is still a work in progress" ]  = GameText.HelperText.Ido[ "This is still a work in progress" ]
GameText.TargetText.Spanish     [ "This is still a work in progress" ]  = GameText.HelperText.Spanish[ "This is still a work in progress" ]
GameText.TargetText.Ithkuil     [ "This is still a work in progress" ]  = GameText.HelperText.Ithkuil[ "This is still a work in progress" ]
GameText.TargetText.German      [ "This is still a work in progress" ]  = GameText.HelperText.German[ "This is still a work in progress" ]
GameText.TargetText.French      [ "This is still a work in progress" ]  = GameText.HelperText.French[ "This is still a work in progress" ]

GameText.TargetText.English     [ "There may be errors or bugs" ]       = GameText.HelperText.English[ "There may be errors or bugs" ]
GameText.TargetText.Esperanto   [ "There may be errors or bugs" ]       = GameText.HelperText.Esperanto[ "There may be errors or bugs" ]
GameText.TargetText.Ido         [ "There may be errors or bugs" ]       = GameText.HelperText.Ido[ "There may be errors or bugs" ]
GameText.TargetText.Spanish     [ "There may be errors or bugs" ]       = GameText.HelperText.Spanish[ "There may be errors or bugs" ]
GameText.TargetText.Ithkuil     [ "There may be errors or bugs" ]       = GameText.HelperText.Ithkuil[ "There may be errors or bugs" ]
GameText.TargetText.German      [ "There may be errors or bugs" ]       = GameText.HelperText.German[ "There may be errors or bugs" ]
GameText.TargetText.French      [ "There may be errors or bugs" ]       = GameText.HelperText.French[ "There may be errors or bugs" ]

GameText.TargetText.English     [ "Report problems at EMAIL" ]          = GameText.HelperText.English[ "Report problems at EMAIL" ]
GameText.TargetText.Esperanto   [ "Report problems at EMAIL" ]          = GameText.HelperText.Esperanto[ "Report problems at EMAIL" ]
GameText.TargetText.Ido         [ "Report problems at EMAIL" ]          = GameText.HelperText.Ido[ "Report problems at EMAIL" ]
GameText.TargetText.Spanish     [ "Report problems at EMAIL" ]          = GameText.HelperText.Spanish[ "Report problems at EMAIL" ]
GameText.TargetText.Ithkuil     [ "Report problems at EMAIL" ]          = GameText.HelperText.Ithkuil[ "Report problems at EMAIL" ]
GameText.TargetText.German      [ "Report problems at EMAIL" ]          = GameText.HelperText.German[ "Report problems at EMAIL" ]
GameText.TargetText.French      [ "Report problems at EMAIL" ]          = GameText.HelperText.French[ "Report problems at EMAIL" ]

GameText.TargetText.English     [ "Want to keep up with this game's progress?" ]        = GameText.HelperText.English[ "Want to keep up with this game's progress?" ]
GameText.TargetText.Esperanto   [ "Want to keep up with this game's progress?" ]        = GameText.HelperText.Esperanto[ "Want to keep up with this game's progress?" ]
GameText.TargetText.Ido         [ "Want to keep up with this game's progress?" ]        = GameText.HelperText.Ido[ "Want to keep up with this game's progress?" ]
GameText.TargetText.Spanish     [ "Want to keep up with this game's progress?" ]        = GameText.HelperText.Spanish[ "Want to keep up with this game's progress?" ]
GameText.TargetText.Ithkuil     [ "Want to keep up with this game's progress?" ]        = GameText.HelperText.Ithkuil[ "Want to keep up with this game's progress?" ]
GameText.TargetText.German      [ "Want to keep up with this game's progress?" ]        = GameText.HelperText.German[ "Want to keep up with this game's progress?" ]
GameText.TargetText.French      [ "Want to keep up with this game's progress?" ]        = GameText.HelperText.French[ "Want to keep up with this game's progress?" ]

-- Got a star

GameText.TargetText.English     [ "Earned a star" ]     = "You aquired a star!"
GameText.TargetText.Esperanto   [ "Earned a star" ]     = "Vi akiris stelon!"
GameText.TargetText.Ido         [ "Earned a star" ]     = "Vu aquiris stelo!"
GameText.TargetText.Spanish     [ "Earned a star" ]     = "¡Has adquirido una estrella!"
GameText.TargetText.Ithkuil     [ "Earned a star" ]     = "Uk'awîr kî"
GameText.TargetText.German      [ "Earned a star" ]     = "Du hast einen Stern erhalten!"
GameText.TargetText.French      [ "Earned a star" ]     = "Tu as gagné une étoile !"

-- This block doesn't get translated
GameText.HelperText.English     [ "Earned a star" ]     = GameText.TargetText.English[ "Earned a star" ]
GameText.HelperText.Esperanto   [ "Earned a star" ]     = GameText.TargetText.Esperanto[ "Earned a star" ]
GameText.HelperText.Ido         [ "Earned a star" ]     = GameText.TargetText.Ido[ "Earned a star" ]
GameText.HelperText.Spanish     [ "Earned a star" ]     = GameText.TargetText.Spanish[ "Earned a star" ]
GameText.HelperText.Ithkuil     [ "Earned a star" ]     = GameText.TargetText.Ithkuil[ "Earned a star" ]
GameText.HelperText.German      [ "Earned a star" ]     = GameText.TargetText.German[ "Earned a star" ]
GameText.HelperText.French      [ "Earned a star" ]     = GameText.TargetText.French[ "Earned a star" ]

-- DifficultSelectState --

GameText.HelperText.English     [ "Practice" ]  = "Practice"
GameText.HelperText.Esperanto   [ "Practice" ]  = "Ekzerci"
GameText.HelperText.Ido         [ "Practice" ]  = "Exercar"
GameText.HelperText.Spanish     [ "Practice" ]  = "Practicar"
GameText.HelperText.Ithkuil     [ "Practice" ]  = "Xháwîl"
GameText.HelperText.German      [ "Practice" ]  = "Üben"
GameText.HelperText.French      [ "Practice" ]  = "Entraînement"

GameText.HelperText.English     [ "Easy" ]      = "Easy"
GameText.HelperText.Esperanto   [ "Easy" ]      = "Baznivela"
GameText.HelperText.Ido         [ "Easy" ]      = "Baznivela"
GameText.HelperText.Spanish     [ "Easy" ]      = "Fácil"
GameText.HelperText.Ithkuil     [ "Easy" ]      = "Xháwîlürt"
GameText.HelperText.German      [ "Easy" ]      = "Leicht"
GameText.HelperText.French      [ "Easy" ]      = "Facile"

GameText.HelperText.English     [ "Medium" ]    = "Medium"
GameText.HelperText.Esperanto   [ "Medium" ]    = "Meznivela"
GameText.HelperText.Ido         [ "Medium" ]    = "Meznivela"
GameText.HelperText.Spanish     [ "Medium" ]    = "Intermedia"
GameText.HelperText.Ithkuil     [ "Medium" ]    = "Xháwîlart"
GameText.HelperText.German      [ "Medium" ]    = "Mittel"
GameText.HelperText.French      [ "Medium" ]    = "Intermédiaire"

GameText.HelperText.English     [ "Hard" ]      = "Hard"
GameText.HelperText.Esperanto   [ "Hard" ]      = "Altnivela"
GameText.HelperText.Ido         [ "Hard" ]      = "Altnivela"
GameText.HelperText.Spanish     [ "Hard" ]      = "Difícil"
GameText.HelperText.Ithkuil     [ "Hard" ]      = "Xháwîlert"
GameText.HelperText.German      [ "Hard" ]      = "Schwer"
GameText.HelperText.French      [ "Hard" ]      = "Difficile"

GameText.HelperText.English     [ "Stats" ]     = "Stats"
GameText.HelperText.Esperanto   [ "Stats" ]     = "Statistikoj"
GameText.HelperText.Ido         [ "Stats" ]     = "Statistiki"
GameText.HelperText.Spanish     [ "Stats" ]     = "Estadísticas"
GameText.HelperText.Ithkuil     [ "Stats" ]     = "Upšáwušk"
GameText.HelperText.German      [ "Stats" ]     = "Statistiken"
GameText.HelperText.French      [ "Stats" ]     = "Statistiques"

-- MinerGameState --

-- Miner character
GameText.TargetText.English     [ "Miner" ]     = "Miner"
GameText.TargetText.Esperanto   [ "Miner" ]     = "Ministo"
GameText.TargetText.Ido         [ "Miner" ]     = "Ministo"
GameText.TargetText.Spanish     [ "Miner" ]     = "Minero"
GameText.TargetText.Ithkuil     [ "Miner" ]     = "Qò rq'il ômrar"
GameText.TargetText.German      [ "Miner" ]     = "Bergarbeiter"
GameText.TargetText.French      [ "Miner" ]     = "Mineur"

-- Game Stats
GameText.TargetText.English     [ "Floor" ]     = "Floor:"
GameText.TargetText.Esperanto   [ "Floor" ]     = "Nivelo:"
GameText.TargetText.Ido         [ "Floor" ]     = "Nivelo:"
GameText.TargetText.Spanish     [ "Floor" ]     = "Nivel:"
GameText.TargetText.Ithkuil     [ "Floor" ]     = "Mthal:"
GameText.TargetText.German      [ "Floor" ]     = "Ebene:"
GameText.TargetText.French      [ "Floor" ]     = "Étage :"

GameText.TargetText.English     [ "Money" ]     = "Money:"
GameText.TargetText.Esperanto   [ "Money" ]     = "Mono:"
GameText.TargetText.Ido         [ "Money" ]     = "Pekunio:"
GameText.TargetText.Spanish     [ "Money" ]     = "Dinero:"
GameText.TargetText.Ithkuil     [ "Money" ]     = "Îmsawur:"
GameText.TargetText.German      [ "Money" ]     = "Geld:"
GameText.TargetText.French      [ "Money" ]     = "Sous :"

GameText.TargetText.English     [ "Health" ]    = "Health:"
GameText.TargetText.Esperanto   [ "Health" ]    = "Sano:"
GameText.TargetText.Ido         [ "Health" ]    = "Saneso:"
GameText.TargetText.Spanish     [ "Health" ]    = "Salud:"
GameText.TargetText.Ithkuil     [ "Health" ]    = "Glawul:"
GameText.TargetText.German      [ "Health" ]    = "Leben:"
GameText.TargetText.French      [ "Health" ]    = "Santé :"

-- Monsters
GameText.TargetText.English     [ "snail" ]     = "Snail"
GameText.TargetText.Esperanto   [ "snail" ]     = "Heliko"
GameText.TargetText.Ido         [ "snail" ]     = "Heliko"
GameText.TargetText.Spanish     [ "snail" ]     = "Caracol"
GameText.TargetText.Ithkuil     [ "snail" ]     = "Âļnal"
GameText.TargetText.German      [ "snail" ]     = "Schnecke"
GameText.TargetText.French      [ "snail" ]     = "Escargot"

GameText.TargetText.English     [ "mole" ]      = "Mole"
GameText.TargetText.Esperanto   [ "mole" ]      = "Talpo"
GameText.TargetText.Ido         [ "mole" ]      = "Talpo"
GameText.TargetText.Spanish     [ "mole" ]      = "Topo"
GameText.TargetText.Ithkuil     [ "mole" ]      = "Çqhwal"
GameText.TargetText.German      [ "mole" ]      = "Maulwurf"
GameText.TargetText.French      [ "mole" ]      = "Taupe"

GameText.TargetText.English     [ "mushroom" ]  = "Mushroom"
GameText.TargetText.Esperanto   [ "mushroom" ]  = "Fungo"
GameText.TargetText.Ido         [ "mushroom" ]  = "Fungo"
GameText.TargetText.Spanish     [ "mushroom" ]  = "Champiñón"
GameText.TargetText.Ithkuil     [ "mushroom" ]  = "Cnalek"
GameText.TargetText.German      [ "mushroom" ]  = "Pilz"
GameText.TargetText.French      [ "mushroom" ]  = "Champignon"

GameText.TargetText.English     [ "bat" ]       = "Bat"
GameText.TargetText.Esperanto   [ "bat" ]       = "Vesperto"
GameText.TargetText.Ido         [ "bat" ]       = "Vespertilio"
GameText.TargetText.Spanish     [ "bat" ]       = "Murcielago"
GameText.TargetText.Ithkuil     [ "bat" ]       = "Ftçal"
GameText.TargetText.German      [ "bat" ]       = "Fledermaus"
GameText.TargetText.French      [ "bat" ]       = "Chauve-souris"

GameText.TargetText.English     [ "rabbit" ]    = "Rabbit"
GameText.TargetText.Esperanto   [ "rabbit" ]    = "Kuniklo"
GameText.TargetText.Ido         [ "rabbit" ]    = "Kuniklo"
GameText.TargetText.Spanish     [ "rabbit" ]    = "Conejo"
GameText.TargetText.Ithkuil     [ "rabbit" ]    = "Lxwal"
GameText.TargetText.German      [ "rabbit" ]    = "Hase"
GameText.TargetText.French      [ "rabbit" ]    = "Lapin"

GameText.TargetText.English     [ "snake" ]     = "Snake"
GameText.TargetText.Esperanto   [ "snake" ]     = "Serpento"
GameText.TargetText.Ido         [ "snake" ]     = "Serpento"
GameText.TargetText.Spanish     [ "snake" ]     = "Serpiente"
GameText.TargetText.Ithkuil     [ "snake" ]     = "Knal"
GameText.TargetText.German      [ "snake" ]     = "Schlange"
GameText.TargetText.French      [ "snake" ]     = "Serpent"

GameText.TargetText.English     [ "skeleton" ]  = "Skeleton"
GameText.TargetText.Esperanto   [ "skeleton" ]  = "Skeleto"
GameText.TargetText.Ido         [ "skeleton" ]  = "Skeleto"
GameText.TargetText.Spanish     [ "skeleton" ]  = "Esqueleto"
GameText.TargetText.Ithkuil     [ "skeleton" ]  = "Urp'al eqel"
GameText.TargetText.German      [ "skeleton" ]  = "Skelett"
GameText.TargetText.French      [ "skeleton" ]  = "Squelette"

GameText.TargetText.English     [ "moose" ]     = "Moose"
GameText.TargetText.Esperanto   [ "moose" ]     = "Alko"
GameText.TargetText.Ido         [ "moose" ]     = "Alko"
GameText.TargetText.Spanish     [ "moose" ]     = "Alce"
GameText.TargetText.Ithkuil     [ "moose" ]     = "Ndwal"
GameText.TargetText.German      [ "moose" ]     = "Elch"
GameText.TargetText.French      [ "moose" ]     = "Élan"

-- Items
GameText.TargetText.English     [ "rock" ]      = "Rock"
GameText.TargetText.Esperanto   [ "rock" ]      = "Ŝtono"
GameText.TargetText.Ido         [ "rock" ]      = "Roko"
GameText.TargetText.Spanish     [ "rock" ]      = "Piedra"
GameText.TargetText.Ithkuil     [ "rock" ]      = "Ktal"
GameText.TargetText.German      [ "rock" ]      = "Fels"
GameText.TargetText.French      [ "rock" ]      = "Rocher"

GameText.TargetText.English     [ "star" ]      = "Star"
GameText.TargetText.Esperanto   [ "star" ]      = "Stelo"
GameText.TargetText.Ido         [ "star" ]      = "Stelo"
GameText.TargetText.Spanish     [ "star" ]      = "Estrella"
GameText.TargetText.Ithkuil     [ "star" ]      = "Uk'ar"
GameText.TargetText.German      [ "star" ]      = "Stern"
GameText.TargetText.French      [ "star" ]      = "Étoile"

GameText.TargetText.English     [ "sandwich" ]  = "Sandwich"
GameText.TargetText.Esperanto   [ "sandwich" ]  = "Sandviĉo"
GameText.TargetText.Ido         [ "sandwich" ]  = "Sandwich"
GameText.TargetText.Spanish     [ "sandwich" ]  = "Sandwich"
GameText.TargetText.Ithkuil     [ "sandwich" ]  = "Âčmawîr"
GameText.TargetText.German      [ "sandwich" ]  = "Sandwich"
GameText.TargetText.French      [ "sandwich" ]  = "Sandwich"

GameText.TargetText.English     [ "amethyst" ]  = "Amethyst"
GameText.TargetText.Esperanto   [ "amethyst" ]  = "Ametisto"
GameText.TargetText.Ido         [ "amethyst" ]  = "Ametisto"
GameText.TargetText.Spanish     [ "amethyst" ]  = "Ametista"
GameText.TargetText.Ithkuil     [ "amethyst" ]  = "Ktél khwal"
GameText.TargetText.German      [ "amethyst" ]  = "Amethyst"
GameText.TargetText.French      [ "amethyst" ]  = "Améthyste"

GameText.TargetText.English     [ "sapphire" ]  = "Sapphire"
GameText.TargetText.Esperanto   [ "sapphire" ]  = "Safiro"
GameText.TargetText.Ido         [ "sapphire" ]  = "Safiro"
GameText.TargetText.Spanish     [ "sapphire" ]  = "Zafiro"
GameText.TargetText.Ithkuil     [ "sapphire" ]  = "Ktél přal"
GameText.TargetText.German      [ "sapphire" ]  = "Saphir"
GameText.TargetText.French      [ "sapphire" ]  = "Saphir"

GameText.TargetText.English     [ "diamond" ]   = "Diamond"
GameText.TargetText.Esperanto   [ "diamond" ]   = "Diamanto"
GameText.TargetText.Ido         [ "diamond" ]   = "Diamanto"
GameText.TargetText.Spanish     [ "diamond" ]   = "Diamante"
GameText.TargetText.Ithkuil     [ "diamond" ]   = "Stral"
GameText.TargetText.German      [ "diamond" ]   = "Diamant"
GameText.TargetText.French      [ "diamond" ]   = "Diamant"

GameText.TargetText.English     [ "emerald" ]   = "Emerald"
GameText.TargetText.Esperanto   [ "emerald" ]   = "Smeraldo"
GameText.TargetText.Ido         [ "emerald" ]   = "Smeraldo"
GameText.TargetText.Spanish     [ "emerald" ]   = "Esmeralda"
GameText.TargetText.Ithkuil     [ "emerald" ]   = "Żp'al"
GameText.TargetText.German      [ "emerald" ]   = "Emerald"
GameText.TargetText.French      [ "emerald" ]   = "Émeraude"

GameText.TargetText.English     [ "ruby" ]      = "Ruby"
GameText.TargetText.Esperanto   [ "ruby" ]      = "Rubeno"
GameText.TargetText.Ido         [ "ruby" ]      = "Rubino"
GameText.TargetText.Spanish     [ "ruby" ]      = "Rubí"
GameText.TargetText.Ithkuil     [ "ruby" ]      = "Ktél xt'al"
GameText.TargetText.German      [ "ruby" ]      = "Rubin"
GameText.TargetText.French      [ "ruby" ]      = "Rubis"

GameText.TargetText.English     [ "copper" ]    = "Copper"
GameText.TargetText.Esperanto   [ "copper" ]    = "Kupro"
GameText.TargetText.Ido         [ "copper" ]    = "Kupro"
GameText.TargetText.Spanish     [ "copper" ]    = "Cobre"
GameText.TargetText.Ithkuil     [ "copper" ]    = "Xhtal"
GameText.TargetText.German      [ "copper" ]    = "Kupfer"
GameText.TargetText.French      [ "copper" ]    = "Cuivre"

GameText.TargetText.English     [ "silver" ]    = "Silver"
GameText.TargetText.Esperanto   [ "silver" ]    = "Arĝento"
GameText.TargetText.Ido         [ "silver" ]    = "Arjento"
GameText.TargetText.Spanish     [ "silver" ]    = "Plata"
GameText.TargetText.Ithkuil     [ "silver" ]    = "Rqal"
GameText.TargetText.German      [ "silver" ]    = "Silber"
GameText.TargetText.French      [ "silver" ]    = "Argent"

GameText.TargetText.English     [ "gold" ]      = "Gold"
GameText.TargetText.Esperanto   [ "gold" ]      = "Oro"
GameText.TargetText.Ido         [ "gold" ]      = "Oro"
GameText.TargetText.Spanish     [ "gold" ]      = "Oro"
GameText.TargetText.Ithkuil     [ "gold" ]      = "Xral"
GameText.TargetText.German      [ "gold" ]      = "Gold"
GameText.TargetText.French      [ "gold" ]      = "Or"

GameText.TargetText.English     [ "ladder" ]    = "Ladder"
GameText.TargetText.Esperanto   [ "ladder" ]    = "Ŝtupetaro"
GameText.TargetText.Ido         [ "ladder" ]    = "Skalo"
GameText.TargetText.Spanish     [ "ladder" ]    = "Escalera"
GameText.TargetText.Ithkuil     [ "ladder" ]    = "Otnal"
GameText.TargetText.German      [ "ladder" ]    = "Leiter"
GameText.TargetText.French      [ "ladder" ]    = "Échelle"

GameText.TargetText.English     [ "Game Over" ]     = "Game Over"
GameText.TargetText.Esperanto   [ "Game Over" ]     = "Ludfino"
GameText.TargetText.Ido         [ "Game Over" ]     = "Ludfino"
GameText.TargetText.Spanish     [ "Game Over" ]     = "Fin del juego"
GameText.TargetText.Ithkuil     [ "Game Over" ]     = "Upšákt’"
GameText.TargetText.German      [ "Game Over" ]     = "Spiel vorbei"
GameText.TargetText.French      [ "Game Over" ]     = "Fin de la partie"

-- Skip this block
GameText.HelperText.English     [ "Game Over" ]     = GameText.TargetText.English[ "Game Over" ]
GameText.HelperText.Esperanto   [ "Game Over" ]     = GameText.TargetText.Esperanto[ "Game Over" ]
GameText.HelperText.Ido         [ "Game Over" ]     = GameText.TargetText.Ido[ "Game Over" ]
GameText.HelperText.Spanish     [ "Game Over" ]     = GameText.TargetText.Spanish[ "Game Over" ]
GameText.HelperText.Ithkuil     [ "Game Over" ]     = GameText.TargetText.Ithkuil[ "Game Over" ]
GameText.HelperText.German      [ "Game Over" ]     = GameText.TargetText.German[ "Game Over" ]
GameText.HelperText.French      [ "Game Over" ]     = GameText.TargetText.French[ "Game Over" ]

-- Game actions
GameText.TargetText.English     [ "miner-begin" ]   = "Mine for treasure and stay alive!"
GameText.TargetText.Esperanto   [ "miner-begin" ]   = "Minu trezoron kaj daŭru vivi!"
GameText.TargetText.Ido         [ "miner-begin" ]   = "Minez trezoro e durez vivar!"
GameText.TargetText.Spanish     [ "miner-begin " ]  = "¡Excava el tesoro y mantente con vida!"
GameText.TargetText.Ithkuil     [ "miner-begin" ]   = "Ko rq'il ômrar. Ka uglawelir"
GameText.TargetText.German      [ "miner-begin" ]   = "Fördere Schätze und bleibe am Leben!"
GameText.TargetText.French      [ "miner-begin" ]   = "Mine à la recherche de trésors et reste en vie !"

GameText.TargetText.English     [ "miner-move-north" ]  = "You walk north."
GameText.TargetText.Esperanto   [ "miner-move-north" ]  = "Vi marŝas norden."
GameText.TargetText.Ido         [ "miner-move-north" ]  = "Vu marchas adnorde."
GameText.TargetText.Spanish     [ "miner-move-north" ]  = "Caminas hacia el norte."
GameText.TargetText.Ithkuil     [ "miner-move-north" ]  = "Ku gwal osroar"
GameText.TargetText.German      [ "miner-move-north" ]  = "Du gehst Richtung Norden."
GameText.TargetText.French      [ "miner-move-north" ]  = "Tu marches vers le nord."

GameText.TargetText.English     [ "miner-move-south" ]  = "You walk south."
GameText.TargetText.Esperanto   [ "miner-move-south" ]  = "Vi marŝas suden."
GameText.TargetText.Ido         [ "miner-move-south" ]  = "Vu marchas adsude."
GameText.TargetText.Spanish     [ "miner-move-south" ]  = "Caminas hacia el sur"
GameText.TargetText.Ithkuil     [ "miner-move-south" ]  = "Ku gwal ösroar"
GameText.TargetText.German      [ "miner-move-south" ]  = "Du gehst Richtung Süden."
GameText.TargetText.French      [ "miner-move-south" ]  = "Tu marches vers le sud."

GameText.TargetText.English     [ "miner-move-east" ]   = "You walk east."
GameText.TargetText.Esperanto   [ "miner-move-east" ]   = "Vi marŝas orienten."
GameText.TargetText.Ido         [ "miner-move-east" ]   = "Vu marchas adeste."
GameText.TargetText.Spanish     [ "miner-move-east" ]   = "Caminas hacia el este"
GameText.TargetText.Ithkuil     [ "miner-move-east" ]   = "Ku gwal öcmoar"
GameText.TargetText.German      [ "miner-move-east" ]   = "Du gehst Richtung Osten."
GameText.TargetText.French      [ "miner-move-east" ]   = "Tu marches vers l'est."

GameText.TargetText.English     [ "miner-move-west" ]   = "You walk west."
GameText.TargetText.Esperanto   [ "miner-move-west" ]   = "Vi marŝas okcidenten."
GameText.TargetText.Ido         [ "miner-move-west" ]   = "Vu marchas adweste."
GameText.TargetText.Spanish     [ "miner-move-west" ]   = "Caminas hacia el oeste"
GameText.TargetText.Ithkuil     [ "miner-move-east" ]   = "You walk west."
GameText.TargetText.German      [ "miner-move-west" ]   = "Du gehst Richtung Westen."
GameText.TargetText.French      [ "miner-move-west" ]   = "Tu marches vers l'ouest."

GameText.TargetText.English     [ "miner-mine" ]        = "You swing your pick."
GameText.TargetText.Esperanto   [ "miner-mine" ]        = "Vi svingas vian pioĉon."
GameText.TargetText.Ido         [ "miner-mine" ]        = "Vu frapas per vua piocho."
GameText.TargetText.Spanish     [ "miner-mine" ]        = "Comienzas a picar."
GameText.TargetText.Ithkuil     [ "miner-mine" ]        = "Čel obval kî ko"
GameText.TargetText.German      [ "miner-mine" ]        = "Du schwingst deine Spitzhacke."
GameText.TargetText.French      [ "miner-mine" ]        = "Tu donnes un coup de pioche."

GameText.TargetText.English     [ "miner-eat-sandwich" ]    = "You eat the cave sandwich."
GameText.TargetText.Esperanto   [ "miner-eat-sandwich" ]    = "Vi manĝas la kavernan sandviĉon."
GameText.TargetText.Ido         [ "miner-eat-sandwich" ]    = "Vu manjas la kaverna sandwich."
GameText.TargetText.Spanish     [ "miner-eat-sandwich" ]    = "Comes el sandwich cavernario."
GameText.TargetText.Ithkuil     [ "miner-eat-sandwich" ]    = "Čmel gral ko"
GameText.TargetText.German      [ "miner-eat-sandwich" ]    = "Du isst das Höhlensandwich."
GameText.TargetText.French      [ "miner-eat-sandwich" ]    = "Tu manges le sandwich des cavernes."

GameText.TargetText.English     [ "use-earthquake" ]    = "The earth shakes violently."
GameText.TargetText.Esperanto   [ "use-earthquake" ]    = "La tero tremas forte."
GameText.TargetText.Ido         [ "use-earthquake" ]    = "La tero tremas forte."
GameText.TargetText.Spanish     [ "use-earthquake" ]    = "La tierra tiembla violentamente."
GameText.TargetText.Ithkuil     [ "use-earthquake" ]    = "The earth shakes."
GameText.TargetText.German      [ "use-earthquake" ]    = "The earth shakes."
GameText.TargetText.French      [ "use-earthquake" ]    = "The earth shakes."

GameText.TargetText.English     [ "use-blizzard" ]    = "Everything freezes over."
GameText.TargetText.Esperanto   [ "use-blizzard" ]    = "Ĉio frostas."
GameText.TargetText.Ido         [ "use-blizzard" ]    = "Omno frostas."
GameText.TargetText.Spanish     [ "use-blizzard" ]    = "Todo se congela."
GameText.TargetText.Ithkuil     [ "use-blizzard" ]    = "Everything freezes over."
GameText.TargetText.German      [ "use-blizzard" ]    = "Everything freezes over."
GameText.TargetText.French      [ "use-blizzard" ]    = "Everything freezes over."

GameText.TargetText.English     [ "enemies-thaw" ]    = "Everything has thawed out."
GameText.TargetText.Esperanto   [ "enemies-thaw" ]    = "Ĉio degelas."
GameText.TargetText.Ido         [ "enemies-thaw" ]    = "Omno desfrostas."
GameText.TargetText.Spanish     [ "enemies-thaw" ]    = "Todo se ha derretido."
GameText.TargetText.Ithkuil     [ "enemies-thaw" ]    = "Everything has thawed out."
GameText.TargetText.German      [ "enemies-thaw" ]    = "Everything has thawed out."
GameText.TargetText.French      [ "enemies-thaw" ]    = "Everything has thawed out."

GameText.TargetText.English     [ "use-potion" ]    = "You feel strong again."
GameText.TargetText.Esperanto   [ "use-potion" ]    = "Vi sentas vin forta denove."
GameText.TargetText.Ido         [ "use-potion" ]    = "Vu sentas vu forta itere."
GameText.TargetText.Spanish     [ "use-potion" ]    = "You feel strong again."
GameText.TargetText.Ithkuil     [ "use-potion" ]    = "You feel strong again."
GameText.TargetText.German      [ "use-potion" ]    = "You feel strong again."
GameText.TargetText.French      [ "use-potion" ]    = "You feel strong again."

-- collects
GameText.TargetText.English     [ "miner-collect-copper" ]  = "You pick up copper."
GameText.TargetText.Esperanto   [ "miner-collect-copper" ]  = "Vi kolektas kupron."
GameText.TargetText.Ido         [ "miner-collect-copper" ]  = "Vu kolektas kupro."
GameText.TargetText.Spanish     [ "miner-collect-copper" ]  = "Obtienes cobre."
GameText.TargetText.Ithkuil     [ "miner-collect-copper" ]  = "Xhtel ômrar ko"
GameText.TargetText.German      [ "miner-collect-copper" ]  = "Du sammelst Kupfer auf."
GameText.TargetText.French      [ "miner-collect-copper" ]  = "Tu as ramassé du cuivre."

GameText.TargetText.English     [ "miner-collect-silver" ]  = "You pick up silver."
GameText.TargetText.Esperanto   [ "miner-collect-silver" ]  = "Vi kolektas arĝenton."
GameText.TargetText.Ido         [ "miner-collect-silver" ]  = "Vu kolektas arjento."
GameText.TargetText.Spanish     [ "miner-collect-silver" ]  = "Obtienes plata."
GameText.TargetText.Ithkuil     [ "miner-collect-silver" ]  = "Rqel ômrar ko"
GameText.TargetText.German      [ "miner-collect-silver" ]  = "Du sammelst Silber auf."
GameText.TargetText.French      [ "miner-collect-silver" ]  = "Tu as ramassé de l'argent."

GameText.TargetText.English     [ "miner-collect-gold" ]    = "You pick up gold."
GameText.TargetText.Esperanto   [ "miner-collect-gold" ]    = "Vi kolektas oron."
GameText.TargetText.Ido         [ "miner-collect-gold" ]    = "Vu kolektas oro."
GameText.TargetText.Spanish     [ "miner-collect-gold" ]    = "Obtienes oro."
GameText.TargetText.Ithkuil     [ "miner-collect-gold" ]    = "Xrel ômrar ko"
GameText.TargetText.German      [ "miner-collect-gold" ]    = "Du sammelst Gold auf."
GameText.TargetText.French      [ "miner-collect-gold" ]    = "Tu as ramassé de l'or."

GameText.TargetText.English     [ "miner-collect-amethyst" ]    = "You pick up amethyst."
GameText.TargetText.Esperanto   [ "miner-collect-amethyst" ]    = "Vi kolektas ametiston."
GameText.TargetText.Ido         [ "miner-collect-amethyst" ]    = "Vu kolektas ametisto."
GameText.TargetText.Spanish     [ "miner-collect-amethyst" ]    = "Obtienes ametista."
GameText.TargetText.Ithkuil     [ "miner-collect-amethyst" ]    = "Ktél khwal ômrar ko"
GameText.TargetText.German      [ "miner-collect-amethyst" ]    = "Du sammelst Amethyst auf."
GameText.TargetText.French      [ "miner-collect-amethyst" ]    = "Tu as ramassé une améthyste."

GameText.TargetText.English     [ "miner-collect-sapphire" ]    = "You pick up sapphire."
GameText.TargetText.Esperanto   [ "miner-collect-sapphire" ]    = "Vi kolektas safiron."
GameText.TargetText.Ido         [ "miner-collect-sapphire" ]    = "Vu kolektas safiro."
GameText.TargetText.Spanish     [ "miner-collect-sapphire" ]    = "Obtienes zafiro."
GameText.TargetText.Ithkuil     [ "miner-collect-sapphire" ]    = "Ktél přal ômrar ko"
GameText.TargetText.German      [ "miner-collect-sapphire" ]    = "Du sammelst Saphir auf."
GameText.TargetText.French      [ "miner-collect-sapphire" ]    = "Tu as ramassé un saphir."

GameText.TargetText.English     [ "miner-collect-diamond" ]     = "You pick up diamond."
GameText.TargetText.Esperanto   [ "miner-collect-diamond" ]     = "Vi kolektas diamanton."
GameText.TargetText.Ido         [ "miner-collect-diamond" ]     = "Vu kolektas diamanto."
GameText.TargetText.Spanish     [ "miner-collect-diamond" ]     = "Obtienes diamante."
GameText.TargetText.Ithkuil     [ "miner-collect-diamond" ]     = "Strel ômrar ko"
GameText.TargetText.German      [ "miner-collect-diamond" ]     = "Du sammelst Diamant auf."
GameText.TargetText.French      [ "miner-collect-diamond" ]     = "Tu as ramassé un diamant."

GameText.TargetText.English     [ "miner-collect-emerald" ]     = "You pick up emerald."
GameText.TargetText.Esperanto   [ "miner-collect-emerald" ]     = "Vi kolektas smeraldon."
GameText.TargetText.Ido         [ "miner-collect-emerald" ]     = "Vu kolektas smeraldo."
GameText.TargetText.Spanish     [ "miner-collect-emerald" ]     = "Obtienes esmeralda."
GameText.TargetText.Ithkuil     [ "miner-collect-emerald" ]     = "Żp'al ômrar ko"
GameText.TargetText.German      [ "miner-collect-emerald" ]     = "Du sammelst Emerald auf."
GameText.TargetText.French      [ "miner-collect-emerald" ]     = "Tu as ramassé une émeraude."

GameText.TargetText.English     [ "miner-collect-ruby" ]        = "You pick up ruby."
GameText.TargetText.Esperanto   [ "miner-collect-ruby" ]        = "Vi kolektas rubenon."
GameText.TargetText.Ido         [ "miner-collect-ruby" ]        = "Vu kolektas rubino."
GameText.TargetText.Spanish     [ "miner-collect-ruby" ]        = "Obtienes rubí."
GameText.TargetText.Ithkuil     [ "miner-collect-ruby" ]        = "Ktél xtal ômrar ko"
GameText.TargetText.German      [ "miner-collect-ruby" ]        = "Du sammmelst Rubin auf."
GameText.TargetText.French      [ "miner-collect-ruby" ]        = "Tu as ramassé un rubis."

-- attacking
GameText.TargetText.English     [ "miner-attack-snail" ]    = "You attack the snail."
GameText.TargetText.Esperanto   [ "miner-attack-snail" ]    = "Vi atakas la helikon."
GameText.TargetText.Ido         [ "miner-attack-snail" ]    = "Vu atakas la heliko."
GameText.TargetText.Spanish     [ "miner-attack-snail" ]    = "Atacas al caracol."
GameText.TargetText.Ithkuil     [ "miner-attack-snail" ]    = "Âļnel fřál ko"
GameText.TargetText.German      [ "miner-attack-snail" ]    = "Du greifst die Schnecke an."
GameText.TargetText.French      [ "miner-attack-snail" ]    = "Tu attaques l'escargot."

GameText.TargetText.English     [ "miner-attack-mole" ]     = "You attack the mole."
GameText.TargetText.Esperanto   [ "miner-attack-mole" ]     = "Vi atakas la talpon."
GameText.TargetText.Ido         [ "miner-attack-mole" ]     = "Vu atakas la talpo."
GameText.TargetText.Spanish     [ "miner-attack-mole" ]     = "Atacas al topo."
GameText.TargetText.Ithkuil     [ "miner-attack-mole" ]     = "Çqhwel fřál ko"
GameText.TargetText.German      [ "miner-attack-mole" ]     = "Du greifst den Maulwurf an."
GameText.TargetText.French      [ "miner-attack-mole" ]     = "Tu attaques la taupe."

GameText.TargetText.English     [ "miner-attack-mushroom" ]     = "You attack the mushroom."
GameText.TargetText.Esperanto   [ "miner-attack-mushroom" ]     = "Vi atakas la fungon."
GameText.TargetText.Ido         [ "miner-attack-mushroom" ]     = "Vu atakas la fungo."
GameText.TargetText.Spanish     [ "miner-attack-mushroom" ]     = "Atacas al champiñón."
GameText.TargetText.Ithkuil     [ "miner-attack-mushroom" ]     = "Cnelek fřál ko"
GameText.TargetText.German      [ "miner-attack-mushroom" ]     = "Du greifst den Pilz an."
GameText.TargetText.French      [ "miner-attack-mushroom" ]     = "Tu attaques le champignon."

GameText.TargetText.English     [ "miner-attack-bat" ]      = "You attack the bat."
GameText.TargetText.Esperanto   [ "miner-attack-bat" ]      = "Vi atakas la vesperton."
GameText.TargetText.Ido         [ "miner-attack-bat" ]      = "Vu atakas la vespertilio."
GameText.TargetText.Spanish     [ "miner-attack-bat" ]      = "Atacas al murcielago."
GameText.TargetText.Ithkuil     [ "miner-attack-bat" ]      = "Ftçel fřál ko"
GameText.TargetText.German      [ "miner-attack-bat" ]      = "Du greifst die Fledermaus an."
GameText.TargetText.French      [ "miner-attack-bat" ]      = "Tu attaques la chauve-souris."

GameText.TargetText.English     [ "miner-attack-rabbit" ]   = "You attack the rabbit."
GameText.TargetText.Esperanto   [ "miner-attack-rabbit" ]   = "Vi atakas la kuniklon."
GameText.TargetText.Ido         [ "miner-attack-rabbit" ]   = "Vu atakas la kuniklo."
GameText.TargetText.Spanish     [ "miner-attack-rabbit" ]   = "Atacas al conejo."
GameText.TargetText.Ithkuil     [ "miner-attack-rabbit" ]   = "Lxwel fřál ko"
GameText.TargetText.German      [ "miner-attack-rabbit" ]   = "Du greifst den Hasen an."
GameText.TargetText.French      [ "miner-attack-rabbit" ]   = "Tu attaques le lapin."

GameText.TargetText.English     [ "miner-attack-snake" ]    = "You attack the snake."
GameText.TargetText.Esperanto   [ "miner-attack-snake" ]    = "Vi atakas la serpenton."
GameText.TargetText.Ido         [ "miner-attack-snake" ]    = "Vu atakas la serpento."
GameText.TargetText.Spanish     [ "miner-attack-snake" ]    = "Atacas a la serpiente."
GameText.TargetText.Ithkuil     [ "miner-attack-snake" ]    = "Knel fřál ko"
GameText.TargetText.German      [ "miner-attack-snake" ]    = "Du greifst die Schlange an."
GameText.TargetText.French      [ "miner-attack-snake" ]    = "Tu attaques le serpent."

GameText.TargetText.English     [ "miner-attack-moose" ]    = "You attack the moose."
GameText.TargetText.Esperanto   [ "miner-attack-moose" ]    = "Vi atakas la alkon."
GameText.TargetText.Ido         [ "miner-attack-moose" ]    = "Vu atakas la alko."
GameText.TargetText.Spanish     [ "miner-attack-moose" ]    = "Atacas al alce."
GameText.TargetText.Ithkuil     [ "miner-attack-moose" ]    = "Ndwel fřál ko"
GameText.TargetText.German      [ "miner-attack-moose" ]    = "Du greifst den Elch an."
GameText.TargetText.French      [ "miner-attack-moose" ]    = "Tu attaques l'élan."

GameText.TargetText.English     [ "miner-attack-skeleton" ]     = "You attack the skeleton."
GameText.TargetText.Esperanto   [ "miner-attack-skeleton" ]     = "Vi atakas la skeleton."
GameText.TargetText.Ido         [ "miner-attack-skeleton" ]     = "Vu atakas la skeleto."
GameText.TargetText.Spanish     [ "miner-attack-skeleton" ]     = "Atacas al esqueleto."
GameText.TargetText.Ithkuil     [ "miner-attack-skeleton" ]     = "Urp'al eqel fřál ko"
GameText.TargetText.German      [ "miner-attack-skeleton" ]     = "Du greifst das Skelett an."
GameText.TargetText.French      [ "miner-attack-skeleton" ]     = "Tu attaques le squelette."

-- ladder
GameText.TargetText.English     [ "miner-go-down-ladder" ]      = "You descend the ladder."
GameText.TargetText.Esperanto   [ "miner-go-down-ladder" ]      = "Vi malsupreniras per la ŝtupetaro."
GameText.TargetText.Ido         [ "miner-go-down-ladder" ]      = "Vu decensas per la skalo."
GameText.TargetText.Spanish     [ "miner-go-down-ladder" ]      = "Bajas por la escalera."
GameText.TargetText.Ithkuil     [ "miner-go-down-ladder" ]      = "Jal"
GameText.TargetText.German      [ "miner-go-down-ladder" ]      = "Du gehst die Leiter hinab."
GameText.TargetText.French      [ "miner-go-down-ladder" ]      = "Tu descends l'échelle."

GameText.TargetText.English     [ "miner-rope" ]                = "You flee upward with the rope."
GameText.TargetText.Esperanto   [ "miner-rope" ]                = "Vi eskapis supren per la ŝnuro."
GameText.TargetText.Ido         [ "miner-rope" ]                = "Vu eskapis adinfre per la kordo."
GameText.TargetText.Spanish     [ "miner-rope" ]                = "Escapas hacia arriba por la cuerda."
GameText.TargetText.Ithkuil     [ "miner-rope" ]                = "You flee upward with the rope."
GameText.TargetText.German      [ "miner-rope" ]                = "You flee upward with the rope."
GameText.TargetText.French      [ "miner-rope" ]                = "You flee upward with the rope."

GameText.TargetText.English     [ "miner-dynamite" ]            = "You flee downward with the dynamite."
GameText.TargetText.Esperanto   [ "miner-dynamite" ]            = "Vi eskapis malsupren per la dinamito."
GameText.TargetText.Ido         [ "miner-dynamite" ]            = "Vu eskapis adsupere per la dinamito."
GameText.TargetText.Spanish     [ "miner-dynamite" ]            = "Escapas hacia abajo con la dinamita."
GameText.TargetText.Ithkuil     [ "miner-dynamite" ]            = "You flee downward with the dynamite."
GameText.TargetText.German      [ "miner-dynamite" ]            = "You flee downward with the dynamite."
GameText.TargetText.French      [ "miner-dynamite" ]            = "You flee downward with the dynamite."

-- Shop

GameText.TargetText.English     [ "Do you want to buy a tool?" ]    = "Do you want to buy a tool?"
GameText.TargetText.Esperanto   [ "Do you want to buy a tool?" ]    = "Ĉu vi volas aĉeti ilon?"
GameText.TargetText.Ido         [ "Do you want to buy a tool?" ]    = "Ka vu volas kompras utensilo?"
GameText.TargetText.Spanish     [ "Do you want to buy a tool?" ]    = "¿Deseas comprar una herramienta?."
GameText.TargetText.Ithkuil     [ "Do you want to buy a tool?" ]    = "Ebawul ki čeil?"
GameText.TargetText.German      [ "Do you want to buy a tool?" ]    = "Möchtest du ein Werkzeug kaufen?"
GameText.TargetText.French      [ "Do you want to buy a tool?" ]    = "Est-ce que tu veux acheter un outil ?"

GameText.TargetText.English     [ "Don't buy anything" ]    = "Don't buy anything."
GameText.TargetText.Esperanto   [ "Don't buy anything" ]    = "Ne aĉeti ion."
GameText.TargetText.Ido         [ "Don't buy anything" ]    = "Ne komprar irgo."
GameText.TargetText.Spanish     [ "Don't buy anything" ]    = "No comprar nada."
GameText.TargetText.Ithkuil     [ "Don't buy anything" ]    = "Don't buy anything."
GameText.TargetText.German      [ "Don't buy anything" ]    = "Nichts kaufen."
GameText.TargetText.French      [ "Don't buy anything" ]    = "Ne rien acheter."

-- Items
GameText.TargetText.English     [ "Potion" ]    = "Potion"
GameText.TargetText.Esperanto   [ "Potion" ]    = "Pocio"
GameText.TargetText.Ido         [ "Potion" ]    = "Pociono"
GameText.TargetText.Spanish     [ "Potion" ]    = "Poción"
GameText.TargetText.Ithkuil     [ "Potion" ]    = "Ôgral kâ"
GameText.TargetText.German      [ "Potion" ]    = "Heiltrank"
GameText.TargetText.French      [ "Potion" ]    = "Potion"

GameText.TargetText.English     [ "PotionDescription" ]     = "Restores all of your health."
GameText.TargetText.Esperanto   [ "PotionDescription" ]     = "Redoni ĉiom da via sano."
GameText.TargetText.Ido         [ "PotionDescription" ]     = "Ridonar omna de vua saneso."
GameText.TargetText.Spanish     [ "PotionDescription" ]     = "Restaura toda tu salud."
GameText.TargetText.Ithkuil     [ "PotionDescription" ]     = "Restores all of your health."
GameText.TargetText.German      [ "PotionDescription" ]     = "Heilt dich vollständig."
GameText.TargetText.French      [ "PotionDescription" ]     = "Restaure toute ta santé."

GameText.TargetText.English     [ "Earthquake" ]    = "Earthquake"
GameText.TargetText.Esperanto   [ "Earthquake" ]    = "Tertremo"
GameText.TargetText.Ido         [ "Earthquake" ]    = "Tertremo"
GameText.TargetText.Spanish     [ "Earthquake" ]    = "Terremoto"
GameText.TargetText.Ithkuil     [ "Earthquake" ]    = "pErţkwaekpar"
GameText.TargetText.German      [ "Earthquake" ]    = "Erdbeben"
GameText.TargetText.French      [ "Earthquake" ]    = "Séisme"

GameText.TargetText.English     [ "EarthquakeDescription" ]     = "Breaks all rocks."
GameText.TargetText.Esperanto   [ "EarthquakeDescription" ]     = "Rompi ĉiujn ŝtonojn."
GameText.TargetText.Ido         [ "EarthquakeDescription" ]     = "Ruptar omna roki."
GameText.TargetText.Spanish     [ "EarthquakeDescription" ]     = "Rompe todas las piedras."
GameText.TargetText.Ithkuil     [ "EarthquakeDescription" ]     = "Breaks all rocks."
GameText.TargetText.German      [ "EarthquakeDescription" ]     = "Lässt alle Steine zerbrechen."
GameText.TargetText.French      [ "EarthquakeDescription" ]     = "Casse tous les rochers."

GameText.TargetText.English     [ "Dynamite" ]  = "Dynamite"
GameText.TargetText.Esperanto   [ "Dynamite" ]  = "Dinamito"
GameText.TargetText.Ido         [ "Dynamite" ]  = "Dinamito"
GameText.TargetText.Spanish     [ "Dynamite" ]  = "Dinamita"
GameText.TargetText.Ithkuil     [ "Dynamite" ]  = "Xčálrak"
GameText.TargetText.German      [ "Dynamite" ]  = "Dynamit"
GameText.TargetText.French      [ "Dynamite" ]  = "Dynamite"

GameText.TargetText.English     [ "DynamiteDescription" ]   = "Descend down one floor."
GameText.TargetText.Esperanto   [ "DynamiteDescription" ]   = "Subiri unu nivelon."
GameText.TargetText.Ido         [ "DynamiteDescription" ]   = "Decensar unu nivelo."
GameText.TargetText.Spanish     [ "DynamiteDescription" ]   = "Descender un piso."
GameText.TargetText.Ithkuil     [ "DynamiteDescription" ]   = "Jal"
GameText.TargetText.German      [ "DynamiteDescription" ]   = "Gehe eine Ebene hinab."
GameText.TargetText.French      [ "DynamiteDescription" ]   = "Fait descendre d'un étage."

GameText.TargetText.English     [ "Rope" ]  = "Rope"
GameText.TargetText.Esperanto   [ "Rope" ]  = "Ŝnuro"
GameText.TargetText.Ido         [ "Rope" ]  = "Kordo"
GameText.TargetText.Spanish     [ "Rope" ]  = "Cuerda"
GameText.TargetText.Ithkuil     [ "Rope" ]  = "Öxpál"
GameText.TargetText.German      [ "Rope" ]  = "Seil"
GameText.TargetText.French      [ "Rope" ]  = "Corde"

GameText.TargetText.English     [ "RopeDescription" ]   = "Climb up one floor."
GameText.TargetText.Esperanto   [ "RopeDescription" ]   = "Supreniri unu nivelon."
GameText.TargetText.Ido         [ "RopeDescription" ]   = "Acensar unu nivelo."
GameText.TargetText.Spanish     [ "RopeDescription" ]   = "Ascender un piso."
GameText.TargetText.Ithkuil     [ "RopeDescription" ]   = "Jal"
GameText.TargetText.German      [ "RopeDescription" ]   = "Gehe eine Ebene hinauf."
GameText.TargetText.French      [ "RopeDescription" ]   = "Fait monter d'un étage."

GameText.TargetText.English     [ "Blizzard" ]  = "Blizzard"
GameText.TargetText.Esperanto   [ "Blizzard" ]  = "Neĝventego"
GameText.TargetText.Ido         [ "Blizzard" ]  = "Nivsturmo"
GameText.TargetText.Spanish     [ "Blizzard" ]  = "Ventisca"
GameText.TargetText.Ithkuil     [ "Blizzard" ]  = "Uţwálûk"
GameText.TargetText.German      [ "Blizzard" ]  = "Blizzard"
GameText.TargetText.French      [ "Blizzard" ]  = "Blizzard"

GameText.TargetText.English     [ "BlizzardDescription" ]   = "Freeze all the enemies."
GameText.TargetText.Esperanto   [ "BlizzardDescription" ]   = "Frostigi ĉiujn malamikojn."
GameText.TargetText.Ido         [ "BlizzardDescription" ]   = "Frostigar omna enemiki."
GameText.TargetText.Spanish     [ "BlizzardDescription" ]   = "Congela a todos los enemigos."
GameText.TargetText.Ithkuil     [ "BlizzardDescription" ]   = "Tel îdhal"
GameText.TargetText.German      [ "BlizzardDescription" ]   = "Friere alle Gegner ein."
GameText.TargetText.French      [ "BlizzardDescription" ]   = "Gèle tous les ennemis."

GameText.TargetText.English     [ "Price" ]     = "Price:"
GameText.TargetText.Esperanto   [ "Price" ]     = "Prezo:"
GameText.TargetText.Ido         [ "Price" ]     = "Preco:"
GameText.TargetText.Spanish     [ "Price" ]     = "Precio:"
GameText.TargetText.Ithkuil     [ "Price" ]     = "Îmsawur:"
GameText.TargetText.German      [ "Price" ]     = "Preis:"
GameText.TargetText.French      [ "Price" ]     = "Prix :"

end


