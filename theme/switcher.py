
import json
import template

themes = {}

with open("themes.json") as themes_file:
    themes = json.load(themes_file)

print(template.rofi(themes["catppuccin"]))

