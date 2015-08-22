GameText  = Core.class()

function GameText:init( options )
end

function GameText:Setup( options )
	GameText.HelperText = {}
	GameText.TargetText = {}
	GameText:SetupLanguages()
end

function GameText:GetFromLanguage( cat, lang, id )
	local language = lang
	local category = ""
	if ( cat == "helper" ) then
		category = "HelperText"
		
	else
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
	GameText.HelperText.Ithkuil = {}
	
	GameText.TargetText.English = {}
	GameText.TargetText.Esperanto = {}
	GameText.TargetText.Ido = {}
	GameText.TargetText.Spanish = {}
	GameText.TargetText.Ithkuil = {}

-- Credits --
GameText.HelperText.English		[ "Translators" ]	= "Translators"
GameText.HelperText.Esperanto	[ "Translators" ] 	= "Tradukistoj"
GameText.HelperText.Ido			[ "Translators" ] 	= "Tradukisti"
GameText.HelperText.Spanish		[ "Translators" ] 	= "Traductor"
GameText.HelperText.Ithkuil     [ "Translators" ]   = "Translators"

-- Name of the language --
GameText.HelperText.English		[ "language-name" ]		= "English"
GameText.HelperText.Esperanto	[ "language-name" ] 	= "Esperanto"
GameText.HelperText.Ido			[ "language-name" ] 	= "Ido"
GameText.HelperText.Spanish		[ "language-name" ] 	= "Español"
GameText.HelperText.Ithkuil     [ "language-name" ]   	= "Ithkuil"

-- Put your name in here
GameText.HelperText.English		[ "Translation Credits" ]	= "Rachel J. Morris"
GameText.HelperText.Esperanto	[ "Translation Credits" ] 	= "Rachel J. Morris"
GameText.HelperText.Ido			[ "Translation Credits" ] 	= "???"
GameText.HelperText.Spanish		[ "Translation Credits" ] 	= "Tea Coba"
GameText.HelperText.Ithkuil     [ "Translation Credits" ]   = "Chikaodinaka 'dkawirl' Oluigbo"


-- Common --

GameText.TargetText.English		[ "game title" ]	= "English Fantasy"
GameText.TargetText.Esperanto	[ "game title" ] 	= "Fantazio de Esperanto"
GameText.TargetText.Ido			[ "game title" ] 	= "Fantazio di Ido"
GameText.TargetText.Spanish		[ "game title" ] 	= "Fantasía de Español"
GameText.TargetText.Ithkuil     [ "game title" ]    = "Ithkaiwîl ubzál"



-- LanguageSelectState --

-- Helper Languages --
-- These only need to be translated into the specific language, there don't need to be multiple translations --
GameText.HelperText.English		[ "I know English" ] 	= "I know English."
GameText.HelperText.Esperanto	[ "I know Esperanto" ] 	= "Mi konas Esperanton."
GameText.HelperText.Ido			[ "I know Ido" ] 		= "Me konas Ido."
GameText.HelperText.Spanish		[ "I know Spanish" ] 	= "Yo conozco Español."
GameText.HelperText.Ithkuil		[ "I know Ithkuil" ] 	= "I know Ithkuil."

-- Target Languages --
GameText.HelperText.English		[ "I am learning English" ] 	= "I am learning English"
GameText.HelperText.Esperanto	[ "I am learning English" ]		= "Mi lernas anglan lingvon"
GameText.HelperText.Ido			[ "I am learning English" ] 	= "Me lernas angla linguo"
GameText.HelperText.Spanish		[ "I am learning English" ] 	= "Estoy aprendiendo inglés"
GameText.HelperText.Ithkuil     [ "I am learning English" ] 	= "Upinglišpel xháwîl"

GameText.HelperText.English		[ "I am learning Esperanto" ]	= "I am learning Esperanto"
GameText.HelperText.Esperanto	[ "I am learning Esperanto" ]	= "Mi lernas esperanton"
GameText.HelperText.Ido			[ "I am learning Esperanto" ]	= "Me lernas esperanto"
GameText.HelperText.Spanish		[ "I am learning Esperanto" ]	= "Estoy aprendiendo esperanto"
GameText.HelperText.Ithkuil     [ "I am learning Esperanto" ]   = "Upesperantopel xháwîl"

GameText.HelperText.English		[ "I am learning Ido" ]			= "I am learning Ido"
GameText.HelperText.Esperanto	[ "I am learning Ido" ]			= "Mi lernas idon"
GameText.HelperText.Ido			[ "I am learning Ido" ]			= "Me lernas ido"
GameText.HelperText.Spanish		[ "I am learning Ido" ]			= "Estoy aprendiendo ido"
GameText.HelperText.Ithkuil     [ "I am learning Ido" ] 		= "Upidopel xháwîl"

GameText.HelperText.English		[ "I am learning Spanish" ]		= "I am learning Spanish"
GameText.HelperText.Esperanto	[ "I am learning Spanish" ]		= "Mi lernas hispanan lingvon"
GameText.HelperText.Ido			[ "I am learning Spanish" ]		= "Me lernas hispana linguo"
GameText.HelperText.Spanish		[ "I am learning Spanish" ]		= "Estoy aprendiendo español"
GameText.HelperText.Ithkuil     [ "I am learning Spanish" ] 	= "Upspanišpel xháwîl"

