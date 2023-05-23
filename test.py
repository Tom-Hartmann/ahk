import pyautogui
import time
import keyboard

clicking = False  # Autoclicker starts in the off state


def toggle_clicking():
    global clicking
    clicking = not clicking  # Toggle the state of clicking
    if clicking:
        print("Autoclicker on")
    else:
        print("Autoclicker off")


# Register a hotkey to toggle the autoclicker on and off
keyboard.add_hotkey("ctrl+alt+c", toggle_clicking)

while True:
    if clicking:
        # Click the mouse 100 times with 0.01 seconds interval between each click
        pyautogui.click(clicks=100, interval=0.01)
