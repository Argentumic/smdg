extends Control
@onready var main_buttons: Control = $MainButtons
@onready var settings_menu: Control = $SettingsMenu
@onready var hover_sound: AudioStreamPlayer = $HoverSound
@onready var click_sound: AudioStreamPlayer = $ClickSound
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if main_buttons:
		main_buttons.visible = true
	if settings_menu:
		settings_menu.visible = false
			# Підключаємо звуки наведення та натискання до всіх кнопок і повзунків
	_connect_ui_sounds(self)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _connect_ui_sounds(node: Node) -> void:
	for child in node.get_children():
		if child is BaseButton:
			child.mouse_entered.connect(func():
				if hover_sound: hover_sound.play()
			)
			child.pressed.connect(func():
				if click_sound: click_sound.play()
			)
		elif child is HSlider:
			child.mouse_entered.connect(func():
				if hover_sound: hover_sound.play()
			)
			child.value_changed.connect(func(_val):
				if hover_sound and not hover_sound.playing:
					hover_sound.play()
			)
		_connect_ui_sounds(child)


func _on_play_pressed() -> void:
	await get_tree().create_timer(0.15).timeout
	get_tree().change_scene_to_file("main.tscn")


func _on_settings_pressed() -> void:
	if main_buttons:
		main_buttons.visible = false
	if settings_menu:
		settings_menu.visible = true

func _on_exit_pressed() -> void:
	await get_tree().create_timer(0.15).timeout
	get_tree().quit()


func _on_back_button_pressed() -> void:
	if settings_menu:
		settings_menu.visible = false
	if main_buttons:
		main_buttons.visible = true
