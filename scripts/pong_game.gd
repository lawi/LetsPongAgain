extends Node2D

var score := [0,0]
var PADDLE_SPEED : int = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ball_off_left_body_entered(body):
	print("Left entered")
	score[1] += 1
	$Hud/ScoreRight.text = str(score[1])
	$BallTimer.start()


func _on_ball_off_right_body_entered(body):
	print("Right entered")
	score[0] += 1
	$Hud/ScoreLeft.text = str(score[0])
	$BallTimer.start()
