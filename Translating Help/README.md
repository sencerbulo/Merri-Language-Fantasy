# Translating Merri Language Fantasy

The language file for this game is located at:

[https://github.com/Moosader/Merri-Language-Fantasy/blob/master/Merri%20Language%20Fantasy/Merri/Language/GameText.lua](https://github.com/Moosader/Merri-Language-Fantasy/blob/master/Merri%20Language%20Fantasy/Merri/Language/GameText.lua)

Notice that, under the **SetupLanguages()** function, all the game text is being stored, such as:

    GameText.HelperText.English		[ "Play" ] 	= "Play"
    GameText.HelperText.Esperanto	[ "Play" ] 	= "Ludi"
    GameText.HelperText.Ido			[ "Play" ] 	= "Ludar"
    GameText.HelperText.Spanish		[ "Play" ] 	= "Jugar"

Notice that all game text lines begin with **GameText**.  However, there are two types of text.  There is **GameText.HelperText** and **GameText.TargetText**.

Target text is meant to be the language being learned, while the helper text is an already-familiar language to the player. All lines in the game should be translated, so that you can go from any language to any language.

## Adding a new language

Adding a new language is simple, you just need to change a line like this:

    GameText.HelperText.English		[ "Play" ] 	= "Play"

To say your language's name, and the translation (don't change the text inside the square brackets [ ]):

    GameText.HelperText.DuckLang	[ "Play" ] 	= "Quackie"

## Don't know how to use GitHub?

If you're not a programmer, or do not know how to use GitHub, that's OK. 
You can download the file to edit on your computer (it will open with Notepad, but I'd suggest
Notepad++ or another plain-text editor), then email it back to me.

On the [preview page](https://github.com/Moosader/Merri-Language-Fantasy/blob/master/Merri%20Language%20Fantasy/Merri/Language/GameText.lua)
for GameText.lua, click on the **Raw** button.  That will lead to the plain-text file:

[https://raw.githubusercontent.com/Moosader/Merri-Language-Fantasy/master/Merri%20Language%20Fantasy/Merri/Language/GameText.lua](https://raw.githubusercontent.com/Moosader/Merri-Language-Fantasy/master/Merri%20Language%20Fantasy/Merri/Language/GameText.lua)

From your web browser, hit **CTRL+S** to save it to your hard-drive for editing.

Once you're done, just email it as an attachment to **Rachel@Moosader.com**

Don't forget to add yourself to the **translation credits**, which is this line:

    GameText.TargetText.English		[ "Translation Credits" ]	= "Rachel J. Morris"

If there is already somebody there and you are reviewing their work, just add your name after a comma.

    GameText.TargetText.Esperanto		[ "Translation Credits" ]	= "Rachel J. Morris, Tea Coba"

## Non-romanized Scripts

If your language uses an original script, we will need to coordinate on that so I can add that functionality.

If your language uses a script that is supported by Unicode, it will be fine, just write it in that script.  
However, I would like to have a *second* "translation" done with that language in a romanized format.

For example, to support Japanese, I would like to have:

* Hiragana, Katakana, and Kanji version (私の名前はレイチェルです)
* Hiragana and Katakana only (わたし の なあえ は レイチェルです)
* Romaji (Watashi no namae wa reicheru desu)

This is for learning purposes.


