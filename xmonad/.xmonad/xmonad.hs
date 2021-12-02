-- Base
import XMonad
import System.IO
import qualified XMonad.StackSet as W
import System.Exit
-- Data
import Data.Semigroup
-- Hooks
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
-- Layouts modifiers
import XMonad.Layout.Spacing
import XMonad.Layout.LayoutModifier
-- Utilities
import XMonad.Util.Run
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

myLauncher :: String
myLauncher = "dmenu_run"

myTextEditor :: String
myTextEditor = "emacs"

myTerminal :: String
myTerminal = "alacritty "

myBrowser :: String
myBrowser = "vivaldi-stable"

--myFiles :: String
--myFiles = "-e ranger"

myBorderWidth :: Dimension
myBorderWidth = 1

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myModMask :: KeyMask
myModMask = mod4Mask

myWorkspaces :: [[Char]]
myWorkspaces = ["1","2","3","4","5", "6", "7", "8", "9"]

myNormalBorderColor :: String
myNormalBorderColor  = "#000000"

myFocusedBorderColor :: String
myFocusedBorderColor = "#ffffff"

myLayoutHook :: ModifiedLayout AvoidStruts (ModifiedLayout Spacing(Choose Tall Full)) Window
myLayoutHook = avoidStruts(spacing 6 $ tiled ||| Full)
  where
    tiled   = Tall 1 (3/100) (1/2)

myManageHook :: Query(Endo WindowSet)
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , resource =? "desktop_window" --> doIgnore
    , resource =? "kdesktop"       --> doIgnore ]

myEventHook :: Event -> X All
myEventHook = mempty

myStartupHook :: X()
myStartupHook =  do
    spawnOnce "pipewire &"
    spawnOnce "pipewire-media session &"
    spawnOnce "pipewire-pulse &"
    spawnOnce "feh --bg-fill '~/wallpapers/pac1.jpg'"
    spawnOnce "picom &"
    spawnOnce "xmobar ~/.config/xmobar/xmobarrc &"

---------- Key bindings ----------
myKeys::[(String, X())]
myKeys =
  [
     -- launcher keybindings
     --("M-f", spawn ( myTerminal ++ myFiles)),
     ("M-e", spawn myTextEditor),
     ("M-S-<Return>", spawn myTerminal),
     ("M-p", spawn myLauncher),
     ("M-b", spawn myBrowser),
     ("<Print>", spawn "scrot"),
     -- close window
     ("M-S-c", kill),
     -- rotate layout
     ("M-<Space>", sendMessage NextLayout),
     -- resize windows to the default size
     ("M-n", refresh),
     -- move focus
     ("M-<Tab>", windows W.focusDown),
     ("M-j", windows W.focusDown),
     ("M-k", windows W.focusUp),
     ("M-m", windows W.focusMaster),
     -- Swap the focused window and the master window
     ("M-<Return>", windows W.swapMaster),
     ("M-S-j", windows W.swapDown),
     ("M-S-k", windows W.swapUp),
     -- Shrink the master area
     ("M-h", sendMessage Shrink),
     -- Expand the master area
     ("M-l", sendMessage Expand),
     -- Push window back into tiling
     ("M-t", withFocused $ windows . W.sink),
     -- Increment the number of windows in the master area
     ("M-,", sendMessage (IncMasterN 1)),
     -- Deincrement the number of windows in the master area
     ("modm-.", sendMessage (IncMasterN (-1))),
     -- Quit Xmonad
     ("M-S-q", io (exitWith ExitSuccess)),
     -- Restart XMonad
     ("M-S-p", spawn "xmonad --recompile; xmonad --restart"),
     -- Multimedia Keys
     ("<XF86AudioPlay>", spawn ("playerctl play-pause")),
     ("<XF86AudioPrev>", spawn ("playerctl previous")),
     ("<XF86AudioNext>", spawn ("playerctl next")),
     ("<XF86AudioMute>", spawn "amixer set Master toggle"),
     ("<XF86AudioLowerVolume>", spawn "amixer set Master 5%- unmute"),
     ("<XF86AudioRaiseVolume>", spawn "amixer set Master 5%+ unmute")
    ]

main :: IO()
main = do
  h <- spawnPipe "xmobar ~/.config/xmobar/xmobarrc"
  xmonad $ docks def{
        -- Pretty Printer Configs(for xmobar)
        logHook = dynamicLogWithPP $ xmobarPP{
                ppOutput  = hPutStrLn h,
                ppCurrent = xmobarColor "#eabe9a" "" . wrap "[ "" ]",
                ppHidden = xmobarColor "#b18bb1" "" . wrap "{ "" }",
                ppVisible = xmobarColor "#98be65" "",
                ppHiddenNoWindows = xmobarColor "#6e94b9" "",
                ppTitle = xmobarColor "#b3afc2" "" . shorten 40,
                ppWsSep = "    ",
                ppSep =  "  |  ",
                ppUrgent = xmobarColor "#c6797e" "",
                ppOrder = \(ws:l:t:ex) -> [ws]
                },
        --default terminal
        terminal = myTerminal,
        --focus settings
        focusFollowsMouse = myFocusFollowsMouse,
        --modmask
        modMask = myModMask,
        --borders and workspaces
        borderWidth = myBorderWidth,
        workspaces = myWorkspaces,
        normalBorderColor = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
        --layout, hooks
        manageHook = myManageHook <+> manageDocks,
        layoutHook = myLayoutHook,
        handleEventHook = myEventHook <+> docksEventHook,
        startupHook = myStartupHook
} `additionalKeysP` myKeys
