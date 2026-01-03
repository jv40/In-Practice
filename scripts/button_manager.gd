extends Node
var task_number = 1
var task_buttons = []
const TASK_BUTTON = preload("res://scenes/task_button.tscn")
@onready var delete_task_button: Button = $"Delete Task Button"
@onready var add_task_button: Button = $"Add Task Button"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_add_task_button_pressed() -> void:
	if task_buttons.size() == 4:
		return
	
	print ("Add task started")
	add_task_button.position.y += 50
	delete_task_button.position.y += 50
	var new_task_button = TASK_BUTTON.instantiate()
	#tasks.add_child(new_task_button)
	new_task_button.position = Vector2(70, task_number * 50 + 685)
	add_child(new_task_button)
	task_buttons.append(new_task_button)
	#button.position.y += 50
	task_number += 1

func _on_delete_task_button_pressed() -> void:
	if task_buttons.size() > 0:
		add_task_button.position.y -= 50
		delete_task_button.position.y -= 50
		var last_button = task_buttons.pop_back() #Remove from array
		last_button.queue_free() #Delete from scene
		task_number -= 1
