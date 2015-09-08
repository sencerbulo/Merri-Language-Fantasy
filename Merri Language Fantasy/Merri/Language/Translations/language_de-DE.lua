function SetupGerman()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Übersetzer"          -- Header text: "Translators" for Translator credits section
    
    helper[ "website" ]                 = "Internetseite:"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "Deutsche Fantasie"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "Danke, dass du Merri ausprobierst!"
    target[ "This is still a work in progress" ]                = "Dieses Spiel befindet sich derzeit noch in Entwicklung."
    target[ "There may be errors or bugs" ]                     = "Es gibt wahrscheinlich noch Fehler."
    target[ "Report problems at EMAIL" ]                        = "Problemberichte können an Rachel@Moosader.com gesendet werden."
    target[ "Want to keep up with this game's progress?" ]      = "Möchtest du über die Entwicklung dieses Spiels informiert werden?"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "Spielen"             -- Button to begin the game
    target[ "previous" ]                = "Vorherige"           -- Go backward one page (one menu)
    target[ "next" ]                    = "Fortsetzen"          -- Go forward one page (one menu)
    target[ "options" ]                 = "Optionen"            -- Configure options in a game
    target[ "help" ]                    = "Hilfe"               -- Get help / instructions for a game or function
    target[ "menu" ]                    = "Menü"                -- Open up sub-menu screen
    target[ "close-menu" ]              = "Zurück"              -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = ""                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Üben"
    helper[ "Easy" ]      = "Leicht"
    helper[ "Medium" ]    = "Mittel"
    helper[ "Hard" ]      = "Schwer"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "Du hast einen Stern erhalten!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Bergarbeiter"        -- Male miner (temporary)
    target[ "Floor" ]                   = "Ebene:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Geld:"               -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Leben :"             -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Spiel vorbei"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Schnecke"
    target[ "mole" ]                    = "Maulwurf"
    target[ "mushroom" ]                = "Pilz"
    target[ "bat" ]                     = "Fledermaus"
    target[ "rabbit" ]                  = "Hase"
    target[ "snake" ]                   = "Schlange"
    target[ "skeleton" ]                = "Skelett"
    target[ "moose" ]                   = "Elch"
    
    -- Items
    target[ "rock" ]                    = "Fels"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Stern"
    target[ "sandwich" ]                = "Sandwich"
    target[ "amethyst" ]                = "Amethyst"
    target[ "sapphire" ]                = "Saphir"
    target[ "diamond" ]                 = "Diamant"
    target[ "emerald" ]                 = "Emerald"
    target[ "ruby" ]                    = "Rubin"
    target[ "copper" ]                  = "Kupfer"              -- It is a copper coin
    target[ "silver" ]                  = "Silber"
    target[ "gold" ]                    = "Gold"
    target[ "ladder" ]                  = "Leiter"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "Möchtest du ein Werkzeug kaufen?"
    target[ "You don't have enough money" ]   = ""
    
    -- Button options
    target[ "Don't buy anything" ]      =  "Nichts kaufen." -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Preis:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Heiltrank"              -- Restores health
    target[ "PotionDescription" ]       = "Heilt dich vollständig."
    target[ "Earthquake" ]              = "Erdbeben"
    target[ "EarthquakeDescription" ]   = "Lässt alle Steine zerbrechen."
    target[ "Dynamite" ]                = "Dynamit"
    target[ "DynamiteDescription" ]     = "Gehe eine Ebene hinab."
    target[ "Rope" ]                    = "Seil"
    target[ "RopeDescription" ]         = "Gehe eine Ebene hinauf."
    target[ "Blizzard" ]                = "Blizzard"
    target[ "BlizzardDescription" ]     = "Friere alle Gegner ein."
    
    -- Narration
    target[ "miner-begin" ]             = "Fördere Schätze und bleibe am Leben!"
    target[ "miner-move-north" ]        = "Du gehst Richtung Norden."
    target[ "miner-move-south" ]        = "Du gehst Richtung Süden."
    target[ "miner-move-east" ]         = "Du gehst Richtung Osten."
    target[ "miner-move-west" ]         = "Du gehst Richtung Westen."
    target[ "miner-mine" ]              = "Du schwingst deine Spitzhacke."
    target[ "miner-eat-sandwich" ]      = "Du isst das Höhlensandwich."
    target[ "use-earthquake" ]          = ""
    target[ "use-blizzard" ]            = "" 
    target[ "enemies-thaw" ]            = ""
    target[ "use-potion" ]              = ""
    target[ "miner-collect-copper" ]    = "Du sammelst Kupfer auf."
    target[ "miner-collect-silver" ]    = "Du sammelst Silber auf."
    target[ "miner-collect-gold" ]      = "Du sammelst Gold auf."
    target[ "miner-collect-amethyst" ]  = "Du sammelst Amethyst auf."
    target[ "miner-collect-sapphire" ]  = "Du sammelst Saphir auf."
    target[ "miner-collect-diamond" ]   = "Du sammelst Diamant auf."
    target[ "miner-collect-emerald" ]   = "Du sammelst Emerald auf."
    target[ "miner-collect-ruby" ]      = "Du sammmelst Rubin auf."
    target[ "miner-attack-snail" ]      = "Du greifst die Schnecke an."
    target[ "miner-attack-mole" ]       = "Du greifst den Maulwurf an."
    target[ "miner-attack-mushroom" ]   = "Du greifst den Pilz an."
    target[ "miner-attack-bat" ]        = "Du greifst die Fledermaus an."
    target[ "miner-attack-rabbit" ]     = "Du greifst den Hasen an."
    target[ "miner-attack-snake" ]      = "Du greifst die Schlange an."
    target[ "miner-attack-moose" ]      = "Du greifst den Elch an."
    target[ "miner-attack-skeleton" ]   = "Du greifst das Skelett an."
    target[ "miner-go-down-ladder" ]    = "Du gehst die Leiter hinab."
    target[ "miner-rope" ]              = ""
    target[ "miner-dynamite" ]          = ""
    target[ "miner-died" ]              = ""
    
	return helper, target    
end
