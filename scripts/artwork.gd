extends Node2D
@onready var sprite: Sprite2D = $Sprite2D
const POKEMON_WATERFALL_SPRITESHEET = preload("res://gifs/Pokemon Waterfall Spritesheet.png")
const POKEMON_WATERFALL = preload("res://gifs/Pokemon Waterfall.png")
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

#var CHOSEN_GIF = "digimon_train_station" 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim_sprite.offset = Vector2(0,0)
	anim_sprite.centered = false
	sprite_adjust(Globals.CHOSEN_GIF)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func sprite_adjust(current_gif):
	if current_gif == "Pokemon Waterfall":
		anim_sprite.position = Vector2(0,0)
		anim_sprite.scale = Vector2(0.32,0.32)
		anim_sprite.play("default")
		
	if current_gif == "Pokemon Blue Bedroom":
		anim_sprite.position = Vector2(0,0)
		anim_sprite.scale = Vector2(0.58,0.58)
		anim_sprite.play("pokemon_blue_bedroom")
	
	if current_gif == "Digimon Train Station":
		anim_sprite.scale = Vector2(1.15,1.15)
		anim_sprite.position = Vector2(0,0)
		anim_sprite.position.x -= 150
		anim_sprite.play("digimon_train_station")
		
	if current_gif == "Frog?":
		anim_sprite.scale = Vector2(0.8,0.8)
		anim_sprite.position = Vector2(0,0)
		anim_sprite.position.x += 50
		anim_sprite.play("frog?")
	
	if current_gif == "Kingdom Hearts Ocean":
		anim_sprite.position = Vector2(0,0)
		anim_sprite.position.y += 28
		anim_sprite.scale = Vector2(1,1)
		anim_sprite.play("kingdom_hearts_ocean")
	
	if current_gif == "Bloodborne Study":
		anim_sprite.position = Vector2(0,0)
		anim_sprite.scale = Vector2(0.35,0.35)
		anim_sprite.position.x -= 100
		anim_sprite.play("bloodborne_study")
	
	if current_gif == "Dark Souls Bonfire":
		anim_sprite.position = Vector2(0,0)
		anim_sprite.position.x -= 300
		anim_sprite.scale = Vector2(1.75,1.75)
		anim_sprite.play("dark_souls_bonfire")
		
	if current_gif == "Megaman 8 Stage Select":
		anim_sprite.position = Vector2(0,0)
		anim_sprite.position.y += 30
		anim_sprite.position.x += 15
		anim_sprite.scale = Vector2(1.5,1.5)
		anim_sprite.play("mm8_stage_select")
		
	if current_gif == "Megaman 8 Frost Man":
		anim_sprite.position = Vector2(0,0)
		anim_sprite.position.y += 12
		anim_sprite.position.x -= 45
		anim_sprite.scale = Vector2(0.35,0.35)
		anim_sprite.play("mm8_frost_man")


func set_chosen_gif(gif_name):
	Globals.CHOSEN_GIF = gif_name
	sprite_adjust(gif_name)
