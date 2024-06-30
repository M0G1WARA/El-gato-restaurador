extends Control

func _ready():
	if Global.record_days !=0 or Global.record_hours !=0:
		$MarginContainer/VBoxContainer/RecordContainer/Days.text = str(Global.record_days)
		$MarginContainer/VBoxContainer/RecordContainer/Hours.text = str(Global.record_hours)
		$MarginContainer/VBoxContainer/RecordContainer.show()
		

func _on_start_pressed():
	Transition.transition_scene("res://Scenes/Map/map.tscn")
