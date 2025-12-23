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
	elif button.text == "New Data":
		do_i_disable = true
	elif button.text == "Settings":
		do_i_disable = true
	elif button.text == "Art":
		do_i_disable = true

func _on_pressed() -> void:
	animation_player.play("press")

func _on_mouse_entered() -> void:
	print ("mouse enter")
	animation_player.play("hover")

#func _on_mouse_exited() -> void:
	#print ("mouse exit")
	#animation_player.pause()
