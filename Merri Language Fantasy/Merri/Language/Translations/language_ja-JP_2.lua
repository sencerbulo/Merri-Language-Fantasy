-- This file is Japanese, using only Hiragana and Katakana.
function SetupJapanese()
    local helper = {};      local target = {}
    
    -- Translations --
    
    -- CREDITS SCREEN
    helper[ "Translators" ]             = "ほんやく"              -- Header text: "Translators" for Translator credits section
    helper[ "language-name" ]           = "にほんご"              -- Name of this language (match this language file)
    helper[ "Translation Credits" ]     = "Nadipedia"           -- Translators, append your name to the list.
    
    helper[ "website" ]                 = "ウェブサイト"            -- Label for homepage URL
    target[ "website" ] = helper[ "website" ]                   -- Ignore this
    
    helper[ "facebook" ]                = "フェイスブック"           -- Label for Facebook URL
    target[ "facebook" ] = helper[ "facebook" ]                 -- Ignore this
    
    helper[ "twitter" ]                 = "ツイッター"            -- Label for Twitter URL
    target[ "twitter" ] = helper[ "twitter" ]                   -- Ignore this
    
    -- GAME TITLE
    target[ "game title" ]              = "ジャパニーズ・ファンタジー"     -- Translate as "Fantasy of ____" for your language. (e.g., Fantazio de Esperanto)
    
    -- DEMO TEXT (Temporary)
    target[ "Thank you for trying out Merri" ]                  = "ためして　くれて　ありがとう　メッリ！"
    target[ "This is still a work in progress" ]                = "まだ　さぎょうちゅう。"
    target[ "There may be errors or bugs" ]                     = "エラー　か　バグ　が　ある　もよう。"
    target[ "Report problems at EMAIL" ]                        = "Rachel@Moosader.com　に　もんだい　を　ほうこく。"
    target[ "Want to keep up with this game's progress?" ]      = "ゲーム　の　けいか　を　セーブ　する？"
    
    -- Ignore this block
    helper[ "Thank you for trying out Merri" ] = target[ "Thank you for trying out Merri" ]
    helper[ "This is still a work in progress" ] = target[ "This is still a work in progress" ]
    helper[ "There may be errors or bugs" ] = target[ "There may be errors or bugs" ]
    helper[ "Report problems at EMAIL" ] = target[ "Report problems at EMAIL" ]
    helper[ "Want to keep up with this game's progress?" ] = target[ "Want to keep up with this game's progress?" ]
    -- End ignore
        
    -- MAIN MENU BUTTONS
    target[ "play" ]                    = "プレイ"                -- Button to begin the game
    target[ "previous" ]                = "まえ　へ"              -- Go backward one page (one menu)
    target[ "next" ]                    = "つぎ　へ"              -- Go forward one page (one menu)
    target[ "options" ]                 = "オプション"             -- Configure options in a game
    target[ "help" ]                    = "ヘルプ"                -- Get help / instructions for a game or function
    target[ "menu" ]                    = "メニュー"              -- Open up sub-menu screen
    target[ "close-menu" ]              = "もどる"                -- Close sub-menu
    target[ "back" ] = target[ "close-menu" ]                   -- Ignore this
    target[ "progress" ]                = ""                    -- Progress / Statistics menu
    helper[ "progress" ] = target[ "progress" ]
    
    -- Difficulty levels
    helper[ "Practice" ]  = "れんしゅう"
    helper[ "Easy" ]      = "かんたん"
    helper[ "Medium" ]    = "ふつう"
    helper[ "Hard" ]      = "むずかしい"
    
    -- Ignore this block
    target[ "Practice" ] = helper[ "Practice" ]
    target[ "Easy" ] = helper[ "Easy" ]
    target[ "Medium" ] = helper[ "Medium" ]
    target[ "Hard" ] = helper[ "Hard" ]
    -- End ignore
    
    -- COMMON GAME TEXT
    target[ "Earned a star" ]           = "ほし　を　てにいれた！"
    helper[ "Earned a star" ] = target[ "Earned a star" ]       -- Ignore this
    
    --------------------------
    -- MINER MINI-GAME TEXT --
    --------------------------
    -- Stats
    target[ "Miner" ]                   = "たんこうふ"               -- Male miner (temporary)
    target[ "Floor" ]                   = "フロア:"              -- How many floors down you have traveled in the mine
    target[ "Money" ]                   = "おかね:"              -- The amount of (generic) money you've earned
    target[ "Health" ]                  = "ヘルス:"             -- Amount of hits you have before you die
    
    -- Messages
    target[ "Game Over" ]               = "ゲームオーバー"
    helper[ "Game Over" ] = target[ "Game Over" ]   -- Ignore this
    
    
    -- Enemies
    target[ "snail" ]                   = "かたつむり"
    target[ "mole" ]                    = "もぐら"
    target[ "mushroom" ]                = "きのこ"
    target[ "bat" ]                     = "こうもり"
    target[ "rabbit" ]                  = "うさぎ"
    target[ "snake" ]                   = "へび"
    target[ "skeleton" ]                = "がいこつ"
    target[ "moose" ]                   = "へらじか"
    
    -- Items
    target[ "rock" ]                    = "いわ"                -- Large stone to break open with a pickaxe
    target[ "star" ]                    = "ほし"
    target[ "sandwich" ]                = "サンドイッチ"
    target[ "amethyst" ]                = "アメジスト"
    target[ "sapphire" ]                = "サファイア"
    target[ "diamond" ]                 = "ダイヤモンド"
    target[ "emerald" ]                 = "エメラルド"
    target[ "ruby" ]                    = "ルビー"
    target[ "copper" ]                  = "コッパー"              -- It is a copper coin
    target[ "silver" ]                  = "シルバー"
    target[ "gold" ]                    = "ゴールド"
    target[ "ladder" ]                  = "はしご"              -- Ladder to climb down one floor
    
    -- Shopkeeper Dialogue
    target[ "Do you want to buy a tool?" ]    = "どうぐ　を　かいたい？"
    target[ "You don't have enough money" ]   = "おかね　が　たりないよ。"
    
    -- Button options
    target[ "Don't buy anything" ]      = "なにも　かわない。" -- Click to leave the store, nobody is saying this line it is a button.
    target[ "Price" ]                   = "ねだん:"              -- Price label
    
    -- Item names and descriptions
    target[ "Potion" ]                  = "ポーション"              -- Restores health
    target[ "PotionDescription" ]       = "ヘルス　を　かいふく。"
    target[ "Earthquake" ]              = "じしん"
    target[ "EarthquakeDescription" ]   = "すべての　いわ　を　こわす。"
    target[ "Dynamite" ]                = "ダイナマイト"
    target[ "DynamiteDescription" ]     = "した　の　かい　に　おりる。"
    target[ "Rope" ]                    = "ロープ"
    target[ "RopeDescription" ]         = "うえ　の　かい　に　あがる。"
    target[ "Blizzard" ]                = "ブリザード"
    target[ "BlizzardDescription" ]     = "すべて　の　てき　を　フリーズ。"
    
    -- Narration
    target[ "miner-begin" ]             = "Mine for treasure and stay alive!"
    target[ "miner-move-north" ]        = "You walk north."
    target[ "miner-move-south" ]        = "You walk south."
    target[ "miner-move-east" ]         = "You walk east."
    target[ "miner-move-west" ]         = "You walk west."
    target[ "miner-mine" ]              = "You swing your pick."
    target[ "miner-eat-sandwich" ]      = "You eat the cave sandwich."
    target[ "use-earthquake" ]          = "The earth shakes violently."
    target[ "use-blizzard" ]            = "Everything freezes over." 
    target[ "enemies-thaw" ]            = "Everything has thawed out."
    target[ "use-potion" ]              = "You feel strong again."
    target[ "miner-collect-copper" ]    = "You pick up copper."
    target[ "miner-collect-silver" ]    = "You pick up silver."
    target[ "miner-collect-gold" ]      = "You pick up gold."
    target[ "miner-collect-amethyst" ]  = "You pick up amethyst."
    target[ "miner-collect-sapphire" ]  = "You pick up sapphire."
    target[ "miner-collect-diamond" ]   = "You pick up diamond."
    target[ "miner-collect-emerald" ]   = "You pick up emerald."
    target[ "miner-collect-ruby" ]      = "You pick up ruby."
    target[ "miner-attack-snail" ]      = "You attack the snail."
    target[ "miner-attack-mole" ]       = "You attack the mole."
    target[ "miner-attack-mushroom" ]   = "You attack the mushroom."
    target[ "miner-attack-bat" ]        = "You attack the bat."
    target[ "miner-attack-rabbit" ]     = "You attack the rabbit."
    target[ "miner-attack-snake" ]      = "You attack the snake."
    target[ "miner-attack-moose" ]      = "You attack the moose."
    target[ "miner-attack-skeleton" ]   = "You attack the skeleton."
    target[ "miner-go-down-ladder" ]    = "You descend the ladder."
    target[ "miner-rope" ]              = "You flee upward by using the rope."
    target[ "miner-dynamite" ]          = "You flee downward by using the dynamite."
    target[ "miner-died" ]              = "You have been killed."
    
end
