function SetupPolish()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Tłumacze"         -- Header text: "Translators" for Translator credits section
    helper[ "language-name" ]           = "Polish"           -- Name of this language (match this language file)
    helper[ "Translation Credits" ]     = "Wojtek Kubiak"    -- Translators, append your name to the list.
    
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
    target[ "miner-begin" ]             = "Mine for treasure and stay alive!"
    target[ "miner-move-north" ]        = "You walk north."
    target[ "miner-move-south" ]        = "You walk south."
    target[ "miner-move-east" ]         = "You walk east."
    target[ "miner-move-west" ]         = "You walk west."
    target[ "miner-mine" ]              = "You swing your pick."
    target[ "miner-eat-sandwich" ]      = "You eat the cave sandwich."
    target[ "use-earthquake" ]          = "The earth shakes violently."
    target[ "use-blizzard" ]            = "Everything freezes over." 
    target[ "enemies-thaw" ]            = "Everything has thawed out."
    target[ "use-potion" ]              = "You feel strong again."
    target[ "miner-collect-copper" ]    = "You pick up copper."
    target[ "miner-collect-silver" ]    = "You pick up silver."
    target[ "miner-collect-gold" ]      = "You pick up gold."
    target[ "miner-collect-amethyst" ]  = "You pick up amethyst."
    target[ "miner-collect-sapphire" ]  = "You pick up sapphire."
    target[ "miner-collect-diamond" ]   = "You pick up diamond."
    target[ "miner-collect-emerald" ]   = "You pick up emerald."
    target[ "miner-collect-ruby" ]      = "You pick up ruby."
    target[ "miner-attack-snail" ]      = "You attack the snail."
    target[ "miner-attack-mole" ]       = "You attack the mole."
    target[ "miner-attack-mushroom" ]   = "You attack the mushroom."
    target[ "miner-attack-bat" ]        = "You attack the bat."
    target[ "miner-attack-rabbit" ]     = "You attack the rabbit."
    target[ "miner-attack-snake" ]      = "You attack the snake."
    target[ "miner-attack-moose" ]      = "You attack the moose."
    target[ "miner-attack-skeleton" ]   = "You attack the skeleton."
    target[ "miner-go-down-ladder" ]    = "You descend the ladder."
    target[ "miner-rope" ]              = "You flee upward by using the rope."
    target[ "miner-dynamite" ]          = "You flee downward by using the dynamite."
    target[ "miner-died" ]              = "You have been killed."
    
end
