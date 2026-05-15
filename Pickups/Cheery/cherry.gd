extends Area2D
# This is the cherry system Bro
func spawn_feedback():
	var feedback = preload("res://Pickups/Feedback/feedback.tscn").instantiate()
	get_tree().current_scene.add_child(feedback)
	feedback.global_position = global_position


func _on_body_entered(body):

	if body.name != "Player":
		return

	var sound = get_tree().current_scene.get_node("CherrySound")
	sound.play()

	spawn_feedback()

	var ui = get_tree().get_first_node_in_group("ui")

	if ui:
		ui.add_cherry()

	queue_free()
