extends Node2D

func _on_player_side_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Ball':
		get_tree().paused = true
		$LoseWindow.visible = true
