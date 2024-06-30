extends CanvasLayer


func load_score(score):
	for n in score:
		await get_tree().create_timer(0.2).timeout
		$MarginContainer/PanelContainer/VBoxContainer/PointsContainer/ProgressBar.value +=1



func _on_button_pressed():
	visible=false
	Transition.transition_scene("res://Scenes/MainMenu/main_menu.tscn")
