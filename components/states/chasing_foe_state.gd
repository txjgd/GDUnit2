class_name ChasingFoeState
extends StateComponent

@export var animations :AnimationPlayer
@export var sensor :AreaSenseComponent
@export var idle   :IdleFoeStatement
@export var speed  :float = 100

func enter( prev :StateComponent ) -> void:
	animations.play( "alert" )


func running( delta :float ) -> StateComponent:
	if not sensor.is_in_range():
		return idle
	
	host.velocity = sensor.direction * speed
	host.move_and_slide()
	return null
