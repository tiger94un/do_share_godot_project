extends Node3D



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		(func(): get_tree().change_scene_to_file("res://for ui and exit/win_screen.tscn") ).call_deferred()
		
