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
	#print("Se hizo clic en el hijo con índice:", indexChild)
	current_index = indexChild


func _on_update_uses(index:int = current_index):
	get_child(index).updateUses()


func refresh(indexProduct):
	var precio = Global.products[indexProduct]['price']
	if Global.money>precio:
		match indexProduct:
			0:
				add_slots(1,precio)
			1:
				add_slots(3,precio)
			2,3,4,5,6:
				if 0 in items:
					var index = items.find(0)
					get_child(index).set_attributes(indexProduct)
					Global.money -= precio
				else:
					Messages.show_message("No tienes espacio")
	else:
		Messages.show_message("No tienes dinero suficiente")

func add_slots(number_slots:int, precio: int):
	if items.size() < 5:
		for n in number_slots:
			var item = itemHotbar.instantiate()
			item.set_attributes()
			add_child(item)
		slots = get_children()
		slots_count = get_child_count()
		for child in get_children():
			if child.get_signal_connection_list("item_selected").size() == 0:
					child.connect("item_selected", on_hotbar_pressed.bind(child.get_index()))
		Global.money -= precio
