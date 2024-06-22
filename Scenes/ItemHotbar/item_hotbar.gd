extends PanelContainer

signal item_selected

func set_attributes(valor: int = 0):
	match valor:
		0:
			$VBoxContainer.hide()
		1:
			pass

func _on_select_button_pressed():
	emit_signal("item_selected")


func _on_item_selected():
	print("item seleccionado")
