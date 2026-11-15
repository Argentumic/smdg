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
			cost.text = str("[color=red]-", card.cost, " million USD")

var phase:int = 0;
@onready var phase_cards = [[$Card,$Card2,$Card3],[$Card4,$Card5,$Card6],[$Card7,$Card8,$Card9]]

func next_card_set() -> bool:
	$"../../..".budget -= picked_card.cost
	phase += 1;
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
