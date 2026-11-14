extends Control

var is_mouse_inside:bool = false;
@export var cost:int = 1000;
@onready var higlight: Panel = $Panel


func _on_mouse_entered() -> void:
	is_mouse_inside = true;

func _on_mouse_exited() -> void:
	is_mouse_inside = false;


func _on_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("lmb"):
		$"..".picked_card = self;
		
