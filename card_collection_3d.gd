extends CardCollection3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var card:Card3D = preload("res://addons/card_3d/examples/card_table/face_card_3d.tscn").instantiate();
	for i in range(5):
		card = preload("res://card_3d.tscn").instantiate();
		self.append_card(card)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
