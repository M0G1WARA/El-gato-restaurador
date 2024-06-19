extends Control

var scene = load("res://Scenes/RestorationGame/restoration_game.tscn")
#var scene = preload("res://Scenes/RestorationGame/restoration_game.tscn")
var instance = scene.instantiate()

func _ready():
	instance.connect("removeScene", _on_mi_signal)

func _on_mountain_range_pressed():
	Transition.show_transition()
	$MountainRange.show()
	$City.hide()

func _on_city_pressed():
	Transition.show_transition()
	$City.show()
	$MountainRange.hide()

func _on_store_pressed():
	Transition.transition_scene("res://Scenes/Store/store.tscn")

func _on_cave_painting_pressed():
	#Transition.transition_scene("res://Scenes/RestorationGame/restoration_game.tscn")
	add_child(instance)
	
func _on_mi_signal():
		remove_child(instance)
