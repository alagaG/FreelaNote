extends Node


# Nodes
@onready var block_adder : BlockAdderMenu = $HUD/BlockAdder


func _ready():
	block_adder.connect("block_selected", _on_block_selected)


func _on_block_selected(type_key:String) -> void:
	var block_type : BlockEntry = Global.BLOCKS[type_key]
	var block : AbstractBlock = block_type.scene.instantiate()
	var rect = get_viewport().get_visible_rect()
	block.position = rect.position + rect.size / 2 - block.size / 2
	$Blocks.add_child(block)
