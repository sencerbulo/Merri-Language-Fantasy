LanguageManager = Core.class()

function LanguageManager:init( options )
	self.languages = { "en", "eo", "es" }
	self.currentLanguage = 1
	self:SetLanguage( options.language )

	self.strings = {
		en = {},
		eo = {},
        es = {},
	}
	
	-- #########################################################################
	-- #																																				MAIN MENU
	-- #########################################################################
	
	-- Fantasy of [Language] -- [Language] Fantasy is also OK if it makes sense in the language.
	self.strings.en.title1 = { text = "English" }
	self.strings.eo.title1 = { text = "Fantazio" }
	self.strings.es.title1 = { text = "Fantasia" }

	self.strings.en.title2 = { text = "Fantasy" }
	self.strings.eo.title2 = { text = "de" }
	self.strings.es.title2 = { text = "de" }

	self.strings.en.title3 = { text = "" } -- Target language
	self.strings.eo.title3 = { text = "Esperanto" }
	self.strings.es.title3 = { text = "Español" }

	self.strings.en.full_title = { text = "English Fantasy" } -- Fantasy of [Language]
	self.strings.eo.full_title = { text = "Fantazio de Esperanto" }
	self.strings.es.full_title = { text = "Fantasia de Español" }
	
	self.strings.en.path = { text = "english_fantasy" }
	self.strings.eo.path = { text = "fantazio_de_esperanto" }
	self.strings.es.path = { text = "fantasia_de_espanol" }

	self.strings.en.touch_to_begin = { text = "Touch to Begin" } -- Touch / Conventional touch-screen term
	self.strings.eo.touch_to_begin = { text = "Tuŝu por Komenci" }
	self.strings.es.touch_to_begin = { text = "Toca para comenzar" }

	self.strings.en.by_moosader = { text = "By Moosader" }
	self.strings.eo.by_moosader = { text = "De Moosader" }
	self.strings.es.by_moosader = { text = "Por Moosader" }

	self.strings.en.additional_help = { text = "Additional Help" }
	self.strings.eo.additional_help = { text = "Pliaj Helpo" }
	self.strings.es.additional_help = { text = "Ayuda Adicional" }

	self.strings.en.credits1 = { text = "Programming, Art" }
	self.strings.eo.credits1 = { text = "Programado, Desegnado" }
	self.strings.es.credits1 = { text = "Pragramación, Arte" }

	-- "Creative Commons Music:" -- Keep as "Creative Commons", unless language specifically has other term.
	self.strings.en.credits2 = { text = "Creative Commons" }
	self.strings.eo.credits2 = { text = "Krea Komunaĵa" }
	self.strings.es.credits2 = { text = "Música con licencia" }

	self.strings.en.credits2b = { text = "Music:" }
	self.strings.eo.credits2b = { text = "Muziko:" }
	self.strings.es.credits2b = { text = "Creative Commons:" }

	self.strings.en.credits3 = { text = "World Map, Happy," } -- Stays the same
	self.strings.eo.credits3 = { text = "World Map, Happy," }
	self.strings.es.credits3 = { text = "World Map, Happy," }

	self.strings.en.credits3b = { text = "Bouncy, Forest" } -- Stays the same
	self.strings.eo.credits3b = { text = "Bouncy, Forest" }
	self.strings.es.credits3b = { text = "Bouncy, Forest" }

	self.strings.en.credits4 = { text = "Press Start 2P, Consola Mono," } -- Stays the same
	self.strings.eo.credits4 = { text = "Press Start 2P, Consola Mono," }
	self.strings.es.credits4 = { text = "Press Start 2P, Consola Mono," }

	self.strings.en.credits5 = { text = "Modern Antiqua" } -- Stays the same
	self.strings.eo.credits5 = { text = "Modern Antiqua" }
	self.strings.es.credits5 = { text = "Modern Antiqua" }

	self.strings.en.quality_review = { text = "English Language" } -- [Language] Translation
	self.strings.eo.quality_review = { text = "Esperanta Traduko" }
	self.strings.es.quality_review = { text = "Traducción a Español" }

	self.strings.en.credits6 = { text = "Rachel Morris" } -- Put your name in
	self.strings.eo.credits6 = { text = "Tea Coba, Rachel Morris" }
	self.strings.es.credits6 = { text = "Enmanuel Toribio" }

	self.strings.en.voices = { text = "English Voice" } -- [Language] Translation
	self.strings.eo.voices = { text = "Esperanta Voĉo" }
	self.strings.es.voices = { text = "Voz en español" }

	self.strings.en.credits7 = { text = "Rachel Morris" }
	self.strings.eo.credits7 = { text = "Rachel Morris" }
	self.strings.es.credits7 = { text = "Enmanuel Toribio" }
	
	self.strings.en.testing = { text = "Testing" }
	self.strings.eo.testing = { text = "Testado" }
	self.strings.es.testing = { text = "Pruebas" }
	
	self.strings.en.sound_effects = { text = "Sound Effects" }
	self.strings.eo.sound_effects = { text = "Sonefektoj" }
	self.strings.es.sound_effects = { text = "Efectos Sonoros" }

	self.strings.en.credits8 = { text = "Enmanuel Toribio" }
	self.strings.eo.credits8 = { text = "Enmanuel Toribio" }
	self.strings.es.credits8 = { text = "Enmanuel Toribio" }
	
	self.strings.en.framework = { text = "Framework" }
	self.strings.eo.framework = { text = "Programframo" }
	self.strings.es.framework = { text = "Efectos Sonoros" }

	-- To access all of the categories, please buy the full version!
	self.strings.en.download_the_full_game1 = { text = "To access all" } 
	self.strings.eo.download_the_full_game1 = { text = "Por ricevi pli" }
	self.strings.es.download_the_full_game1 = { text = "¡Para acceder a todas " }

	self.strings.en.download_the_full_game2 = { text = "of the categories," }
	self.strings.eo.download_the_full_game2 = { text = "da la kategorioj," }
	self.strings.es.download_the_full_game2 = { text = "las categorías, " }

	self.strings.en.download_the_full_game3 = { text = "please buy" } 
	self.strings.eo.download_the_full_game3 = { text = "bonvolu aĉetu" }
	self.strings.es.download_the_full_game3 = { text = "por favor compra " }

	self.strings.en.download_the_full_game4 = { text = "the full version! " }
	self.strings.eo.download_the_full_game4 = { text = "la kompletan version!" }
	self.strings.es.download_the_full_game4 = { text = "la versión completa!" }

	-- Thank you for buying the full game!
	self.strings.en.thank_you_for_buying1 = { text = "Thank you for buying" }
	self.strings.eo.thank_you_for_buying1 = { text = "Dankon por aĉeti" }
	self.strings.es.thank_you_for_buying1 = { text = "Gracias por comprar" }

	self.strings.en.thank_you_for_buying2 = { text = "the full game!" }
	self.strings.eo.thank_you_for_buying2 = { text = "la kompletan ludon!" }
	self.strings.es.thank_you_for_buying2 = { text = "el juego completo!" }

	-- More games coming soon!
	self.strings.en.more_coming_soon1 = { text = "More mini-games" }
	self.strings.eo.more_coming_soon1 = { text = "Pli da ludetoj baldaŭ!" }
	self.strings.es.more_coming_soon1 = { text = "Más juegos" }
	
	self.strings.en.more_coming_soon2 = { text = "coming soon!" }
	self.strings.eo.more_coming_soon2 = { text = "" }
	self.strings.es.more_coming_soon2 = { text = "vienen pronto!" }


	self.strings.en.questions = { text = "Questions" } -- # of questions answered (Questions: ##)
	self.strings.eo.questions = { text = "Demandoj" }
	self.strings.es.questions = { text = "Preguntas" }

	self.strings.en.correct = { text = "Correct" } -- # of correct answers made (Correct: ##)
	self.strings.eo.correct = { text = "Ĝusta" }
	self.strings.es.correct = { text = "Correctas" }

	-- MAIN MENU CATEGORY OPTIONS
	self.strings.en.category_animals = { text = "Animals" }
	self.strings.eo.category_animals = { text = "Bestoj" }
	self.strings.es.category_animals = { text = "Animales" }

	self.strings.en.category_food = { text = "Food" }
	self.strings.eo.category_food = { text = "Manĝaĵoj" }
	self.strings.es.category_food = { text = "Comida" }

	self.strings.en.category_clothes = { text = "Clothes" }
	self.strings.eo.category_clothes = { text = "Vestoj" }
	self.strings.es.category_clothes = { text = "Ropas" }

	self.strings.en.category_colors = { text = "Colors" }
	self.strings.eo.category_colors = { text = "Koloroj" }
	self.strings.es.category_colors = { text = "Colores" }

	self.strings.en.category_numbers = { text = "Numbers" }
	self.strings.eo.category_numbers = { text = "Nombroj" }
	self.strings.es.category_numbers = { text = "Números" }

	self.strings.en.category_family = { text = "Family" }
	self.strings.eo.category_family = { text = "Familio" }
	self.strings.es.category_family = { text = "Familia" }

	self.strings.en.category_calendar = { text = "Calendar" }
	self.strings.eo.category_calendar = { text = "Kalendaro" }
	self.strings.es.category_calendar = { text = "Calendario" }

	self.strings.en.category_places = { text = "Places" }
	self.strings.eo.category_places = { text = "Lokoj" }
	self.strings.es.category_places = { text = "Lugares" }

	self.strings.en.category_comics = { text = "Comics" }
	self.strings.eo.category_comics = { text = "Bildostrioj" }
	self.strings.es.category_comics = { text = "Historietas" }

	-- General program information stuff
	self.strings.en.EMAIL_ADDRESS = { text = "Rachel@Moosader.com" }
	self.strings.eo.EMAIL_ADDRESS = { text = "Rachel@Moosader.com" }
	self.strings.es.EMAIL_ADDRESS = { text = "Rachel@Moosader.com" }

	self.strings.en.VERSION = { text = "v1.3" }
	self.strings.eo.VERSION = { text = "v1.3" }
	self.strings.es.VERSION = { text = "v1.3" }

	-- Quiz items
	
	-- #########################################################################
	-- #																																				FOOD
	-- #########################################################################
    -- Each of these need to have vocal recorded
	self.strings.en.apple						= { text = "apple" }
	self.strings.eo.apple						= { text = "pomo" }
	self.strings.es.apple						= { text = "manzana" }

	self.strings.en.iwant_apple			= { text = "I want an apple!" }
	self.strings.eo.iwant_apple			= { text = "Mi volas pomon!" }
	self.strings.es.iwant_apple			= { text = "¡Quiero una manzana!" }

	self.strings.en.banana					= { text = "banana" }
	self.strings.eo.banana					= { text = "banano" }
	self.strings.es.banana					= { text = "banana" }

	self.strings.en.iwant_banana		= { text = "I want a banana!" }
	self.strings.eo.iwant_banana		= { text = "Mi volas bananon!" }
	self.strings.es.iwant_banana		= { text = "¡Quiero una banana!" }

	self.strings.en.bread						= { text = "bread" }
	self.strings.eo.bread						= { text = "pano" }
	self.strings.es.bread						= { text = "pan" }

	self.strings.en.iwant_bread			= { text = "I want bread!" }
	self.strings.eo.iwant_bread			= { text = "Mi volas panon!" }
	self.strings.es.iwant_bread			= { text = "¡Quiero pan!" }

	self.strings.en.broccoli					= { text = "broccoli" }
	self.strings.eo.broccoli					= { text = "brokolo" }
	self.strings.es.broccoli					= { text = "brocoli" }

	self.strings.en.iwant_broccoli		= { text = "I want broccoli!" }
	self.strings.eo.iwant_broccoli		= { text = "Mi volas brokolon!" }
	self.strings.es.iwant_broccoli		= { text = "¡Quiero un brocoli!" }

	self.strings.en.cake							= { text = "cake" }
	self.strings.eo.cake							= { text = "kuko" }
	self.strings.es.cake							= { text = "pastel" }

	self.strings.en.iwant_cake				= { text = "I want cake!" }
	self.strings.eo.iwant_cake				= { text = "Mi volas kukon!" }
	self.strings.es.iwant_cake				= { text = "¡Quiero pastel!" }

	self.strings.en.candy						= { text = "candy" }
	self.strings.eo.candy						= { text = "dolĉaĵo" }
	self.strings.es.candy						= { text = "dulce" }

	self.strings.en.iwant_candy			= { text = "I want candy!" }
	self.strings.eo.iwant_candy			= { text = "Mi volas dolĉaĵojn!" }
	self.strings.es.iwant_candy			= { text = "¡Quiero dulce!" }

	self.strings.en.carrot						= { text = "carrot" }
	self.strings.eo.carrot						= { text = "karoto" }
	self.strings.es.carrot						= { text = "zanahoria" }

	self.strings.en.iwant_carrot			= { text = "I want a carrot!" }
	self.strings.eo.iwant_carrot			= { text = "Mi volas karoton!" }
	self.strings.es.iwant_carrot			= { text = "¡Quiero una zanahoria!" }

	self.strings.en.cherry						= { text = "cherry" }
	self.strings.eo.cherry						= { text = "ĉerizo" }
	self.strings.es.cherry						= { text = "cerezas" }

	self.strings.en.iwant_cherry			= { text = "I want a cherry!" }
	self.strings.eo.iwant_cherry			= { text = "Mi volas ĉerizon!" }
	self.strings.es.iwant_cherry			= { text = "¡Quiero una cereza!" }

	self.strings.en.cheese						= { text = "cheese" }
	self.strings.eo.cheese					= { text = "fromaĝo" }
	self.strings.es.cheese						= { text = "queso" }

	self.strings.en.iwant_cheese		= { text = "I want cheese!" }
	self.strings.eo.iwant_cheese		= { text = "Mi volas fromaĝon!" }
	self.strings.es.iwant_cheese		= { text = "¡Quiero queso!" }

	self.strings.en.chicken					= { text = "chicken" }
	self.strings.eo.chicken					= { text = "kokidaĵo" }
	self.strings.es.chicken					= { text = "pollo" }

	self.strings.en.iwant_chicken		= { text = "I want chicken!" }
	self.strings.eo.iwant_chicken		= { text = "Mi volas kokidaĵon!" }
	self.strings.es.iwant_chicken		= { text = "¡Quiero pollo!" }

	self.strings.en.coffee						= { text = "coffee" }
	self.strings.eo.coffee						= { text = "kafo" }
	self.strings.es.coffee						= { text = "café" }

	self.strings.en.iwant_coffee			= { text = "I want a coffee!" }
	self.strings.eo.iwant_coffee			= { text = "Mi volas kafon!" }
	self.strings.es.iwant_coffee			= { text = "¡Quiero un café!" }

	self.strings.en.egg							= { text = "egg" }
	self.strings.eo.egg							= { text = "ovo" }
	self.strings.es.egg							= { text = "huevo" }

	self.strings.en.lemon						= { text = "lemon" }
	self.strings.eo.lemon						= { text = "limono" }
	self.strings.es.lemon						= { text = "limono" }

	self.strings.en.iwant_lemon			= { text = "I want a lemon!" }
	self.strings.eo.iwant_lemon			= { text = "Mi volas limonon!" }
	self.strings.es.iwant_lemon			= { text = "Quiero un limón!" }

	self.strings.en.iwant_egg				= { text = "I want an egg!" }
	self.strings.eo.iwant_egg				= { text = "Mi volas ovon!" }
	self.strings.es.iwant_egg				= { text = "¡Quiero un huevo!" }

	self.strings.en.ham							= { text = "ham" }
	self.strings.eo.ham							= { text = "ŝinko" }
	self.strings.es.ham							= { text = "jamón" }

	self.strings.en.iwant_ham				= { text = "I want ham!" }
	self.strings.eo.iwant_ham				= { text = "Mi volas ŝinkon!" }
	self.strings.es.iwant_ham				= { text = "¡Quiero jamón!" }

	self.strings.en.hamburger				= { text = "hamburger" }
	self.strings.eo.hamburger				= { text = "burgero" }
	self.strings.es.hamburger				= { text = "hamburguesa" }

	self.strings.en.iwant_hamburger	= { text = "I want a hamburger!" }
	self.strings.eo.iwant_hamburger	= { text = "Mi volas burgeron!" }
	self.strings.es.iwant_hamburger	= { text = "¡Quiero una hamburguesa!" }

	self.strings.en.hotdog						= { text = "hotdog" }
	self.strings.eo.hotdog						= { text = "kolbasbulko" }
	self.strings.es.hotdog						= { text = "salchicha" }

	self.strings.en.iwant_hotdog			= { text = "I want a hotdog!" }
	self.strings.eo.iwant_hotdog			= { text = "Mi volas kolbasbulkon!" }
	self.strings.es.iwant_hotdog			= { text = "¡Quiero una salchicha!" }

	self.strings.en.icecream					= { text = "icecream" }
	self.strings.eo.icecream					= { text = "glaciaĵo" }
	self.strings.es.icecream					= { text = "helado" }

	self.strings.en.iwant_icecream		= { text = "I want icecream!" }
	self.strings.eo.iwant_icecream	= { text = "Mi volas glaciaĵon!" }
	self.strings.es.iwant_icecream		= { text = "¡Quiero helado!" }

	self.strings.en.onion							= { text = "onion" }
	self.strings.eo.onion						= { text = "cepo" }
	self.strings.es.onion							= { text = "cebolla" }

	self.strings.en.iwant_onion			= { text = "I want an onion!" }
	self.strings.eo.iwant_onion			= { text = "Mi volas cepon!" }
	self.strings.es.iwant_onion			= { text = "¡Quiero una cebolla!" }

	self.strings.en.orange						= { text = "orange" }
	self.strings.eo.orange						= { text = "oranĝo" }
	self.strings.es.orange						= { text = "naranja" }

	self.strings.en.iwant_orange			= { text = "I want an orange!" }
	self.strings.eo.iwant_orange			= { text = "Mi volas oranĝon!" }
	self.strings.es.iwant_orange			= { text = "¡Quiero una naranja!" }

	self.strings.en.pear							= { text = "pear" }
	self.strings.eo.pear							= { text = "piro" }
	self.strings.es.pear							= { text = "pera" }

	self.strings.en.iwant_pear				= { text = "I want a pear!" }
	self.strings.eo.iwant_pear				= { text = "Mi volas piron!" }
	self.strings.es.iwant_pear				= { text = "¡Quiero una pera!" }

	self.strings.en.pepper						= { text = "pepper" }
	self.strings.eo.pepper						= { text = "pipro" }
	self.strings.es.pepper						= { text = "pimienta" }

	self.strings.en.iwant_pepper			= { text = "I want a pepper!" }
	self.strings.eo.iwant_pepper		= { text = "Mi volas pipron!" }
	self.strings.es.iwant_pepper			= { text = "¡Quiero pimienta!" }

	self.strings.en.pizza							= { text = "pizza" }
	self.strings.eo.pizza							= { text = "pico" }
	self.strings.es.pizza							= { text = "pizza" }

	self.strings.en.iwant_pizza				= { text = "I want pizza!" }
	self.strings.eo.iwant_pizza				= { text = "Mi volas picon!" }
	self.strings.es.iwant_pizza				= { text = "¡Quiero pizza!" }

	self.strings.en.potato						= { text = "potato" }
	self.strings.eo.potato						= { text = "terpomo" }
	self.strings.es.potato						= { text = "papa" }

	self.strings.en.iwant_potato			= { text = "I want a potato!" }
	self.strings.eo.iwant_potato			= { text = "Mi volas terpomon!" }
	self.strings.es.iwant_potato			= { text = "¡Quiero una papa!" }

	self.strings.en.salad						= { text = "salad" }
	self.strings.eo.salad						= { text = "salato" }
	self.strings.es.salad						= { text = "ensalada" }

	self.strings.en.iwant_salad			= { text = "I want a salad!" }
	self.strings.eo.iwant_salad			= { text = "Mi volas salaton!" }
	self.strings.es.iwant_salad			= { text = "¡Quiero una ensalada!" }

	self.strings.en.sandwich					= { text = "sandwich" }
	self.strings.eo.sandwich					= { text = "sandviĉo" }
	self.strings.es.sandwich					= { text = "emparedado" }

	self.strings.en.iwant_sandwich		= { text = "I want a sandwich!" }
	self.strings.eo.iwant_sandwich	= { text = "Mi volas sandviĉon!" }
	self.strings.es.iwant_sandwich	= { text = "¡Quiero un emparedado!" }

	self.strings.en.soda							= { text = "soda" }
	self.strings.eo.soda							= { text = "sodo" }
	self.strings.es.soda							= { text = "gaseosa" }

	self.strings.en.iwant_soda				= { text = "I want a soda!" }
	self.strings.eo.iwant_soda				= { text = "Mi volas sodon!" }
	self.strings.es.iwant_soda				= { text = "¡Quiero una gaseosa!" }

	self.strings.en.steak							= { text = "steak" }
	self.strings.eo.steak						= { text = "bifsteko" }
	self.strings.es.steak							= { text = "bistec" }

	self.strings.en.iwant_steak			= { text = "I want a steak!" }
	self.strings.eo.iwant_steak			= { text = "Mi volas bifstekon!" }
	self.strings.es.iwant_steak			= { text = "¡Quiero un bistec!" }

	self.strings.en.strawberry				= { text = "strawberry" }
	self.strings.eo.strawberry				= { text = "frago" }
	self.strings.es.strawberry				= { text = "fresa" }

	self.strings.en.iwant_strawberry	= { text = "I want a strawberry!" }
	self.strings.eo.iwant_strawberry	= { text = "Mi volas fragon!" }
	self.strings.es.iwant_strawberry	= { text = "¡Quiero una fresa!" }

	self.strings.en.tea								= { text = "tea" }
	self.strings.eo.tea								= { text = "teo" }
	self.strings.es.tea								= { text = "té" }

	self.strings.en.iwant_tea					= { text = "I want tea!" }
	self.strings.eo.iwant_tea					= { text = "Mi volas teon!" }
	self.strings.es.iwant_tea					= { text = "¡Quiero té!" }

	self.strings.en.tomato						= { text = "tomato" }
	self.strings.eo.tomato						= { text = "tomato" }
	self.strings.es.tomato						= { text = "tomate" }

	self.strings.en.iwant_tomato			= { text = "I want a tomato!" }
	self.strings.eo.iwant_tomato			= { text = "Mi volas tomaton!" }
	self.strings.es.iwant_tomato			= { text = "¡Quiero un tomate!" }

	self.strings.en.watermelon					= { text = "watermelon" }
	self.strings.eo.watermelon			    = { text = "akvomelono" }
	self.strings.es.watermelon			    	= { text = "sandia" }

	self.strings.en.iwant_watermelon    = { text = "I want a watermelon!" }
	self.strings.eo.iwant_watermelon    = { text = "Mi volas akvomelonon!" }
	self.strings.es.iwant_watermelon    = { text = "¡Quiero una sandía!" }

	self.strings.en.water							= { text = "water" }
	self.strings.eo.water							= { text = "akvo" }
	self.strings.es.water							= { text = "agua" }

	self.strings.en.iwant_water				= { text = "I want water!" }
	self.strings.eo.iwant_water			= { text = "Mi volas akvon!" }
	self.strings.es.iwant_water				= { text = "¡Quiero agua!" }

	self.strings.en.milk							= { text = "milk" }
	self.strings.eo.milk							= { text = "lakto" }
	self.strings.es.milk							= { text = "leche" }

	self.strings.en.iwant_milk				= { text = "I want milk!" }
	self.strings.eo.iwant_milk				= { text = "Mi volas lakton!" }
	self.strings.es.iwant_milk				= { text = "¡Quiero leche!" }


	-- #########################################################################
	-- #																																				NUMBERS
	-- #########################################################################
	-- Each of these need to have vocal recorded
    -- Also need "plus" recorded in respective language. Name file "plus"
    
	self.strings.en.number0		=	 { text = "zero" }
	self.strings.eo.number0		=	 { text = "nulo" }
	self.strings.es.number0		=	 { text = "cero" }
	
	self.strings.en.number1		=	 { text = "one" }
	self.strings.eo.number1		=	 { text = "unu" }
	self.strings.es.number1		=	 { text = "uno" }
	
	self.strings.en.number2		=	 { text = "two" }
	self.strings.eo.number2		=	 { text = "du" }
	self.strings.es.number2		=	 { text = "dos" }
	
	self.strings.en.number3		=	 { text = "three" }
	self.strings.eo.number3		=	 { text = "tri" }
	self.strings.es.number3		=	 { text = "tres" }
	
	self.strings.en.number4		=	 { text = "four" }
	self.strings.eo.number4		=	 { text = "kvar" }
	self.strings.es.number4		=	 { text = "cuatro" }
	
	self.strings.en.number5		=	 { text = "five" }
	self.strings.eo.number5		=	 { text = "kvin" }
	self.strings.es.number5		=	 { text = "cinco" }
	
	self.strings.en.number6		=	 { text = "six" }
	self.strings.eo.number6		=	 { text = "ses" }
	self.strings.es.number6		=	 { text = "seis" }
	
	self.strings.en.number7		=	 { text = "seven" }
	self.strings.eo.number7		=	 { text = "sep" }
	self.strings.es.number7		=	 { text = "siete" }
	
	self.strings.en.number8		=	 { text = "eight" }
	self.strings.eo.number8		=	 { text = "ok" }
	self.strings.es.number8		=	 { text = "ocho" }
	
	self.strings.en.number9		=	 { text = "nine" }
	self.strings.eo.number9		=	 { text = "naŭ" }
	self.strings.es.number9		=	 { text = "nueve" }
	
	self.strings.en.number10		=	 { text = "ten" }
	self.strings.eo.number10		=	 { text = "dek" }
	self.strings.es.number10		=	 { text = "diez" }
	
	self.strings.en.number11		=	 { text = "eleven" }
	self.strings.eo.number11		=	 { text = "dek unu" }
	self.strings.es.number11		=	 { text = "once" }
	
	self.strings.en.number12		=	 { text = "twelve" }
	self.strings.eo.number12		=	 { text = "dek du" }
	self.strings.es.number12		=	 { text = "doce" }
	
	self.strings.en.number13		=	 { text = "thirteen" }
	self.strings.eo.number13		=	 { text = "dek tri" }
	self.strings.es.number13		=	 { text = "trece" }
	
	self.strings.en.number14		=	 { text = "fourteen" }
	self.strings.eo.number14		=	 { text = "dek kvar" }
	self.strings.es.number14		=	 { text = "catorce" }
	
	self.strings.en.number15		=	 { text = "fifteen" }
	self.strings.eo.number15		=	 { text = "dek kvin" }
	self.strings.es.number15		=	 { text = "quince" }
	
	self.strings.en.number16		=	 { text = "sixteen" }
	self.strings.eo.number16		=	 { text = "dek ses" }
	self.strings.es.number16		=	 { text = "dieciséis" }
	
	self.strings.en.number17		=	 { text = "seventeen" }
	self.strings.eo.number17		=	 { text = "dek sep" }
	self.strings.es.number17		=	 { text = "diecisiete" }
	
	self.strings.en.number18		=	 { text = "eighteen" }
	self.strings.eo.number18		=	 { text = "dek ok" }
	self.strings.es.number18		=	 { text = "dieciocho" }
	
	self.strings.en.number19		=	 { text = "nineteen" }
	self.strings.eo.number19		=	 { text = "dek naŭ" }
	self.strings.es.number19		=	 { text = "diecinueve" }
	
	self.strings.en.number20		=	 { text = "twenty" }
	self.strings.eo.number20		=	 { text = "dudek" }
	self.strings.es.number20		=	 { text = "veinte" }
	
	self.strings.en.number21		=	 { text = "twenty one" }
	self.strings.eo.number21		=	 { text = "dudek unu" }
	self.strings.es.number21		=	 { text = "veintiuno" }
	
	self.strings.en.number22		=	 { text = "twenty two" }
	self.strings.eo.number22		=	 { text = "dudek du" }
	self.strings.es.number22		=	 { text = "veintidós" }
	
	self.strings.en.number23		=	 { text = "twenty three" }
	self.strings.eo.number23		=	 { text = "dudek tri" }
	self.strings.es.number23		=	 { text = "veintitrés" }
	
	self.strings.en.number24		=	 { text = "twenty four" }
	self.strings.eo.number24		=	 { text = "dudek kvar" }
	self.strings.es.number24		=	 { text = "veinticinco" }

	self.strings.en.number25		=	 { text = "twenty five" }
	self.strings.eo.number25		=	 { text = "dudek kvin" }
	self.strings.es.number25		=	 { text = "veinticinco" }
	
	self.strings.en.number26		=	 { text = "twenty six" }
	self.strings.eo.number26		=	 { text = "dudek ses" }
	self.strings.es.number26		=	 { text = "veintiséis" }
	
	self.strings.en.number27		=	 { text = "twenty seven" }
	self.strings.eo.number27		=	 { text = "dudek sep" }
	self.strings.es.number27		=	 { text = "veintiocho" }
	
	self.strings.en.number28		=	 { text = "twenty eight" }
	self.strings.eo.number28		=	 { text = "dudek ok" }
	self.strings.es.number28		=	 { text = "veintiocho" }
	
	self.strings.en.number29		=	 { text = "twenty nine" }
	self.strings.eo.number29		=	 { text = "dudek naŭ" }
	self.strings.es.number29		=	 { text = "veintinueve" }
	
	self.strings.en.number30		=	 { text = "thirty" }
	self.strings.eo.number30		=	 { text = "tridek" }
	self.strings.es.number30		=	 { text = "treinta" }
	
	-- #########################################################################
	-- #																																				CLOTHES
	-- #########################################################################
    -- Each of these need to have vocal recorded
	
	self.strings.en.baseballhat 	= { text = "baseball hat" }
	self.strings.eo.baseballhat 	= { text = "basbalĉapelo" }
	self.strings.es.baseballhat 	= { text = "gorra de béisbol" }
	
	self.strings.en.coat 			= { text = "coat" }
	self.strings.eo.coat 			= { text = "jako" }
	self.strings.es.coat 			= { text = "abrigo" }
	
	self.strings.en.dress 		= { text = "dress" }
	self.strings.eo.dress 		= { text = "robo" }
	self.strings.es.dress 		= { text = "vestido" }
	
	self.strings.en.jacket 		= { text = "jacket" }
	self.strings.eo.jacket 		= { text = "ĵaketo" }
	self.strings.es.jacket 		= { text = "chaqueta" }
	
	self.strings.en.pants 		= { text = "pants" }
	self.strings.eo.pants 		= { text = "pantalono" }
	self.strings.es.pants 		= { text = "pantalones" }
	
	self.strings.en.shoes 		= { text = "shoes" }
	self.strings.eo.shoes 		= { text = "ŝuoj" }
	self.strings.es.shoes 		= { text = "zapatos" }
	
	self.strings.en.shorts 		= { text = "shorts" }
	self.strings.eo.shorts 		= { text = "kuloto" }
	self.strings.es.shorts 		= { text = "pantalones cortos" }
	
	self.strings.en.skirt 			= { text = "skirt" }
	self.strings.eo.skirt 			= { text = "jupo" }
	self.strings.es.skirt 			= { text = "falda" }
	
	self.strings.en.socks 		= { text = "socks" }
	self.strings.eo.socks 		= { text = "duonŝtrumpoj" }
	self.strings.es.socks 		= { text = "calcetines" }
	
	self.strings.en.tshirt 			= { text = "t-shirt" }
	self.strings.eo.tshirt 			= { text = "t-ĉemizo" }
	self.strings.es.tshirt 			= { text = "camiseta" }
	
	self.strings.en.tophat 	= { text = "top hat" }
	self.strings.eo.tophat 	= { text = "klakĉapelo" }
	self.strings.es.tophat 	= { text = "sombrero de copa" }
	
	-- #########################################################################
	-- #																																				COLORS
	-- #########################################################################
    -- Each of these need to have vocal recorded
	
	self.strings.en.red 		= { text = "red" }
	self.strings.eo.red 		= { text = "ruĝa" }
	self.strings.es.red 		= { text = "rojo" }
	
	self.strings.en.orange 		= { text = "orange" }
	self.strings.eo.orange 		= { text = "oranĝo" }
	self.strings.es.orange 		= { text = "naranja " }
	
	self.strings.en.yellow 		= { text = "yellow" }
	self.strings.eo.yellow 		= { text = "flava" }
	self.strings.es.yellow 		= { text = "amarillo " }
	
	self.strings.en.green 		= { text = "green" }
	self.strings.eo.green 		= { text = "verda" }
	self.strings.es.green 		= { text = "verde " }
	
	self.strings.en.blue 		= { text = "blue" }
	self.strings.eo.blue 		= { text = "blua" }
	self.strings.es.blue 		= { text = "azul " }
	
	self.strings.en.purple 		= { text = "purple" }
	self.strings.eo.purple 		= { text = "purpura" }
	self.strings.es.purple 		= { text = "púrpura " }
	
	self.strings.en.pink 		= { text = "pink" }
	self.strings.eo.pink 		= { text = "rozkolora" }
	self.strings.es.pink 		= { text = "rosa " }
	
	self.strings.en.black 		= { text = "black" }
	self.strings.eo.black 		= { text = "nigra" }
	self.strings.es.black 		= { text = "negro " }
	
	self.strings.en.white 		= { text = "white" }
	self.strings.eo.white 		= { text = "blanka" }
	self.strings.es.white 		= { text = "blanco " }
	
	self.strings.en.grey 		= { text = "gray" }
	self.strings.eo.grey 		= { text = "griza" }
	self.strings.es.grey 		= { text = "gris " }
	
	self.strings.en.brown 		= { text = "brown" }
	self.strings.eo.brown 		= { text = "bruna" }
	self.strings.es.brown 		= { text = "marrón " }
	
	-- #########################################################################
	-- #																																				FAMILY
	-- #########################################################################
	
	-- Common names in target language
	self.strings.en.male_name_1 = { text = "Luke" }
	self.strings.eo.male_name_1 = { text = "Karlo" }
	self.strings.es.male_name_1 = { text = "" }

	self.strings.en.male_name_2 = { text = "Adam" }
	self.strings.eo.male_name_2 = { text = "Omaro" }
	self.strings.es.male_name_2 = { text = "" }

	self.strings.en.male_name_3 = { text = "Josh" }
	self.strings.eo.male_name_3 = { text = "Jeremio" }
	self.strings.es.male_name_3 = { text = "" }
	
	self.strings.en.male_name_4 = { text = "Mike" }
	self.strings.eo.male_name_4 = { text = "Natano" }
	self.strings.es.male_name_4 = { text = "" }
	
	self.strings.en.male_name_5 = { text = "Richard" }
	self.strings.eo.male_name_5 = { text = "Ĝeraldo" }
	self.strings.es.male_name_5 = { text = "" }
	
	self.strings.en.male_name_6 = { text = "Matt" }
	self.strings.eo.male_name_6 = { text = "Eriko" }
	self.strings.es.male_name_6 = { text = "" }
	
	self.strings.en.male_name_7 = { text = "Will" }
	self.strings.eo.male_name_7 = { text = "Denizo" }
	self.strings.es.male_name_7 = { text = "" }
	
	self.strings.en.female_name_1 = { text = "Sarah" }
	self.strings.eo.female_name_1 = { text = "Gerda" }
	self.strings.es.female_name_1 = { text = "" }
	
	self.strings.en.female_name_2 = { text = "Rebecca" }
	self.strings.eo.female_name_2 = { text = "Lucilo" }
	self.strings.es.female_name_2 = { text = "" }
	
	self.strings.en.female_name_3 = { text = "Shannon" }
	self.strings.eo.female_name_3 = { text = "Aprilo" }
	self.strings.es.female_name_3 = { text = "" }
	
	self.strings.en.female_name_4 = { text = "Zoe" }
	self.strings.eo.female_name_4 = { text = "Eliza" }
	self.strings.es.female_name_4 = { text = "" }
	
	self.strings.en.female_name_5 = { text = "Anna" }
	self.strings.eo.female_name_5 = { text = "Iriso" }
	self.strings.es.female_name_5 = { text = "" }
	
	self.strings.en.female_name_6 = { text = "Rose" }
	self.strings.eo.female_name_6 = { text = "Adelo" }
	self.strings.es.female_name_6 = { text = "" }
	
	self.strings.en.female_name_7 = { text = "Angela" }
	self.strings.eo.female_name_7 = { text = "Ada" }
	self.strings.es.female_name_7 = { text = "" }
	
	self.strings.en.grandmother = { text = "grandmother" }
	self.strings.eo.grandmother = { text = "grandmother" }
	self.strings.es.grandmother = { text = "grandmother" }
	
	self.strings.en.grandfather = { text = "grandfather" }
	self.strings.eo.grandfather = { text = "grandfather" }
	self.strings.es.grandfather = { text = "grandfather" }
	
	self.strings.en.mother = { text = "mother" }
	self.strings.eo.mother = { text = "mother" }
	self.strings.es.mother = { text = "mother" }
	
	self.strings.en.father = { text = "father" }
	self.strings.eo.father = { text = "father" }
	self.strings.es.father = { text = "father" }
	
	self.strings.en.wife = { text = "wife" }
	self.strings.eo.wife = { text = "wife" }
	self.strings.es.wife = { text = "wife" }
	
	self.strings.en.husband = { text = "husband" }
	self.strings.eo.husband = { text = "husband" }
	self.strings.es.husband = { text = "husband" }
	
	self.strings.en.daughter = { text = "daughter" }
	self.strings.eo.daughter = { text = "daughter" }
	self.strings.es.daughter = { text = "daughter" }
	
	self.strings.en.son = { text = "son" }
	self.strings.eo.son = { text = "son" }
	self.strings.es.son = { text = "son" }
	
	self.strings.en.sister = { text = "sister" }
	self.strings.eo.sister = { text = "sister" }
	self.strings.es.sister = { text = "sister" }
	
	self.strings.en.brother = { text = "brother" }
	self.strings.eo.brother = { text = "brother" }
	self.strings.es.brother = { text = "brother" }
	
	self.strings.en.granddaughter = { text = "granddaughter" }
	self.strings.eo.granddaughter = { text = "granddaughter" }
	self.strings.es.granddaughter = { text = "granddaughter" }
	
	self.strings.en.grandson = { text = "grandson" }
	self.strings.eo.grandson = { text = "grandson" }
	self.strings.es.grandson = { text = "grandson" }
	
	self.strings.en.aunt = { text = "aunt" }
	self.strings.eo.aunt = { text = "aunt" }
	self.strings.es.aunt = { text = "aunt" }
	
	self.strings.en.uncle = { text = "uncle" }
	self.strings.eo.uncle = { text = "uncle" }
	self.strings.es.uncle = { text = "uncle" }
	
	self.strings.en.cousin_female = { text = "cousin" }
	self.strings.eo.cousin_female = { text = "cousin" }
	self.strings.es.cousin_female = { text = "cousin" }
	
	self.strings.en.cousin_male = { text = "cousin" }
	self.strings.eo.cousin_male = { text = "cousin" }
	self.strings.es.cousin_male = { text = "cousin" }
	
	
	-- #########################################################################
	-- #																																				ANIMALS
	-- #########################################################################
	
	self.strings.en.what_is_that = { text = "What is that?" }
	self.strings.eo.what_is_that = { text = "Kio estas tio?" }
	self.strings.es.what_is_that = { text = "What is that?" }
	
	self.strings.en.ant = { text = "ant" }
	self.strings.eo.ant = { text = "formiko" }
	self.strings.es.ant = { text = "hormiga" }
	
	self.strings.en.attack_ant = { text = "Attack the ant!" }
	self.strings.eo.attack_ant = { text = "Ataku la formikon!" }
	self.strings.es.attack_ant = { text = "Atacar la hormiga!" }
	
	self.strings.en.bear = { text = "bear" }
	self.strings.eo.bear = { text = "urso" }
	self.strings.es.bear = { text = "soportar" }
	
	self.strings.en.attack_bear = { text = "Attack the bear!" }
	self.strings.eo.attack_bear = { text = "Ataku la urson!" }
	self.strings.es.attack_bear = { text = "soportar" }
	
	self.strings.en.bee = { text = "bee" }
	self.strings.eo.bee = { text = "abelo" }
	self.strings.es.bee = { text = "abeja" }
	
	self.strings.en.attack_bee = { text = "Attack the bee!" }
	self.strings.eo.attack_bee = { text = "Ataku la abelon!" }
	self.strings.es.attack_bee = { text = "abeja" }
	
	self.strings.en.bird = { text = "bird" }
	self.strings.eo.bird = { text = "birdo" }
	self.strings.es.bird = { text = "pájaro" }
	
	self.strings.en.attack_bird = { text = "Attack the bird!" }
	self.strings.eo.attack_bird = { text = "Ataku la birdon!" }
	self.strings.es.attack_bird = { text = "pájaro" }
	
	self.strings.en.butterfly = { text = "butterfly" }
	self.strings.eo.butterfly = { text = "papilio" }
	self.strings.es.butterfly = { text = "mariposa" }
	
	self.strings.en.attack_butterfly = { text = "Attack the butterfly!" }
	self.strings.eo.attack_butterfly = { text = "Ataku la papilion!" }
	self.strings.es.attack_butterfly = { text = "mariposa" }
	
	self.strings.en.cat = { text = "cat" }
	self.strings.eo.cat = { text = "kato" }
	self.strings.es.cat = { text = "gato" }
	
	self.strings.en.attack_cat = { text = "Attack the cat!" }
	self.strings.eo.attack_cat = { text = "Ataku la katon!" }
	self.strings.es.attack_cat = { text = "gato" }
	
	self.strings.en.chicken = { text = "chicken" }
	self.strings.eo.chicken = { text = "koko" }
	self.strings.es.chicken = { text = "pollo" }
	
	self.strings.en.attack_chicken = { text = "Attack the chicken!" }
	self.strings.eo.attack_chicken = { text = "Ataku la kokon!" }
	self.strings.es.attack_chicken = { text = "pollo" }
	
	self.strings.en.cow = { text = "cow" }
	self.strings.eo.cow = { text = "bovino" }
	self.strings.es.cow = { text = "vaca" }
	
	self.strings.en.attack_cow = { text = "Attack the cow!" }
	self.strings.eo.attack_cow = { text = "Ataku la bovinon!" }
	self.strings.es.attack_cow = { text = "vaca" }
	
	self.strings.en.crab = { text = "crab" }
	self.strings.eo.crab = { text = "krabo" }
	self.strings.es.crab = { text = "cangrejo" }
	
	self.strings.en.attack_crab = { text = "Attack the crab!" }
	self.strings.eo.attack_crab = { text = "Ataku la krabon!" }
	self.strings.es.attack_crab = { text = "cangrejo" }
	
	self.strings.en.crocodile = { text = "crocodile" }
	self.strings.eo.crocodile = { text = "krokodilo" }
	self.strings.es.crocodile = { text = "cocodrilo" }
	
	self.strings.en.attack_crocodile = { text = "Attack the crocodile!" }
	self.strings.eo.attack_crocodile = { text = "Ataku la krokodilon!" }
	self.strings.es.attack_crocodile = { text = "cocodrilo" }
	
	self.strings.en.dog = { text = "dog" }
	self.strings.eo.dog = { text = "hundo" }
	self.strings.es.dog = { text = "perro" }
	
	self.strings.en.attack_dog = { text = "Attack the dog!" }
	self.strings.eo.attack_dog = { text = "Ataku la hundon!" }
	self.strings.es.attack_dog = { text = "perro" }
	
	self.strings.en.dolphin = { text = "dolphin" }
	self.strings.eo.dolphin = { text = "delfeno" }
	self.strings.es.dolphin = { text = "delfín" }
	
	self.strings.en.attack_dolphin = { text = "Attack the dolphin!" }
	self.strings.eo.attack_dolphin = { text = "Ataku la delfenon!" }
	self.strings.es.attack_dolphin = { text = "delfín" }
	
	self.strings.en.elephant = { text = "elephant" }
	self.strings.eo.elephant = { text = "elefanto" }
	self.strings.es.elephant = { text = "elefante" }
	
	self.strings.en.attack_elephant = { text = "Attack the elephant!" }
	self.strings.eo.attack_elephant = { text = "Ataku la elefanton!" }
	self.strings.es.attack_elephant = { text = "elefante" }
	
	self.strings.en.fox = { text = "fox" }
	self.strings.eo.fox = { text = "vulpo" }
	self.strings.es.fox = { text = "zorro" }
	
	self.strings.en.attack_fox = { text = "Attack the fox!" }
	self.strings.eo.attack_fox = { text = "Ataku la vulpon!" }
	self.strings.es.attack_fox = { text = "zorro" }
	
	self.strings.en.frog = { text = "frog" }
	self.strings.eo.frog = { text = "rano" }
	self.strings.es.frog = { text = "rana" }
	
	self.strings.en.attack_frog = { text = "Attack the frog!" }
	self.strings.eo.attack_frog = { text = "Ataku la ranon!" }
	self.strings.es.attack_frog = { text = "rana" }
	
	self.strings.en.kangaroo = { text = "kangaroo" }
	self.strings.eo.kangaroo = { text = "kanguruo" }
	self.strings.es.kangaroo = { text = "canguro" }
	
	self.strings.en.attack_kangaroo = { text = "Attack the kangaroo!" }
	self.strings.eo.attack_kangaroo = { text = "Ataku la kanguruon!" }
	self.strings.es.attack_kangaroo = { text = "canguro" }
	
	self.strings.en.lion = { text = "lion" }
	self.strings.eo.lion = { text = "leono" }
	self.strings.es.lion = { text = "león" }
	
	self.strings.en.attack_lion = { text = "Attack the lion!" }
	self.strings.eo.attack_lion = { text = "Ataku la leonon!" }
	self.strings.es.attack_lion = { text = "león" }
	
	self.strings.en.llama = { text = "llama" }
	self.strings.eo.llama = { text = "lamo" }
	self.strings.es.llama = { text = "llama" }
	
	self.strings.en.attack_llama = { text = "Attack the llama!" }
	self.strings.eo.attack_llama = { text = "Ataku la lamon!" }
	self.strings.es.attack_llama = { text = "llama" }
	
	self.strings.en.monkey = { text = "monkey" }
	self.strings.eo.monkey = { text = "simio" }
	self.strings.es.monkey = { text = "mono" }
	
	self.strings.en.attack_monkey = { text = "Attack the monkey!" }
	self.strings.eo.attack_monkey = { text = "Ataku la simion!" }
	self.strings.es.attack_monkey = { text = "mono" }
	
	self.strings.en.moose = { text = "moose" }
	self.strings.eo.moose = { text = "alko" }
	self.strings.es.moose = { text = "alce" }
	
	self.strings.en.attack_moose = { text = "Attack the moose!" }
	self.strings.eo.attack_moose = { text = "Ataku la alkon!" }
	self.strings.es.attack_moose = { text = "alce" }
	
	self.strings.en.mouse = { text = "mouse" }
	self.strings.eo.mouse = { text = "muso" }
	self.strings.es.mouse = { text = "atón" }
	
	self.strings.en.attack_mouse = { text = "Attack the mouse!" }
	self.strings.eo.attack_mouse = { text = "Ataku la muson!" }
	self.strings.es.attack_mouse = { text = "atón" }
	
	self.strings.en.owl = { text = "owl" }
	self.strings.eo.owl = { text = "strigo" }
	self.strings.es.owl = { text = "búho" }
	
	self.strings.en.attack_owl = { text = "Attack the owl!" }
	self.strings.eo.attack_owl = { text = "Ataku la strigon!" }
	self.strings.es.attack_owl = { text = "búho" }
	
	self.strings.en.penguin = { text = "penguin" }
	self.strings.eo.penguin = { text = "pingveno" }
	self.strings.es.penguin = { text = "pingüino" }
	
	self.strings.en.attack_penguin = { text = "Attack the penguin!" }
	self.strings.eo.attack_penguin = { text = "Ataku la pingvenon!" }
	self.strings.es.attack_penguin = { text = "pingüino" }
	
	self.strings.en.pig = { text = "pig" }
	self.strings.eo.pig = { text = "porko" }
	self.strings.es.pig = { text = "cerdo" }
	
	self.strings.en.attack_pig = { text = "Attack the pig!" }
	self.strings.eo.attack_pig = { text = "Ataku la porkon!" }
	self.strings.es.attack_pig = { text = "cerdo" }
	
	self.strings.en.rabbit = { text = "rabbit" }
	self.strings.eo.rabbit = { text = "kuniklo" }
	self.strings.es.rabbit = { text = "conejo" }
	
	self.strings.en.attack_rabbit = { text = "Attack the rabbit!" }
	self.strings.eo.attack_rabbit = { text = "Ataku la kuniklon!" }
	self.strings.es.attack_rabbit = { text = "conejo" }
	
	self.strings.en.seal = { text = "seal" }
	self.strings.eo.seal = { text = "foko" }
	self.strings.es.seal = { text = "foca" }
	
	self.strings.en.attack_seal = { text = "Attack the seal!" }
	self.strings.eo.attack_seal = { text = "Ataku la fokon!" }
	self.strings.es.attack_seal = { text = "foca" }
	
	self.strings.en.sheep = { text = "sheep" }
	self.strings.eo.sheep = { text = "ŝafo" }
	self.strings.es.sheep = { text = "oveja" }
	
	self.strings.en.attack_sheep = { text = "Attack the sheep!" }
	self.strings.eo.attack_sheep = { text = "Ataku la ŝafon!" }
	self.strings.es.attack_sheep = { text = "oveja" }
	
	self.strings.en.skunk = { text = "skunk" }
	self.strings.eo.skunk = { text = "mefito" }
	self.strings.es.skunk = { text = "mofeta" }
	
	self.strings.en.attack_skunk = { text = "Attack the skunk!" }
	self.strings.eo.attack_skunk = { text = "Ataku la mefiton!" }
	self.strings.es.attack_skunk = { text = "mofeta" }
	
	self.strings.en.snake = { text = "snake" }
	self.strings.eo.snake = { text = "serpento" }
	self.strings.es.snake = { text = "serpiente" }
	
	self.strings.en.attack_snake = { text = "Attack the snake!" }
	self.strings.eo.attack_snake = { text = "Ataku la serpenton!" }
	self.strings.es.attack_snake = { text = "serpiente" }
	
	self.strings.en.squirrel = { text = "squirrel" }
	self.strings.eo.squirrel = { text = "sciuro" }
	self.strings.es.squirrel = { text = "ardilla" }
	
	self.strings.en.attack_squirrel = { text = "Attack the squirrel!" }
	self.strings.eo.attack_squirrel = { text = "Ataku la sciuron!" }
	self.strings.es.attack_squirrel = { text = "ardilla" }
	
	self.strings.en.turkey = { text = "turkey" }
	self.strings.eo.turkey = { text = "meleagro" }
	self.strings.es.turkey = { text = "pavo" }
	
	self.strings.en.attack_turkey = { text = "Attack the turkey!" }
	self.strings.eo.attack_turkey = { text = "Ataku la meleagron!" }
	self.strings.es.attack_turkey = { text = "pavo" }
	
	self.strings.en.turtle = { text = "turtle" }
	self.strings.eo.turtle = { text = "testudo" }
	self.strings.es.turtle = { text = "tortuga" }
	
	self.strings.en.attack_turtle = { text = "Attack the turtle!" }
	self.strings.eo.attack_turtle = { text = "Ataku la testudon!" }
	self.strings.es.attack_turtle = { text = "tortuga" }
	
	self.strings.en.whale = { text = "whale" }
	self.strings.eo.whale = { text = "baleno" }
	self.strings.es.whale = { text = "ballena" }
	
	self.strings.en.attack_whale = { text = "Attack the whale!" }
	self.strings.eo.attack_whale = { text = "Ataku la balenon!" }
	self.strings.es.attack_whale = { text = "ballena" }
	
	-- #########################################################################
	-- #																																				COMICS
	-- #########################################################################
	
	self.strings.en.lostcat_title = { text = "Lost Cat" }
	self.strings.eo.lostcat_title = { text = "Perdita Kato" }
	self.strings.es.lostcat_title = { text = "" }
	
	self.strings.en.lostcat1 = { text = "Hello, Adelle! What are you doing?" }
	self.strings.eo.lostcat1 = { text = "Saluton, Adelo! Kion vi faras?" }
	self.strings.es.lostcat1 = { text = "Hola, Adelo! Qué estás haciendo?" }
	
	self.strings.en.lostcat2 = { text = "My cat, Fuzzy Foot, is missing!" }
	self.strings.eo.lostcat2 = { text = "Mia kato, Nebula Piedo, estas perdita!" }
	self.strings.es.lostcat2 = { text = "Hola, Adelo! Qué estás haciendo?" }
	
	self.strings.en.lostcat3 = { text = "So I am posting flyers." }
	self.strings.eo.lostcat3 = { text = "Do mi afiŝas afiŝojn." }
	self.strings.es.lostcat3 = { text = "" }
	
	self.strings.en.lostcat4 = { text = "Oh no! I will look for your cat!" }
	self.strings.eo.lostcat4 = { text = "Ho, ne! Mi traserĉos por via kato!" }
	self.strings.es.lostcat4 = { text = "" }
	
	self.strings.en.lostcat5 = { text = "Thank you, Belinda!" }
	self.strings.eo.lostcat5 = { text = "Dankon, Belindo!" }
	self.strings.es.lostcat5 = { text = "" }
	
	self.strings.en.lostcat6 = { text = "Where was the last place you saw her?" }
	self.strings.eo.lostcat6 = { text = "Kie vi vidis ŝin antaŭe?" }
	self.strings.es.lostcat6 = { text = "" }
	
	self.strings.en.lostcat7 = { text = "At my house." }
	self.strings.eo.lostcat7 = { text = "Ĉe mia domo." }
	self.strings.es.lostcat7 = { text = "" }
	
	self.strings.en.lostcat8 = { text = "How did Fuzzy Foot escape?" }
	self.strings.eo.lostcat8 = { text = "Kiel 'Nebula Piedo' eskapis?" }
	self.strings.es.lostcat8 = { text = "" }
	
	self.strings.en.lostcat9 = { text = "It escaped when I opened the door." }
	self.strings.eo.lostcat9 = { text = "Ĝi eskapis kiam mi malfermis la pordon." }
	self.strings.es.lostcat9 = { text = "" }
	
	self.strings.en.lostcat10 = { text = "I'll check the bushes." }
	self.strings.eo.lostcat10 = { text = "Mi traserĉas arbustojn." }
	self.strings.es.lostcat10 = { text = "" }
	
	self.strings.en.lostcat11 = { text = "You check the trees!" }
	self.strings.eo.lostcat11 = { text = "Vi traserĉu la arbojn!" }
	self.strings.es.lostcat11 = { text = "" }
	
	self.strings.en.lostcat12 = { text = "There are only bugs here." }
	self.strings.eo.lostcat12 = { text = "Nur insektoj ĉi tie." }
	self.strings.es.lostcat12 = { text = "" }
	
	self.strings.en.lostcat13 = { text = "There are only squirrels in the trees!" }
	self.strings.eo.lostcat13 = { text = "Nur sciuroj en la arboj!" }
	self.strings.es.lostcat13 = { text = "" }
	
	self.strings.en.lostcat14 = { text = "Let's search at the cafe!" }
	self.strings.eo.lostcat14 = { text = "Ni traserĉu ĉe la kafejo!" }
	self.strings.es.lostcat14 = { text = "" }
	
	self.strings.en.lostcat15 = { text = "What would you two like?" }
	self.strings.eo.lostcat15 = { text = "Kion vi du ŝatus?" }
	self.strings.es.lostcat15 = { text = "" }
	
	self.strings.en.lostcat16 = { text = "I would like coffee." }
	self.strings.eo.lostcat16 = { text = "Mi ŝatus kafon." }
	self.strings.es.lostcat16 = { text = "" }
	
	self.strings.en.lostcat17 = { text = "Can I have tea?" }
	self.strings.eo.lostcat17 = { text = "Ĉu mi povas havi teon?" }
	self.strings.es.lostcat17 = { text = "" }
	
	self.strings.en.lostcat18 = { text = "I will be right back." }
	self.strings.eo.lostcat18 = { text = "Mi revenos baldaŭ." }
	self.strings.es.lostcat18 = { text = "" }
	
	self.strings.en.lostcat19 = { text = "I don't know where to search." }
	self.strings.eo.lostcat19 = { text = "Mi ne scias kie traserĉi..." }
	self.strings.es.lostcat19 = { text = "" }
	
	self.strings.en.lostcat20 = { text = "Don't lose hope!" }
	self.strings.eo.lostcat20 = { text = "Ne perdu esperon!" }
	self.strings.es.lostcat20 = { text = "" }
	
	self.strings.en.lostcat21 = { text = "Do you need anything else?" }
	self.strings.eo.lostcat21 = { text = "Ĉu vi bezonas ion ajn?" }
	self.strings.es.lostcat21 = { text = "" }
	
	self.strings.en.lostcat22 = { text = "How about a cat?" }
	self.strings.eo.lostcat22 = { text = "Kio pri kato?" }
	self.strings.es.lostcat22 = { text = "" }
	
	self.strings.en.lostcat23 = { text = "Like this cat?" }
	self.strings.eo.lostcat23 = { text = "Kia ĉi tiu kato?" }
	self.strings.es.lostcat23 = { text = "" }
	
	self.strings.en.lostcat24 = { text = "Fuzzy Foot!" }
	self.strings.eo.lostcat24 = { text = "Nebula Piedo" }
	self.strings.es.lostcat24 = { text = "" }
	
	self.strings.en.lostcat25 = { text = "Thank you for finding her!" }
	self.strings.eo.lostcat25 = { text = "Dankon por trovis ŝin!" }
	self.strings.es.lostcat25 = { text = "" }
	
	self.strings.en.lostcat26 = { text = "Fuzzy Foot has returned!" }
	self.strings.eo.lostcat26 = { text = "Nebula Piedo revenas!" }
	self.strings.es.lostcat26 = { text = "" }
	
	self.strings.en.lostcat27 = { text = "The End" }
	self.strings.eo.lostcat27 = { text = "La Fino" }
	self.strings.es.lostcat27 = { text = "" }
	
end

function LanguageManager:GetString( key )
	local currentLanguage = self.languages[ self.currentLanguage ]
	if ( self.strings[ currentLanguage ][ key ] ~= nil ) then
		return self.strings[ currentLanguage ][ key ]["text"]
	else
		return "ERROR"
	end
end

function LanguageManager:GetPosition( key )
	local currentLanguage = self.languages[ self.currentLanguage ]
	return self.strings[ currentLanguage ][ key ]["posX"]
end

function LanguageManager:SetLanguage( language )
	for key, value in pairs( self.languages ) do
		if value == language then
			self.currentLanguage = key
		end
	end
end

function LanguageManager:GetLanguage()
	return self.languages[ self.currentLanguage ]
end


