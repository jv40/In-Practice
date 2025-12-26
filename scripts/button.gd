extends Button

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var button: Button = $"."

# Do you disable the font or not
# Yes = true, No = false
var do_i_disable: bool = false

func _ready() -> void:
	which_button()
	animation_player.play("disable_font")
	

func which_button():
	
	if button.text == "Load":
		do_i_disable = true
	elif button.text == "New_Data":
		do_i_disable = true
	elif button.text == "Settings":
		do_i_disable = true
	elif button.text == "Art":
		do_i_disable = true
	elif button.text == "Home":
		do_i_disable = true

func change_scene(nextScene):
	if nextScene == "New_Data":
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file("res://scenes/task_menu.tscn")
	elif nextScene == "Home":
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file("res://scenes/home_menu.tscn")

func _on_pressed() -> void:
	animation_player.play("press")
	change_scene(button.text)

func _on_mouse_entered() -> void:
	print ("mouse enter")
	animation_player.play("hover")

#func _on_mouse_exited() -> void:
	#print ("mouse exit")
	#animation_player.pause()
