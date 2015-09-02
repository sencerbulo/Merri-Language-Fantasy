GameText  = Core.class()

function GameText:SetupLanguages()
GameText.LastUpdated = {}

-- Esperanto:       https://en.wikipedia.org/wiki/Esperanto
-- Ido:             https://en.wikipedia.org/wiki/Ido_%28language%29
-- Ithkuil:         https://en.wikipedia.org/wiki/Ithkuil
-- Interlingua:     https://en.wikipedia.org/wiki/Interlingua
    
GameText.HelperText.English = {}
GameText.TargetText.English = {}
GameText.LastUpdated.English = "2015-09-01"
GameText.HelperText.English   [ "I know English" ]              = "I know English"
GameText.HelperText.English   [ "I am learning English" ]       = "I am learning English"
GameText.HelperText.English   [ "I am learning Esperanto" ]     = "I am learning Esperanto"
GameText.HelperText.English   [ "I am learning Ido" ]           = "I am learning Ido"
GameText.HelperText.English   [ "I am learning Spanish" ]       = "I am learning Spanish"
GameText.HelperText.English   [ "I am learning Ithkuil" ]       = "I am learning Ithkuil"
GameText.HelperText.English   [ "I am learning German" ]        = "I am learning German"
GameText.HelperText.English   [ "I am learning French" ]        = "I am learning French"
GameText.HelperText.English   [ "I am learning Polish" ]        = "I am learning Polish"
    
GameText.HelperText.Spanish = {}
GameText.TargetText.Spanish = {}
GameText.LastUpdated.Spanish = "2015-08-22"
GameText.HelperText.Spanish[ "I know Spanish" ]                 = "Yo sé Español"
GameText.HelperText.Spanish[ "I am learning English" ]          = "Estoy aprendiendo Inglés"
GameText.HelperText.Spanish[ "I am learning Esperanto" ]        = "Estoy aprendiendo Esperanto"
GameText.HelperText.Spanish[ "I am learning Ido" ]              = "Estoy aprendiendo Ido"
GameText.HelperText.Spanish[ "I am learning Spanish" ]          = "Estoy aprendiendo Español"   
GameText.HelperText.Spanish[ "I am learning Ithkuil" ]          = "Estoy aprendiendo Ithkuil"
GameText.HelperText.Spanish[ "I am learning German" ]           = ""
GameText.HelperText.Spanish[ "I am learning French" ]           = ""
GameText.HelperText.Spanish[ "I am learning Polish" ]           = ""
    
GameText.HelperText.German = {}
GameText.TargetText.German = {}
GameText.LastUpdated.German = "2015-08-22"
GameText.HelperText.German[ "I know German" ]                   = "Ich kann Deutsch"
GameText.HelperText.German[ "I am learning English" ]           = "Ich lerne Englisch"
GameText.HelperText.German[ "I am learning Esperanto" ]         = "Ich lerne Esperanto"
GameText.HelperText.German[ "I am learning Ido" ]               = "Ich lerne Ido"
GameText.HelperText.German[ "I am learning Spanish" ]           = "Ich lerne Spanisch"
GameText.HelperText.German[ "I am learning Ithkuil" ]           = "Ich lerne Ithkuil"
GameText.HelperText.German[ "I am learning German" ]            = "Ich lerne Deutsch"
GameText.HelperText.German[ "I am learning French" ]            = "Ich lerne Französisch"
GameText.HelperText.German[ "I am learning Polish" ]            = "Ich lerne Polnisch"
    
GameText.TargetText.French = {}
GameText.HelperText.French = {}
GameText.LastUpdated.French = "2015-09-01"
GameText.HelperText.French[ "I know French" ]                   = "Je connais le français"
GameText.HelperText.French[ "I am learning English" ]           = "J'apprends l'anglais"
GameText.HelperText.French[ "I am learning Esperanto" ]         = "J'apprends l'espéranto"
GameText.HelperText.French[ "I am learning Ido" ]               = "J'apprends l'ido"
GameText.HelperText.French[ "I am learning Spanish" ]           = "J'apprends l'espagnol"
GameText.HelperText.French[ "I am learning Ithkuil" ]           = "J'apprends l'ithkuil"
GameText.HelperText.French[ "I am learning German" ]            = "J'apprends l'allemand"
GameText.HelperText.French[ "I am learning French" ]            = "J'apprends le français"
GameText.HelperText.French[ "I am learning Polish" ]            = "J'apprends le polonais"
    
