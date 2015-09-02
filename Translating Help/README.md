# Translating Merri: Language Fantasy

Thank you for contributing to Merri: Language Fantasy!  Here are some instructions on getting started with translating!

You don't need to know how to use GitHub to contribute - 
you can download the files and edit them on your machine, and then email them in if you're not familiar with GitHub.

The .lua language files can be opened in Notepad or another plaintext editor.
It is all just plain text and can be edited and saved through a plaintext editor.

Language files are located in this directory:

https://github.com/Moosader/Merri-Language-Fantasy/tree/master/Merri%20Language%20Fantasy/Merri/Language

## Downloading the files - For people who aren't familiar with GitHub

Go to the [Language](https://github.com/Moosader/Merri-Language-Fantasy/tree/master/Merri%20Language%20Fantasy/Merri/Language) directory.
There is a **GameText.lua** file and a **Translations** folder.

First, open **GameText.lua**.

In the top-right corner, there is a button labelled **Raw**. Click this and your browser will open this file as a plaintext file,
(or [Click Here](https://raw.githubusercontent.com/Moosader/Merri-Language-Fantasy/master/Merri%20Language%20Fantasy/Merri/Language/GameText.lua)
to view the raw file)

![Screenshot of raw download button](https://raw.githubusercontent.com/Moosader/Merri-Language-Fantasy/master/Translating%20Help/screenshot-raw-download.png)

From here, use the **Save** shortcut on your web-browser (example: CTRL+S) to save the file to your hard-drive.

Go back in your browser, back to the Language folder. Open the **Translations** folder.

![Screenshot of language files](https://raw.githubusercontent.com/Moosader/Merri-Language-Fantasy/master/Translating%20Help/screenshot-language-files.png)



This is where all the language files are saved. Download the file named **LANGUAGE_TEMPLATE.lua** via the Raw button, as we did above.

([Click Here](https://raw.githubusercontent.com/Moosader/Merri-Language-Fantasy/master/Merri%20Language%20Fantasy/Merri/Language/Translations/LANGUAGE_TEMPLATE.lua)
to open the raw file)

You might also open and save the 
[**language_es-ES.lua**](https://github.com/Moosader/Merri-Language-Fantasy/blob/master/Merri%20Language%20Fantasy/Merri/Language/Translations/language_es-ES.lua) 
file for reference.

## Downloading the files - For people who know GitHub

Make a clone of the repository, somewhere on your hard-drive.  The important path is `Merri-Language-Fantasy/Merri Language Fantasy/Merri/Language/`

## Updating GameText.lua

There are a few lines that will need to be updated in GameText.lua ... 

Each language has a block of text with a translation for "I know <language>" and "I am learning <language>".  There is a template block that looks like this:

    ------------------------------------------------------------------------------------------------
    -- This is the template for a new language. Copy / Paste this block immediately below and translate these lines.
    -- Use the translations below for reference.
    GameText.HelperText.NewLanguage = {}
    GameText.TargetText.NewLanguage = {}
    GameText.LastUpdated.NewLanguage = "TodayDate"
    GameText.HelperText.NewLanguage   [ "I know LANGUAGE" ]              = "" -- Set this to say, "I know (language you are translating to)".
    GameText.HelperText.NewLanguage   [ "I am learning English" ]       = ""
    GameText.HelperText.NewLanguage   [ "I am learning Esperanto" ]     = ""
    GameText.HelperText.NewLanguage   [ "I am learning Ido" ]           = ""
    GameText.HelperText.NewLanguage   [ "I am learning Spanish" ]       = ""
    GameText.HelperText.NewLanguage   [ "I am learning Ithkuil" ]       = ""
    GameText.HelperText.NewLanguage   [ "I am learning German" ]        = ""
    GameText.HelperText.NewLanguage   [ "I am learning French" ]        = ""
    GameText.HelperText.NewLanguage   [ "I am learning Polish" ]        = ""
    ------------------------------------------------------------------------------------------------
    
Copy and paste this block to make a duplicate and add your translations.  You can use the languages further down in the file for reference.

For example:

    GameText.HelperText.English   [ "I know English" ]              = "I know English"
    GameText.HelperText.English   [ "I am learning English" ]       = "I am learning English"
    GameText.HelperText.English   [ "I am learning Esperanto" ]     = "I am learning Esperanto"
    GameText.HelperText.English   [ "I am learning Ido" ]           = "I am learning Ido"
    GameText.HelperText.English   [ "I am learning Spanish" ]       = "I am learning Spanish"
    GameText.HelperText.English   [ "I am learning Ithkuil" ]       = "I am learning Ithkuil"
    GameText.HelperText.English   [ "I am learning German" ]        = "I am learning German"
    GameText.HelperText.English   [ "I am learning French" ]        = "I am learning French"
    GameText.HelperText.English   [ "I am learning Polish" ]        = "I am learning Polish"
    
Note that you're adding translations between the right-hand-side double-quotes ( not the text within the square brackets [ ] )

## Updating your new language file

This is the file that will need a majority of the work.  You will edit **LANGUAGE_TEMPLATE.lua** and use an existing language file for reference.

In the template file, all the lines are blank. They need to be filled in. To see the original English translation, view 
[**language_es-ES.lua**](https://github.com/Moosader/Merri-Language-Fantasy/blob/master/Merri%20Language%20Fantasy/Merri/Language/Translations/language_es-ES.lua) 


## Non-romanized Scripts

If your language uses an original script, we will need to coordinate on that so I can add that functionality.

If your language uses a script that is supported by Unicode, it will be fine, just write it in that script.  
However, I would like to have a *second* "translation" done with that language in a romanized format.

For example, to support Japanese, I would like to have:

* Hiragana, Katakana, and Kanji version (私の名前はレイチェルです)
* Hiragana and Katakana only (わたし の なまえ は レイチェルです)
* Romaji (Watashi no namae wa reicheru desu)

This is for learning purposes!

What you name these files don't matter so much (Japanese_1, Japanese_2, Japanese_3) - I can change how they appear in-game.

## Keep in Touch

If you want to be a contributor, please send an email to Rachel@Moosader.com so we can send updates, keep in contact with you. If you're interested in doing translation work but would like a donation for your time, please also let us know!

And thank you so much for your contribution!
