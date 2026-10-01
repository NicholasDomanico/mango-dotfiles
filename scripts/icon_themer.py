#!/usr/bin/env python3

# Script to convert hex color to approximate color for Papirus icons

import math
import colorsys

papirus_colors = {
    "adwaita":   (126, 161, 194),
    "black":     (78, 78, 79),
    "blue":      (75, 127, 189),
    "bluegrey":  (88, 111, 122),
    "breeze":    (80, 157, 198),
    "brown":     (121, 85, 72),
    "carmine":   (137, 6, 7),
    "cyan":      (14, 165, 184),
    "darkcyan":  (64, 145, 154),
    "deeporange":(200, 93, 55),
    "green":     (119, 153, 82),
    "grey":      (126, 126, 125),
    "indigo":    (81, 92, 159),
    "magenta":   (176, 104, 193),
    "nordic":    (111, 136, 161),
    "orange":    (201, 127, 56),
    "palebrown": (179, 164, 151),
    "paleorange":(201, 172, 124),
    "pink":      (199, 84, 122),
    "red":       (194, 78, 78),
    "teal":      (27, 136, 114),
    "violet":    (113, 81, 167),
    "white":     (255, 255, 255),
    "yaru":      (127, 99, 89),
    "yellow":    (210, 162, 50),
}

def hex_to_rgb(hex):
    hex_color = hex.lstrip("#")
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def rgb_to_hsv(rgb):
    r_norm = rgb[0] / 255.0
    g_norm = rgb[1] / 255.0
    b_norm = rgb[2] / 255.0
    return colorsys.rgb_to_hsv(r_norm, g_norm, b_norm)

def distance(hsv1, hsv2):
    hue1, saturation1, value1 = hsv1
    hue2, saturation2, value2 = hsv2
    distance_hue = min(abs(hue1 - hue2), 1 - abs(hue1 - hue2))
    distance_saturation = abs(saturation1 - saturation2) / 100.0
    distance_value = abs(value1 - value2) / 100.0

    return math.sqrt(distance_hue**2 + distance_saturation**2 + distance_value**2)

def closest_color(hex_input):
    target_hsv = rgb_to_hsv(hex_to_rgb(hex_input))

    closest_papirus_color = None
    best_dist = float("inf")

    for name, rgb in papirus_colors.items():
        hsv = rgb_to_hsv(rgb)
        d = distance(target_hsv, hsv)

        if d < best_dist:
            best_dist = d
            closest_papirus_color = name

    return closest_papirus_color


with open("/home/nicholas/.cache/wal/colors") as f:
    pywal_colors = f.readlines()
    color = pywal_colors[2].strip()

print(closest_color(color))
