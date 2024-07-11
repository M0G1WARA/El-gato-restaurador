extends Control

func _ready():
	if Global.record_score > 0:
		$MarginContainer/VBoxContainer/RecordContainer/TimeContainer/Days.text = str(Global.record_days)
		$MarginContainer/VBoxContainer/RecordContainer/TimeContainer/Hours.text = str(Global.record_hours)
		$MarginContainer/VBoxContainer/RecordContainer/ScoreContainer/ProgressBar.value = Global.record_score
		$MarginContainer/VBoxContainer/RecordContainer.show()
		

func _on_start_pressed():
	Global.backpack= [2]
	Global.item_selected = -1
	Global.wanted = false
	Transition.transition_scene("res://Scenes/Map/map.tscn")
