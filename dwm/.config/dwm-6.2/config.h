#include <X11/XF86keysym.h>

static const unsigned int borderpx = 1;
static const unsigned int snap = 32;

static const unsigned int gappx = 14;
static const int user_bh = 25;

static const char term[] = "alacritty";

static const int showbar = 1;
static const int topbar = 1;

static const char *fonts[] = {"Ubuntu Nerd Font:size=11:weight=bold"};
static const char dmenufont[] = "Ubuntu Nerd Font:size=11:weight=bold";

//0xd0
        static const unsigned int baralpha = 0x00;
        static const unsigned int borderalpha = OPAQUE;
        static const char col1[] = "#000000";
        static const char col2[] = "#444444";
        static const char col3[] = "#ebeef3";
        static const char col4[] = "#ebeef3";
        static const char col5[] = "#6a8ca5";
        static const char *colors[][3] = {
        /*                  fg     bg   border */
            [SchemeNorm] = {col3, col1, col2},
            [SchemeSel] = {col4, col5, col5},
        };
        static const unsigned int alphas[][3]      = {
           /*               fg      bg        border     */
           [SchemeNorm] = { OPAQUE, baralpha, borderalpha },
           [SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

static const char *tags[] = {" ", "", "", "", ""};

static const Rule rules[] = {
    /* class                        instance   title       tags mask    isfloating   monitor */
      {"Steam",                     NULL,      NULL,       1 << 3,      0,           -1},
      {"Gimp",                      NULL,      NULL,       1 << 4,      0,           -1},
      {"Blender",                   NULL,      NULL,       1 << 4,      0,           -1},
      {"Virt-manager",              NULL,      NULL,       1 << 2,      0,           -1},
      {"Emacs",                     NULL,      NULL,       1 << 1,      0,           -1},
      {"Brave-browser",             NULL,      NULL,       1 << 0,      0,           -1},
};

static const float mfact = 0.55;  /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;     /* number of clients in master area */
static const int resizehints = 1; /* 1 means respect size hints in tiled resizals */
static const Layout layouts[] = {
    {"", tile}, 
    {"", NULL},
    {"", monocle},
};

#define MODKEY Mod4Mask
#define print 0x0000ff61
#define TAGKEYS(KEY, TAG) \
   {MODKEY,                           KEY, view,       {.ui = 1 << TAG}}, \
   {MODKEY | ControlMask,             KEY, toggleview, {.ui = 1 << TAG}}, \
   {MODKEY | ShiftMask,               KEY, tag,        {.ui = 1 << TAG}}, \
   {MODKEY | ControlMask | ShiftMask, KEY, toggletag,  {.ui = 1 << TAG}},

 // helper for spawning shell commands
 #define SHCMD(cmd) {.v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }}

static char dmenumon[2] = "0";
static const char *termcmd[] = {term, NULL};
static const char *dmenucmd[] = {"dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col1, "-nf", col3, "-sb", col5, "-sf", col4, NULL};
static const char *roficmd[] = {"rofi", "-show", "run", NULL};
static const char *browser[] = {"vivaldi-stable", NULL};
static const char *textEditor[] = {"/bin/emacsclient", "-c", NULL};
static const char *emacsAlt[] = {"/usr/bin/emacs", NULL};
static const char *files[] = {term, "-e", "ranger", NULL};
static const char *mutecmd[] = {"amixer", "-q", "set", "Master", "toggle", NULL};
static const char *volupcmd[] = {"amixer", "-q", "set", "Master", "5%+", "unmute", NULL};
static const char *voldowncmd[] = {"amixer", "-q", "set", "Master", "5%-", "unmute", NULL};
static const char *pausecmd[] = {"playerctl", "play-pause", NULL};
static const char *scrotcmd[] = {"scrot", NULL};

static Key keys[] = {
  // modifier                       key        function        argument */   
    {MODKEY,                       XK_p,       spawn,          {.v = roficmd}},
    {MODKEY | ShiftMask,      XK_Return,       spawn,          {.v = termcmd}},
    {MODKEY,                       XK_b,       spawn,          {.v = browser}},
    {MODKEY,                       XK_e,       spawn,          {.v = textEditor}},
    {MODKEY | ShiftMask,           XK_e,       spawn,          {.v = emacsAlt}},
    {MODKEY,                       XK_f,       spawn,          {.v = files}},
    {0,                           print,       spawn,          {.v = scrotcmd}},

    {0,                XF86XK_AudioMute,       spawn,          {.v = mutecmd}},
    {0,         XF86XK_AudioLowerVolume,       spawn,          {.v = voldowncmd}},
    {0,         XF86XK_AudioRaiseVolume,       spawn,          {.v = volupcmd}},
    {0,                XF86XK_AudioPlay,       spawn,          {.v = pausecmd}},

    {MODKEY | ShiftMask,           XK_b,       togglebar,      {0}},
    {MODKEY,                       XK_j,       focusstack,     {.i = +1}},
    {MODKEY,                       XK_k,       focusstack,     {.i = -1}},
    {MODKEY,                       XK_i,       incnmaster,     {.i = +1}},
    {MODKEY,                       XK_d,       incnmaster,     {.i = -1}},
    {MODKEY,                       XK_h,       setmfact,       {.f = -0.05}},
    {MODKEY,                       XK_l,       setmfact,       {.f = +0.05}},
    {MODKEY,                       XK_Return,  zoom,           {0}},
    {MODKEY,                       XK_Tab,     view,           {0}},
    {MODKEY | ShiftMask,           XK_c,       killclient,     {0}},
    {MODKEY,                       XK_t,       setlayout,      {.v = &layouts[0]}},
    {MODKEY | ShiftMask,           XK_f,       setlayout,      {.v = &layouts[1]}},
    {MODKEY,                       XK_m,       setlayout,      {.v = &layouts[2]}},
    {MODKEY,                       XK_space,   setlayout,      {0}},
    {MODKEY | ShiftMask,           XK_space,   togglefloating, {0}},
    {MODKEY,                       XK_0,       view,           {.ui = ~0}},
    {MODKEY | ShiftMask,           XK_0,       tag,            {.ui = ~0}},
    {MODKEY,                       XK_comma,   focusmon,       {.i = -1}},
    {MODKEY,                       XK_period,  focusmon,       {.i = +1}},
    {MODKEY | ShiftMask,           XK_comma,   tagmon,         {.i = -1}},
    {MODKEY | ShiftMask,           XK_period,  tagmon,         {.i = +1}},
    TAGKEYS(                       XK_1,                       0)
    TAGKEYS(                       XK_2,                       1)
    TAGKEYS(                       XK_3,                       2)
    TAGKEYS(                       XK_4,                       3)
    TAGKEYS(                       XK_5,                       4)
    TAGKEYS(                       XK_6,                       5)
    TAGKEYS(                       XK_7,                       6) 
    TAGKEYS(                       XK_8,                       7)
    TAGKEYS(                       XK_9,                       8)
    {MODKEY | ShiftMask,           XK_q,       quit,           {0}},
};

static Button buttons[] = {
    /* click        vent     mask     button         function argument*/
    {ClkLtSymbol,   0,       Button1, setlayout,     {0}},
    {ClkLtSymbol,   0,       Button3, setlayout,     {.v = &layouts[2]}},
    {ClkStatusText, 0,       Button2, spawn,         {.v = termcmd}},
    {ClkClientWin,  MODKEY,  Button1, movemouse,     {0}},
    {ClkClientWin,  MODKEY,  Button2, togglefloating,{0}},
    {ClkClientWin,  MODKEY,  Button3, resizemouse,   {0}},
    {ClkTagBar,     0,       Button1, view,          {0}},
    {ClkTagBar,     0,       Button3, toggleview,    {0}},
    {ClkTagBar,     MODKEY,  Button1, tag,           {0}},
    {ClkTagBar,     MODKEY,  Button3, toggletag,     {0}},
};
