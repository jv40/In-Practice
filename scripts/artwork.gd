extends Node2D
@onready var sprite: Sprite2D = $Sprite2D
const POKEMON_WATERFALL_SPRITESHEET = preload("res://gifs/Pokemon Waterfall Spritesheet.png")
const POKEMON_WATERFALL = preload("res://gifs/Pokemon Waterfall.png")
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = POKEMON_WATERFALL_SPRITESHEET
	sprite.hframes = 7
	sprite.vframes = 6
	sprite.frame = 0
	
	anim_sprite.offset = Vector2(0,0)
	anim_sprite.centered = false
	anim_sprite.scale = Vector2(0.32,0.32)
	anim_sprite.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
