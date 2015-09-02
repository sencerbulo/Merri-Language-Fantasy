function SetupEsperanto()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Tradukistoj"         -- Header text: "Translators" for Translator credits section
    helper[ "language-name" ]           = "Esperanto"           -- Name of this language (match this language file)
    helper[ "Translation Credits" ]     = "Rachel J. Morris"    -- Translators, append your name to the list.
    
    helper[ "website" ]                 = "Retejo:"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "Fantazio de Esperanto"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "Dankon pro provi je Merri!"
    target[ "This is still a work in progress" ]                = "Tio ĉi ankoraŭ ne estas kompleta."
    target[ "There may be errors or bugs" ]                     = "Eble ekzistas eraroj aŭ cimoj."
    target[ "Report problems at EMAIL" ]                        = "Raportu problemojn al Rachel@Moosader.com ."
    target[ "Want to keep up with this game's progress?" ]      = "Ĉu vi volas sekvi novaĵojn pri la ludo?"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "Ludi"                -- Button to begin the game
    target[ "previous" ]                = "Antaŭa"              -- Go backward one page (one menu)
    target[ "next" ]                    = "Sekvanta"            -- Go forward one page (one menu)
    target[ "options" ]                 = "Opciones"            -- Configure options in a game
    target[ "help" ]                    = "Helpo"               -- Get help / instructions for a game or function
    target[ "menu" ]                    = "Menuo"               -- Open up sub-menu screen
    target[ "close-menu" ]              = "Reveni"              -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = "Progreso"            -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Ekzerci"
    helper[ "Easy" ]      = "Baznivela"
    helper[ "Medium" ]    = "Meznivela"
    helper[ "Hard" ]      = "Altnivela"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "Vi akiris stelon!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Ministo"             -- Male miner (temporary)
    target[ "Floor" ]                   = "Nivelo:"             -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Mono:"               -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Sano:"               -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Ludfino"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Heliko"
    target[ "mole" ]                    = "Talpo"
    target[ "mushroom" ]                = "Fungo"
    target[ "bat" ]                     = "Vesperto"
    target[ "rabbit" ]                  = "Kuniklo"
    target[ "snake" ]                   = "Serpento"
    target[ "skeleton" ]                = "Skeleto"
    target[ "moose" ]                   = "Alko"
    
    -- Items
    target[ "rock" ]                    = "Ŝtono"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Stelo"
    target[ "sandwich" ]                = "Sandviĉo"
    target[ "amethyst" ]                = "Ametisto"
    target[ "sapphire" ]                = "Safiro"
    target[ "diamond" ]                 = "Diamanto"
    target[ "emerald" ]                 = "Smeraldo"
    target[ "ruby" ]                    = "Rubeno"
    target[ "copper" ]                  = "Kupro"              -- It is a copper coin
    target[ "silver" ]                  = "Arĝento"
    target[ "gold" ]                    = "Oro"
    target[ "ladder" ]                  = "Ŝtupetaro"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "Ĉu vi volas aĉeti ilon?"
    target[ "You don't have enough money" ]   = "Vi ne havas sufiĉe da mono."
    
    -- Button options
    target[ "Don't buy anything" ]      = "Ne aĉeti ion." -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Prezo:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Pocio"              -- Restores health
    target[ "PotionDescription" ]       = "Redoni ĉiom da via sano."
    target[ "Earthquake" ]              = "Tertremo"
    target[ "EarthquakeDescription" ]   = "Rompi ĉiujn ŝtonojn."
    target[ "Dynamite" ]                = "Dinamito"
    target[ "DynamiteDescription" ]     = "Subiri unu nivelon."
    target[ "Rope" ]                    = "Ŝnuro"
    target[ "RopeDescription" ]         = "Acensar unu nivelo."
    target[ "Blizzard" ]                = "Neĝventego"
    target[ "BlizzardDescription" ]     = "Frostigi ĉiujn malamikojn."
    
    -- Narration
    target[ "miner-begin" ]             = "Minu trezoron kaj daŭru vivi!"
    target[ "miner-move-north" ]        = "Vi marŝas norden."
    target[ "miner-move-south" ]        = "Vi marŝas suden."
    target[ "miner-move-east" ]         = "Vi marŝas orienten."
    target[ "miner-move-west" ]         = "Vi marŝas okcidenten."
    target[ "miner-mine" ]              = "Vi svingas vian pioĉon."
    target[ "miner-eat-sandwich" ]      = "Vi manĝas la kavernan sandviĉon."
    target[ "use-earthquake" ]          = "La tero tremas forte."
    target[ "use-blizzard" ]            = "Ĉio frostas."
    target[ "enemies-thaw" ]            = "Ĉio degelas."
    target[ "use-potion" ]              = "Vi sentas vin forta denove."
    target[ "miner-collect-copper" ]    = "Vi kolektas kupron."
    target[ "miner-collect-silver" ]    = "Vi kolektas arĝenton."
    target[ "miner-collect-gold" ]      = "Vi kolektas oron."
    target[ "miner-collect-amethyst" ]  = "Vi kolektas ametiston."
    target[ "miner-collect-sapphire" ]  = "Vi kolektas safiron."
    target[ "miner-collect-diamond" ]   = "Vi kolektas diamanton."
    target[ "miner-collect-emerald" ]   = "Vi kolektas smeraldon."
    target[ "miner-collect-ruby" ]      = "Vi kolektas rubenon."
    target[ "miner-attack-snail" ]      = "Vi atakas la helikon."
    target[ "miner-attack-mole" ]       = "Vi atakas la talpon."
    target[ "miner-attack-mushroom" ]   = "Vi atakas la fungon."
    target[ "miner-attack-bat" ]        = "Vi atakas la vesperton."
    target[ "miner-attack-rabbit" ]     = "Vi atakas la kuniklon."
    target[ "miner-attack-snake" ]      = "Vi atakas la serpenton."
    target[ "miner-attack-moose" ]      = "Vi atakas la alkon."
    target[ "miner-attack-skeleton" ]   = "Vi atakas la skeleton."
    target[ "miner-go-down-ladder" ]    = "Vi malsupreniras per la ŝtupetaro."
    target[ "miner-rope" ]              = "Vi eskapis supren per la ŝnuro."
    target[ "miner-dynamite" ]          = "Vi eskapis malsupren per la dinamito."
    target[ "miner-died" ]              = "Vi estis mortigita."
    
end
