extends PanelContainer
@onready var check_button: CheckButton = $MarginContainer/VBoxContainer/GridContainer/VideoBox/FullScreenRow/CheckButton

var resolutions: Array[Vector2i] = [
	Vector2i(1920, 1080),
	Vector2i(1600, 900),
	Vector2i(1280, 720)
]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var current_mode = DisplayServer.window_get_mode()
	check_button.button_pressed = (
		current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN or 
		current_mode == DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN
	)

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
# Зміна роздільної здатності екрану
func _on_option_button_item_selected(index: int) -> void:
	var selected_res = resolutions[index]
	DisplayServer.window_set_size(selected_res)
# Центруємо вікно на екрані після зміни розміру
	var screen_center = DisplayServer.screen_get_position() + Vector2i(DisplayServer.screen_get_size() * 0.5)
	var window_size = DisplayServer.window_get_size_with_decorations()
	DisplayServer.window_set_position(screen_center - Vector2i(window_size * 0.5))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
