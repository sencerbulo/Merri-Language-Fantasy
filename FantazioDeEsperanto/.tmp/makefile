LUAC = luac

all: .tmp/main.lua.bin .tmp/TEMPLATE.lua.bin .tmp/DressupState.lua.bin .tmp/MathProblemsState.lua.bin .tmp/QuizAnimalsState.lua.bin .tmp/QuizColorsState.lua.bin .tmp/QuizFoodsState.lua.bin .tmp/SelectState.lua.bin .tmp/TitleState.lua.bin .tmp/ColorState.lua.bin .tmp/FamilyTree.lua.bin .tmp/AudioManager.lua.bin .tmp/FontManager.lua.bin .tmp/StateManager.lua.bin .tmp/LanguageManager.lua.bin .tmp/OptionsManager.lua.bin .tmp/SaveLoadManager.lua.bin .tmp/QuizManager.lua.bin .tmp/Button.lua.bin .tmp/Label.lua.bin .tmp/FamilyTreeNode.lua.bin

.tmp/main.lua.bin: main.lua
	$(LUAC) -o ".tmp/main.lua.bin" "main.lua"

.tmp/TEMPLATE.lua.bin: states/TEMPLATE.lua
	$(LUAC) -o ".tmp/TEMPLATE.lua.bin" "states/TEMPLATE.lua"

.tmp/DressupState.lua.bin: states/DressupState.lua
	$(LUAC) -o ".tmp/DressupState.lua.bin" "states/DressupState.lua"

.tmp/MathProblemsState.lua.bin: states/MathProblemsState.lua
	$(LUAC) -o ".tmp/MathProblemsState.lua.bin" "states/MathProblemsState.lua"

.tmp/QuizAnimalsState.lua.bin: states/QuizAnimalsState.lua
	$(LUAC) -o ".tmp/QuizAnimalsState.lua.bin" "states/QuizAnimalsState.lua"

.tmp/QuizColorsState.lua.bin: states/QuizColorsState.lua
	$(LUAC) -o ".tmp/QuizColorsState.lua.bin" "states/QuizColorsState.lua"

.tmp/QuizFoodsState.lua.bin: states/QuizFoodsState.lua
	$(LUAC) -o ".tmp/QuizFoodsState.lua.bin" "states/QuizFoodsState.lua"

.tmp/SelectState.lua.bin: states/SelectState.lua
	$(LUAC) -o ".tmp/SelectState.lua.bin" "states/SelectState.lua"

.tmp/TitleState.lua.bin: states/TitleState.lua
	$(LUAC) -o ".tmp/TitleState.lua.bin" "states/TitleState.lua"

.tmp/ColorState.lua.bin: states/ColorState.lua
	$(LUAC) -o ".tmp/ColorState.lua.bin" "states/ColorState.lua"

.tmp/FamilyTree.lua.bin: states/FamilyTree.lua
	$(LUAC) -o ".tmp/FamilyTree.lua.bin" "states/FamilyTree.lua"

.tmp/AudioManager.lua.bin: managers/AudioManager.lua
	$(LUAC) -o ".tmp/AudioManager.lua.bin" "managers/AudioManager.lua"

.tmp/FontManager.lua.bin: managers/FontManager.lua
	$(LUAC) -o ".tmp/FontManager.lua.bin" "managers/FontManager.lua"

.tmp/StateManager.lua.bin: managers/StateManager.lua
	$(LUAC) -o ".tmp/StateManager.lua.bin" "managers/StateManager.lua"

.tmp/LanguageManager.lua.bin: managers/LanguageManager.lua
	$(LUAC) -o ".tmp/LanguageManager.lua.bin" "managers/LanguageManager.lua"

.tmp/OptionsManager.lua.bin: managers/OptionsManager.lua
	$(LUAC) -o ".tmp/OptionsManager.lua.bin" "managers/OptionsManager.lua"

.tmp/SaveLoadManager.lua.bin: managers/SaveLoadManager.lua
	$(LUAC) -o ".tmp/SaveLoadManager.lua.bin" "managers/SaveLoadManager.lua"

.tmp/QuizManager.lua.bin: managers/QuizManager.lua
	$(LUAC) -o ".tmp/QuizManager.lua.bin" "managers/QuizManager.lua"

.tmp/Button.lua.bin: entities/ui/Button.lua
	$(LUAC) -o ".tmp/Button.lua.bin" "entities/ui/Button.lua"

.tmp/Label.lua.bin: entities/ui/Label.lua
	$(LUAC) -o ".tmp/Label.lua.bin" "entities/ui/Label.lua"

.tmp/FamilyTreeNode.lua.bin: entities/FamilyTreeNode.lua
	$(LUAC) -o ".tmp/FamilyTreeNode.lua.bin" "entities/FamilyTreeNode.lua"

