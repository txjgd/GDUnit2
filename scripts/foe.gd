extends CharacterBody2D

@onready var state_machine = $StateMachineComponent
@onready var stun = $StateMachineComponent/StunFoeState

func take_damage( amt: float ) -> void:
	state_machine.transition_to( stun )
	pass
