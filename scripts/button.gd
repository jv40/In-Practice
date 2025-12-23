extends Button

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_pressed() -> void:
	print ("Button pressed")
	animation_player.play("press")

func _on_mouse_entered() -> void:
	print ("mouse enter")
	animation_player.play("hover")

#func _on_mouse_exited() -> void:
	#print ("mouse exit")
	#animation_player.pause()
