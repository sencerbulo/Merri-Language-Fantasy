-- Reference "language_en-US.lua" for dialogue lines
function SetupEnglish()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = ""                    -- Header text: "Translators" for Translator credits section
    helper[ "language-name" ]           = ""                    -- Name of this language (match this language file)
    helper[ "Translation Credits" ]     = ""                    -- Translators, append your name to the list.
    
    helper[ "website" ]                 = ""                    -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = ""                    -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = ""                    -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = ""                    -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = ""
    target[ "This is still a work in progress" ]                = ""
    target[ "There may be errors or bugs" ]                     = ""
    target[ "Report problems at EMAIL" ]                        = ""
    target[ "Want to keep up with this game's progress?" ]      = ""
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = ""                    -- Button to begin the game
    target[ "previous" ]                = ""                    -- Go backward one page (one menu)
    target[ "next" ]                    = ""                    -- Go forward one page (one menu)
    target[ "options" ]                 = ""                    -- Configure options in a game
    target[ "help" ]                    = ""                    -- Get help / instructions for a game or function
    target[ "menu" ]                    = ""                    -- Open up sub-menu screen
    target[ "close-menu" ]              = ""                    -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = ""                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = ""
    helper[ "Easy" ]      = ""
    helper[ "Medium" ]    = ""
    helper[ "Hard" ]      = ""
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = ""
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = ""                    -- Male miner (temporary)
    target[ "Floor" ]                   = ""                    -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = ""                    -- The amount of (generic) money you've earned
    target[ "Health" ]                  = ""                    -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = ""
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = ""
    target[ "mole" ]                    = ""
    target[ "mushroom" ]                = ""
    target[ "bat" ]                     = ""
    target[ "rabbit" ]                  = ""
    target[ "snake" ]                   = ""
    target[ "skeleton" ]                = ""
    target[ "moose" ]                   = ""
    
    -- Items
    target[ "rock" ]                    = ""                    -- Large stone to break open with a pickaxe
    target[ "star" ]                    = ""
    target[ "sandwich" ]                = ""
    target[ "amethyst" ]                = ""
    target[ "sapphire" ]                = ""
    target[ "diamond" ]                 = ""
    target[ "emerald" ]                 = ""
    target[ "ruby" ]                    = ""
    target[ "copper" ]                  = ""                    -- It is a copper coin
    target[ "silver" ]                  = ""
    target[ "gold" ]                    = ""
    target[ "ladder" ]                  = ""                    -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = ""
    target[ "You don't have enough money" ]   = ""
    
    -- Button options
    target[ "Don't buy anything" ]      = ""                    -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = ""                    -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = ""                    -- Restores health
    target[ "PotionDescription" ]       = ""
    target[ "Earthquake" ]              = ""
    target[ "EarthquakeDescription" ]   = ""
    target[ "Dynamite" ]                = ""
    target[ "DynamiteDescription" ]     = ""
    target[ "Rope" ]                    = ""
    target[ "RopeDescription" ]         = ""
    target[ "Blizzard" ]                = ""
    target[ "BlizzardDescription" ]     = ""
    
    -- Narration
    target[ "miner-begin" ]             = ""
    target[ "miner-move-north" ]        = ""
    target[ "miner-move-south" ]        = ""
    target[ "miner-move-east" ]         = ""
    target[ "miner-move-west" ]         = ""
    target[ "miner-mine" ]              = ""
    target[ "miner-eat-sandwich" ]      = ""
    target[ "use-earthquake" ]          = ""
    target[ "use-blizzard" ]            = ""
    target[ "enemies-thaw" ]            = ""
    target[ "use-potion" ]              = ""
    target[ "miner-collect-copper" ]    = ""
    target[ "miner-collect-silver" ]    = ""
    target[ "miner-collect-gold" ]      = ""
    target[ "miner-collect-amethyst" ]  = ""
    target[ "miner-collect-sapphire" ]  = ""
    target[ "miner-collect-diamond" ]   = ""
    target[ "miner-collect-emerald" ]   = ""
    target[ "miner-collect-ruby" ]      = ""
    target[ "miner-attack-snail" ]      = ""
    target[ "miner-attack-mole" ]       = ""
    target[ "miner-attack-mushroom" ]   = ""
    target[ "miner-attack-bat" ]        = ""
    target[ "miner-attack-rabbit" ]     = ""
    target[ "miner-attack-snake" ]      = ""
    target[ "miner-attack-moose" ]      = ""
    target[ "miner-attack-skeleton" ]   = ""
    target[ "miner-go-down-ladder" ]    = ""
    target[ "miner-rope" ]              = ""
    target[ "miner-dynamite" ]          = ""
    target[ "miner-died" ]              = ""
    
end
