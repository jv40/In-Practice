extends Button



#func _on_gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.pressed and event.is_action_pressed("mouse_left_click"):
			#print("Left!")
#
		#if event.pressed and event.button_index == "mouse_right_click":
			#print("Right!")

@onready var check_box: CheckBox = $CheckBox
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var line_edit: LineEdit = $LineEdit

func is_task_done():
	if check_box.button_pressed == true:
		return true
	else:
		return false

#func _on_mouse_entered() -> void:
	#if is_task_done() == true:
		#animation_player.play("completed")
	#else:
		#animation_player.play("RESET")

func _process (delta: float) -> void:
	if is_task_done() == true:
		animation_player.play("completed")
	else:
		animation_player.play("RESET")
		
	if line_edit.placeholder_text == "" and line_edit.is_editing() == false:
		line_edit.placeholder_text = "insert text here|"



func _on_pressed() -> void:
	line_edit.placeholder_text = ""


func _on_line_edit_editing_toggled(toggled_on: bool) -> void:
	line_edit.placeholder_text = ""
