# AdventureLoader.gd
extends Node
"""""
This scrip is global and auto loaded.
_dir_index changes currently loded adventure
other scripts can get adventure dictionary data with functions
"""""
const _SOURCE_DIRECTORY = "res://src/data/"
var _dir_index := 0
var _files: Array


func _ready() -> void:
	_files = _get_files_in_directory(_SOURCE_DIRECTORY)


# Get the currently loaded adventure scene
# return scene loaded from .json
func get_current_adventure() -> Dictionary:
	return _load_adventure(_files[_dir_index])


# Get the next adventure scene in the directory
func get_next_adventure() -> Dictionary:
	if _dir_index < _files.size() - 1:
		_dir_index += 1
	else:
		_dir_index = 0
	return get_current_adventure()


# Get the previous adventure scene in the directory
func get_previous_adventure() -> Dictionary:
	if _dir_index > 0:
		_dir_index -= 1
	else:
		_dir_index = _files.size() - 1
	return get_current_adventure()


# Get all adventure .json files in directory
# returns an array of files in directory
func _get_files_in_directory(path) -> Array:
	var files = []
	var dir = Directory.new()
	assert(dir.dir_exists(path))
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			files.append("%s/%s" % [path, file])

	dir.list_dir_end()
	
	return files


# Load adventure scene from .json file
# returns a dictionary from a .json file  
func _load_adventure(file_path) -> Dictionary:
	# Parses a JSON file and returns it as a dictionary
	var file = File.new()
	assert(file.file_exists(file_path))

	file.open(file_path, file.READ)
	var adventure_scene = parse_json(file.get_as_text())
	assert(adventure_scene.size() > 0)
	return adventure_scene
