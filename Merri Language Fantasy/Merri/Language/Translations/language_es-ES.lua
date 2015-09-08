function SetupSpanish()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Traductores"         -- Header text: "Translators" for Translator credits section
    
    helper[ "website" ]                 = "Página web:"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "Fantasía de Español"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "¡Gracias por probar Merri!"
    target[ "This is still a work in progress" ]                = "Esto es un trabajo en progreso."
    target[ "There may be errors or bugs" ]                     = "Este software puede contener errores o bugs."
    target[ "Report problems at EMAIL" ]                        = "Por favor, reporta cualquier problema a Rachel@Moosader.com ."
    target[ "Want to keep up with this game's progress?" ]      = "¿Quieres mantenerte al día sobre el desarrollo de este videojuego?"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "Jugar"                -- Button to begin the game
    target[ "previous" ]                = "Atrás"            -- Go backward one page (one menu)
    target[ "next" ]                    = "Siguiente"                -- Go forward one page (one menu)
    target[ "options" ]                 = "Options"             -- Configure options in a game
    target[ "help" ]                    = "Ayuda"                -- Get help / instructions for a game or function
    target[ "menu" ]                    = "Menú"                -- Open up sub-menu screen
    target[ "close-menu" ]              = "Volver"                -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = "Progreso"            -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Practicar"
    helper[ "Easy" ]      = "Fácil"
    helper[ "Medium" ]    = "Intermedia"
    helper[ "Hard" ]      = "Difícil"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "¡Has adquirido una estrella!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Minero"               -- Male miner (temporary)
    target[ "Floor" ]                   = "Piso:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Dinero:"              -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Health:"             -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Fin del juego"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Caracol"
    target[ "mole" ]                    = "Topo"
    target[ "mushroom" ]                = "Champiñón"
    target[ "bat" ]                     = "Murcielago"
    target[ "rabbit" ]                  = "Conejo"
    target[ "snake" ]                   = "Serpiente"
    target[ "skeleton" ]                = "Esqueleto"
    target[ "moose" ]                   = "Alce"
    
    -- Items
    target[ "rock" ]                    = "Piedra"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Estrella"
    target[ "sandwich" ]                = "Sandwich"
    target[ "amethyst" ]                = "Ametista"
    target[ "sapphire" ]                = "Zafiro"
    target[ "diamond" ]                 = "Diamante"
    target[ "emerald" ]                 = "Esmeralda"
    target[ "ruby" ]                    = "Rubí"
    target[ "copper" ]                  = "Cobre"              -- It is a copper coin
    target[ "silver" ]                  = "Plata"
    target[ "gold" ]                    = "Oro"
    target[ "ladder" ]                  = "Escalera"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "¿Deseas comprar una herramienta?"
    target[ "You don't have enough money" ]   = "No tienes suficiente dinero."
    
    -- Button options
    target[ "Don't buy anything" ]      = "No comprar nada." -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Precio:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Poción"              -- Restores health
    target[ "PotionDescription" ]       = "Restaura toda tu salud."
    target[ "Earthquake" ]              = "Terremoto"
    target[ "EarthquakeDescription" ]   = "Rompe todas las piedras."
    target[ "Dynamite" ]                = "Dinamita"
    target[ "DynamiteDescription" ]     = "Descender un piso."
    target[ "Rope" ]                    = "Cuerda"
    target[ "RopeDescription" ]         = "Ascender un piso."
    target[ "Blizzard" ]                = "Ventisca"
    target[ "BlizzardDescription" ]     = "Congela a todos los enemigos."
    
    -- Narration
    target[ "miner-begin" ]             = "¡Excava el tesoro y mantente con vida!"
    target[ "miner-move-north" ]        = "Caminas hacia el norte."
    target[ "miner-move-south" ]        = "Caminas hacia el sur"
    target[ "miner-move-east" ]         = "Caminas hacia el este"
    target[ "miner-move-west" ]         = "Caminas hacia el oeste"
    target[ "miner-mine" ]              = "Comienzas a picar."
    target[ "miner-eat-sandwich" ]      = "Comes el sandwich cavernario."
    target[ "use-earthquake" ]          = "La tierra tiembla violentamente."
    target[ "use-blizzard" ]            = "Todo se congela."
    target[ "enemies-thaw" ]            = "Todo se ha derretido."
    target[ "use-potion" ]              = ""
    target[ "miner-collect-copper" ]    = "Obtienes cobre."
    target[ "miner-collect-silver" ]    = "Obtienes plata."
    target[ "miner-collect-gold" ]      = "Obtienes oro."
    target[ "miner-collect-amethyst" ]  = "Obtienes ametista."
    target[ "miner-collect-sapphire" ]  = "Obtienes zafiro."
    target[ "miner-collect-diamond" ]   = "Obtienes diamante."
    target[ "miner-collect-emerald" ]   = "Obtienes esmeralda."
    target[ "miner-collect-ruby" ]      = "Obtienes rubí."
    target[ "miner-attack-snail" ]      = "Atacas al caracol."
    target[ "miner-attack-mole" ]       = "Atacas al topo."
    target[ "miner-attack-mushroom" ]   = "Atacas al champiñón."
    target[ "miner-attack-bat" ]        = "Atacas al murcielago."
    target[ "miner-attack-rabbit" ]     = "Atacas al conejo."
    target[ "miner-attack-snake" ]      = "Atacas a la serpiente."
    target[ "miner-attack-moose" ]      = "Atacas al alce."
    target[ "miner-attack-skeleton" ]   = "Atacas al esqueleto."
    target[ "miner-go-down-ladder" ]    = "Bajas por la escalera."
    target[ "miner-rope" ]              = "Escapas hacia arriba usando la cuerda."
    target[ "miner-dynamite" ]          = "Escapas hacia arriba usando la dinamita."
    target[ "miner-died" ]              = "Te han matado."
    
	return helper, target    
end