GameText.HelperText.Japanese = {}
GameText.TargetText.Japanese = {}
GameText.LastUpdated.Japanese = "2015-08-26"
GameText.HelperText.Japanese[ "I know Japanese" ]               = "にほんご　わかるよ。"
GameText.HelperText.Japanese[ "I am learning English" ]         = "えいご　を　べんきょう　してるんだ。"
GameText.HelperText.Japanese[ "I am learning Esperanto" ]       = "エスペラントご　を　べんきょう　してるんだ。"
GameText.HelperText.Japanese[ "I am learning Ido" ]             = "イドご　を　べんきょう　してるんだ。"
GameText.HelperText.Japanese[ "I am learning Spanish" ]         = "スペインご　を　べんきょう　してるんだ。"
GameText.HelperText.Japanese[ "I am learning Ithkuil" ]         = "イスクイルご　を　べんきょう　してるんだ。"
GameText.HelperText.Japanese[ "I am learning French" ]          = "フランスご　を　べんきょう　してるんだ。"
GameText.HelperText.Japanese[ "I am learning German" ]          = "ドイツご　を　べんきょう　してるんだ。"
GameText.HelperText.Japanese[ "I am learning Polish" ]          = "ポーランドご　を　べんきょう　してるんだ。"
    
GameText.HelperText.Polish = {}
GameText.TargetText.Polish = {}
GameText.LastUpdated.Polish = "2015-08-24"
GameText.HelperText.Polish[ "I know Polish" ]                   = "Znam polski"
GameText.HelperText.Polish[ "I am learning English" ]           = "Uczę się angielskiego"
GameText.HelperText.Polish[ "I am learning Esperanto" ]         = ""
GameText.HelperText.Polish[ "I am learning Ido" ]               = "Uczę się ido"
GameText.HelperText.Polish[ "I am learning Spanish" ]           = ""
GameText.HelperText.Polish[ "I am learning Ithkuil" ]           = "Uczę się ithkuil"
GameText.HelperText.Polish[ "I am learning German" ]            = "Uczę się niemieckiego"
GameText.HelperText.Polish[ "I am learning French" ]            = "Uczę się francuskiego"
GameText.HelperText.Polish[ "I am learning Polish" ]            = "Uczę się polskiego"
    
GameText.HelperText.Persian = {}
GameText.TargetText.Persian = {}
GameText.LastUpdated.Persian = "2015-09-01"
GameText.HelperText.Persian[ "I know Persian" ]                  =  ".من فارسی بلدم"
GameText.HelperText.Persian[ "I am learning English" ]           = "من دارم انگلیسی یاد می‌گیرم"
GameText.HelperText.Persian[ "I am learning Esperanto" ]         =  "من دارم اسپرانتو یاد می‌گیرم"
GameText.HelperText.Persian[ "I am learning Ido" ]               = "من دارم ایدو یاد می‌گیرم"
GameText.HelperText.Persian[ "I am learning Spanish" ]           = "من دارم اسپانیایی یاد می‌گیرم"
GameText.HelperText.Persian[ "I am learning Ithkuil" ]           =  "من دارم زبان ایثکوییل یاد می‌گیرم"
GameText.HelperText.Persian[ "I am learning German" ]            = "من دارم آلمانی یاد می‌گیرم"
GameText.HelperText.Persian[ "I am learning French" ]            = "من دارم فرانسوی یاد می‌گیرم"
GameText.HelperText.Persian[ "I am learning Polish" ]            = "من دارم لهستانی یاد می‌گیرم"
    
-- Conlangs
    
