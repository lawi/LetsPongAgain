extends CharacterBody2D

const START_SPEED : int = 500
const ACCEL : int  = 20
var dir : Vector2
var speed : int
var ball_moving = false
var win_size : Vector2

func _ready():
	win_size = get_viewport_rect().size
	
	

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../PaddleLeft" or collider == $"../PaddleRight":
			speed += ACCEL
			dir = dir.bounce(collision.get_normal()) #TODO bounce durch eigene methode ersetzen
		else:
			dir = dir.bounce(collision.get_normal())
	
func new_ball():
	position.x = win_size.x / 2
	position.y = randi_range(200, win_size.y - 200)
	speed = START_SPEED
	dir = random_dir()
	
func random_dir():
	var new_dir := Vector2()
	new_dir.x = [1,-1].pick_random()
	new_dir.y = randf_range(-1,1)
	return new_dir.normalized()

func _on_ball_timer_timeout():
	new_ball()
