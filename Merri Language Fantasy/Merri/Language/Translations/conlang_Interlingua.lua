function SetupInterlingua()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Traductores"         -- Header text: "Translators" for Translator credits section
    
    helper[ "website" ]                 = "Sito web:"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "Fantasia de Interlingua"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "Gratias pro provar Merri!"
    target[ "This is still a work in progress" ]                = "Isto es totevia un obra in processo."
    target[ "There may be errors or bugs" ]                     = "Iste software poterea continer errores o bugs."
    target[ "Report problems at EMAIL" ]                        = "Reporta cualcunque problema a Rachel@Moosader.com ."
    target[ "Want to keep up with this game's progress?" ]      = "Esque tu vole sequer le disveloppamento del joco?"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "Jocar"               -- Button to begin the game
    target[ "previous" ]                = "Previe"              -- Go backward one page (one menu)
    target[ "next" ]                    = "Continuar"           -- Go forward one page (one menu)
    target[ "options" ]                 = "Optiones"            -- Configure options in a game
    target[ "help" ]                    = "Adjuta"              -- Get help / instructions for a game or function
    target[ "menu" ]                    = "Menu"                -- Open up sub-menu screen
    target[ "close-menu" ]              = "Retornar"            -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = "Progresso"                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Practicar"
    helper[ "Easy" ]      = "Facile"
    helper[ "Medium" ]    = "Intermedie"
    helper[ "Hard" ]      = "Difficile"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "Tu ha acquirite un stella!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Minator"             -- Male miner (temporary)
    target[ "Floor" ]                   = "Etage:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Moneta:"             -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Sanitate:"           -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Fin del joco"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Limace"
    target[ "mole" ]                    = "Talpa"
    target[ "mushroom" ]                = "Champignon"
    target[ "bat" ]                     = "Vespertilion"
    target[ "rabbit" ]                  = "Conilio"
    target[ "snake" ]                   = "Serpente"
    target[ "skeleton" ]                = "Skeleto"
    target[ "moose" ]                   = "Alce"
    
    -- Items
    target[ "rock" ]                    = "Petra"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Stella"
    target[ "sandwich" ]                = "Sandwich"
    target[ "amethyst" ]                = "Amethysto"
    target[ "sapphire" ]                = "Sapphiro"
    target[ "diamond" ]                 = "Diamante"
    target[ "emerald" ]                 = "Esmeraldo"
    target[ "ruby" ]                    = "Rubino"
    target[ "copper" ]                  = "Cupro"              -- It is a copper coin
    target[ "silver" ]                  = "Argento"
    target[ "gold" ]                    = "Auro"
    target[ "ladder" ]                  = "Scala"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "Esque tu vole comprar un utensile?"
    target[ "You don't have enough money" ]   = "Tu non ha assatis moneta."
    
    -- Button options
    target[ "Don't buy anything" ]      = "Non comprar." -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Precio:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Potion"              -- Restores health
    target[ "PotionDescription" ]       = "Restaura tote tu sanitate."
    target[ "Earthquake" ]              = "Tremor de terra"
    target[ "EarthquakeDescription" ]   = "Rumpe tote le petras."
    target[ "Dynamite" ]                = "Dinamite"
    target[ "DynamiteDescription" ]     = "Descender un etage."
    target[ "Rope" ]                    = "Corda"
    target[ "RopeDescription" ]         = "Ascender un etage."
    target[ "Blizzard" ]                = "Tempesta de nive"
    target[ "BlizzardDescription" ]     = "Gela tote le inimicos."
    
    -- Narration
    target[ "miner-begin" ]             = "Mina pro trovar tresoros e supervive！"
    target[ "miner-move-north" ]        = "Tu va al nord."
    target[ "miner-move-south" ]        = "Tu va al sud."
    target[ "miner-move-east" ]         = "Tu va al est."
    target[ "miner-move-west" ]         = "Tu va al west."
    target[ "miner-mine" ]              = "Tu dona un colpo de picco."
    target[ "miner-eat-sandwich" ]      = "Tu mangia le sandwich del caverna."
    target[ "use-earthquake" ]          = "Le terra treme violentemente."
    target[ "use-blizzard" ]            = "Toto se gela."
    target[ "enemies-thaw" ]            = "Toto se disgela."
    target[ "use-potion" ]              = "Tu te senti plus forte."
    target[ "miner-collect-copper" ]    = "Tu collige cupro"
    target[ "miner-collect-silver" ]    = "Tu collige argento."
    target[ "miner-collect-gold" ]      = "Tu collige auro."
    target[ "miner-collect-amethyst" ]  = "Tu collige amethysto."
    target[ "miner-collect-sapphire" ]  = "Tu collige sapphiro."
    target[ "miner-collect-diamond" ]   = "Tu collige diamante."
    target[ "miner-collect-emerald" ]   = "Tu collige esmeralda."
    target[ "miner-collect-ruby" ]      = "Tu collige rubino."
    target[ "miner-attack-snail" ]      = "Tu attacca le limace."
    target[ "miner-attack-mole" ]       = "Tu attacca le talpa."
    target[ "miner-attack-mushroom" ]   = "Tu attacca le champignon."
    target[ "miner-attack-bat" ]        = "Tu attacca le vespertilion."
    target[ "miner-attack-rabbit" ]     = "Tu attacca le conilio."
    target[ "miner-attack-snake" ]      = "Tu attacca le serpente."
    target[ "miner-attack-moose" ]      = "Tu attaca le alce."
    target[ "miner-attack-skeleton" ]   = "Tu attacca le skeleto."
    target[ "miner-go-down-ladder" ]    = "You descend the ladder."
    target[ "miner-rope" ]              = "Tu fugi e ascende per le corda."
    target[ "miner-dynamite" ]          = "Tu usa le dinamite pro descender."
    target[ "miner-died" ]              = "Tu ha essite occidite."
    
	return helper, target    
end
