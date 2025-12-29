extends Control

@onready var timer: Timer = $Timer

func _ready() -> void:
	Reset_Timer()
	$"Minutes Label".text = "%02d" % minutes + ":"
	$"Seconds Label".text = "%02d" % seconds
	pass

var seconds = 0
var minutes = 0
var Dseconds = 1
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
	timer.paused = !timer.paused
