GameText  = Core.class()

function GameText:init( options )
end

function GameText:Setup( options )
	GameText.HelperText = {}
	GameText.TargetText = {}
	GameText:SetupLanguages()
end

function GameText:Get( cat, id )
	local language = ""
	local category = ""
	if ( cat == "helper" ) then
		language = GLOBAL_CONFIG.HELPER_LANGUAGE
		category = "HelperText"
		
	else
		language = GLOBAL_CONFIG.TARGET_LANGUAGE
		category = "TargetText"
		
	end

	if ( GameText[ category ] == nil ) then							
		return "Invalid category " .. category
		
	elseif ( GameText[ category ][ language ] == nil ) then
		return "Invalid language " .. language 
		
	elseif ( GameText[ category ][ language ][ id ] == nil ) then
		return "Invalid id " .. id 
		
	else 
		return GameText[ category ][ language ][ id ]
		
	end
end

function GameText:SetupLanguages()
	GameText.HelperText.English = {}
	GameText.HelperText.Esperanto = {}
	GameText.HelperText.Ido = {}
	GameText.HelperText.Spanish = {}
	
	GameText.TargetText.English = {}
	GameText.TargetText.Esperanto = {}
	GameText.TargetText.Ido = {}
	GameText.TargetText.Spanish = {}

	-- Credits --
	GameText.TargetText.English		[ "Translation Credits" ]	= "Rachel J. Morris"
	GameText.TargetText.Esperanto	[ "Translation Credits" ] 	= "Rachel J. Morris"
	GameText.TargetText.Ido			[ "Translation Credits" ] 	= "???"
	GameText.TargetText.Spanish		[ "Translation Credits" ] 	= "Tea Coba"
	
	
	-- Common --
	
	GameText.TargetText.English		[ "game title" ]	= "English Fantasy"
	GameText.TargetText.Esperanto	[ "game title" ] 	= "Fantazio de Esperanto"
	GameText.TargetText.Ido			[ "game title" ] 	= "Fantazio di Ido"
	GameText.TargetText.Spanish		[ "game title" ] 	= "Fantasía de Español"
	
	-- Menu Buttons --
	
	GameText.HelperText.English		[ "Play" ] 	= "Play"
	GameText.HelperText.Esperanto	[ "Play" ] 	= "Ludi"
	GameText.HelperText.Ido			[ "Play" ] 	= "Ludar"
	GameText.HelperText.Spanish		[ "Play" ] 	= "Jugar"
	
	GameText.HelperText.English		[ "Options" ] 	= "Options"
	GameText.HelperText.Esperanto	[ "Options" ] 	= "Agordoj"
	GameText.HelperText.Ido			[ "Options" ] 	= "Agordi"
	GameText.HelperText.Spanish		[ "Options" ] 	= "Opciones"
	
	GameText.HelperText.English		[ "Help" ] 	= "Help"
	GameText.HelperText.Esperanto	[ "Help" ] 	= "Helpo"
	GameText.HelperText.Ido			[ "Help" ] 	= "Helpo"
	GameText.HelperText.Spanish		[ "Help" ] 	= "Ayuda"
	
	GameText.HelperText.English		[ "Back" ] 	= "Back"
	GameText.HelperText.Esperanto	[ "Back" ] 	= "Reveni"
	GameText.HelperText.Ido			[ "Back" ] 	= "Revenar"
	GameText.HelperText.Spanish		[ "Back" ] 	= "Regres"
	
	GameText.HelperText.English		[ "Menu" ] 	= "Menu"
	GameText.HelperText.Esperanto	[ "Menu" ] 	= "Menuo"
	GameText.HelperText.Ido			[ "Menu" ] 	= "Revenar"
	GameText.HelperText.Spanish		[ "Menu" ] 	= "Regres"
	
	-- Got a star
	
	GameText.TargetText.English		[ "Earned a star" ] 	= "You aquired a star!"
	GameText.TargetText.Esperanto	[ "Earned a star" ] 	= "Vi akiris stelon!"
	GameText.TargetText.Ido			[ "Earned a star" ] 	= "Vu aquiris stelo!"
	GameText.TargetText.Spanish		[ "Earned a star" ] 	= "Usted adquirió una estrella!"
	
	GameText.HelperText.English		[ "Earned a star" ] 	= "You aquired a star!"
	GameText.HelperText.Esperanto	[ "Earned a star" ] 	= "Vi akiris stelon!"
	GameText.HelperText.Ido			[ "Earned a star" ] 	= "Vu aquiris stelo!"
	GameText.HelperText.Spanish		[ "Earned a star" ] 	= "Usted adquirió una estrella!"
	
	
	-- LanguageSelectState --
	
	GameText.HelperText.English		[ "I am learning English" ] 	= "I am learning English"
	GameText.HelperText.Esperanto	[ "I am learning English" ]		= "Mi lernas anglan lingvon"
	GameText.HelperText.Ido			[ "I am learning English" ] 	= "Me lernas angla linguo"
	GameText.HelperText.Spanish		[ "I am learning English" ] 	= "Estoy aprendiendo inglés"
	
	GameText.HelperText.English		[ "I am learning Esperanto" ]	= "I am learning Esperanto"
	GameText.HelperText.Esperanto	[ "I am learning Esperanto" ]	= "Mi lernas esperanton"
	GameText.HelperText.Ido			[ "I am learning Esperanto" ]	= "Me lernas esperanto"
	GameText.HelperText.Spanish		[ "I am learning Esperanto" ]	= "Estoy aprendiendo esperanto"
	
	GameText.HelperText.English		[ "I am learning Ido" ]			= "I am learning Ido"
	GameText.HelperText.Esperanto	[ "I am learning Ido" ]			= "Mi lernas idon"
	GameText.HelperText.Ido			[ "I am learning Ido" ]			= "Me lernas ido"
	GameText.HelperText.Spanish		[ "I am learning Ido" ]			= "Estoy aprendiendo ido"
	
	GameText.HelperText.English		[ "I am learning Spanish" ]		= "I am learning Spanish"
	GameText.HelperText.Esperanto	[ "I am learning Spanish" ]		= "Mi lernas hispanan lingvon"
	GameText.HelperText.Ido			[ "I am learning Spanish" ]		= "Me lernas hispana linguo"
	GameText.HelperText.Spanish		[ "I am learning Spanish" ]		= "Estoy aprendiendo español"
	
	-- DifficultSelectState --
	
	GameText.HelperText.English		[ "Practice" ] 	= "Practice"
	GameText.HelperText.Esperanto	[ "Practice" ] 	= "Ekzerci"
	GameText.HelperText.Ido			[ "Practice" ] 	= "Exercar"
	GameText.HelperText.Spanish		[ "Practice" ] 	= "Práctica"	
	
	GameText.HelperText.English		[ "Easy" ] 		= "Easy"
	GameText.HelperText.Esperanto	[ "Easy" ] 		= "Baznivela"
	GameText.HelperText.Ido			[ "Easy" ] 		= "Baznivela"
	GameText.HelperText.Spanish		[ "Easy" ] 		= "Fácil"	
	
	GameText.HelperText.English		[ "Medium" ] 	= "Medium"
	GameText.HelperText.Esperanto	[ "Medium" ] 	= "Meznivela"
	GameText.HelperText.Ido			[ "Medium" ] 	= "Meznivela"
	GameText.HelperText.Spanish		[ "Medium" ] 	= "Intermedio"	
	
	GameText.HelperText.English		[ "Hard" ] 		= "Hard"
	GameText.HelperText.Esperanto	[ "Hard" ] 		= "Altnivela"
	GameText.HelperText.Ido			[ "Hard" ] 		= "Altnivela"
	GameText.HelperText.Spanish		[ "Hard" ] 		= "Difícil"
	
	GameText.HelperText.English		[ "Stats" ] 	= "Stats"
	GameText.HelperText.Esperanto	[ "Stats" ] 	= "Statistikoj"
	GameText.HelperText.Ido			[ "Stats" ] 	= "Statistiki"
	GameText.HelperText.Spanish		[ "Stats" ] 	= "Estadística"
	
	-- GameMinerState --
	
	GameText.TargetText.English		[ "Miner" ] 	= "Miner"
	GameText.TargetText.Esperanto	[ "Miner" ] 	= "Ministo"
	GameText.TargetText.Ido			[ "Miner" ] 	= "Ministo"
	GameText.TargetText.Spanish		[ "Miner" ] 	= "Minero"
	
	GameText.TargetText.English		[ "Floor" ] 	= "Floor:"
	GameText.TargetText.Esperanto	[ "Floor" ] 	= "Nivelo:"
	GameText.TargetText.Ido			[ "Floor" ] 	= "Ministo"
	GameText.TargetText.Spanish		[ "Floor" ] 	= "Minero"
	
	GameText.TargetText.English		[ "Money" ] 	= "Money:"
	GameText.TargetText.Esperanto	[ "Money" ] 	= "Mono:"
	GameText.TargetText.Ido			[ "Money" ] 	= "Ministo"
	GameText.TargetText.Spanish		[ "Money" ] 	= "Minero"
	
	GameText.TargetText.English		[ "Health" ] 	= "Health:"
	GameText.TargetText.Esperanto	[ "Health" ] 	= "Sano:"
	GameText.TargetText.Ido			[ "Health" ] 	= "Ministo"
	GameText.TargetText.Spanish		[ "Health" ] 	= "Minero"
	
	GameText.TargetText.English		[ "snail" ] 	= "Snail"
	GameText.TargetText.Esperanto	[ "snail" ] 	= "Heliko"
	GameText.TargetText.Ido			[ "snail" ] 	= "Ministo"
	GameText.TargetText.Spanish		[ "snail" ] 	= "Minero"
	
	GameText.TargetText.English		[ "mole" ] 		= "Mole"
	GameText.TargetText.Esperanto	[ "mole" ] 		= "Talpo"
	GameText.TargetText.Ido			[ "mole" ] 		= "Ministo"
	GameText.TargetText.Spanish		[ "mole" ] 		= "Minero"
	
	GameText.TargetText.English		[ "mushroom" ] 	= "Mushroom"
	GameText.TargetText.Esperanto	[ "mushroom" ] 	= "Fungo"
	GameText.TargetText.Ido			[ "mushroom" ] 	= "Piocho"
	GameText.TargetText.Spanish		[ "mushroom" ] 	= "Minero"
	
	GameText.TargetText.English		[ "bat" ] 		= "Bat"
	GameText.TargetText.Esperanto	[ "bat" ] 		= "Vesperto"
	GameText.TargetText.Ido			[ "bat" ] 		= "Sabro"
	GameText.TargetText.Spanish		[ "bat" ] 		= "Minero"
	
	GameText.TargetText.English		[ "rabbit" ] 	= "Rabbit"
	GameText.TargetText.Esperanto	[ "rabbit" ] 	= "Kuniklo"
	GameText.TargetText.Ido			[ "rabbit" ] 	= "Sube"
	GameText.TargetText.Spanish		[ "rabbit" ] 	= "Minero"
	
	GameText.TargetText.English		[ "snake" ] 	= "Snake"
	GameText.TargetText.Esperanto	[ "snake" ] 	= "Serpento"
	GameText.TargetText.Ido			[ "snake" ] 	= "Sube"
	GameText.TargetText.Spanish		[ "snake" ] 	= "Minero"
	
	GameText.TargetText.English		[ "skeleton" ] 	= "Skeleton"
	GameText.TargetText.Esperanto	[ "skeleton" ] 	= "Skeleto"
	GameText.TargetText.Ido			[ "skeleton" ] 	= "Sube"
	GameText.TargetText.Spanish		[ "skeleton" ] 	= "Minero"
	
	GameText.TargetText.English		[ "moose" ] 	= "Moose"
	GameText.TargetText.Esperanto	[ "moose" ] 	= "Alko"
	GameText.TargetText.Ido			[ "moose" ] 	= "Sube"
	GameText.TargetText.Spanish		[ "moose" ] 	= "Minero"
	
	GameText.TargetText.English		[ "rock" ] 		= "Rock"
	GameText.TargetText.Esperanto	[ "rock" ] 		= "Ŝtono"
	GameText.TargetText.Ido			[ "rock" ] 		= "Roko"
	GameText.TargetText.Spanish		[ "rock" ] 		= "Piedra"
	
	GameText.TargetText.English		[ "star" ] 		= "Star"
	GameText.TargetText.Esperanto	[ "star" ] 		= "Stelo"
	GameText.TargetText.Ido			[ "star" ] 		= "Roko"
	GameText.TargetText.Spanish		[ "star" ] 		= "Piedra"
	
	GameText.TargetText.English		[ "sandwich" ] 	= "Sandwich"
	GameText.TargetText.Esperanto	[ "sandwich" ] 	= "Sandviĉo"
	GameText.TargetText.Ido			[ "sandwich" ] 	= "Sandwich"
	GameText.TargetText.Spanish		[ "sandwich" ] 	= "Piedra"
	
	GameText.TargetText.English		[ "amethyst" ] 	= "Amethyst"
	GameText.TargetText.Esperanto	[ "amethyst" ] 	= "Ametisto"
	GameText.TargetText.Ido			[ "amethyst" ] 	= "Ametisto"
	GameText.TargetText.Spanish		[ "amethyst" ] 	= "Ametisto"
	
	GameText.TargetText.English		[ "sapphire" ] 	= "Sapphire"
	GameText.TargetText.Esperanto	[ "sapphire" ] 	= "Safiro"
	GameText.TargetText.Ido			[ "sapphire" ] 	= "Akvamarino"
	GameText.TargetText.Spanish		[ "sapphire" ] 	= "Akvamarino"
	
	GameText.TargetText.English		[ "diamond" ] 	= "Diamond"
	GameText.TargetText.Esperanto	[ "diamond" ] 	= "Diamanto"
	GameText.TargetText.Ido			[ "diamond" ] 	= "Rubeno"
	GameText.TargetText.Spanish		[ "diamond" ] 	= "Rubeno"
	
	GameText.TargetText.English		[ "emerald" ] 	= "Emerald"
	GameText.TargetText.Esperanto	[ "emerald" ] 	= "Smeraldo"
	GameText.TargetText.Ido			[ "emerald" ] 	= "Jado"
	GameText.TargetText.Spanish		[ "emerald" ] 	= "Jado"
	
	GameText.TargetText.English		[ "ruby" ] 		= "Ruby"
	GameText.TargetText.Esperanto	[ "ruby" ] 		= "Rubeno"
	GameText.TargetText.Ido			[ "ruby" ] 		= "Jado"
	GameText.TargetText.Spanish		[ "ruby" ] 		= "Jado"
	
	GameText.TargetText.English		[ "copper" ] 	= "Copper"
	GameText.TargetText.Esperanto	[ "copper" ] 	= "Kupro"
	GameText.TargetText.Ido			[ "copper" ] 	= "Kupra"
	GameText.TargetText.Spanish		[ "copper " ] 	= "Kupra"
	
	GameText.TargetText.English		[ "silver" ] 	= "Silver"
	GameText.TargetText.Esperanto	[ "silver" ] 	= "Arĝento"
	GameText.TargetText.Ido			[ "silver" ] 	= "Arĝenta"
	GameText.TargetText.Spanish		[ "silver " ] 	= "Arĝenta"
	
	GameText.TargetText.English		[ "gold" ] 		= "Gold"
	GameText.TargetText.Esperanto	[ "gold" ] 		= "Oro"
	GameText.TargetText.Ido			[ "gold" ] 		= "Ora"
	GameText.TargetText.Spanish		[ "gold " ] 	= "Ora"
	
	GameText.TargetText.English		[ "ladder" ] 	= "Ladder"
	GameText.TargetText.Esperanto	[ "ladder" ] 	= "Ŝtupetaro"
	GameText.TargetText.Ido			[ "ladder" ] 	= "Ora"
	GameText.TargetText.Spanish		[ "ladder " ] 	= "Ora"
	
	GameText.TargetText.English		[ "Game Over" ] 	= "Game Over"
	GameText.TargetText.Esperanto	[ "Game Over" ] 	= "Ludfino"
	GameText.TargetText.Ido			[ "Game Over" ] 	= "Ora"
	GameText.TargetText.Spanish		[ "Game Over " ] 	= "Ora"
	
	GameText.HelperText.English		[ "Game Over" ] 	= "Game Over"
	GameText.HelperText.Esperanto	[ "Game Over" ] 	= "Ludfino"
	GameText.HelperText.Ido			[ "Game Over" ] 	= "Ora"
	GameText.HelperText.Spanish		[ "Game Over " ] 	= "Ora"
	
	GameText.TargetText.English		[ "miner-begin" ] 	= "Mine for treasure and stay alive!"
	GameText.TargetText.Esperanto	[ "miner-begin" ] 	= "Minu trezoron kaj daŭru vivi!"
	GameText.TargetText.Ido			[ "miner-begin" ] 	= "Ora"
	GameText.TargetText.Spanish		[ "miner-begin " ] 	= "Ora"
	
	GameText.TargetText.English		[ "miner-move-north" ] 	= "You walk north."
	GameText.TargetText.Esperanto	[ "miner-move-north" ] 	= "Vi marŝas norden."
	GameText.TargetText.Ido			[ "miner-move-north" ] 	= "Ora"
	GameText.TargetText.Spanish		[ "miner-move-north" ] 	= "Ora"
	
	GameText.TargetText.English		[ "miner-move-south" ] 	= "You walk south."
	GameText.TargetText.Esperanto	[ "miner-move-south" ] 	= "Vi marŝas suden."
	GameText.TargetText.Ido			[ "miner-move-south" ] 	= "Ora"
	GameText.TargetText.Spanish		[ "miner-move-south" ] 	= "Ora"
	
	GameText.TargetText.English		[ "miner-move-east" ] 	= "You walk east."
	GameText.TargetText.Esperanto	[ "miner-move-east" ] 	= "Vi marŝas orienten."
	GameText.TargetText.Ido			[ "miner-move-east" ] 	= "Ora"
	GameText.TargetText.Spanish		[ "miner-move-east" ] 	= "Ora"
	
	GameText.TargetText.English		[ "miner-move-west" ] 	= "You walk west."
	GameText.TargetText.Esperanto	[ "miner-move-west" ] 	= "Vi marŝas okcidenten."
	GameText.TargetText.Ido			[ "miner-move-west" ] 	= "Ora"
	GameText.TargetText.Spanish		[ "miner-move-west" ] 	= "Ora"
	
	GameText.TargetText.English		[ "miner-mine" ] 		= "You swing your pick."
	GameText.TargetText.Esperanto	[ "miner-mine" ] 		= "Vi svingas vian pioĉon."
	GameText.TargetText.Ido			[ "miner-mine" ] 		= "asdf"
	GameText.TargetText.Spanish		[ "miner-mine" ] 		= "asdf"
	
	GameText.TargetText.English		[ "miner-eat-sandwich" ] 	= "You eat the cave sandwich."
	GameText.TargetText.Esperanto	[ "miner-eat-sandwich" ] 	= "Vi manĝas la kavernan sandviĉon."
	GameText.TargetText.Ido			[ "miner-eat-sandwich" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-eat-sandwich" ] 	= "asdf."
	
	-- collects
	GameText.TargetText.English		[ "miner-collect-copper" ] 	= "You pick up copper."
	GameText.TargetText.Esperanto	[ "miner-collect-copper" ] 	= "Vi kolektas kupron."
	GameText.TargetText.Ido			[ "miner-collect-copper" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-collect-copper" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-collect-silver" ] 	= "You pick up silver."
	GameText.TargetText.Esperanto	[ "miner-collect-silver" ] 	= "Vi kolektas arĝenton."
	GameText.TargetText.Ido			[ "miner-collect-silver" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-collect-silver" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-collect-gold" ] 	= "You pick up gold."
	GameText.TargetText.Esperanto	[ "miner-collect-gold" ] 	= "Vi kolektas oron."
	GameText.TargetText.Ido			[ "miner-collect-gold" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-collect-gold" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-collect-amethyst" ] 	= "You pick up amethyst."
	GameText.TargetText.Esperanto	[ "miner-collect-amethyst" ] 	= "Vi kolektas oron."
	GameText.TargetText.Ido			[ "miner-collect-amethyst" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-collect-amethyst" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-collect-sapphire" ] 	= "You pick up sapphire."
	GameText.TargetText.Esperanto	[ "miner-collect-sapphire" ] 	= "Vi kolektas oron."
	GameText.TargetText.Ido			[ "miner-collect-sapphire" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-collect-sapphire" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-collect-diamond" ] 	= "You pick up diamond."
	GameText.TargetText.Esperanto	[ "miner-collect-diamond" ] 	= "Vi kolektas oron."
	GameText.TargetText.Ido			[ "miner-collect-diamond" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-collect-diamond" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-collect-emerald" ] 	= "You pick up emerald."
	GameText.TargetText.Esperanto	[ "miner-collect-emerald" ] 	= "Vi kolektas oron."
	GameText.TargetText.Ido			[ "miner-collect-emerald" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-collect-emerald" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-collect-ruby" ] 	= "You pick up ruby."
	GameText.TargetText.Esperanto	[ "miner-collect-ruby" ] 	= "Vi kolektas oron."
	GameText.TargetText.Ido			[ "miner-collect-ruby" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-collect-ruby" ] 	= "asdf."
	
	-- attacking
	GameText.TargetText.English		[ "miner-attack-snail" ] 	= "You attack the snail."
	GameText.TargetText.Esperanto	[ "miner-attack-snail" ] 	= "Vi atakas la helikon."
	GameText.TargetText.Ido			[ "miner-attack-snail" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-attack-snail" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-attack-mole" ] 	= "You attack the mole."
	GameText.TargetText.Esperanto	[ "miner-attack-mole" ] 	= "Vi atakas la talpon."
	GameText.TargetText.Ido			[ "miner-attack-mole" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-attack-mole" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-attack-mushroom" ] 	= "You attack the mushroom."
	GameText.TargetText.Esperanto	[ "miner-attack-mushroom" ] 	= "Vi atakas la fungon."
	GameText.TargetText.Ido			[ "miner-attack-mushroom" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-attack-mushroom" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-attack-bat" ] 		= "You attack the bat."
	GameText.TargetText.Esperanto	[ "miner-attack-bat" ] 		= "Vi atakas la vesperton."
	GameText.TargetText.Ido			[ "miner-attack-bat" ] 		= "asdf."
	GameText.TargetText.Spanish		[ "miner-attack-bat" ] 		= "asdf."
	
	GameText.TargetText.English		[ "miner-attack-rabbit" ] 	= "You attack the rabbit."
	GameText.TargetText.Esperanto	[ "miner-attack-rabbit" ] 	= "Vi atakas la kuniklon."
	GameText.TargetText.Ido			[ "miner-attack-rabbit" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-attack-rabbit" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-attack-snake" ] 	= "You attack the snake."
	GameText.TargetText.Esperanto	[ "miner-attack-snake" ] 	= "Vi atakas la serpenton."
	GameText.TargetText.Ido			[ "miner-attack-snake" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-attack-snake" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-attack-moose" ] 	= "You attack the moose."
	GameText.TargetText.Esperanto	[ "miner-attack-moose" ] 	= "Vi atakas la alkon."
	GameText.TargetText.Ido			[ "miner-attack-moose" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-attack-moose" ] 	= "asdf."
	
	GameText.TargetText.English		[ "miner-attack-skeleton" ] 	= "You attack the skeleton."
	GameText.TargetText.Esperanto	[ "miner-attack-skeleton" ] 	= "Vi atakas la skeleton."
	GameText.TargetText.Ido			[ "miner-attack-skeleton" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "miner-attack-skeleton" ] 	= "asdf."

	-- Shop
	
	GameText.TargetText.English		[ "Do you want to buy a tool?" ] 	= "Do you want to buy a tool?"
	GameText.TargetText.Esperanto	[ "Do you want to buy a tool?" ] 	= "Ĉu vi volas aĉeti ilon?"
	GameText.TargetText.Ido			[ "Do you want to buy a tool?" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "Do you want to buy a tool?" ] 	= "asdf."
	
	GameText.TargetText.English		[ "Potion" ] 	= "Potion"
	GameText.TargetText.Esperanto	[ "Potion" ] 	= "Pocio"
	GameText.TargetText.Ido			[ "Potion" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "Potion" ] 	= "asdf."
	
	GameText.TargetText.English		[ "PotionDescription" ] 	= "Restores all of your health."
	GameText.TargetText.Esperanto	[ "PotionDescription" ] 	= "Redoni ĉiom da via sano."
	GameText.TargetText.Ido			[ "PotionDescription" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "PotionDescription" ] 	= "asdf."
	
	GameText.TargetText.English		[ "Earthquake" ] 	= "Earthquake"
	GameText.TargetText.Esperanto	[ "Earthquake" ] 	= "Sismo"
	GameText.TargetText.Ido			[ "Earthquake" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "Earthquake" ] 	= "asdf."
	
	GameText.TargetText.English		[ "EarthquakeDescription" ] 	= "Breaks all rocks."
	GameText.TargetText.Esperanto	[ "EarthquakeDescription" ] 	= "Rompi ĉiujn ŝtonojn."
	GameText.TargetText.Ido			[ "EarthquakeDescription" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "EarthquakeDescription" ] 	= "asdf."
	
	GameText.TargetText.English		[ "Dynamite" ] 	= "Dynamite"
	GameText.TargetText.Esperanto	[ "Dynamite" ] 	= "Dinamito"
	GameText.TargetText.Ido			[ "Dynamite" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "Dynamite" ] 	= "asdf."
	
	GameText.TargetText.English		[ "DynamiteDescription" ] 	= "Descend down one floor."
	GameText.TargetText.Esperanto	[ "DynamiteDescription" ] 	= "Subiri unu nivelon."
	GameText.TargetText.Ido			[ "DynamiteDescription" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "DynamiteDescription" ] 	= "asdf."
	
	GameText.TargetText.English		[ "Rope" ] 	= "Rope"
	GameText.TargetText.Esperanto	[ "Rope" ] 	= "Ŝnuro"
	GameText.TargetText.Ido			[ "Rope" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "Rope" ] 	= "asdf."
	
	GameText.TargetText.English		[ "RopeDescription" ] 	= "Climb up one floor."
	GameText.TargetText.Esperanto	[ "RopeDescription" ] 	= "Supreniri unu nivelon."
	GameText.TargetText.Ido			[ "RopeDescription" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "RopeDescription" ] 	= "asdf."
	
	GameText.TargetText.English		[ "Blizzard" ] 	= "Blizzard"
	GameText.TargetText.Esperanto	[ "Blizzard" ] 	= "Neĝoŝtormo"
	GameText.TargetText.Ido			[ "Blizzard" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "Blizzard" ] 	= "asdf."
	
	GameText.TargetText.English		[ "BlizzardDescription" ] 	= "Freeze all the enemies."
	GameText.TargetText.Esperanto	[ "BlizzardDescription" ] 	= "Frostigi ĉiujn malamikojn."
	GameText.TargetText.Ido			[ "BlizzardDescription" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "BlizzardDescription" ] 	= "asdf."
	
	GameText.TargetText.English		[ "Price" ] 	= "Price:"
	GameText.TargetText.Esperanto	[ "Price" ] 	= "Prezo:"
	GameText.TargetText.Ido			[ "Price" ] 	= "asdf."
	GameText.TargetText.Spanish		[ "Price" ] 	= "asdf."
	
	-- ladder
	GameText.TargetText.English		[ "miner-go-down-ladder" ] 		= "You descend the ladder."
	GameText.TargetText.Esperanto	[ "miner-go-down-ladder" ] 		= "Vi malsupreniras per la ŝtupetaro.."
	GameText.TargetText.Ido			[ "miner-go-down-ladder" ] 		= "asdf."
	GameText.TargetText.Spanish		[ "miner-go-down-ladder" ] 		= "asdf."
	
end


