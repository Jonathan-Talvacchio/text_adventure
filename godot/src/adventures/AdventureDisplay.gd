# AdventureDisplay.gd
extends Control

var loaded_adventure_scene
var choices


# Get adventure scene data from AdventurePlayer.gd signal
func _on_ScenePlayer_adventure_scene_loaded(data) -> void:
	loaded_adventure_scene = data
	_update()


# Update godot scene UI with new adventure scene
func _update():
	$Title.text = loaded_adventure_scene.get("title")
	
#	set adventure text to string from array
	var text_array = loaded_adventure_scene.get("text")
	var text_to_string: String
	for i in range(0,text_array.size()):
			text_to_string += text_array[i]
	$Text.text = text_to_string
	
	choices = loaded_adventure_scene.get("choices")
	$Button.text = choices[0].get("text")
	$Button2.text = choices[1].get("text")


func _on_ButtonBack_button_down() -> void:
	SceneChanger.change_scene("res://src/menus/AdventureSelector.tscn", 0.01)