GameText.HelperText.English     [ "I am learning Ithkuil" ]     = "I am learning Spanish"
GameText.HelperText.Esperanto   [ "I am learning Ithkuil" ]     = "Mi lernas Ifkuilon"
GameText.HelperText.Ido         [ "I am learning Ithkuil" ]     = "Me lernas Ifkuilo"
GameText.HelperText.Spanish     [ "I am learning Ithkuil" ]     = "Estoy aprendiendo Ithkuil"
GameText.HelperText.Ithkuil     [ "I am learning Ithkuil" ] 	= "Ithkel xháwîl"

-- Menu Buttons --

GameText.HelperText.English		[ "Play" ] 	= "Play"
GameText.HelperText.Esperanto	[ "Play" ] 	= "Ludi"
GameText.HelperText.Ido			[ "Play" ] 	= "Ludar"
GameText.HelperText.Spanish		[ "Play" ] 	= "Jugar"
GameText.HelperText.Ithkuil     [ "Play" ]  = "Ováweš!"

GameText.HelperText.English		[ "Next" ] 	= "Continue"
GameText.HelperText.Esperanto	[ "Next" ] 	= "Daŭri"
GameText.HelperText.Ido			[ "Next" ] 	= "Durar"
GameText.HelperText.Spanish		[ "Next" ] 	= "Durar"
GameText.HelperText.Ithkuil     [ "Next" ]  = "Continue"

GameText.HelperText.English		[ "Previous" ] 	= "Previous"
GameText.HelperText.Esperanto	[ "Previous" ] 	= "Antaŭa"
GameText.HelperText.Ido			[ "Previous" ] 	= "Antea"
GameText.HelperText.Spanish		[ "Previous" ] 	= "Pasada"
GameText.HelperText.Ithkuil     [ "Previous" ]  = "Previous"

GameText.HelperText.English		[ "Options" ] 	= "Options"
GameText.HelperText.Esperanto	[ "Options" ] 	= "Agordoj"
GameText.HelperText.Ido			[ "Options" ] 	= "Agordi"
GameText.HelperText.Spanish		[ "Options" ] 	= "Opciones"
GameText.HelperText.Ithkuil     [ "Options" ]   = "Ênyar"

GameText.HelperText.English		[ "Help" ] 	= "Help"
GameText.HelperText.Esperanto	[ "Help" ] 	= "Helpo"
GameText.HelperText.Ido			[ "Help" ] 	= "Helpo"
GameText.HelperText.Spanish		[ "Help" ] 	= "Ayuda"
GameText.HelperText.Ithkuil     [ "Help" ]  = "Âdnan"

GameText.HelperText.English		[ "Back" ] 	= "Back"
GameText.HelperText.Esperanto	[ "Back" ] 	= "Reveni"
GameText.HelperText.Ido			[ "Back" ] 	= "Revenar"
GameText.HelperText.Spanish		[ "Back" ] 	= "Regres"
GameText.HelperText.Ithkuil     [ "Back" ]  = "Rçarļ"

GameText.HelperText.English		[ "Menu" ] 	= "Menu"
GameText.HelperText.Esperanto	[ "Menu" ] 	= "Menuo"
GameText.HelperText.Ido			[ "Menu" ] 	= "Revenar"
GameText.HelperText.Spanish		[ "Menu" ] 	= "Regres"
GameText.HelperText.Ithkuil     [ "Menu" ]  = "Rçarļ"

-- Demo Text

GameText.HelperText.English		[ "Thank you for trying out Merri" ] 	= "Thank you for trying out Merri!"
GameText.HelperText.Esperanto	[ "Thank you for trying out Merri" ] 	= "Dankon por provi je Merri!"
GameText.HelperText.Ido			[ "Thank you for trying out Merri" ] 	= "Thank you for trying out Merri!"
GameText.HelperText.Spanish		[ "Thank you for trying out Merri" ] 	= "Thank you for trying out Merri!"
GameText.HelperText.Ithkuil		[ "Thank you for trying out Merri" ] 	= "Thank you for trying out Merri!"

GameText.HelperText.English		[ "This is still a work in progress" ] 	= "This is still a work in progress."
GameText.HelperText.Esperanto	[ "This is still a work in progress" ] 	= "This is still a work in progress."
GameText.HelperText.Ido			[ "This is still a work in progress" ] 	= "This is still a work in progress."
GameText.HelperText.Spanish		[ "This is still a work in progress" ] 	= "This is still a work in progress."
GameText.HelperText.Ithkuil     [ "This is still a work in progress" ]  = "This is still a work in progress."

GameText.HelperText.English		[ "There may be errors or bugs" ] 		= "There may be errors or bugs."
GameText.HelperText.Esperanto	[ "There may be errors or bugs" ] 		= "There may be errors or bugs."
GameText.HelperText.Ido			[ "There may be errors or bugs" ] 		= "There may be errors or bugs."
GameText.HelperText.Spanish		[ "There may be errors or bugs" ] 		= "There may be errors or bugs."
GameText.HelperText.Ithkuil		[ "There may be errors or bugs" ] 		= "There may be errors or bugs."

