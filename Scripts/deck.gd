extends HBoxContainer

@onready var picked_card = $Card;
var picked_card_index = 0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var i = -1;
	for card in get_children():
		i += 1;
		if card != picked_card:
			card.higlight.visible = false
		else:
			card.higlight.visible = true
			picked_card_index = i;
	
	if $"../MissionHealthAndProgress/ProgressBar".value >=100:
		$"..".queue_free()
		$"../../SpaceMissionDesign".queue_free()
		$"../../MissionSuccessful".visible = true;
		
