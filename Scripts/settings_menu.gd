extends Control
var settings_menu: Control = $SettingsMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if settings_menu:
		settings_menu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
