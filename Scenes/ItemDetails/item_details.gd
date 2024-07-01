extends CanvasLayer


func set_attributes(itemName:String,description:String):
	$PanelContainer/VBoxContainer/Title.text = itemName
	$PanelContainer/VBoxContainer/Description.text = description

func showDetails():
	$PanelContainer.show()


func _on_close_button_pressed():
	$PanelContainer.hide()
