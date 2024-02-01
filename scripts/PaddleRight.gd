extends StaticBody2D

var win_height : int
var p_height : int
var p_offset : int
# Called when the node enters the scene tree for the first time.
func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $PaddleRightRect.get_size().y
	p_offset = $"../Borders/TopRect".position.y + $"../Borders/TopRect".size.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right_up"):
		position.y -= delta * $"..".PADDLE_SPEED
	elif Input.is_action_pressed("ui_right_down"):
		position.y += delta * $"..".PADDLE_SPEED
	position.y = clamp(position.y, p_height / 2 + p_offset, win_height -p_offset - p_height/2)

	
