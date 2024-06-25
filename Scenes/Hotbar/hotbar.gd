extends FlowContainer

var slots = 0#$MarginContainer/HotBar.get_children()
var slots_count = 0 #$MarginContainer/HotBar.get_child_count()
var itemHotbar = preload("res://Scenes/ItemHotbar/item_hotbar.tscn")
var items: Array[int] = Global.backpack
var current_index: int:
	set(value):
		current_index = value
		reset_focus()
		set_focus()

signal updateUses

func _ready():
	
	for i in items:
		var item = itemHotbar.instantiate()
		item.set_attributes(i)
		add_child(item)
	
	slots = get_children()
	slots_count = get_child_count()

	for child in get_children():
		child.connect("item_selected", on_hotbar_pressed.bind(child.get_index()))

	current_index = 0

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
	if slots_count>0:
		get_child(current_index).modulate = Color(0,1,0)
		Global.item_selected = current_index


func on_hotbar_pressed(indexChild):
	print("Se hizo clic en el hijo con índice:", indexChild)
	current_index = indexChild


func _on_update_uses():
	print('waaaaaaaaaaaaa')
	get_child(current_index).updateUses()