# AdventurePlayer.gd
extends Node

signal adventure_scene_loaded(data)
export(String, FILE, "*.json") var source_file

var loaded_adventure: Dictionary
var loaded_adventure_scene: Dictionary
var choices: Array
var _scene_index:= "0"


func _ready() -> void:
	# current scene loaded from AdventureLoader
	loaded_adventure = AdventureLoader.get_current_adventure()
	# initial adventure scene
	_change_adventure_scene(_scene_index)


# Change currently active adventure scene
func _change_adventure_scene(new_scene):
	loaded_adventure_scene = loaded_adventure.get(new_scene)
	choices = loaded_adventure_scene.get("choices")
	emit_signal("adventure_scene_loaded", loaded_adventure_scene)


# Change adventure scene on button press
func _on_Button_button_down() -> void:
	_scene_index = choices[0].get("next_scene")
	_change_adventure_scene(_scene_index)


# Change adventure scene on button press
func _on_Button2_button_down() -> void:
	_scene_index = choices[1].get("next_scene")
	_change_adventure_scene(_scene_index)
