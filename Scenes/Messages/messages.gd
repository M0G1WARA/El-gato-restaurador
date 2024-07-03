extends CanvasLayer

var message = load("res://Scenes/Message/message.tscn")

func show_message(text:String):
	var newMessage = message.instantiate()
	newMessage.set_attributes(text)
	$MarginContainer/VBoxContainer.add_child(newMessage)
