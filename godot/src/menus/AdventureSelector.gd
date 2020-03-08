# AdventureSelector.gd
extends Control

const _ADVENTURE_DISPLAY = "res://src/adventures/AdventureDisplay.tscn"
var _loaded_adventure: Dictionary


func _ready() -> void:
	_update(AdventureLoader.get_current_adventure())


func _on_ButtonNext_button_down() -> void:
	_update(AdventureLoader.get_next_adventure())


func _update(adventure: Dictionary):
	_loaded_adventure = adventure
	$Text.text = _loaded_adventure.get("adventure_title")


func _on_ButtonPlay_button_down() -> void:
	SceneChanger.change_scene(_ADVENTURE_DISPLAY, 0.05)
