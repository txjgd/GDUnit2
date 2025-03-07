class_name PlayerClass
extends CharacterBody2D

func is_player(): return true

func _process( delta :float ) -> void:
	if Input.is_action_just_pressed( "ui_select" ) or Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$LaunchComponent.launch()
	pass
