extends Control


func _on_home_button_pressed() -> void:
	$ClickSFX.play();
	get_tree().change_scene_to_file("res://home_menu.tscn");
