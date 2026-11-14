extends RichTextLabel

@onready var rocket: Sprite3D = $"../../3dEnv/Rocket"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = str(round((rocket.global_position.x / 3000)*100), "% ", round(rocket.global_position.x), "/", "3000", "km")
