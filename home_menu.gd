extends Control

func _ready():
	pass
	
func _process(delta):
	pass


#I'm hard coding the hover functionality, not very good
#to do I'll be honest but it works for now
func _on_load_hovered() -> void:
	$HoverSFX.play();
	$LoadSelected.visible = true;

func _on_load_unhovered() -> void:
	$LoadSelected.visible = false;

#--------------------------------------------
func _on_new_data_hovered() -> void:
	$HoverSFX.play();
	$NewDataSelected.visible = true;

func _on_new_data_unhovered() -> void:
	$NewDataSelected.visible = false;
	

#--------------------------------------------
func _on_settings_hovered() -> void:
	$HoverSFX.play();
	$SettingsSelected.visible = true;
	
func _on_settings_unhovered() -> void:
	$SettingsSelected.visible = false;


func _on_art_button_pressed() -> void:
	$ClickSFX.play();


func _on_load_pressed() -> void:
	$ClickSFX.play();


func _on_new_data_pressed() -> void:
	$ClickSFX.play();


func _on_settings_pressed() -> void:
	$ClickSFX.play();