GameText.HelperText.English		[ "Report problems at EMAIL" ] 			= "Report problems at Rachel@Moosader.com ."
GameText.HelperText.Esperanto	[ "Report problems at EMAIL" ] 			= "Report problems at Rachel@Moosader.com ."
GameText.HelperText.Ido			[ "Report problems at EMAIL" ] 			= "Report problems at Rachel@Moosader.com ."
GameText.HelperText.Spanish		[ "Report problems at EMAIL" ] 			= "Report problems at Rachel@Moosader.com ."
GameText.HelperText.Ithkuil		[ "Report problems at EMAIL" ] 			= "Report problems at Rachel@Moosader.com ."

GameText.HelperText.English		[ "Want to keep up with this game's progress?" ] 	= "Want to keep up with this game's progress?"
GameText.HelperText.Esperanto	[ "Want to keep up with this game's progress?" ] 	= "Want to keep up with this game's progress?"
GameText.HelperText.Ido			[ "Want to keep up with this game's progress?" ] 	= "Want to keep up with this game's progress?"
GameText.HelperText.Spanish		[ "Want to keep up with this game's progress?" ] 	= "Want to keep up with this game's progress?"
GameText.HelperText.Ithkuil		[ "Want to keep up with this game's progress?" ] 	= "Want to keep up with this game's progress?"

-- Don't translate these, they're being set based on the notes above.
GameText.TargetText.English		[ "Thank you for trying out Merri" ] 	= GameText.HelperText.English[ "Thank you for trying out Merri" ]
GameText.TargetText.Esperanto	[ "Thank you for trying out Merri" ] 	= GameText.HelperText.Esperanto[ "Thank you for trying out Merri" ]
GameText.TargetText.Ido			[ "Thank you for trying out Merri" ] 	= GameText.HelperText.Ido[ "Thank you for trying out Merri" ]
GameText.TargetText.Spanish		[ "Thank you for trying out Merri" ] 	= GameText.HelperText.Spanish[ "Thank you for trying out Merri" ]
GameText.TargetText.Ithkuil		[ "Thank you for trying out Merri" ] 	= GameText.HelperText.Ithkuil[ "Thank you for trying out Merri" ]

GameText.TargetText.English		[ "This is still a work in progress" ] 	= GameText.TargetText.English[ "This is still a work in progress" ]
GameText.TargetText.Esperanto	[ "This is still a work in progress" ] 	= GameText.TargetText.Esperanto[ "This is still a work in progress" ]
GameText.TargetText.Ido			[ "This is still a work in progress" ] 	= GameText.TargetText.Ido[ "This is still a work in progress" ]
GameText.TargetText.Spanish		[ "This is still a work in progress" ] 	= GameText.TargetText.Spanish[ "This is still a work in progress" ]
GameText.TargetText.Ithkuil     [ "This is still a work in progress" ]  = GameText.TargetText.Ithkuil[ "This is still a work in progress" ]

GameText.TargetText.English		[ "There may be errors or bugs" ] 		= GameText.HelperText.English[ "There may be errors or bugs" ]
GameText.TargetText.Esperanto	[ "There may be errors or bugs" ] 		= GameText.HelperText.Esperanto[ "There may be errors or bugs" ]
GameText.TargetText.Ido			[ "There may be errors or bugs" ] 		= GameText.HelperText.Ido[ "There may be errors or bugs" ]
GameText.TargetText.Spanish		[ "There may be errors or bugs" ] 		= GameText.HelperText.Spanish[ "There may be errors or bugs" ]
GameText.TargetText.Ithkuil		[ "There may be errors or bugs" ] 		= GameText.HelperText.Ithkuil[ "There may be errors or bugs" ]

GameText.TargetText.English		[ "Report problems at EMAIL" ] 			= GameText.HelperText.English[ "Report problems at EMAIL" ]
GameText.TargetText.Esperanto	[ "Report problems at EMAIL" ] 			= GameText.HelperText.Esperanto[ "Report problems at EMAIL" ]
GameText.TargetText.Ido			[ "Report problems at EMAIL" ] 			= GameText.HelperText.Ido[ "Report problems at EMAIL" ]
GameText.TargetText.Spanish		[ "Report problems at EMAIL" ] 			= GameText.HelperText.Spanish[ "Report problems at EMAIL" ]
GameText.TargetText.Ithkuil		[ "Report problems at EMAIL" ] 			= GameText.HelperText.Ithkuil[ "Report problems at EMAIL" ]

GameText.TargetText.English		[ "Want to keep up with this game's progress?" ] 		= GameText.HelperText.English[ "Want to keep up with this game's progress?" ]
GameText.TargetText.Esperanto	[ "Want to keep up with this game's progress?" ] 		= GameText.HelperText.Esperanto[ "Want to keep up with this game's progress?" ]
GameText.TargetText.Ido			[ "Want to keep up with this game's progress?" ] 		= GameText.HelperText.Ido[ "Want to keep up with this game's progress?" ]
GameText.TargetText.Spanish		[ "Want to keep up with this game's progress?" ]		= GameText.HelperText.Spanish[ "Want to keep up with this game's progress?" ]
GameText.TargetText.Ithkuil		[ "Want to keep up with this game's progress?" ] 		= GameText.HelperText.Ithkuil[ "Want to keep up with this game's progress?" ]

