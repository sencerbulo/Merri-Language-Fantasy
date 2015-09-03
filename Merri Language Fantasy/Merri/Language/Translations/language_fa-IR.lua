-- Reference "language_en-US.lua" for dialogue lines
function SetupFarsi()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "مترجم‌ها"                    -- Header text: "Translators" for Translator credits section
    helper[ "language-name" ]           = "فارسی"                    -- Name of this language (match this language file)
    helper[ "Translation Credits" ]     = "Ali H."                    -- Translators, append your name to the list.
    
    helper[ "website" ]                 = ":وبگاه"                    -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                =  ":فیس‌بوک"                  -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = ":توییتر"                  -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "فانتزی فارسی"                    -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  =".مری! ممنون از این‌که تلاش کردی"
    target[ "This is still a work in progress" ]                =  ".این [بازی] هنوز در دست ساخت است"
    target[ "There may be errors or bugs" ]                     =  ".ممکن است اشتباه یا باگ‌هایی وجود داشته باشند"
    target[ "Report problems at EMAIL" ]                        = "Rachel@Moosader.com مشکلات را گزارش کنید به"
    target[ "Want to keep up with this game's progress?" ]      =  "می‌خواهید از پیشرفت‌های این بازی باخبر باشید؟"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "!شروع"                   -- Button to begin the game
    target[ "previous" ]                = "قبلی"                  -- Go backward one page (one menu)
    target[ "next" ]                    = "ادامه"                   -- Go forward one page (one menu)
    target[ "options" ]                 = "گزینه‌ها"                 -- Configure options in a game
    target[ "help" ]                    = "کمک"                   -- Get help / instructions for a game or function
    target[ "menu" ]                    =  "منو"               -- Open up sub-menu screen
    target[ "close-menu" ]              =  "بازگشت"                  -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = ""                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "تمرین"
    helper[ "Easy" ]      = "آسان"
    helper[ "Medium" ]    = "میانی"
    helper[ "Hard" ]      = "دشوار"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           =  "!یک ستاره گرفتید"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "معدنچی"                    -- Male miner (temporary)
    target[ "Floor" ]                   =":طبقه"                   -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = ":پول"                  -- The amount of (generic) money you've earned
    target[ "Health" ]                  =  ":سلامتی"                   -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               =  "بازی تمام شد"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "حلزون"
    target[ "mole" ]                    = "موش کور"
    target[ "mushroom" ]                = "قارچ"
    target[ "bat" ]                     = "خفاش"
    target[ "rabbit" ]                  = "خرگوش"
    target[ "snake" ]                   =  "مار"
    target[ "skeleton" ]                ="اسکلت"
    target[ "moose" ]                   = "گوزن"
    
    -- Items
    target[ "rock" ]                    =  "سنگ"                    -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "ستاره"
    target[ "sandwich" ]                = "ساندویچ"
    target[ "amethyst" ]                =  "آمیتیست"
    target[ "sapphire" ]                ="یاقوت کبود"
    target[ "diamond" ]                 =  "الماس"
    target[ "emerald" ]                 = "زمرد"
    target[ "ruby" ]                    = "یاقوت سرخ"
    target[ "copper" ]                  =  "مس"                    -- It is a copper coin
    target[ "silver" ]                  = "نقره"
    target[ "gold" ]                    = "طلا"
    target[ "ladder" ]                  =  "نردبان"                  -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    =  "آیا می‌خواهید یک ابزار بخرید؟"
    target[ "You don't have enough money" ]   = ".پول کافی ندارید"
    
    -- Button options
    target[ "Don't buy anything" ]      =  ".هیچ چیز نخر"                   -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   =  "قیمت"                   -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "معجون"                  -- Restores health
    target[ "PotionDescription" ]       =  ".تمام سلامتی شما را بازمی‌گرداند"
    target[ "Earthquake" ]              = "زلزله"
    target[ "EarthquakeDescription" ]   =  ".تمام سنگ‌ها را می‌شکند"
    target[ "Dynamite" ]                = "دینامیت"
    target[ "DynamiteDescription" ]     =".یک طبقه پایین می‌روید"
    target[ "Rope" ]                    = "طناب"
    target[ "RopeDescription" ]         = ".یک طبقه بالا می‌روید"
    target[ "Blizzard" ]                ="کولاک"
    target[ "BlizzardDescription" ]     =  ".همه‌ی دشمن‌ها یخ می‌زنند"
    
    -- Narration
    target[ "miner-begin" ]             = "!برای گنج حفر کن و زنده بمان"
    target[ "miner-move-north" ]        = ".به سمت شمال راه می‌روید"
    target[ "miner-move-south" ]        = ".به سمت جنوب راه می‌روید"
    target[ "miner-move-east" ]         = ".به سمت شرق راه می‌روید"
    target[ "miner-move-west" ]         = ".به سمت جنوب راه می‌روید"
    target[ "miner-mine" ]              = ".با کلنگ ضربه می‌زنید"
    target[ "miner-eat-sandwich" ]      = ".ساندویچ غاری را می‌خورید"
    target[ "use-earthquake" ]          = ".زمین به شدت می‌لرزد"
    target[ "use-blizzard" ]            = ".همه چیز یخ می‌زند"
    target[ "enemies-thaw" ]            = ".همه چیز ذوب شده است"
    target[ "use-potion" ]              = ".دوباره احساس قدرت می‌کنید"
    target[ "miner-collect-cooper" ]    = ".مقداری مس برمی‌دارید"
    target[ "miner-collect-silver" ]    = ".مقداری نقره برمی‌دارید"
    target[ "miner-collect-gold" ]      = ".مقداری طلا برمی‌دارید"
    target[ "miner-collect-amethyst" ]  = ".مقداری مس برمی‌دارید"
    target[ "miner-collect-sapphire" ]  = ".مقداری یاقوت کبود برمی‌دارید"
    target[ "miner-collect-diamond" ]   = ".مقداری الماس برمی‌دارید"
    target[ "miner-collect-emerald" ]   = ".مقداری زمرد برمی‌دارید"
    target[ "miner-collect-ruby" ]      = ".مقداری یاقوت سرخ برمی‌دارید"
    target[ "miner-attack-snail" ]      = ".به حلزون حمله می‌کنید"
    target[ "miner-attack-mole" ]       = ".به موش کور حمله می‌کنید"
    target[ "miner-attack-mushroom" ]   = ".به قارچ حمله می‌کنید"
    target[ "miner-attack-bat" ]        = ".به خفاش حمله می‌کنید"
    target[ "miner-attack-rabbit" ]     = ".به خرگوش حمله می‌کنید"
    target[ "miner-attack-snake" ]      = ".به مار حمله می‌کنید"
    target[ "miner-attack-moose" ]      = ".به گوزن می‌کنید"
    target[ "miner-attack-skeleton" ]   = ".به اسکلت حمله می‌کنید"
    target[ "miner-go-down-ladder" ]    = ".از نردبان پایین می‌روید"
    target[ "miner-rope" ]              = ".با طناب به سمت بالا فرار می‌کنید"
    target[ "miner-dynamite" ]          = ".با دینامیت رو به پایین فرار می‌کنید"
    target[ "miner-died" ]              = ".شما کشته شدید"
    
	return helper, target    
end
