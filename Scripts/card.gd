extends Control

var is_mouse_inside:bool = false;
@export var cost:int = 1000;
@export var reliability:float = 30;
@onready var higlight: Panel = $Panel
@onready var label: Label = $Card/Label
@onready var click_sound: AudioStreamPlayer;

func _ready() -> void:
	click_sound = get_tree().get_first_node_in_group("click_sound");
	tooltip_text = str("-",reliability,"% damage")

func _on_mouse_entered() -> void:
	is_mouse_inside = true;

func _on_mouse_exited() -> void:
	is_mouse_inside = false;


func _on_gui_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("lmb"):
		$"..".picked_card = self;
		click_sound.pitch_scale = randf_range(0.9,1.1);
		click_sound.play()
		