-- Got a star

GameText.TargetText.English		[ "Earned a star" ] 	= "You aquired a star!"
GameText.TargetText.Esperanto	[ "Earned a star" ] 	= "Vi akiris stelon!"
GameText.TargetText.Ido			[ "Earned a star" ] 	= "Vu aquiris stelo!"
GameText.TargetText.Spanish		[ "Earned a star" ] 	= "Usted adquirió una estrella!"
GameText.TargetText.Ithkuil     [ "Earned a star" ]     = "Uk'awîr kî"

GameText.HelperText.English		[ "Earned a star" ] 	= "You aquired a star!"
GameText.HelperText.Esperanto	[ "Earned a star" ] 	= "Vi akiris stelon!"
GameText.HelperText.Ido			[ "Earned a star" ] 	= "Vu aquiris stelo!"
GameText.HelperText.Spanish		[ "Earned a star" ] 	= "Usted adquirió una estrella!"
GameText.HelperText.Ithkuil     [ "Earned a star" ]     = "Uk'awîr kî"

-- DifficultSelectState --

GameText.HelperText.English		[ "Practice" ] 	= "Practice"
GameText.HelperText.Esperanto	[ "Practice" ] 	= "Ekzerci"
GameText.HelperText.Ido			[ "Practice" ] 	= "Exercar"
GameText.HelperText.Spanish		[ "Practice" ] 	= "Práctica"
GameText.HelperText.Ithkuil     [ "Practice" ]  = "Xháwîl"	

GameText.HelperText.English		[ "Easy" ] 		= "Easy"
GameText.HelperText.Esperanto	[ "Easy" ] 		= "Baznivela"
GameText.HelperText.Ido			[ "Easy" ] 		= "Baznivela"
GameText.HelperText.Spanish		[ "Easy" ] 		= "Fácil"	
GameText.HelperText.Ithkuil     [ "Easy" ]  	= "Xháwîlürt"

GameText.HelperText.English		[ "Medium" ] 	= "Medium"
GameText.HelperText.Esperanto	[ "Medium" ] 	= "Meznivela"
GameText.HelperText.Ido			[ "Medium" ] 	= "Meznivela"
GameText.HelperText.Spanish		[ "Medium" ] 	= "Intermedio"	
GameText.HelperText.Ithkuil     [ "Medium" ]    = "Xháwîlart" 

GameText.HelperText.English		[ "Hard" ] 		= "Hard"
GameText.HelperText.Esperanto	[ "Hard" ] 		= "Altnivela"
GameText.HelperText.Ido			[ "Hard" ] 		= "Altnivela"
GameText.HelperText.Spanish		[ "Hard" ] 		= "Difícil"
GameText.HelperText.Ithkuil     [ "Hard" ]  	= "Xháwîlert" 

GameText.HelperText.English		[ "Stats" ] 	= "Stats"
GameText.HelperText.Esperanto	[ "Stats" ] 	= "Statistikoj"
GameText.HelperText.Ido			[ "Stats" ] 	= "Statistiki"
GameText.HelperText.Spanish		[ "Stats" ] 	= "Estadística"
GameText.HelperText.Ithkuil     [ "Stats" ]     = "Upšáwušk"

-- GameMinerState --

GameText.TargetText.English		[ "Miner" ] 	= "Miner"
GameText.TargetText.Esperanto	[ "Miner" ] 	= "Ministo"
GameText.TargetText.Ido			[ "Miner" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "Miner" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "Miner" ]     = "Qò rq'il ômrar"

GameText.TargetText.English		[ "Floor" ] 	= "Floor:"
GameText.TargetText.Esperanto	[ "Floor" ] 	= "Nivelo:"
GameText.TargetText.Ido			[ "Floor" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "Floor" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "Floor" ]     = "Mthal"

GameText.TargetText.English		[ "Money" ] 	= "Money:"
GameText.TargetText.Esperanto	[ "Money" ] 	= "Mono:"
GameText.TargetText.Ido			[ "Money" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "Money" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "Money" ]     = "Îmsawur"

GameText.TargetText.English		[ "Health" ] 	= "Health:"
GameText.TargetText.Esperanto	[ "Health" ] 	= "Sano:"
GameText.TargetText.Ido			[ "Health" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "Health" ] 	= "Minero"
GameText.TargetText.Ithkuil [ "Health" ]    = "Glawul:"

GameText.TargetText.English		[ "snail" ] 	= "Snail"
GameText.TargetText.Esperanto	[ "snail" ] 	= "Heliko"
GameText.TargetText.Ido			[ "snail" ] 	= "Ministo"
GameText.TargetText.Spanish		[ "snail" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "snail" ]     = "Âļnal"

GameText.TargetText.English		[ "mole" ] 		= "Mole"
GameText.TargetText.Esperanto	[ "mole" ] 		= "Talpo"
GameText.TargetText.Ido			[ "mole" ] 		= "Ministo"
GameText.TargetText.Spanish		[ "mole" ] 		= "Minero"
GameText.TargetText.Ithkuil     [ "mole" ]      = "Çqhwal"

