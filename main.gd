extends Node2D

func _on_player_side_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Ball':
		get_tree().paused = true
		$LoseWindow.visible = true


func _on_lose_window_visibility_changed() -> void:
	var points = str($PointsLabel.text)
	if int(points) == 1:
		points += " point"
	else:
		points += " points"
		
	var pointsText = "Your score: " + points
	$LoseWindow/Control/Label_FinalPoints.text = pointsText
