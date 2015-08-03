loadx# = 0.2

function doplay()
	if (once[1] = 0)
		GLOBAL menuGroup as spriteGroup
		menuGroup.name = "menu"
		menuGroup.X = 0
		menuGroup.Y = 0
		
		bg_button = LoadImage("button.png")
		for i=100 to GetScreenBoundsBottom()-130 step GetImageHeight(bg_button)+1
			for j=100 to GetScreenBoundsRight()-130 step GetImageWidth(bg_button)+1
				makeSprite(bg_button, j, i, menuGroup, 1)
			next j
		next i
		
		img_loading_screen = CreateImageColor(255, 50, 50, 255)
		loading_screen = CreateSprite(img_loading_screen)
		SetSpriteSize(loading_screen, 400, 400)
		
		loadx# = 0.2
		once[1] = 1
	endif
	
	loadx# = loadx# + 1.1
	SetSpritePosition(loading_screen, loadx#, 0.0)
	
endfunction
