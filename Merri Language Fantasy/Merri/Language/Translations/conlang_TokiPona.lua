-- Reference "language_en-US.lua" for dialogue lines
function SetupEnglish()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = ""                    -- Header text: "Translators" for Translator credits section
    helper[ "language-name" ]           = "toki pona"                    -- Name of this language (match this language file)
    helper[ "Translation Credits" ]     = "AetherStar"                    -- Translators, append your name to the list.
    
    helper[ "website" ]                 = ""                    -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = ""                    -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = ""                    -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "musi pi toki pona"                    -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
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
    target[ "play" ]                    = "musi"                    -- Button to begin the game
    target[ "previous" ]                = ""                    -- Go backward one page (one menu)
    target[ "next" ]                    = ""                    -- Go forward one page (one menu)
    target[ "options" ]                 = "ante e ijo"                    -- Configure options in a game
    target[ "help" ]                    = "kama sona e ijo"                    -- Get help / instructions for a game or function
    target[ "menu" ]                    = "tawa lipu lawa"                    -- Open up sub-menu screen
    target[ "close-menu" ]              = "tawa lipu pini"                    -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = ""                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "moli ala"
    helper[ "Easy" ]      = "pona"
    helper[ "Medium" ]    = "pona lili"
    helper[ "Hard" ]      = "ike"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "sina jo e suno lili!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "tawa lon lupa anpa"                    -- Male miner (temporary)
    target[ "Floor" ]                   = "nanpa anpa:"                    -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "mani:"                    -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "sijelo:"                    -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "musi li pini"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "pipi"
    target[ "mole" ]                    = "soweli lupa"
    target[ "mushroom" ]                = "kili"
    target[ "bat" ]                     = "soweli waso"
    target[ "rabbit" ]                  = "soweli suwi"
    target[ "snake" ]                   = "akesi linja"
    target[ "skeleton" ]                = "jan moli tawa"
    target[ "moose" ]                   = "soweli suli"
    
    -- Items
    target[ "rock" ]                    = "kiwen"                    -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "suno lili"
    target[ "sandwich" ]                = "moku"
    target[ "amethyst" ]                = "kiwen laso loje"
    target[ "sapphire" ]                = "kiwen laso"
    target[ "diamond" ]                 = "kiwen walo"
    target[ "emerald" ]                 = "kiwen laso jelo"
    target[ "ruby" ]                    = "kiwen loje"
    target[ "copper" ]                  = "kiwen loje jelo"                    -- It is a copper coin
    target[ "silver" ]                  = "kiwen mun"
    target[ "gold" ]                    = "kiwen suno"
    target[ "ladder" ]                  = "ilo tawa"                    -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "sina wile ala wile esun tawa ilo?"
    target[ "You don't have enough money" ]   = ""
    
    -- Button options
    target[ "Don't buy anything" ]      = ""                    -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "mani esun:"                    -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "telo wawa"                    -- Restores health
    target[ "PotionDescription" ]       = "ijo ni li pona e sijelo sina."
    target[ "Earthquake" ]              = "tawa wawa e ma"
    target[ "EarthquakeDescription" ]   = "ijo ni loi pakala e kiwen ale."
    target[ "Dynamite" ]                = "ilo wawa seli"
    target[ "DynamiteDescription" ]     = "ijo ni li kama e ni: nanpa anpa li anpa wan."
    target[ "Rope" ]                    = "linja"
    target[ "RopeDescription" ]         = "ijo ni li kama e ni: nanpa anpa li sewi wan."
    target[ "Blizzard" ]                = "lete wawa"
    target[ "BlizzardDescription" ]     = "ijo ni li pini e tawa pi soweli ike ale."
    
    -- Narration
    target[ "miner-begin" ]             = "o kama jo e kiwen o awen lon!"
    target[ "miner-move-north" ]        = "sina tawa sinpin."
    target[ "miner-move-south" ]        = "sina tawa monsi."
    target[ "miner-move-east" ]         = "sina tawa poka."
    target[ "miner-move-west" ]         = "sina tawa poka."
    target[ "miner-mine" ]              = "sina tawa e ilo sina."
    target[ "miner-eat-sandwich" ]      = "sina moku e moku tan lupa."
    target[ "use-earthquake" ]          = ""
    target[ "use-blizzard" ]            = ""
    target[ "enemies-thaw" ]            = ""
    target[ "use-potion" ]              = ""
    target[ "miner-collect-copper" ]    = "sina kama jo e kiwen loje jelo."
    target[ "miner-collect-silver" ]    = "sina kama jo e kiwen mun."
    target[ "miner-collect-gold" ]      = "sina kama jo e kiwen suno."
    target[ "miner-collect-amethyst" ]  = "sina kama jo e kiwen laso loje."
    target[ "miner-collect-sapphire" ]  = "sina kama jo e kiwen laso."
    target[ "miner-collect-diamond" ]   = "sina kama jo e kiwen walo."
    target[ "miner-collect-emerald" ]   = "sina kama jo e kiwen laso jelo."
    target[ "miner-collect-ruby" ]      = "sina kama jo e kiwen loje."
    target[ "miner-attack-snail" ]      = "sina pakala e pipi."
    target[ "miner-attack-mole" ]       = "sina pakala e soweli lupa."
    target[ "miner-attack-mushroom" ]   = "sina pakala e kili."
    target[ "miner-attack-bat" ]        = "sina pakala e soweli waso."
    target[ "miner-attack-rabbit" ]     = "sina pakala e soweli suwi."
    target[ "miner-attack-snake" ]      = "sina pakala e akesi linja."
    target[ "miner-attack-moose" ]      = "sina pakala e soweli suli."
    target[ "miner-attack-skeleton" ]   = "sina pakala e jan moli tawa."
    target[ "miner-go-down-ladder" ]    = "sina tawa anpa kepeken ilo tawa."
    target[ "miner-rope" ]              = ""
    target[ "miner-dynamite" ]          = ""
    target[ "miner-died" ]              = ""
    
	return helper, target    
end
