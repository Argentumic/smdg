extends CanvasLayer

var budget:int = 50

var engine_reliability: float = 0;
var chassis_reliability: float = 0;
var communication_reliability: float = 0;
var software_reliability: float = 0;
var power_reliability: float = 0;
@onready var hover_sound: AudioStreamPlayer = $"../HoverSound"
@onready var click_sound: AudioStreamPlayer = $"../ClickSound"

func _ready() -> void:
	$LaunchSegment/BG/Next.mouse_entered.connect(func():
		if hover_sound: hover_sound.play()
	)
	$LaunchSegment/BG/Next.pressed.connect(func():
		if click_sound: click_sound.play()
	)
	get_tree().paused = true;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Budget.text = str("Budget: ",budget," billion USD")

@onready var launch_segment: Control = $LaunchSegment
func _on_launch_segment_next_pressed() -> void:
	if !$LaunchSegment/BG/Cards.next_card_set():
		get_tree().paused = false;
		$"../RandomEvents/RandomEventTimer".start()
		visible = false;
