extends Button

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var button: Button = $"."

#@onready var parent = get_parent()

# Do you disable the font or not
# Yes = true, No = false
var do_i_disable: bool = false
var original_text: String = ""

#=================== Change Scene ===================
#PRE: nextScene is assigned as a string
#POST: Current scene in tree is switched to nextScene
func change_scene(nextScene):
	if nextScene == "New Data But":
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file("res://scenes/task_menu.tscn")
	elif nextScene == "Home But" || nextScene == "Home Button":
		var current_scene = get_tree().current_scene
		if current_scene.scene_file_path == "res://scenes/home_menu.tscn":
			return
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file("res://scenes/home_menu.tscn")

#=================== On Press ===================
#PRE: Button must lead to another page upon press
#POST: SFX plays and scene changes if appropriate
func _on_pressed() -> void:
	animation_player.play("press")
	change_scene(name)

#=================== On Mouse Entered ===================
#POST: SFX plays
func _on_mouse_entered() -> void:
	animation_player.play("hover")
