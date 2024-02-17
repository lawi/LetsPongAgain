extends StaticBody2D

@export var x_position : int
@export var control_up : String
@export var control_down : String
var win_height : int
var p_height : int
var p_offset : int

func _ready():
	position.x = x_position
	win_height = get_viewport_rect().size.y
	p_height = $PaddleRect.get_size().y
	p_offset = $"../Borders/TopRect".position.y + $"../Borders/TopRect".size.y

func _process(delta):
	if Input.is_action_pressed(control_up):
		position.y -= delta * $"../..".PADDLE_SPEED # get_parent() is also possible instead of $".."
	elif Input.is_action_pressed(control_down):
		position.y += delta * $"../..".PADDLE_SPEED
	position.y = clamp(position.y, p_height / 2 + p_offset, win_height -p_offset - p_height/2)
