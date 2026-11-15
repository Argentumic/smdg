extends Control
@onready var main_buttons: Control = $MainButtons
@onready var settings_menu: Control = $SettingsMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if settings_menu:
		settings_menu.visible = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("main.tscn")


func _on_settings_pressed() -> void:
	if main_buttons:
		main_buttons.visible = false
	if settings_menu:
		settings_menu.visible = true

func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_back_button_pressed() -> void:
	if settings_menu:
		settings_menu.visible = false
	if main_buttons:
		main_buttons.visible = true
