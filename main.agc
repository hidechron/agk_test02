
// Project: test02 
// Created: 2015-08-03
#include "init.agc"
#include "play.agc"
#include "helpers.agc"
// set window properties
SetWindowTitle( "test02" )
SetWindowSize( 1024, 768, 0 )

// set display properties
SetVirtualResolution( 1024, 768 )
SetOrientationAllowed( 1, 1, 1, 1 )

spritesheet as integer = 0
spritesheet = LoadImage("spritesheet.png")
SetImageTransparentColor(spritesheet, 94, 129, 162)
debug$ as string = "Error : debug$"
debug$ = makeAtlasTxt()


dim img[899]
for i=0 to 899
	img[i] = LoadSubImage(spritesheet,"img"+str(i))
	SetImageTransparentColor(img[i], 94, 129, 162)
next i

#constant INIT 0
#constant TEST -1
#constant MENU 1
#constant INITGAME 2
#constant PLAY 3
GLOBAL mode = INIT

dim once[5]

GLOBAL consoleText as myMessage[]

GLOBAL imgTestGroup as spriteGroup
imgTestGroup.name = "test"
imgTestGroup.X = 100
imgTestGroup.Y = 0

makeSprite(img[7], 0, 0, imgTestGroup, 1)

do
    if (once[0] = 0)
		//my_sprite = CreateSprite(img[1]) //That stay
		print("not staying") // That don't stay
		once[0] = 1
	endif
	
	select mode
		//========================================
		case INIT:
			mode = PLAY
		endcase
		//=========================================
		case MENU:
			print("This is the menu")
		endcase
		//=========================================
		case INITGAME:

		endcase
		//=========================================
		case PLAY:
			doplay()
		endcase
		//=========================================
		case TEST:

		endcase
		//=========================================
	endselect
	
	// ====================== CONSOLE ========================
	for i=0 to consoleText.length
		if (consoleText[i].time > 0)
			print(consoleText[i].text)
			dec consoleText[i].time, 1
		else
			consoleText.remove(0)
		endif
	next i
	// ====================== END CONSOLE ========================

    Print(ScreenFPS())
    Sync()
loop

function makeSprite(image, x, y, group as spriteGroup, visible)
	spr = CreateSprite(image)
	group.sprlist.insert(spr)
	SetSpritePosition(spr, group.X+x, group.Y+y)
	SetSpriteVisible(spr, visible)
endFunction

function sendMessage(text as string)
	msg as myMessage
	msg.text = text
	msg.time = 80
	consoleText.insert(msg)
endFunction

TYPE spriteGroup
	name as string
	sprlist as integer[]
	X as integer
	Y as integer
ENDTYPE

TYPE myMessage
	text as string
	time as integer
ENDTYPE
