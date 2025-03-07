class_name PickupSpawnComponent
extends Node

signal no_more_pickups

@export var spawn_count :int = 10
@export var pickup :PackedScene
@export var spawn_node :Node

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
	if get_child_count() == 0:
		print( "ERROR! No Marker2Ds set" )
	spawn()

func picked_up( who :Node ) -> void:
	who.queue_free()
	print("waiting for timer...")
	await get_tree().create_timer(0.5).timeout
	print("spawning new")
	spawn()


func spawn() -> void:
	print( "spawns left ", spawn_count )
	
	if spawn_count == 0:
		emit_signal("no_more_pickups")
		return

	var places = get_child_count()
	var place = rng.randi_range( 0, places - 1 )
	var child = get_child( place )
	var obj = pickup.instantiate()

	spawn_node.add_child( obj )
	obj.global_position = child.global_position
	obj.spawner = self

	spawn_count -= 1
	pass