GameText.HelperText.Esperanto = {}
GameText.TargetText.Esperanto = {}
GameText.LastUpdated.Esperanto = "2015-09-01"
GameText.HelperText.Esperanto[ "I know Esperanto" ]             = "Mi scipovas paroli Esperanton"
GameText.HelperText.Esperanto[ "I am learning English" ]        = "Mi lernas la anglan lingvon"
GameText.HelperText.Esperanto[ "I am learning Esperanto" ]      = "Mi lernas Esperanton"
GameText.HelperText.Esperanto[ "I am learning Ido" ]            = "Mi lernas Idon"
GameText.HelperText.Esperanto[ "I am learning Spanish" ]        = "Mi lernas la hispanan lingvon"
GameText.HelperText.Esperanto[ "I am learning Ithkuil" ]        = "Mi lernas Ifkuilon"
GameText.HelperText.Esperanto[ "I am learning German" ]         = "Mi lernas la germanan lingvon"
GameText.HelperText.Esperanto[ "I am learning French" ]         = "Mi lernas la francan lingvon"
GameText.HelperText.Esperanto[ "I am learning Polish" ]         = "Mi lernas la polan lingvon"
    
GameText.HelperText.Ido = {}
GameText.TargetText.Ido = {}
GameText.LastUpdated.Ido = "2015-09-01"
GameText.HelperText.Ido[ "I know Ido" ]                         = "Me savas Ido"
GameText.HelperText.Ido[ "I am learning English" ]              = "Me lernas la Angla linguo"
GameText.HelperText.Ido[ "I am learning Esperanto" ]            = "Me lernas Esperanto"
GameText.HelperText.Ido[ "I am learning Ido" ]                  = "Me lernas Ido"
GameText.HelperText.Ido[ "I am learning Spanish" ]              = "Me lernas la Hispana linguo"
GameText.HelperText.Ido[ "I am learning Ithkuil" ]              = "Me lernas Ifkuilo"
GameText.HelperText.Ido[ "I am learning German" ]               = "Me lernas la Franca linguo"
GameText.HelperText.Ido[ "I am learning French" ]               = "Me lernas la Germana linguo"
GameText.HelperText.Ido[ "I am learning Polish" ]               = "Me lernas la Polona linguo"

GameText.HelperText.Ithkuil = {}
GameText.TargetText.Ithkuil = {}
GameText.LastUpdated.Ithkuil = "2015-08-21"
GameText.HelperText.Ithkuil[ "I know Ithkuil" ]                 = ""
GameText.HelperText.Ithkuil[ "I am learning English" ]          = "Upinglišpel xháwîl"
GameText.HelperText.Ithkuil[ "I am learning Esperanto" ]        = "Upesperantopel xháwîl"
GameText.HelperText.Ithkuil[ "I am learning Ido" ]              = "Upidopel xháwîl"
GameText.HelperText.Ithkuil[ "I am learning Spanish" ]          = "Upspanišpel xháwîl"
GameText.HelperText.Ithkuil[ "I am learning Ithkuil" ]          = "Ithkel xháwîl"
GameText.HelperText.Ithkuil[ "I am learning German" ]           = ""
GameText.HelperText.Ithkuil[ "I am learning French" ]           = ""
GameText.HelperText.Ithkuil[ "I am learning Polish" ]           = ""

GameText.HelperText.Interlingua = {}
GameText.TargetText.Interlingua = {}
GameText.LastUpdated.Interlingua = "2015-08-31"
GameText.HelperText.Interlingua[ "I know Interlingua" ]         = "Io comprende Interlingua"
GameText.HelperText.Interlingua[ "I am learning English" ]      = "Io apprende Anglese"
GameText.HelperText.Interlingua[ "I am learning Esperanto" ]    = "Io apprende Esperanto"
GameText.HelperText.Interlingua[ "I am learning Ido" ]          = "Io apprende Ido"
GameText.HelperText.Interlingua[ "I am learning Spanish" ]      = "Io apprende Espaniol"
GameText.HelperText.Interlingua[ "I am learning Ithkuil" ]      = "Io apprende Ithkuil"
GameText.HelperText.Interlingua[ "I am learning German" ]       = "Io apprende German"
GameText.HelperText.Interlingua[ "I am learning French" ]       = "Io apprende Francese"
GameText.HelperText.Interlingua[ "I am learning Polish" ]       = "Io apprende Polonese"

-- TODO: All of these should be moved to an external file.
-- Note: Only load languages needed, after the language select.

end


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
