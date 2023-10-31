@tool
class_name BlockAdderMenu
extends HBoxContainer

# Nodes
@onready var panel : PanelContainer = $Panel
@onready var type_list : VBoxContainer = $Panel/Margin/VBox
@onready var activator : Button = $Activator
# Var
signal block_selected(type_key:String)


func _ready():
	activator.connect("pressed", _on_activator_down)
	
	for key in Global.BLOCKS.keys():
		var button : BlockTypeButton = BlockTypeButton.new()
		var block_type : BlockEntry = Global.BLOCKS[key]
		button.text = block_type.name
		button.key = key
		type_list.add_child(button)
		button.connect("selected", _on_block_type_button_selected)


func _on_block_type_button_selected(type_key:String):
	emit_signal("block_selected", type_key)


func _on_activator_down():
	panel.visible = true
	panel.grab_focus()


class BlockTypeButton extends Button:
	var key : String
	signal selected(type_key:String)
	
	
	func _ready():
		self.connect("pressed", self._on_pressed)
	
	
	func _on_pressed():
		self.emit_signal("selected", self.key)
