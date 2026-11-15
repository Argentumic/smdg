extends Control

func _process(delta: float) -> void:
	if visible:
		$"../..".time -= delta;
		if $"../..".time <= 0:
			$"..".visible = false
			visible = false;
			$"../..".time = $"../..".start_time
			if $"../../Deck".picked_card_index == 1:
				print("damage = ", ((100.0-$"../../Deck".picked_card.reliability)/100.0)*30.0)
				$"../..".hp -= ((100.0-$"../../Deck".picked_card.reliability)/100.0)*30.0
			else:
				$"../..".hp -= 30;
				print("wanted index 1, given index,",$"../../Deck".picked_card_index)
