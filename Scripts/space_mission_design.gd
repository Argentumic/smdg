extends CanvasLayer

var budget:int = 4000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Budget.text = str("Budget: ",budget," million USD")

@onready var launch_segment: Control = $LaunchSegment
func _on_launch_segment_next_pressed() -> void:
	if !$LaunchSegment/BG/Cards.next_card_set():
		visible = false;


func _on_previous_pressed() -> void:
	pass # Replace with function body.
