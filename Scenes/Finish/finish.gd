extends CanvasLayer


func load_score(score):
	$MarginContainer/PanelContainer/VBoxContainer/TimeContainer/Days.text = str(Global.tmp_days)
	$MarginContainer/PanelContainer/VBoxContainer/TimeContainer/Hours.text = str(Global.tmp_hours)
	for n in score:
		await get_tree().create_timer(0.2).timeout
		$MarginContainer/PanelContainer/VBoxContainer/PointsContainer/ProgressBar.value +=1
	if score > Global.record_score:
		set_record(score)
	elif score == Global.record_score:
		update_record()


func _on_button_pressed():
	visible=false
	Transition.transition_scene("res://Scenes/MainMenu/main_menu.tscn")


func set_record(score):
	Global.record_score = score
	Global.record_days = Global.tmp_days
	Global.record_hours = Global.tmp_hours

func update_record():
	if Global.tmp_days < Global.record_days:
		Global.record_days = Global.tmp_days
	elif Global.tmp_days == Global.record_days:
		if Global.tmp_hours < Global.record_hours:
			Global.record_hours = Global.tmp_hours
