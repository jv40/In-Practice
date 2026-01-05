extends Button
@onready var artwork_select_button: Button = $"."

@onready var label: Label = $Label
const AVENIR_LT_PRO_HEAVY = preload("res://assets/avenir-lt-pro/AvenirLTProHeavy.otf")
const AVENIR_LT_PRO_LIGHT = preload("res://assets/avenir-lt-pro/AvenirLTProLight.otf")
@onready var art_highlight_bar: Sprite2D = $"CurrentTaskBar-8"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var currently_selected: bool = false

signal artwork_selected(artwork_name)  # Signal that sends text

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("artwork_buttons")
	
	await get_tree().process_frame #Wait one frame
	
	var texture_width = art_highlight_bar.texture.get_size().x
	var width = label.size.x
	artwork_select_button.size.x = width
	art_highlight_bar.scale.x = (width + 50) / texture_width
	
	if label.text == Globals.CHOSEN_GIF:
		currently_selected = true
		select_current()
	else:
		animation_player.play("RESET")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func select_current():
	label.add_theme_color_override("font_color", Color(1,1,1))
	label.add_theme_font_override("font", AVENIR_LT_PRO_HEAVY)
	animation_player.play("show_art_highlight")
	#artwork_select_button.position.x -= 20

func _on_pressed() -> void:
	if not currently_selected:
		#deselect all other buttons
		for button in get_tree().get_nodes_in_group("artwork_buttons"):
			if button != self:
				button.revert()
		
		#Select this button
		currently_selected = true
		select_current()
		#artwork_select_button.position.x -= 20
		
		artwork_selected.emit(label.text)

#func on_artwork_selected(selected_button):
	#if selected_button != self:
		#revert()

func revert():
	label.add_theme_color_override("font_color", Color(0,0,0))
	label.add_theme_font_override("font", AVENIR_LT_PRO_LIGHT)
	animation_player.play("RESET")
	currently_selected = false
	#artwork_select_button.position.x += 20


#func _on_artwork_selected(artwork_name: Variant) -> void:
	#pass # Replace with function body.
