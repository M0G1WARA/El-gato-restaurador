extends Control

func set_attributes(text: String):
	$PanelContainer/VBoxContainer/Label.text = text

func _on_timer_timeout():
	queue_free()
