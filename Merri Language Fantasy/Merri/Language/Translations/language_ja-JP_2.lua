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
    target[ "miner-begin" ]             = "たから　を　ほりだして　げんき　を　キープ！"
    target[ "miner-move-north" ]        = "きた　へ　あるく。"
    target[ "miner-move-south" ]        = "みなみ　へ　あるく。"
    target[ "miner-move-east" ]         = "ひがし　へ　あるく。"
    target[ "miner-move-west" ]         = "にし　へ　あるく。"
    target[ "miner-mine" ]              = "つるはし　を　ふるう。"
    target[ "miner-eat-sandwich" ]      = "ほらあな　サンドイッチ　を　たべる。"
    target[ "use-earthquake" ]          = "じめん　が　はげしく　ゆれる。"
    target[ "use-blizzard" ]            = "すべての　もの　が　こおる。"
    target[ "enemies-thaw" ]            = "すべての　もの　が　とけてしまった。"
    target[ "use-potion" ]              = "ちから　が　もどった。"
    target[ "miner-collect-cooper" ]    = "コッパー　を　ゲット。"
    target[ "miner-collect-silver" ]    = "シルバー　を　ゲット。"
    target[ "miner-collect-gold" ]      = "ゴールド　を　ゲット。"
    target[ "miner-collect-amethyst" ]  = "ｱﾒｼﾞｽﾄ を　ゲット。"
    target[ "miner-collect-sapphire" ]  = "サファイア　を　ゲット。"
    target[ "miner-collect-diamond" ]   = "ダイアモンド　を　ゲット。"
    target[ "miner-collect-emerald" ]   = "エメラルド　を　ゲット。"
    target[ "miner-collect-ruby" ]      = "ルビー　を　ゲット。"
    target[ "miner-attack-snail" ]      = "かたつむり　を　こうげき。"
    target[ "miner-attack-mole" ]       = "もぐら　を　こうげき。"
    target[ "miner-attack-mushroom" ]   = "きのこ　を　こうげき。"
    target[ "miner-attack-bat" ]        = "こうもり　を　こうげき。"
    target[ "miner-attack-rabbit" ]     = "うさぎ　を　こうげき。"
    target[ "miner-attack-snake" ]      = "へび　を　こうげき。"
    target[ "miner-attack-moose" ]      = "へらじか　を　こうげき。"
    target[ "miner-attack-skeleton" ]   = "がいこつ　を　こうげき。"
    target[ "miner-go-down-ladder" ]    = "はしご　を　おりる。"
    target[ "miner-rope" ]              = "ロープ　で　うえに　にげる。"
    target[ "miner-dynamite" ]          = "ダイナマイト　で　したに　にげる。"
    target[ "miner-died" ]              = "ころされて　しまった。"
    
	return helper, target    
end
