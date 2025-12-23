extends Button



#func _on_gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.pressed and event.is_action_pressed("mouse_left_click"):
			#print("Left!")
#
		#if event.pressed and event.button_index == "mouse_right_click":
			#print("Right!")
