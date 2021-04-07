import XMonad
import XMonad.Actions.SpawnOn
import XMonad.Actions.Volume
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Util.Brightness
import XMonad.Util.Run(spawnPipe)
import System.IO

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ defaultConfig
      {
        borderWidth = 3,
        workspaces = myWorkspace,
        startupHook = myStartupHook,
        modMask = mod4Mask,
        logHook = dynamicLogWithPP xmobarPP
          { 
            ppOutput = hPutStrLn xmproc,
            ppTitle = xmobarColor "green" "" . shorten 50
          },
        terminal = "konsole --hide-menubar",
        manageHook = manageDocks <+> manageHook defaultConfig,
        layoutHook = avoidStruts  $  layoutHook defaultConfig,
        handleEventHook = handleEventHook defaultConfig <+> docksEventHook
      } `additionalKeysP` mediaKeys

myWorkspace = ["shell", "intellij", "www", "enpass"] ++ map show [5..9]

myStartupHook = do
    setWMName "LG3D"
    spawnOn "enpass" "/opt/enpass/Enpass"

mediaKeys = [
    ("<XF86AudioLowerVolume>", lowerVolume 4 >> return()),
    ("<XF86AudioRaiseVolume>", raiseVolume 4 >> return()),
    ("<XF86AudioMute>", toggleMute >> return()),
    ("<XF86MonBrightnessUp>", spawn "lux -a 10%"),
    ("<XF86MonBrightnessDown>", spawn "lux -s 10%")
    ]
