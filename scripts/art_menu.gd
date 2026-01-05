extends Control
const ARTWORK_SELECT_BUTTON = preload("res://scenes/artwork_select_button.tscn")
#@onready var label = $ArtworkSelectButton/Label
var artwork_number = 1;
var artwork_buttons = []
#@onready var label: Label = $Label
@onready var artwork: Node2D = $Artwork

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	create_new_button("Digimon Train Station")
	create_new_button("Frog?")
	create_new_button("Pokemon Waterfall")
	
	for button in get_tree().get_nodes_in_group("artwork_buttons"):
		button.artwork_selected.connect(_on_artwork_selected)

func _on_artwork_selected(new_artwork_name):
	print("Selected artwork: ", new_artwork_name)
	Globals.CHOSEN_GIF = new_artwork_name
	#var chosen_artwork = artwork.CHOSEN_GIF
	#chosen_artwork = new_artwork_name
	artwork.set_chosen_gif(new_artwork_name)

func create_new_button(newName):
	var new_artwork_button = ARTWORK_SELECT_BUTTON.instantiate()
	new_artwork_button.position = Vector2(90, artwork_number * 45 + 504)
	add_child(new_artwork_button)
	artwork_buttons.append(new_artwork_button)
	
	var label = new_artwork_button.get_node("Label")
	label.text = newName
	artwork_number += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
