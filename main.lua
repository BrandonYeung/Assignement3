-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local nOfToppingsTextField = native.newTextField( display.contentCenterX, display.contentCenterY + 100, 200, 80 )
nOfToppingsTextField.id = "n textField"

local toppingsTextField = display.newText( "Enter Number of Toppings", display.contentCenterX, display.contentCenterY - 10, native.systemFont, 20 )
toppingsTextField.id = "toppings textField"
toppingsTextField:setFillColor( 0, 0, 255 )

local LargeButton = display.newImageRect( "largebutton.png", 100, 100 )
LargeButton.x = display.contentCenterX-60
LargeButton.y = 450
LargeButton.id = "large button"

local ExtraLargeButton = display.newImageRect( "extrabutton.png", 100, 100 )
ExtraLargeButton.x = display.contentCenterX + 60
ExtraLargeButton.y = 450
ExtraLargeButton.id = "extra large button"

display.setDefault("background", 0, 255, 0)

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 2)
  return math.floor(num * mult + 0.5) / mult
end

local function calculatePrice( event )

	local tax = subtotal * 0.13
	local total = subtotal + tax
	local showSubtotal = display.newText( 'Subtotal: $' .. string.format("%.2f", subtotal), display.contentCenterX , display.contentCenterY - 200, native.systemFont, 20 )
	showSubtotal:setTextColor( 0, 0, 255)
	local showTax = display.newText( 'Tax: $' .. string.format("%.2f", tax), display.contentCenterX , display.contentCenterY - 150, native.systemFont, 20 )
	showTax:setTextColor( 0, 0, 255 )
	local showTotal = display.newText( 'Total: $' .. string.format("%.2f", total), display.contentCenterX , display.contentCenterY  -100, native.systemFont, 20 )
	showTotal:setTextColor( 0, 0, 255 )
end

local function onLargeTouch( event )

	toppings = tonumber( nOfToppingsTextField.text )

	if toppings == 1 then
		subtotal = 6 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 6 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 6 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 6 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Too many toppings', display.contentCenterX , display.contentCenterY  -150, native.systemFont, 20 )
		errorText:setTextColor( 0, 0, 255 )
	end	
end

local function onExtraLargeTouch( event )
	
	toppings = tonumber( nOfToppingsTextField.text )
	
	if toppings == 1 then
		subtotal = 10 + 1
		calculatePrice()
	elseif toppings == 2 then
		subtotal = 10 + 1.75
		calculatePrice()
	elseif toppings == 3 then
		subtotal = 10 + 2.5
		calculatePrice()
	elseif toppings == 4 then
		subtotal = 10 + 3.35
		calculatePrice()
	else 
		local errorText = display.newText( 'Too many toppings', display.contentCenterX + 20, display.contentCenterY + -620, native.systemFont, 80 )
		errorText:setTextColor( 0, 0, 255 )
	end	
end

LargeButton:addEventListener( 'touch', onLargeTouch)
ExtraLargeButton:addEventListener( 'touch', onExtraLargeTouch)