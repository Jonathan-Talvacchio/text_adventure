extends CanvasLayer

signal scene_changed()

onready var animation_player = $AnimationPlayer
onready var control = $Control
onready var color_rect = $Control/ColorRect


"""""
Start animation, change scene, then reverse the animation
"""""
func change_scene(path: String, delay: int = 0.5):
	control.visible = true
	yield(get_tree().create_timer(delay), "timeout")
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	animation_player.play_backwards("fade")
	yield(animation_player, "animation_finished")
	control.visible = false
	emit_signal("scene_changed")
