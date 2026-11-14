extends CanvasLayer

var budget:int = 4000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

@onready var launch_segment: Control = $LaunchSegment
func _on_launch_segment_next_pressed() -> void:
	if $LaunchSegment/BG/Cards.next_card_set():
		$Budget.text = str("Budget: ",budget," million USD")
	else:
		launch_segment.visible = false;

@onready var space_segment: Control = $SpaceSegment
func _on_space_segment_next_pressed() -> void:
	space_segment.visible = false;

@onready var ground_segment: Control = $GroundSegment
func _on_ground_segment_next_pressed() -> void:
	ground_segment.visible = false;

@onready var user_segment: Control = $UserSegment
func _on_user_segment_next_pressed() -> void:
	user_segment.visible = false;


func _on_launch_segment_previous_pressed() -> void:
	pass # Replace with function body.


func _on_space_segment_previous_pressed() -> void:
	launch_segment.visible = true;


func _on_ground_segment_previous_pressed() -> void:
	space_segment.visible = true;


func _on_user_segment_previous_pressed() -> void:
	ground_segment.visible = true;
