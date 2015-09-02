function SetupFrench()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "Traducteurs"         -- Header text: "Translators" for Translator credits section
    helper[ "language-name" ]           = "Français"            -- Name of this language (match this language file)
    helper[ "Translation Credits" ]     = "Vanege"              -- Translators, append your name to the list.
    
    helper[ "website" ]                 = "Site web :"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "Facebook:"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "Twitter:"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "Fantaisie du Français"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "Merci d'avoir essayé Merri !"
    target[ "This is still a work in progress" ]                = "Le jeu est encore en développement."
    target[ "There may be errors or bugs" ]                     = "Il peut y avoir des erreurs ou des bug."
    target[ "Report problems at EMAIL" ]                        = "Signalez les problèmes à Rachel@Moosader.com ."
    target[ "Want to keep up with this game's progress?" ]      = "Souhaitez-vous suivre le développement du jeu ?"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "Jouer"               -- Button to begin the game
    target[ "previous" ]                = "Précédent"           -- Go backward one page (one menu)
    target[ "next" ]                    = "Suivant"             -- Go forward one page (one menu)
    target[ "options" ]                 = "Options"             -- Configure options in a game
    target[ "help" ]                    = "Aide"                -- Get help / instructions for a game or function
    target[ "menu" ]                    = "Menu"                -- Open up sub-menu screen
    target[ "close-menu" ]              = "Retour"              -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = ""                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "Entraînement"
    helper[ "Easy" ]      = "Facile"
    helper[ "Medium" ]    = "Intermédiaire"
    helper[ "Hard" ]      = "Difficile"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "Tu as gagné une étoile!"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "Mineur"               -- Male miner (temporary)
    target[ "Floor" ]                   = "Étage:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "Sous:"              -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "Santé:"             -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "Fin de la partie"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "Escargot"
    target[ "mole" ]                    = "Taupe"
    target[ "mushroom" ]                = "Champignon"
    target[ "bat" ]                     = "Chauve-souris"
    target[ "rabbit" ]                  = "Lapin"
    target[ "snake" ]                   = "Serpent"
    target[ "skeleton" ]                = "Squelette"
    target[ "moose" ]                   = "Élan"
    
    -- Items
    target[ "rock" ]                    = "Rocher"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "Étoile"
    target[ "sandwich" ]                = "Sandwich"
    target[ "amethyst" ]                = "Améthyste"
    target[ "sapphire" ]                = "Saphir"
    target[ "diamond" ]                 = "Diamant"
    target[ "emerald" ]                 = "Émeraude"
    target[ "ruby" ]                    = "Rubis"
    target[ "copper" ]                  = "Cuivre"              -- It is a copper coin
    target[ "silver" ]                  = "Argent"
    target[ "gold" ]                    = "Or"
    target[ "ladder" ]                  = "Échelle"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "Est-ce que tu veux acheter un outil?"
    target[ "You don't have enough money" ]   = ""
    
    -- Button options
    target[ "Don't buy anything" ]      = "Tu n'as pas assez de sous." -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "Prix:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "Potion"              -- Restores health
    target[ "PotionDescription" ]       = "Restaure toute ta santé."
    target[ "Earthquake" ]              = "Séisme"
    target[ "EarthquakeDescription" ]   = "Brise tous les rochers."
    target[ "Dynamite" ]                = "Dynamite"
    target[ "DynamiteDescription" ]     = "Fait descendre d'un étage."
    target[ "Rope" ]                    = "Corde"
    target[ "RopeDescription" ]         = "Fait remonter d'un étage."
    target[ "Blizzard" ]                = "Blizzard"
    target[ "BlizzardDescription" ]     = "Gèle tous les ennemis."
    
    -- Narration
    target[ "miner-begin" ]             = "Mine à la recherche de trésors et reste en vie!"
    target[ "miner-move-north" ]        = "Tu marches vers le nord."
    target[ "miner-move-south" ]        = "Tu marches vers le sud."
    target[ "miner-move-east" ]         = "Tu marches vers l'est."
    target[ "miner-move-west" ]         = "Tu marches vers l'ouest."
    target[ "miner-mine" ]              = "Tu donnes un coup de pioche."
    target[ "miner-eat-sandwich" ]      = "Tu manges le sandwich des cavernes."
    target[ "use-earthquake" ]          = "La terre tremble violemment."
    target[ "use-blizzard" ]            = "Tout a gelé."
    target[ "enemies-thaw" ]            = "Tout a dégelé."
    target[ "use-potion" ]              = "Tu sens tes forces revenir."
    target[ "miner-collect-copper" ]    = "Tu as ramassé du cuivre."
    target[ "miner-collect-silver" ]    = "Tu as ramassé de l'argent."
    target[ "miner-collect-gold" ]      = "Tu as ramassé de l'or."
    target[ "miner-collect-amethyst" ]  = "Tu as ramassé une améthyste."
    target[ "miner-collect-sapphire" ]  = "Tu as ramassé un saphir."
    target[ "miner-collect-diamond" ]   = "Tu as ramassé un diamant."
    target[ "miner-collect-emerald" ]   = "Tu as ramassé une émeraude."
    target[ "miner-collect-ruby" ]      = "Tu as ramassé un rubis."
    target[ "miner-attack-snail" ]      = "Tu attaques l'escargot."
    target[ "miner-attack-mole" ]       = "Tu attaques la taupe."
    target[ "miner-attack-mushroom" ]   = "Tu attaques le champignon."
    target[ "miner-attack-bat" ]        = "Tu attaques la chauve-souris."
    target[ "miner-attack-rabbit" ]     = "Tu attaques le lapin."
    target[ "miner-attack-snake" ]      = "Tu attaques le serpent."
    target[ "miner-attack-moose" ]      = "Tu attaques l'élan."
    target[ "miner-attack-skeleton" ]   = "Tu attaques le squelette."
    target[ "miner-go-down-ladder" ]    = "Tu descends l'échelle."
    target[ "miner-rope" ]              = "Tu t'enfuis en haut par la corde."
    target[ "miner-dynamite" ]          = "Tu t'enfuis par le bas grâce à la dynamite."
    target[ "miner-died" ]              = "Tu as été tué."
    
end
