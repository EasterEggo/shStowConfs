import XMonad
import qualified XMonad.Core as XC
import qualified Data.Map as M
import qualified XMonad.StackSet as W
import System.Exit


import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Util.Loggers
import XMonad.Util.ClickableWorkspaces

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.WallpaperSetter
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Renamed

main :: IO ()
main = xmonad .
  ewmhFullscreen .
  ewmh .
  withSB mySB .
  docks
  $ cfg

mySB :: StatusBarConfig
mySB = statusBarProp "xmobar ~/.xmonad/xmobarrc" (clickablePP myXmobarPP)

myLauncher :: String
myLauncher = "dmenu_run"

myXmobarPP :: PP
myXmobarPP = def {
    ppSep = blue " | "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap "[" "]"
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \(ws:l:_) -> [ws, l]
  }
  where

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#F5C2E7" ""
    blue     = xmobarColor "#96CDFB" ""
    white    = xmobarColor "#D9E0EE" ""
    yellow   = xmobarColor "#FAE3B0" ""
    red      = xmobarColor "#F28FAD" ""
    lowWhite = xmobarColor "#988BA2" ""

myTerm :: String
myTerm = "alacritty"

myBrowser :: String
myBrowser = "vivaldi-stable"

myWorkspaces :: [String]
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

myNormalBorderColor :: String
myNormalBorderColor = "#000000"

myFocusedBorderColor :: String
myFocusedBorderColor = "#ffffff"

myKeys :: [(String, X ())]
myKeys =
  [
    ("M-S-<Return>",               spawn myTerm),
    ("M-b",                        spawn myBrowser ),
    ("M-p",                        spawn myLauncher),
    ("M-S-c",                      kill),
    ("M-<Space> ",                 sendMessage NextLayout),
    ("M-n",                        refresh),
    ("M-<Tab>",                    windows W.focusDown),
    ("M-j",                        windows W.focusDown),
    ("M-k",                        windows W.focusUp),
    ("M-m",                        windows W.focusMaster),
    ("M-<Return>",                 windows W.swapMaster),
    ("M-S-j",                      windows W.swapDown),
    ("M-S-k",                      windows W.swapUp),
    ("M-h",                        sendMessage Shrink),
    ("M-l",                        sendMessage Expand),
    ("M-t",                        withFocused $ windows . W.sink),
    ("M-,",                        sendMessage (IncMasterN 1)),
    ("M-.",                        sendMessage (IncMasterN (-1))),
    ("M-S-b",                      sendMessage ToggleStruts),
    ("M-S-q",                      io exitSuccess),
    ("M-q",                        spawn "xmonad --recompile; xmonad --restart")
  ]

myMouseBindings :: XConfig l -> M.Map (KeyMask, Button) (Window -> X ())
myMouseBindings XConfig {XMonad.modMask = modm} = M.fromList

    [ ((modm, button1), \w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster)
    , ((modm, button2), \w -> focus w >> windows W.shiftMaster)
    , ((modm, button3), \w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster)
    ]


myLayout    = tiled ||| Mirror tiled ||| Full
  where
    tiled   = renamed[Replace "Tiled"] $ spacing 10 $ Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 3/100

cfg =
  def {
    terminal           = myTerm,
    workspaces         = myWorkspaces,
    focusFollowsMouse  = True,

    borderWidth        = 2,
    normalBorderColor  = myNormalBorderColor,
    focusedBorderColor = myFocusedBorderColor,

    mouseBindings      = myMouseBindings,
    modMask            = mod4Mask,

    startupHook        = startupHook def <+> spawnStatusBar "xmobar ~/.xmonad/xmobarrc",
    layoutHook         = avoidStruts $ smartBorders myLayout,
    manageHook         = manageHook def <+> manageDocks,
    handleEventHook    = handleEventHook def
  }
  `additionalKeysP` myKeys
