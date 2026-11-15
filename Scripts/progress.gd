extends ProgressBar

@onready var rocket: Sprite3D = $"../../../3dEnv/Rocket"

func _process(delta: float) -> void:
	value = (rocket.global_position.x / 3000)*100
