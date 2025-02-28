class_name AreaSenseComponent
extends Area2D

@export var host :CharacterBody2D
@export var target :CharacterBody2D

var direction :Vector2
var in_range :bool = false

func _ready() -> void:
	connect( "body_entered", _on_body_entered )
	connect( "body_exited", _on_body_exited )
	print( "signals connected" )
	pass
	
func _process( delta :float ) -> void:
	if in_range:
		direction = host.position.direction_to( target.position ).normalized()
		
func is_in_range() -> bool:
	return in_range

func _on_body_entered(body):
	print( body, " entered range" )
	if body == target:
		in_range = true

func _on_body_exited(body):
	if body == target:
		in_range = false
