extends CanvasLayer

func transition_scene(target: String) -> void:
	$AnimationPlayer.play("fade_animation")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards("fade_animation")

func show_transition():
	$AnimationPlayer.play_backwards("fade_animation")

func go_to_san_francisco():
	$AnimationPlayer.play("san_francisco")

func go_to_city():
	$AnimationPlayer.play("city")
