#!/usr/bin/env python3

# Script to convert hex color to approximate color for Papirus icons

import math
import colorsys

papirus_colors = {
    "adwaita":   (78, 154, 6),
    "black":     (0, 0, 0),
    "blue":      (30, 136, 229),
    "bluegrey":  (96, 125, 139),
    "breeze":    (61, 174, 233),
    "brown":     (121, 85, 72),
    "carmine":   (150, 0, 24),
    "cyan":      (0, 188, 212),
    "darkcyan":  (0, 139, 139),
    "deeporange":(255, 87, 34),
    "green":     (67, 160, 71),
    "grey":      (117, 117, 117),
    "indigo":    (63, 81, 181),
    "magenta":   (216, 27, 96),
    "nordic":    (94, 129, 172),
    "orange":    (251, 140, 0),
    "palebrown": (161, 136, 127),
    "paleorange":(255, 183, 77),
    "pink":      (233, 30, 99),
    "red":       (229, 57, 53),
    "teal":      (0, 137, 123),
    "violet":    (142, 36, 170),
    "white":     (255, 255, 255),
    "yaru":      (233, 84, 32),
    "yellow":    (253, 216, 53),
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
    color = pywal_colors[10].strip()

print(closest_color(color))
