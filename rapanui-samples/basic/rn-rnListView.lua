--[[
--
-- RapaNui
--
-- by Ymobe ltd  (http://ymobe.co.uk)
--
-- LICENSE:
--
-- RapaNui uses the Common Public Attribution License Version 1.0 (CPAL) http://www.opensource.org/licenses/cpal_1.0.
-- CPAL is an Open Source Initiative approved
-- license based on the Mozilla Public License, with the added requirement that you attribute
-- Moai (http://getmoai.com/) and RapaNui in the credits of your program.
]]

--welcome to RNLists sample!
--RNLists are a sequence of vertical cells in which you can insert any of the RNObject.

--NOTE1: at the moment the scrolling gesture is only vertical.
--NOTE2: the touch is got when a cell is touched, not when the object is.
--NOTE3: since RapaNui touch listener doesn't return the target as the enterFrame does,
--       we need to specify SELF in RNListView.lua, and due to this fact
--       only one RNList at once can be created.

--object creation
local image1 = RNFactory.createImage("images/image.png")
local image2 = RNFactory.createImage("images/image2.png")
local image3 = RNFactory.createImage("images/image3.png")
local image4 = RNFactory.createImage("images/image4.png")
local image5 = RNFactory.createImage("images/tile0.png")
local image6 = RNFactory.createImage("images/tile1.png")
local image7 = RNFactory.createImage("images/tile2.png")
local image8 = RNFactory.createImage("images/tile3.png")
local image9 = RNFactory.createImage("images/tile4.png")
local image10 = RNFactory.createImage("images/tile5.png")
local image11 = RNFactory.createImage("images/tile6.png")
local image12 = RNFactory.createImage("images/tile7.png")
local image13 = RNFactory.createImage("images/tile8.png")
local image14 = RNFactory.createImage("images/tile9.png")
local anim1 = RNFactory.createAnim("images/char.png", 42, 32, 100, 200, 0.27, 0.5); anim1:play("default", 12, -1)
local text1 = RNFactory.createText("RapaNui is great!", { size = 10, top = 5, left = 5, width = 200, height = 50 })
local text2 = RNFactory.createText("Moai is great!", { size = 10, top = 5, left = 5, width = 200, height = 50 })

--callback for touch
function getCallBack(event)
    for i, v in pairs(event) do print(i, v, v.object.name, v.userValue, v.userValue2) end
end

--create the list
--field in options are optional
--x,y and canScrollY are optional
--offsetX,offsetY and onClick are optional
--you can set as many userValues as needed. They all will be received in the callBack funcion
-- (call them as you want all the touched elements is passed to that funcion)

--cellW and cellH are really important:
--1) cells are the things returning the callback
--2) the list is created cell by cell. So the cellH is quite important defining objects vertical distances and
--   list height.

--cells cannot be moved by offsets. Offsets only affect objects in cells. Cells are always created one below the other.

--maxScrollingForceY,minY and maxY affect directly the scrolling gesture.

local list = RNFactory.createList("testList", {
    options = { cellH = 64, cellW = 64, maxScrollingForceY = 30, minY = -64 * 6 - 32, maxY = 0 }, --minY=-64*6 means it can move down 6 cells since they are 64 in height
    canScrollY = true,
    x = 0,
    y = 0,
    elements = {
        { object = image1, offsetX = 32, offsetY = 32, onClick = getCallBack, userValue = "test", userValue2 = "test2" },
        { object = image2, offsetX = 64, offsetY = 32, onClick = getCallBack },
        { object = anim1, offsetX = 32, offsetY = 32, onClick = getCallBack, userValue = "this is the anim 1" },
        { object = text1, offsetX = 0, offsetY = 0, onClick = getCallBack, userValue = "this is the text 1" },
        { object = image3, offsetX = 32, offsetY = 32, onClick = getCallBack },
        { object = image4, offsetX = 64, offsetY = 32, onClick = getCallBack },
        { object = text2, offsetX = 0, offsetY = 0, onClick = getCallBack, userValue = "this is the text 2" },
        { object = image5, offsetX = 32, offsetY = 32, onClick = getCallBack },
        { object = image6, offsetX = 32, offsetY = 32, onClick = getCallBack },
        { object = image7, offsetX = 32, offsetY = 32, onClick = getCallBack },
        { object = image8, offsetX = 32, offsetY = 32, onClick = getCallBack },
        { object = image9, offsetX = 32, offsetY = 32, onClick = getCallBack },
    },
})


-- ELEMENTS ACTIONS

--insertElement(element,number)
--the element is added at the end if param number is nil or > list size
--insert tile5 at the end
list:insertElement({ object = image10, offsetX = 32, offsetY = 32, onClick = getCallBack },9999)
--insert tile6 at the end
list:insertElement({ object = image11, offsetX = 32, offsetY = 32, onClick = getCallBack })
--addElement inside of a list
--insert tile7 at 9th place (below tile0)
list:insertElement({ object = image12, offsetX = 32, offsetY = 32, onClick = getCallBack },9)
--remove last object
--removeElement(isRNObjectToRemove,number in list)
--the last element is removed if param number is nil or > list size
--if the first boolean param is true the RNObject will be removed from the screen else it's just removed from the list
--tile6 is removed
list:removeElement(true)
--tile5 is removed from list then manually removed from screen
list:removeElement(false,9999)
image10:remove()
--tile3 is removed from 12th place
list:removeElement(true,12)
--add elements tile8 and tile9 at the end
list:insertElement({ object = image13, offsetX = 32, offsetY = 32, onClick = getCallBack })
list:insertElement({ object = image14, offsetX = 32, offsetY = 32, onClick = getCallBack })
--swap tile8 and tile9 positions
list:swapElements(13,14)




--OTHER WORKING CALLS AND METHODS:

--list.x=0
--list.y=0
--list.alpha=0
--list.visible=false
--list:remove()
--list:getElement(1) --returns whole element table as given to the RNListView
--list:getSize()
--list.options.maxScrollingForceY=30
--list.options.maxY=100
--list.options.minY=0
--list:getObjectByNumber(14) --returns RNObject
--print(list:getNumberByObject(image13))

