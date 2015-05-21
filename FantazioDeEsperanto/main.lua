SCREEN_WIDTH = 320
SCREEN_HEIGHT = 480

languageManager = LanguageManager.new( { language = "eo" } )

saveManager = SaveLoadManager.new()

fontManager = FontManager.new()
audioManager = AudioManager.new()
optionsManager = OptionsManager.new( { demo = false } )

-- Create various states
states = {}
table.insert( states, TitleState.new(               { name = "title" } ) )
table.insert( states, SelectState.new(              { name = "select" } ) )

table.insert( states, CategoryFoodState.new(        { name = "category_food" } ) )
table.insert( states, CategoryNumberState.new(      { name = "category_number" } ) )
table.insert( states, CategoryClothesState.new(     { name = "category_clothes" } ) )

table.insert( states, CategoryColorState.new(       { name = "category_color" } ) )
table.insert( states, CategoryAnimalState.new(      { name = "category_animal" } ) )
table.insert( states, CategoryComicState.new(       { name = "category_comic" } ) )

--table.insert( states, CategoryCalendarState.new(    { name = "category_calendar" } ) )
--table.insert( states, CategoryLocationState.new(    { name = "category_location" } ) )
--table.insert( states, CategoryFamilyState.new(      { name = "category_family" } ) )

StateManager:init()  
StateManager:StateSetup( "title" )
--StateManager:StateSetup( "category_comic" )

border = Bitmap.new( Texture.new( "content/graphics/ui/border.png" ) )
border:setPosition( -40, -80 )
stage:addChild( border )
