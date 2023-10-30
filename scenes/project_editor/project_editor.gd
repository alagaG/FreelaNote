extends Node


# Nodes
@onready var add_button : Button = $'%AddButton'


func _ready():
	add_button.connect("button_down", _on_add_button_down)


func _on_add_button_down() -> void:
	print(1)
