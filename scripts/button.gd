extends Button

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var button: Button = $"."

#@onready var parent = get_parent()

# Do you disable the font or not
# Yes = true, No = false
var do_i_disable: bool = false
var original_text: String = ""

func _ready() -> void:
	add_to_group("menu_buttons")  # Add this line!
	
	original_text = text
	
	animation_player = get_node_or_null("AnimationPlayer")
	if not animation_player:
		print("animation_player not found")
		return
	
	which_button()
	
	if do_i_disable:
		animation_player.play("disable_font")

func _process(delta: float):
	pass
	#animation_player.play("disable_font")
	

func disable_font_func():
	animation_player = get_node_or_null("AnimationPlayer")
	if not animation_player:
		return
	
	which_button()
	if do_i_disable:
		print(text, " - animation playing")
		animation_player.play("disable_font")
		
	else:
		print(text, " - NOT disabling (do_i_disable is false)")

func which_button():
	do_i_disable = false  # Reset it first!
	
	if original_text == "Load":
		print ("Load button disabling")
		do_i_disable = true
	elif original_text == "New_Data":
		do_i_disable = true
	elif original_text == "Settings":
		do_i_disable = true
	elif original_text == "Art":
		do_i_disable = true
	elif original_text == "Home":
		print ("Home Button Disabling")
		do_i_disable = true

func change_scene(nextScene):
	if nextScene == "New_Data":
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file("res://scenes/task_menu.tscn")
	elif nextScene == "Home":
		var current_scene = get_tree().current_scene
		if current_scene.scene_file_path == "res://scenes/home_menu.tscn":
			return
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file("res://scenes/home_menu.tscn")

func _on_pressed() -> void:
	animation_player.play("press")
	change_scene(original_text)

func _on_mouse_entered() -> void:
	animation_player.play("hover")

#func _on_mouse_exited() -> void:
	#print ("mouse exit")
	#animation_player.pause()
