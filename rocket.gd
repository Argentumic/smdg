extends Sprite3D


var flight_tween:Tween;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	flight_tween = get_tree().create_tween()
	flight_tween.tween_property(self, "global_position", Vector3(3000, 0, 0), 120).set_ease(Tween.EASE_IN_OUT)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
