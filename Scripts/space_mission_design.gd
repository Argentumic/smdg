extends CanvasLayer

var budget:int = 60

var engine_reliability: float = 0;
var chassis_reliability: float = 0;
var communication_reliability: float = 0;
var software_reliability: float = 0;
var power_reliability: float = 0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Budget.text = str("Budget: ",budget," billion USD")

@onready var launch_segment: Control = $LaunchSegment
func _on_launch_segment_next_pressed() -> void:
	if !$LaunchSegment/BG/Cards.next_card_set():
		visible = false;


func _on_previous_pressed() -> void:
	pass # Replace with function body.
