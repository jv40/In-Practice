extends Button

@onready var animation_player: AnimationPlayer = $AnimationPlayer
const TASK_BUTTON = preload("res://scenes/task_button.tscn")
@onready var button: Button = $"."
@onready var tasks: VBoxContainer = $"../Tasks"
#var task_number = 0;

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
	elif nextScene == "Art But" || nextScene == "Art Button":
		await get_tree().create_timer(0.2).timeout
		get_tree().change_scene_to_file("res://scenes/art_menu.tscn")
		

#=================== On Press ===================
#PRE: Button must lead to another page upon press
#POST: SFX plays and scene changes if appropriate
func _on_pressed() -> void:
	animation_player.play("press")
	change_scene(name)
	#if button.name == "Add Task Button":
		##print ("Add task started")
		##var new_task_button = TASK_BUTTON.instantiate()
		###tasks.add_child(new_task_button)
		##new_task_button.position = Vector2(-360, task_number * 50 - 10)
		##add_child(new_task_button)
		##button.position.y += 50
		##task_number += 1
	#
	#if button.name == "Delete Task Button":
		##button.position.y -= 50

#=================== On Mouse Entered ===================
#POST: SFX plays
func _on_mouse_entered() -> void:
	animation_player.play("hover")
