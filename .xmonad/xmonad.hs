import XMonad
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig(additionalKeys)

main = xmonad $ defaultConfig {
       borderWidth = 2
     , normalBorderColor = "#0FEC8B"
     , focusedBorderColor = "#EC820F"
     , modMask = mod4Mask
     , terminal = "xterm"
     , layoutHook = smartBorders (layoutHook defaultConfig)
  }
  `additionalKeys` [ ((mod4Mask, xK_p), spawn "dmenu_run") ]
