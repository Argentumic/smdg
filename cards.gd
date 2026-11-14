extends HBoxContainer

@onready var picked_card = $Card;
@onready var cost: RichTextLabel = $"../Cost"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_card_set();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for card in get_children():
		if card != picked_card:
			card.higlight.visible = false
		else:
			card.higlight.visible = true
			cost.text = str("[color=red]-", card.cost, " million USD")

var phase:int = -1;
@onready var phase_cards = [[$Card,$Card2,$Card3],[$Card4,$Card5,$Card6],[$Card7,$Card8,$Card9]]

func next_card_set() -> bool:
	$"../../..".budget -= picked_card.cost
	phase += 1;
	if phase < len(phase_cards):
		for arr in phase_cards:
			for card in arr:
				card.visible = false
		for card in phase_cards[phase]:
			card.visible = true;
		return true
	else:
		return false