GameText.TargetText.English		[ "mushroom" ] 	= "Mushroom"
GameText.TargetText.Esperanto	[ "mushroom" ] 	= "Fungo"
GameText.TargetText.Ido			[ "mushroom" ] 	= "Piocho"
GameText.TargetText.Spanish		[ "mushroom" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "mushroom" ]  = "Cnalek"

GameText.TargetText.English		[ "bat" ] 		= "Bat"
GameText.TargetText.Esperanto	[ "bat" ] 		= "Vesperto"
GameText.TargetText.Ido			[ "bat" ] 		= "Sabro"
GameText.TargetText.Spanish		[ "bat" ] 		= "Minero"
GameText.TargetText.Ithkuil     [ "bat" ]       = "Ftçal"

GameText.TargetText.English		[ "rabbit" ] 	= "Rabbit"
GameText.TargetText.Esperanto	[ "rabbit" ] 	= "Kuniklo"
GameText.TargetText.Ido			[ "rabbit" ] 	= "Sube"
GameText.TargetText.Spanish		[ "rabbit" ] 	= "Minero"
GameText.TargetText.Ithkuil [ "rabbit" ]    = "Lxwal"

GameText.TargetText.English		[ "snake" ] 	= "Snake"
GameText.TargetText.Esperanto	[ "snake" ] 	= "Serpento"
GameText.TargetText.Ido			[ "snake" ] 	= "Sube"
GameText.TargetText.Spanish		[ "snake" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "snake" ]     = "Knal"

GameText.TargetText.English		[ "skeleton" ] 	= "Skeleton"
GameText.TargetText.Esperanto	[ "skeleton" ] 	= "Skeleto"
GameText.TargetText.Ido			[ "skeleton" ] 	= "Sube"
GameText.TargetText.Spanish		[ "skeleton" ] 	= "Minero"
GameText.TargetText.Ithkuil [ "skeleton" ]  = "Urp'al eqel"

GameText.TargetText.English		[ "moose" ] 	= "Moose"
GameText.TargetText.Esperanto	[ "moose" ] 	= "Alko"
GameText.TargetText.Ido			[ "moose" ] 	= "Sube"
GameText.TargetText.Spanish		[ "moose" ] 	= "Minero"
GameText.TargetText.Ithkuil     [ "moose" ]     = "Ndwal"

GameText.TargetText.English		[ "rock" ] 		= "Rock"
GameText.TargetText.Esperanto	[ "rock" ] 		= "Ŝtono"
GameText.TargetText.Ido			[ "rock" ] 		= "Roko"
GameText.TargetText.Spanish		[ "rock" ] 		= "Piedra"
GameText.TargetText.Ithkuil     [ "rock" ]      = "Ktal"

GameText.TargetText.English		[ "star" ] 		= "Star"
GameText.TargetText.Esperanto	[ "star" ] 		= "Stelo"
GameText.TargetText.Ido			[ "star" ] 		= "Roko"
GameText.TargetText.Spanish		[ "star" ] 		= "Piedra"
GameText.TargetText.Ithkuil     [ "star" ]      = "Uk'ar"

GameText.TargetText.English		[ "sandwich" ] 	= "Sandwich"
GameText.TargetText.Esperanto	[ "sandwich" ] 	= "Sandviĉo"
GameText.TargetText.Ido			[ "sandwich" ] 	= "Sandwich"
GameText.TargetText.Spanish		[ "sandwich" ] 	= "Piedra"
GameText.TargetText.Ithkuil     [ "sandwich" ]  = "Âčmawîr"

GameText.TargetText.English		[ "amethyst" ] 	= "Amethyst"
GameText.TargetText.Esperanto	[ "amethyst" ] 	= "Ametisto"
GameText.TargetText.Ido			[ "amethyst" ] 	= "Ametisto"
GameText.TargetText.Spanish		[ "amethyst" ] 	= "Ametisto"
GameText.TargetText.Ithkuil     [ "amethyst" ]  = "Ktél khwal"

GameText.TargetText.English		[ "sapphire" ] 	= "Sapphire"
GameText.TargetText.Esperanto	[ "sapphire" ] 	= "Safiro"
GameText.TargetText.Ido			[ "sapphire" ] 	= "Akvamarino"
GameText.TargetText.Spanish		[ "sapphire" ] 	= "Akvamarino"
GameText.TargetText.Ithkuil     [ "sapphire" ]  = "Ktél přal"

GameText.TargetText.English		[ "diamond" ] 	= "Diamond"
GameText.TargetText.Esperanto	[ "diamond" ] 	= "Diamanto"
GameText.TargetText.Ido			[ "diamond" ] 	= "Rubeno"
GameText.TargetText.Spanish		[ "diamond" ] 	= "Rubeno"
GameText.TargetText.Ithkuil     [ "diamond" ]   = "Stral"

GameText.TargetText.English		[ "emerald" ] 	= "Emerald"
GameText.TargetText.Esperanto	[ "emerald" ] 	= "Smeraldo"
GameText.TargetText.Ido			[ "emerald" ] 	= "Jado"
GameText.TargetText.Spanish		[ "emerald" ] 	= "Jado"
GameText.TargetText.Ithkuil     [ "emerald" ]   = "Żp'al"

