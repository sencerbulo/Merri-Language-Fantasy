function SetupIdo()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Tradukisti"          -- Header text: "Translators" for Translator credits section
    
    helper[ "website" ]                 = "Retosituo:"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "Fantazio di Ido"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "Danko pro probar Merri!"
    target[ "This is still a work in progress" ]                = "Ica ankore esas nekompleta."
    target[ "There may be errors or bugs" ]                     = "Forsan existas erori o cimi."
    target[ "Report problems at EMAIL" ]                        = "Raportez problemi ad Rachel@Moosader.com ."
    target[ "Want to keep up with this game's progress?" ]      = "Ka vu volas sequar informo pri la ludo?"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "Ludar"               -- Button to begin the game
    target[ "previous" ]                = "Antea"               -- Go backward one page (one menu)
    target[ "next" ]                    = "Sequanta"            -- Go forward one page (one menu)
    target[ "options" ]                 = "Selektaji"           -- Configure options in a game
    target[ "help" ]                    = "Helpo"               -- Get help / instructions for a game or function
    target[ "menu" ]                    = "Menuo"               -- Open up sub-menu screen
    target[ "close-menu" ]              = "Revenar"             -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = "Progreso"            -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Exercar"
    helper[ "Easy" ]      = "Baz'nivela"
    helper[ "Medium" ]    = "Mez'nivela"
    helper[ "Hard" ]      = "Alt'nivela"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "Vu aquiris stelo!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Ministo"               -- Male miner (temporary)
    target[ "Floor" ]                   = "Nivelo:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Pekunio:"              -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Saneso:"             -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Ludfino"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Heliko"
    target[ "mole" ]                    = "Talpo"
    target[ "mushroom" ]                = "Fungo"
    target[ "bat" ]                     = "Vespertilio"
    target[ "rabbit" ]                  = "Kuniklo"
    target[ "snake" ]                   = "Serpento"
    target[ "skeleton" ]                = "Skeleto"
    target[ "moose" ]                   = "Alko"
    
    -- Items
    target[ "rock" ]                    = "Roko"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Stelo"
    target[ "sandwich" ]                = "Sandwicho"
    target[ "amethyst" ]                = "Ametisto"
    target[ "sapphire" ]                = "Safiro"
    target[ "diamond" ]                 = "Diamanto"
    target[ "emerald" ]                 = "Smeraldo"
    target[ "ruby" ]                    = "Rubino"
    target[ "copper" ]                  = "Kupro"              -- It is a copper coin
    target[ "silver" ]                  = "Arjento"
    target[ "gold" ]                    = "Oro"
    target[ "ladder" ]                  = "Skalo"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "Ka vu volas komprar utensilo?"
    target[ "You don't have enough money" ]   = "Vu ne havas suficanta pekunio."
    
    -- Button options
    target[ "Don't buy anything" ]      = "Ne komprar irgo." -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Preco:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Pociono"              -- Restores health
    target[ "PotionDescription" ]       = "Ridonar omna de vua saneso."
    target[ "Earthquake" ]              = "Ter'tremo"
    target[ "EarthquakeDescription" ]   = "Ruptar omna roki."
    target[ "Dynamite" ]                = "Dinamito"
    target[ "DynamiteDescription" ]     = "Decensar unu nivelo."
    target[ "Rope" ]                    = "Cuerda"
    target[ "RopeDescription" ]         = "Acensar unu nivelo."
    target[ "Blizzard" ]                = "Niv'sturmo"
    target[ "BlizzardDescription" ]     = "Frostigar omna enemiki."
    
    -- Narration
    target[ "miner-begin" ]             = "Minez trezoro e durigez vivar!"
    target[ "miner-move-north" ]        = "Vu marchas ad'norde."
    target[ "miner-move-south" ]        = "Vu marchas ad'sude."
    target[ "miner-move-east" ]         = "Vu marchas ad'este."
    target[ "miner-move-west" ]         = "Vu marchas ad'weste."
    target[ "miner-mine" ]              = "Vu frapas per vua piocho."
    target[ "miner-eat-sandwich" ]      = "Vu manjas la kaverna sandwicho."
    target[ "use-earthquake" ]          = "La tero tremas forte."
    target[ "use-blizzard" ]            = "Omno frostas."
    target[ "enemies-thaw" ]            = "Omno des'frostas."
    target[ "use-potion" ]              = "Vu sentas vu ye forta itere."
    target[ "miner-collect-copper" ]    = "Vu kolektas kupro."
    target[ "miner-collect-silver" ]    = "Vu kolektas arjento."
    target[ "miner-collect-gold" ]      = "Vu kolektas oro."
    target[ "miner-collect-amethyst" ]  = "Vu kolektas ametisto."
    target[ "miner-collect-sapphire" ]  = "Vu kolektas safiro."
    target[ "miner-collect-diamond" ]   = "Vu kolektas diamanto."
    target[ "miner-collect-emerald" ]   = "Vu kolektas smeraldo."
    target[ "miner-collect-ruby" ]      = "Vu kolektas rubino."
    target[ "miner-attack-snail" ]      = "Vu atakas la heliko."
    target[ "miner-attack-mole" ]       = "Vu atakas la talpo."
    target[ "miner-attack-mushroom" ]   = "Vu atakas la fungo."
    target[ "miner-attack-bat" ]        = "Vu atakas la vespertilio."
    target[ "miner-attack-rabbit" ]     = "Vu atakas la kuniklo."
    target[ "miner-attack-snake" ]      = "Vu atakas la serpento."
    target[ "miner-attack-moose" ]      = "Vu atakas la alko."
    target[ "miner-attack-skeleton" ]   = "Vu atakas la skeleto."
    target[ "miner-go-down-ladder" ]    = "Vu decensas per la skalo."
    target[ "miner-rope" ]              = "Vu eskapis ad'infre per la kordo."
    target[ "miner-dynamite" ]          = "Vu eskapis ad'supre per la dinamito."
    target[ "miner-died" ]              = "Vu esis ocidita."
    
	return helper, target
end
