
def i3(colors):
    return f"""set $bg                 {colors["bg"]}
set $fg                 {colors["fg"]}
set $urgent             {colors["urgent"]}
set $inactive           {colors["inactive"]}
set $active             {colors["active"]}
set $black              {colors["black"]}
set $white              {colors["white"]}
set $red                {colors["red"]}
set $green              {colors["green"]}
set $blue               {colors["blue"]}
set $cyan               {colors["cyan"]}
set $magenta            {colors["magenta"]}
set $signature          {colors["signature"] if "signature" in colors else colors["active"]}

set $border_unfocused   #ffffff00
# colors
# class                     border      backgr.     text            indicator   child_border
client.focused              #000000     $bg         $fg             $inactive   $signature
client.unfocused            #000000     $bg         $white          $inactive   $border_unfocused
client.urgent               #000000     $bg         $fg             $inactive   $red
client.focused_inactive     #000000     $bg         $white          $inactive   $border_unfocused
"""

def rofi(colors):
    return f"""* {{
    bg:                 {colors["bg"]};
    fg:                 {colors["fg"]};
    urgent:             {colors["urgent"]};
    inactive:           {colors["inactive"]}; 
    active:             {colors["active"]};
    black:              {colors["black"]};
    white:              {colors["white"]};
    red:                {colors["red"]}; 
    green:              {colors["green"]};
    blue:               {colors["blue"]};
    cyan:               {colors["cyan"]};
    magenta:            {colors["magenta"]};
}}
"""

def eww(colors):
    return f"""$bg:                    {colors["bg"]};
$fg:                    {colors["fg"]};
$urgent:                {colors["urgent"]};
$inactive:              {colors["inactive"]}; 
$active:                {colors["active"]};
$black:                 {colors["black"]};
$white:                 {colors["white"]};
$red:                   {colors["red"]}; 
$green:                 {colors["green"]};
$blue:                  {colors["blue"]};
$cyan:                  {colors["cyan"]};
$magenta:               {colors["magenta"]};
"""

def dunst(settings, colors):
    return settings + f"""[urgency_low]
    # IMPORTANT: colors have to be defined in quotation marks.
    # Otherwise the "#" and following would be interpreted as a comment.
    frame_color = "{colors["inactive"]}"
    foreground = "{colors["fg"]}"
    background = "{colors["bg"]}"
    highlight = "{colors["inactive"]}"
    timeout = 4

[urgency_normal]
    frame_color = "{colors["active"]}"
    highlight = "{colors["active"]}"
    foreground = "{colors["fg"]}"
    background = "{colors["bg"]}"
    timeout = 6

[urgency_critical]
    frame_color = "{colors["urgent"]}"
    highlight = "{colors["urgent"]}"
    foreground = "{colors["fg"]}"
    background = "{colors["bg"]}"
    timeout = 8
"""
