extends Control

func _ready():
	if Global.record_score > 0:
		$MarginContainer/VBoxContainer/ScoreContainer/ProgressBar.value = Global.record_score
		$MarginContainer/VBoxContainer/RecordContainer/Days.text = str(Global.record_days)
		$MarginContainer/VBoxContainer/RecordContainer/Hours.text = str(Global.record_hours)
		$MarginContainer/VBoxContainer/ScoreContainer.show()
		$MarginContainer/VBoxContainer/RecordContainer.show()
		$MarginContainer/VBoxContainer/ChallengesButton.show()
		

func _on_start_pressed():
	Global.backpack= [2]
	Global.item_selected = -1
	Global.wanted = false
	Transition.transition_scene("res://Scenes/Map/map.tscn")
