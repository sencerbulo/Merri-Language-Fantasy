function SetupPolish()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Tłumacze"         -- Header text: "Translators" for Translator credits section
    
    helper[ "website" ]                 = "Strona internetowa:"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "Polska Fantazja"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "Ta gra jest wciąż rozwijana."
    target[ "This is still a work in progress" ]                = "Ta gra jest wciąż rozwijana."
    target[ "There may be errors or bugs" ]                     = "Mogą pojawiać się błędy lub bugi."
    target[ "Report problems at EMAIL" ]                        = "Problemy zgłaszaj na adres Rachel@Moosader.com ."
    target[ "Want to keep up with this game's progress?" ]      = "Czy chcesz otrzymywać informacje o postępach nad grą ?"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "Graj"                -- Button to begin the game
    target[ "previous" ]                = "Poprzednia"          -- Go backward one page (one menu)
    target[ "next" ]                    = "Kontynuuj"           -- Go forward one page (one menu)
    target[ "options" ]                 = "Opcje"               -- Configure options in a game
    target[ "help" ]                    = "Pomoc"                -- Get help / instructions for a game or function
    target[ "menu" ]                    = "Menu"                -- Open up sub-menu screen
    target[ "close-menu" ]              = "Wróć"                -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = ""                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Trening"
    helper[ "Easy" ]      = "Łatwy"
    helper[ "Medium" ]    = "Średni"
    helper[ "Hard" ]      = "Trudny"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "Zdobyto gwiazdę!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Górnik"               -- Male miner (temporary)
    target[ "Floor" ]                   = "Poziom:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Pieniądze:"           -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Zdrowie:"             -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Koniec gry"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Ślimak"
    target[ "mole" ]                    = "Kret"
    target[ "mushroom" ]                = "Grzyb"
    target[ "bat" ]                     = "Nietoperz"
    target[ "rabbit" ]                  = "Królik"
    target[ "snake" ]                   = "Wąż"
    target[ "skeleton" ]                = "Szkielet"
    target[ "moose" ]                   = "Łoś"
    
    -- Items
    target[ "rock" ]                    = "Kamień"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Gwiazda"
    target[ "sandwich" ]                = "Kanapka"
    target[ "amethyst" ]                = "Ametyst"
    target[ "sapphire" ]                = "Szafir"
    target[ "diamond" ]                 = "Diament"
    target[ "emerald" ]                 = "Szmaragd"
    target[ "ruby" ]                    = "Rubin"
    target[ "copper" ]                  = "Miedź"              -- It is a copper coin
    target[ "silver" ]                  = "Srebro"
    target[ "gold" ]                    = "Złoto"
    target[ "ladder" ]                  = "Drabina"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "Czy chcesz kupić narzędzie?"
    target[ "You don't have enough money" ]   = "Masz za mało pieniędzy."
    
    -- Button options
    target[ "Don't buy anything" ]      = "Nie kupuj nic." -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Cena:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Mikstura"              -- Restores health
    target[ "PotionDescription" ]       = "Przywraca całe zdrowie."
    target[ "Earthquake" ]              = "Trzęsienie ziemii"
    target[ "EarthquakeDescription" ]   = "Rozwala wszystkie kamienie."
    target[ "Dynamite" ]                = "Dynamit"
    target[ "DynamiteDescription" ]     = "Pozwala zejść jeden poziom niżej."
    target[ "Rope" ]                    = "Lina"
    target[ "RopeDescription" ]         = "Pozwala wejść jeden poziom wyżej."
    target[ "Blizzard" ]                = "Zamieć"
    target[ "BlizzardDescription" ]     = "Zamraża wszystkich wrogów."
    
    -- Narration
    target[ "miner-begin" ]             = "Kop za skarbem i przeżyj!"
    target[ "miner-move-north" ]        = "Idziesz na północ."
    target[ "miner-move-south" ]        = "Idziesz na południe."
    target[ "miner-move-east" ]         = "Idziesz na wschód."
    target[ "miner-move-west" ]         = "Idziesz na zachód."
    target[ "miner-mine" ]              = "Machasz swoim kilofem."
    target[ "miner-eat-sandwich" ]      = "Zjadasz jaskiniową kanapkę."
    target[ "use-earthquake" ]          = "Ziemia trzęsie się gwałtownie."
    target[ "use-blizzard" ]            = "Wszystko zamarza."
    target[ "enemies-thaw" ]            = "Wszystko rozmroziło się."
    target[ "use-potion" ]              = "Czujesz że wracają Tobie siły."
    target[ "miner-collect-copper" ]    = "Podnosisz miedź."
    target[ "miner-collect-silver" ]    = "Podnosisz srebro."
    target[ "miner-collect-gold" ]      = "Podnosisz złoto."
    target[ "miner-collect-amethyst" ]  = "Podnosisz ametyst."
    target[ "miner-collect-sapphire" ]  = "Podnosisz szafir."
    target[ "miner-collect-diamond" ]   = "Podnosisz diament."
    target[ "miner-collect-diamond" ]   = "Podnosisz diament."
    target[ "miner-collect-ruby" ]      = "Tu as ramassé un rubin."
    target[ "miner-attack-snail" ]      = "Atakujesz ślimaka."
    target[ "miner-attack-mole" ]       = "Atakujesz kreta."
    target[ "miner-attack-mushroom" ]   = "Atakujesz grzyba."
    target[ "miner-attack-bat" ]        = "Atakujesz nietoperza."
    target[ "miner-attack-rabbit" ]     = "Atakujesz królika."
    target[ "miner-attack-snake" ]      = "Atakujesz węża."
    target[ "miner-attack-moose" ]      = "Atakujesz łosia."
    target[ "miner-attack-skeleton" ]   = "Atakujesz szkielet."
    target[ "miner-go-down-ladder" ]    = "Schodzisz po drabinie."
    target[ "miner-rope" ]              = "Uciekasz w górę po linie."
    target[ "miner-dynamite" ]          = "Uciekasz w dół używając dynamitu."
    target[ "miner-died" ]              = "Nie żyjesz."
    
	return helper, target    
end
