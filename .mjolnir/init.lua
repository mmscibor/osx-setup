-- Load extensions
local grid 			= require "mjolnir.bg.grid"
local application 	= require "mjolnir.application"
local hotkey 		= require "mjolnir.hotkey"
local window 		= require "mjolnir.window"

-- Set up hotkey aliases
local cmdOpt          = {                  "alt", "cmd"  }  -- scope: launcher
local cmdOptCtrl      = {          "ctrl", "alt", "cmd"  }  -- scope: application
local cmdOptShift     = { "shift",         "alt", "cmd"  }  -- scope: window
local cmdCtrlShift    = { "shift", "ctrl",        "cmd"  }  -- scope: window
local cmdOptCtrl      = {          "ctrl", "alt", "cmd"  }  -- scope: screen / display
local cmdCtrlShiftOpt = { "shift", "ctrl", "alt", "cmd"  }  -- scope: global

-------------------
-- Grid Settings --
-------------------

-- Dividing into 6ths allows for positioning windows into halves, quarters, and thirds of the screens
grid.MARGINX 	= 0
grid.MARGINY 	= 0
grid.GRIDWIDTH 	= 6
grid.GRIDHEIGHT = 6


----------------------
-- Helper functions --
----------------------

-- Set the current window to a particular location on the grid
local gridset = function(x, y, w, h)
	return function()
		cur_window = window.focusedwindow()
		grid.set(
			cur_window,
			{x=x, y=y, w=w, h=h},
			cur_window:screen()
		)
	end
end


------------------------------
-- Window Placement Hotkeys --
------------------------------

-- Thirds, full vertical
hotkey.bind(cmdOptCtrl, "1", gridset(0, 0, 2, 6))
hotkey.bind(cmdOptCtrl, "2", gridset(2, 0, 2, 6))
hotkey.bind(cmdOptCtrl, "3", gridset(4, 0, 2, 6))
hotkey.bind(cmdOptCtrl, "4", gridset(0, 0, 4, 6))
hotkey.bind(cmdOptCtrl, "5", gridset(2, 0, 4, 6))

-- Halves
hotkey.bind(cmdOptCtrl, "left", gridset(0, 0, 3, 6))
hotkey.bind(cmdOptCtrl, "right", gridset(3, 0, 3, 6))

-- Quarters, corners
hotkey.bind(cmdOptCtrl, "[", gridset(0, 0, 3, 3))
hotkey.bind(cmdOptCtrl, "]", gridset(3, 0, 3, 3))
hotkey.bind(cmdOptCtrl, ";", gridset(0, 3, 3, 3))
hotkey.bind(cmdOptCtrl, "'", gridset(3, 3, 3, 3))

-- Maximize
hotkey.bind(cmdOptCtrl, "up", gridset(0, 0, 6, 6))
