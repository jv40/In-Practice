extends Node

var time: float = 15.0
var minutes: int = 15
var seconds: int = 0

func _process(delta: float) -> void:
	time -= delta
	seconds = fmod(time,60) * 100
	minutes = fmod(time, 3600) /60
	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d" % seconds
