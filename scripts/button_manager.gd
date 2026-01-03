extends Node
var task_number = 1
const TASK_BUTTON = preload("res://scenes/task_button.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_add_task_button_pressed() -> void:
	print ("Add task started")
	var new_task_button = TASK_BUTTON.instantiate()
	#tasks.add_child(new_task_button)
	new_task_button.position = Vector2(70, task_number * 50 + 685)
	add_child(new_task_button)
	#button.position.y += 50
	task_number += 1
