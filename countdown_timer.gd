extends Control

@onready var timer: Timer = $Timer

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
	
	elif timer.paused:
		#Resume
		timer.paused = false
	else:
		#Pause
		timer.paused = true

func _on_reset_button_pressed() -> void:
	Reset_Timer()
	$"Minutes Label".text = "%02d" % minutes + ":"
	$"Seconds Label".text = "%02d" % seconds
	timer.stop()
	
