import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.EwmhDesktops

import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.DynamicLog
import XMonad.Util.Loggers

import XMonad.StackSet as W
import XMonad.ManageHook
import XMonad.Util.NamedScratchpad

myTerm = "kitty"
modm = mod4Mask
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

scratchpads = [
    NS "term" "kitty -T nsp" (title =? "nsp") defaultFloating
    ]

-- for programmer dvorak
wsKeys = [
       "&", "[", "{", "}", "(", "=", "*", ")", "+"
         ]

myKeys = [
         ("M-S-<Return>", spawn myTerm)
       , ("M-<Return>", namedScratchpadAction scratchpads "term")
       , ("M-S-e", spawn "emacsclient -e '(kill-emacs)'; emacs --daemon | notify-send daemon restarted")
       , ("M-e", spawn "emacsclient -c")
       , ("<XF86AudioRaiseVolume>", spawn "wpctl set-volume 51 0.05+")
       , ("<XF86AudioLowerVolume>", spawn "wpctl set-volume 51 0.05-")
       , ("<XF86AudioMute>", spawn "wpctl set-mute 51 toggle")
       , ("<XF86AudioPlay>", spawn "playerctl play-pause")
       , ("<XF86MonBrightnessUp>", spawn "brightnessctl s +5%")
       , ("<XF86MonBrightnessDown>", spawn "brightnessctl s 5%-")
       , ("<Print>", spawn "flameshot gui")
       ]
--      ++
--      [(otherModMasks ++ "M-" ++ key, action tag)
--       | (tag, key)  <- zip myWorkspaces wsKeys
--       , (otherModMasks, action) <- [ ("", windows . W.greedyView)
--                                     , ("S-", windows . W.shift)]
--    ]

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

main = xmonad . ewmhFullscreen . ewmh . withEasySB (statusBarProp "xmobar ~/.config/xmonad/xmobar" (pure myXmobarPP)) defToggleStrutsKey $ myConfig

myConfig = def {
       terminal = myTerm
     , modMask = modm
     , manageHook = namedScratchpadManageHook scratchpads
} `additionalKeysP` myKeys
