extends HBoxContainer

@onready var picked_card = $Card;
@onready var cost: RichTextLabel = $"../../../Cost"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for card in get_children():
		if card != picked_card:
			card.higlight.visible = false
		else:
			card.higlight.visible = true
			cost.text = str("[color=red]-", card.cost, " billion USD")

var phase:int = 0;
@onready var phase_cards = [[$Card, $Card2, $Card3],[$Card4, $Card5, $Card6],[$Card7, $Card8, $Card9],[$Card14, $Card15, $Card16],[$Card18, $Card19, $Card20],[$Card10, $Card11, $Card12, $Card13, $Card17]]

func next_card_set() -> bool:
	$"../../..".budget -= picked_card.cost
	phase += 1;
	if phase <= 5:
		var new_card = picked_card.duplicate()
		$"../../../../RandomEvents/Deck".add_child(new_card)
	else:
		var index = [$Card10, $Card11, $Card12, $Card13, $Card17].find(picked_card)
		$"../../../../RandomEvents/Deck".get_children()[index].reliability += 15
		if $"../../../../RandomEvents/Deck".get_children()[index].reliability > 100:
			$"../../../../RandomEvents/Deck".get_children()[index].reliability = 100;
	if phase < len(phase_cards):
		for arr in phase_cards:
			for card in arr:
				card.visible = false;
		for card in phase_cards[phase]:
			card.visible = true;
		picked_card = phase_cards[phase][0]
		return true;
	else:
		cost.clear();
		visible = false;
		return false;
