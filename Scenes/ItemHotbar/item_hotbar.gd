extends PanelContainer

signal item_selected

func _on_select_button_pressed():
	emit_signal("item_selected")
