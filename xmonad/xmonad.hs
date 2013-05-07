import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


myTerminal :: String
myTerminal = "/usr/bin/urxvt"

myModMask :: KeyMask
myModMask = mod4Mask

myNormalBorderColor :: String
myNormalBorderColor = "#586e75"

myFocusedBorderColor :: String
myFocusedBorderColor = "#dc322f"

myBorderWidth :: Dimension
myBorderWidth = 3



main = do
	xmproc <- spawnPipe "xmobar"
	xmonad $ defaultConfig
		{ manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts $ layoutHook defaultConfig
		, modMask = myModMask	-- Rebind Mod to Windows Key
		, terminal = myTerminal
		, normalBorderColor = myNormalBorderColor
		, focusedBorderColor = myFocusedBorderColor
		, borderWidth = myBorderWidth
		, logHook = dynamicLogWithPP xmobarPP
						{ ppOutput = hPutStrLn xmproc
						, ppTitle = xmobarColor "green" "" . shorten 50
						}
		} `additionalKeys`
		[ ( (controlMask, xK_Print), spawn "sleep 0.2; scrot -s" )
		, ( (0, xK_Print), spawn "scrot" )
		]
