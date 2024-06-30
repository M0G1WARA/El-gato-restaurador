extends Control

var scene = load("res://Scenes/RestorationGame/restoration_game.tscn")
var store = load("res://Scenes/Store/store.tscn")
var RestorationInstance = scene.instantiate()
var storeInstance = store.instantiate()

func _ready():
	RestorationInstance.connect("removeScene", _on_mi_signal.bind(RestorationInstance))
	storeInstance.connect("removeScene", _on_mi_signal.bind(storeInstance))

func _on_mountain_range_pressed():
	Transition.show_transition()
	$MountainRange.show()
	$City.hide()

func _on_city_pressed():
	Transition.show_transition()
	$City.show()
	$MountainRange.hide()

func _on_store_pressed():
	#Transition.transition_scene("res://Scenes/Store/store.tscn")
	add_child(storeInstance)

func _on_cave_painting_pressed():
	#Transition.transition_scene("res://Scenes/RestorationGame/restoration_game.tscn")
	add_child(RestorationInstance)
	
func _on_mi_signal(instance):
		remove_child(instance)

var currentTimeHour = 12
var currentTimeMinutes = 0
var IntensityLevel = 1
func _on_timer_timeout():
	print("hour: ",currentTimeHour," minutes: ", currentTimeMinutes, " CanvasModulate ", IntensityLevel )
	if currentTimeMinutes <50:
		currentTimeMinutes+=60
	else:
		currentTimeMinutes=0
		update_canvas()
	

func update_canvas():
	if currentTimeHour <23:
		currentTimeHour+=1
	else:
		currentTimeHour = 0
	
	if currentTimeHour >= 18 and currentTimeHour <= 23:
		IntensityLevel -= 0.15#0.126
		$CanvasModulate.color = Color(IntensityLevel, IntensityLevel, IntensityLevel)
	elif currentTimeHour >= 1 and currentTimeHour <= 6:
		IntensityLevel += 0.15
		$CanvasModulate.color = Color(IntensityLevel, IntensityLevel, IntensityLevel)
