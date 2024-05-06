class_name SpawnComponent
extends Node

@export var scene: PackedScene

func spawn(global_spawn_position: Vector2, parent: Node = get_tree().current_scene):
	assert(scene is PackedScene, "Error: The scene export was never set on this spawner component.")
	
	var instance = scene.instantiate()
	parent.add_child(instance)
	
	instance.global_position = global_spawn_position
	return instance
