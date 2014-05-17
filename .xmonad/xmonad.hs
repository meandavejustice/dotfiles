import XMonad
import XMonad.Config.Gnome
import XMonad.Layout.NoBorders
import XMonad.Util.EZConfig(additionalKeys)

main = xmonad $ gnomeConfig {
       borderWidth = 2
     , normalBorderColor = "#0FEC8B"
     , focusedBorderColor = "#EC820F"
     , modMask = mod4Mask
     , terminal = "xterm"
     , layoutHook = smartBorders (layoutHook gnomeConfig)
  }
  `additionalKeys` [ ((mod4Mask, xK_p), spawn "dmenu_run") ]
