class_name IdleFoeStatement
extends StateComponent


@export var sensor :AreaSenseComponent
@export var chasing :ChasingFoeState

func running( delta :float ) -> StateComponent:
	if sensor.is_in_range():
		return chasing
	return null