GameText.TargetText.English		[ "ruby" ] 		= "Ruby"
GameText.TargetText.Esperanto	[ "ruby" ] 		= "Rubeno"
GameText.TargetText.Ido			[ "ruby" ] 		= "Jado"
GameText.TargetText.Spanish		[ "ruby" ] 		= "Jado"
GameText.TargetText.Ithkuil     [ "ruby" ]  = "Ktél xt'al"

GameText.TargetText.English		[ "copper" ] 	= "Copper"
GameText.TargetText.Esperanto	[ "copper" ] 	= "Kupro"
GameText.TargetText.Ido			[ "copper" ] 	= "Kupra"
GameText.TargetText.Spanish		[ "copper " ] 	= "Kupra"
GameText.TargetText.Ithkuil     [ "copper" ]    = "Xhtal"

GameText.TargetText.English		[ "silver" ] 	= "Silver"
GameText.TargetText.Esperanto	[ "silver" ] 	= "Arĝento"
GameText.TargetText.Ido			[ "silver" ] 	= "Arĝenta"
GameText.TargetText.Spanish		[ "silver " ] 	= "Arĝenta"
GameText.TargetText.Ithkuil     [ "silver " ]   = "Rqal"

GameText.TargetText.English		[ "gold" ] 		= "Gold"
GameText.TargetText.Esperanto	[ "gold" ] 		= "Oro"
GameText.TargetText.Ido			[ "gold" ] 		= "Ora"
GameText.TargetText.Spanish		[ "gold " ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "gold " ]     = "Xral"

GameText.TargetText.English		[ "ladder" ] 	= "Ladder"
GameText.TargetText.Esperanto	[ "ladder" ] 	= "Ŝtupetaro"
GameText.TargetText.Ido			[ "ladder" ] 	= "Ora"
GameText.TargetText.Spanish		[ "ladder " ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "ladder " ]   = "Otnal"

GameText.TargetText.English		[ "Game Over" ] 	= "Game Over"
GameText.TargetText.Esperanto	[ "Game Over" ] 	= "Ludfino"
GameText.TargetText.Ido			[ "Game Over" ] 	= "Ora"
GameText.TargetText.Spanish		[ "Game Over " ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "Game Over" ]     = "Upšákt’"

GameText.HelperText.English		[ "Game Over" ] 	= "Game Over"
GameText.HelperText.Esperanto	[ "Game Over" ] 	= "Ludfino"
GameText.HelperText.Ido			[ "Game Over" ] 	= "Ora"
GameText.HelperText.Spanish		[ "Game Over " ] 	= "Ora"
GameText.HelperText.Ithkuil     [ "Game Over" ]     = "Upšákt’"

