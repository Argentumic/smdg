extends CanvasLayer

var hp:float = 100;
var start_time:float = 5;
var time:float = 0;

func _process(delta: float) -> void:
	if hp <= 0:
		get_tree().paused = true;
		$"../GameOver".visible = true;

func successful_roll() -> void:
	time = start_time
	$RandomEvent.visible = true;
	var events = $RandomEvent.get_children();
	var event_amount = $RandomEvent.get_child_count()-1;
	events[randi_range(0,event_amount-1)].visible = true;

func failed_roll() -> void:
	pass

func random_event_roll() -> void:
	var num = randi_range(0,100);
	if num < 70:
		successful_roll();
	else:
		failed_roll();


func _on_random_event_timer_timeout() -> void:
	random_event_roll();
	print("timeout")
