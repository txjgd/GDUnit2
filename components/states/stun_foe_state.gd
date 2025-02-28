class_name StunFoeState
extends StateComponent

@export var animations :AnimationPlayer
@export var idle :IdleFoeStatement
@export var chase :ChasingFoeState
@export var stun_time :float = 5

var cooldown :float = 0

func enter( prev :StateComponent ) -> void:
	cooldown = stun_time
	animations.play( "shake" )


func running( delta :float ) -> StateComponent:
	cooldown -= delta
	if cooldown < 0:
		return idle
	
	return null