GameText.TargetText.English		[ "miner-begin" ] 	= "Mine for treasure and stay alive!"
GameText.TargetText.Esperanto	[ "miner-begin" ] 	= "Minu trezoron kaj daŭru vivi!"
GameText.TargetText.Ido			[ "miner-begin" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-begin " ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "miner-begin" ]   = "Ko rq'il ômrar. Ka uglawelir"

GameText.TargetText.English		[ "miner-move-north" ] 	= "You walk north."
GameText.TargetText.Esperanto	[ "miner-move-north" ] 	= "Vi marŝas norden."
GameText.TargetText.Ido			[ "miner-move-north" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-move-north" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "miner-move-north" ]  = "Ku gwal osroar"

GameText.TargetText.English		[ "miner-move-south" ] 	= "You walk south."
GameText.TargetText.Esperanto	[ "miner-move-south" ] 	= "Vi marŝas suden."
GameText.TargetText.Ido			[ "miner-move-south" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-move-south" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "miner-move-south" ]  = "Ku gwal ösroar"

GameText.TargetText.English		[ "miner-move-east" ] 	= "You walk east."
GameText.TargetText.Esperanto	[ "miner-move-east" ] 	= "Vi marŝas orienten."
GameText.TargetText.Ido			[ "miner-move-east" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-move-east" ] 	= "Ora"
GameText.TargetText.Ithkuil     [ "miner-move-east" ]   = "Ku gwal öcmoar"

GameText.TargetText.English		[ "miner-move-west" ] 	= "You walk west."
GameText.TargetText.Esperanto	[ "miner-move-west" ] 	= "Vi marŝas okcidenten."
GameText.TargetText.Ido			[ "miner-move-west" ] 	= "Ora"
GameText.TargetText.Spanish		[ "miner-move-west" ] 	= "Ora"

GameText.TargetText.English		[ "miner-mine" ] 		= "You swing your pick."
GameText.TargetText.Esperanto	[ "miner-mine" ] 		= "Vi svingas vian pioĉon."
GameText.TargetText.Ido			[ "miner-mine" ] 		= "asdf"
GameText.TargetText.Spanish		[ "miner-mine" ] 		= "asdf"
GameText.TargetText.Ithkuil     [ "miner-mine" ]        = "Čel obval kî ko"

GameText.TargetText.English		[ "miner-eat-sandwich" ] 	= "You eat the cave sandwich."
GameText.TargetText.Esperanto	[ "miner-eat-sandwich" ] 	= "Vi manĝas la kavernan sandviĉon."
GameText.TargetText.Ido			[ "miner-eat-sandwich" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-eat-sandwich" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-eat-sandwich" ]    = "Čmel gral ko"

-- collects
GameText.TargetText.English		[ "miner-collect-copper" ] 	= "You pick up copper."
GameText.TargetText.Esperanto	[ "miner-collect-copper" ] 	= "Vi kolektas kupron."
GameText.TargetText.Ido			[ "miner-collect-copper" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-copper" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-copper" ]  = "Xhtel ômrar ko"

GameText.TargetText.English		[ "miner-collect-silver" ] 	= "You pick up silver."
GameText.TargetText.Esperanto	[ "miner-collect-silver" ] 	= "Vi kolektas arĝenton."
GameText.TargetText.Ido			[ "miner-collect-silver" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-silver" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-silver" ]  = "Rqel ômrar ko"

GameText.TargetText.English		[ "miner-collect-gold" ] 	= "You pick up gold."
GameText.TargetText.Esperanto	[ "miner-collect-gold" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-gold" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-gold" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-gold" ]    = "Xrel ômrar ko"

GameText.TargetText.English		[ "miner-collect-amethyst" ] 	= "You pick up amethyst."
GameText.TargetText.Esperanto	[ "miner-collect-amethyst" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-amethyst" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-amethyst" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-amethyst" ]    = "Ktél khwal ômrar ko"

GameText.TargetText.English		[ "miner-collect-sapphire" ] 	= "You pick up sapphire."
GameText.TargetText.Esperanto	[ "miner-collect-sapphire" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-sapphire" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-sapphire" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-sapphire" ]    = "Ktél přal ômrar ko"

GameText.TargetText.English		[ "miner-collect-diamond" ] 	= "You pick up diamond."
GameText.TargetText.Esperanto	[ "miner-collect-diamond" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-diamond" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-diamond" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-diamond" ]     = "Strel ômrar ko"

GameText.TargetText.English		[ "miner-collect-emerald" ] 	= "You pick up emerald."
GameText.TargetText.Esperanto	[ "miner-collect-emerald" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-emerald" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-emerald" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-emerald" ]     = "Żp'al ômrar ko"

GameText.TargetText.English		[ "miner-collect-ruby" ] 	= "You pick up ruby."
GameText.TargetText.Esperanto	[ "miner-collect-ruby" ] 	= "Vi kolektas oron."
GameText.TargetText.Ido			[ "miner-collect-ruby" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-collect-ruby" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-collect-ruby" ]    = "Ktél xtal ômrar ko"

-- attacking
GameText.TargetText.English		[ "miner-attack-snail" ] 	= "You attack the snail."
GameText.TargetText.Esperanto	[ "miner-attack-snail" ] 	= "Vi atakas la helikon."
GameText.TargetText.Ido			[ "miner-attack-snail" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-snail" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-snail" ]    = "Âļnel fřál ko"

GameText.TargetText.English		[ "miner-attack-mole" ] 	= "You attack the mole."
GameText.TargetText.Esperanto	[ "miner-attack-mole" ] 	= "Vi atakas la talpon."
GameText.TargetText.Ido			[ "miner-attack-mole" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-mole" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-mole" ]     = "Çqhwel fřál ko"

GameText.TargetText.English		[ "miner-attack-mushroom" ] 	= "You attack the mushroom."
GameText.TargetText.Esperanto	[ "miner-attack-mushroom" ] 	= "Vi atakas la fungon."
GameText.TargetText.Ido			[ "miner-attack-mushroom" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-mushroom" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-mushroom" ]     = "Cnelek fřál ko"

GameText.TargetText.English		[ "miner-attack-bat" ] 		= "You attack the bat."
GameText.TargetText.Esperanto	[ "miner-attack-bat" ] 		= "Vi atakas la vesperton."
GameText.TargetText.Ido			[ "miner-attack-bat" ] 		= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-bat" ] 		= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-bat" ]  = "Ftçel fřál ko"

GameText.TargetText.English		[ "miner-attack-rabbit" ] 	= "You attack the rabbit."
GameText.TargetText.Esperanto	[ "miner-attack-rabbit" ] 	= "Vi atakas la kuniklon."
GameText.TargetText.Ido			[ "miner-attack-rabbit" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-rabbit" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-rabbit" ]   = "Lxwel fřál ko"

GameText.TargetText.English		[ "miner-attack-snake" ] 	= "You attack the snake."
GameText.TargetText.Esperanto	[ "miner-attack-snake" ] 	= "Vi atakas la serpenton."
GameText.TargetText.Ido			[ "miner-attack-snake" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-snake" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-snake" ]    = "Knel fřál ko"

GameText.TargetText.English		[ "miner-attack-moose" ] 	= "You attack the moose."
GameText.TargetText.Esperanto	[ "miner-attack-moose" ] 	= "Vi atakas la alkon."
GameText.TargetText.Ido			[ "miner-attack-moose" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-moose" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-moose" ]    = "Ndwel fřál ko"

GameText.TargetText.English		[ "miner-attack-skeleton" ] 	= "You attack the skeleton."
GameText.TargetText.Esperanto	[ "miner-attack-skeleton" ] 	= "Vi atakas la skeleton."
GameText.TargetText.Ido			[ "miner-attack-skeleton" ] 	= "asdf."
GameText.TargetText.Spanish		[ "miner-attack-skeleton" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "miner-attack-skeleton" ]     = "Urp'al eqel fřál ko"

-- Shop

GameText.TargetText.English		[ "Do you want to buy a tool?" ] 	= "Do you want to buy a tool?"
GameText.TargetText.Esperanto	[ "Do you want to buy a tool?" ] 	= "Ĉu vi volas aĉeti ilon?"
GameText.TargetText.Ido			[ "Do you want to buy a tool?" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Do you want to buy a tool?" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Do you want to buy a tool?" ]    = "Ebawul ki čeil?"

GameText.TargetText.English		[ "Potion" ] 	= "Potion"
GameText.TargetText.Esperanto	[ "Potion" ] 	= "Pocio"
GameText.TargetText.Ido			[ "Potion" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Potion" ] 	= "asdf."
GameText.TargetText.Ithkuil 	[ "Potion" ]    = "Ôgral kâ"

GameText.TargetText.English		[ "PotionDescription" ] 	= "Restores all of your health."
GameText.TargetText.Esperanto	[ "PotionDescription" ] 	= "Redoni ĉiom da via sano."
GameText.TargetText.Ido			[ "PotionDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "PotionDescription" ] 	= "asdf."

GameText.TargetText.English		[ "Earthquake" ] 	= "Earthquake"
GameText.TargetText.Esperanto	[ "Earthquake" ] 	= "Sismo"
GameText.TargetText.Ido			[ "Earthquake" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Earthquake" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Earthquake" ]    = "pErţkwaekpar"

GameText.TargetText.English		[ "EarthquakeDescription" ] 	= "Breaks all rocks."
GameText.TargetText.Esperanto	[ "EarthquakeDescription" ] 	= "Rompi ĉiujn ŝtonojn."
GameText.TargetText.Ido			[ "EarthquakeDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "EarthquakeDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "EarthquakeDescription" ]     = ""

GameText.TargetText.English		[ "Dynamite" ] 	= "Dynamite"
GameText.TargetText.Esperanto	[ "Dynamite" ] 	= "Dinamito"
GameText.TargetText.Ido			[ "Dynamite" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Dynamite" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Dynamite" ]  = "Xčálrak"

GameText.TargetText.English		[ "DynamiteDescription" ] 	= "Descend down one floor."
GameText.TargetText.Esperanto	[ "DynamiteDescription" ] 	= "Subiri unu nivelon."
GameText.TargetText.Ido			[ "DynamiteDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "DynamiteDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil 	[ "DynamiteDescription" ]   = "Jal"

GameText.TargetText.English		[ "Rope" ] 	= "Rope"
GameText.TargetText.Esperanto	[ "Rope" ] 	= "Ŝnuro"
GameText.TargetText.Ido			[ "Rope" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Rope" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Rope" ]  = "Öxpál"

GameText.TargetText.English		[ "RopeDescription" ] 	= "Climb up one floor."
GameText.TargetText.Esperanto	[ "RopeDescription" ] 	= "Supreniri unu nivelon."
GameText.TargetText.Ido			[ "RopeDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "RopeDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "RopeDescription" ]   = "Jal"

GameText.TargetText.English		[ "Blizzard" ] 	= "Blizzard"
GameText.TargetText.Esperanto	[ "Blizzard" ] 	= "Neĝoŝtormo"
GameText.TargetText.Ido			[ "Blizzard" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Blizzard" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Blizzard" ]  = "Uţwálûk"

GameText.TargetText.English		[ "BlizzardDescription" ] 	= "Freeze all the enemies."
GameText.TargetText.Esperanto	[ "BlizzardDescription" ] 	= "Frostigi ĉiujn malamikojn."
GameText.TargetText.Ido			[ "BlizzardDescription" ] 	= "asdf."
GameText.TargetText.Spanish		[ "BlizzardDescription" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "BlizzardDescription" ]   = "Tel îdhal"

GameText.TargetText.English		[ "Price" ] 	= "Price:"
GameText.TargetText.Esperanto	[ "Price" ] 	= "Prezo:"
GameText.TargetText.Ido			[ "Price" ] 	= "asdf."
GameText.TargetText.Spanish		[ "Price" ] 	= "asdf."
GameText.TargetText.Ithkuil     [ "Price" ]     = "Îmsawur"

-- ladder
GameText.TargetText.English		[ "miner-go-down-ladder" ] 		= "You descend the ladder."
GameText.TargetText.Esperanto	[ "miner-go-down-ladder" ] 		= "Vi malsupreniras per la ŝtupetaro.."
GameText.TargetText.Ido			[ "miner-go-down-ladder" ] 		= "asdf."
GameText.TargetText.Spanish		[ "miner-go-down-ladder" ] 		= "asdf."
GameText.TargetText.Ithkuil     [ "miner-go-down-ladder" ]  = "Jal"
	
end


