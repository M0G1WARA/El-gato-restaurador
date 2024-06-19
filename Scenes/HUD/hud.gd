extends CanvasLayer

@onready var slots = $MarginContainer/HotBar.get_children()
@onready var slots_count = $MarginContainer/HotBar.get_child_count()

signal returnMap

var current_index: int:
	set(value):
		current_index = value
		reset_focus()
		set_focus()

func _ready():
	current_index = 0
	for child in $MarginContainer/HotBar.get_children():
		child.connect("mouse_entered", on_hotbar_pressed.bind(child.get_index()))

func _input(event):
	if event.is_action_pressed("ui_scroll_up"):
		if current_index == slots_count -1:
			current_index = 0
		else:
			current_index += 1
	
	if event.is_action_pressed("ui_scroll_down"):
		if current_index == 0:
			current_index = slots_count -1
		else:
			current_index -= 1

func reset_focus():
	for slot in slots:
		slot.modulate = Color("ffffff")

func set_focus():
	$MarginContainer/HotBar.get_child(current_index).modulate = Color(0,1,0)


func on_hotbar_pressed(indexChild):
	print("mouse_entered")
	print("Se hizo clic en el hijo con índice:", indexChild)
	current_index = indexChild


func _on_return_pressed():
	if(get_parent().get_parent().name == "Map"):
		print("parent de map")
		emit_signal("returnMap")
	else:
		print(get_parent().get_parent().name)
