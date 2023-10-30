class_name SelectionSettings
extends Control


@export var block : AbstractBlock = null


func set_block_target(value:AbstractBlock) -> void:
	block = value
	global_position = block.global_position + Vector2(block.size.x / 2, -8)
