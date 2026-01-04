extends Control

@onready var timer: Timer = $Timer
const START_BUTTON = preload("res://assets/Start Button-8.png")
const PAUSE_BUTTON = preload("res://assets/Pause Button-8.png")
@onready var timer_button: Button = $"Timer Button"
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	Reset_Timer()
	$"Minutes Label".text = "%02d" % minutes + ":"
	$"Seconds Label".text = "%02d" % seconds
	#timer.start()
	timer.stop()

var seconds = 0
var minutes = 0
var Dseconds = 0
var Dminutes = 15
func _on_timer_timeout() -> void:
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60
	seconds -= 1
	
	$"Minutes Label".text = "%02d" % minutes + ":"
	$"Seconds Label".text = "%02d" % seconds

func Reset_Timer():
	seconds = Dseconds
	minutes = Dminutes

func _on_timer_button_pressed() -> void:
	#timer.paused = !timer.paused
	
	if timer.is_stopped() == true:
		#Start timer if not running
		timer.start()
		var normal_style = timer_button.get_theme_stylebox("normal")
		var hover_style = timer_button.get_theme_stylebox("hover")
		if normal_style is StyleBoxTexture:
			normal_style.texture = PAUSE_BUTTON
			hover_style.texture = PAUSE_BUTTON
			timer_button.position.y += 5
			animation_player.play("paused_button")
	
	elif timer.paused:
		#Resume
		timer.paused = false
		var normal_style = timer_button.get_theme_stylebox("normal")
		var hover_style = timer_button.get_theme_stylebox("hover")
		if normal_style is StyleBoxTexture:
			normal_style.texture = PAUSE_BUTTON
			hover_style.texture = PAUSE_BUTTON
			timer_button.position.y += 5
			animation_player.play("paused_button")
			
	else:
		#Pause
		timer.paused = true
		var normal_style = timer_button.get_theme_stylebox("normal")
		var hover_style = timer_button.get_theme_stylebox("hover")
		if normal_style is StyleBoxTexture:
			normal_style.texture = START_BUTTON
			hover_style.texture = START_BUTTON
			timer_button.position.y -= 5
			animation_player.play("RESET")

func _on_reset_button_pressed() -> void:
	Reset_Timer()
	$"Minutes Label".text = "%02d" % minutes + ":"
	$"Seconds Label".text = "%02d" % seconds
	timer.stop()
	
