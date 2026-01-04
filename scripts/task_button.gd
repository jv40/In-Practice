extends Button



#func _on_gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.pressed and event.is_action_pressed("mouse_left_click"):
			#print("Left!")
#
		#if event.pressed and event.button_index == "mouse_right_click":
			#print("Right!")
@onready var task_button: Button = $"."

@onready var check_box: CheckBox = $CheckBox
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var line_edit: LineEdit = $LineEdit
#@onready var current_task_bar: Sprite2D = $"CurrentTaskBar-8"

const CURRENT_TASK_BAR = preload("res://assets/Current Task Bar-8.png")
const COMPLETED_TASK_BAR = preload("res://assets/Completed Task Bar-8.png")

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
		var style = task_button.get_theme_stylebox("normal")
		#if style is StyleBoxTexture:
			#style.texture = COMPLETED_TASK_BAR
	
	else:
		animation_player.play("RESET")
		var style = task_button.get_theme_stylebox("normal")
		
		#Checking to make sure we're accessing a StyleBoxTexture
		if style is StyleBoxTexture:
			style.texture = CURRENT_TASK_BAR
		#current_task_bar.Texture = CURRENT_TASK_BAR
		
	if line_edit.placeholder_text == "" and line_edit.is_editing() == false:
		line_edit.placeholder_text = "insert text here|"

func _on_line_edit_editing_toggled(toggled_on: bool) -> void:
	line_edit.placeholder_text = ""
