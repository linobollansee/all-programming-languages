// GDScript (Godot)
extends Node

func _ready():
    print("Hello, World!")

func greet(name: String) -> String:
    return "Hello, " + name + "!"
