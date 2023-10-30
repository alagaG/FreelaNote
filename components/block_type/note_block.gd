@tool
class_name NoteBlock
extends TitledBlock


# Exports
@export var note_text : String = "" :
	set = set_note_text, get = get_note_text
# Nodes
@onready var text_editor_node : TextEdit = $Panel/Margin/VBox/TextEdit


func reset() -> void:
	super()
	note_text = ""


func get_note_text() -> String:
	return text_editor_node.text if text_editor_node else ""


func set_note_text(value:String) -> void:
	if text_editor_node:
		text_editor_node.text = value
