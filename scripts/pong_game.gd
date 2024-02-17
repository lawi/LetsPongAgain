extends Node2D

var score := [0,0]
var PADDLE_SPEED : int = 500
var game_ended = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("start_over") and game_ended:
		new_game()
	
func new_game():
	$Hud/WinnerText.visible = false
	$Hud/NewGameText.visible = false
	$GameArea.visible = true
	score[0] = 0
	score[1] = 0
	$Hud/ScoreLeft.text = str(score[0])
	$Hud/ScoreRight.text = str(score[1])
	$BallTimer.start()
	game_ended = false
	
func _on_ball_off_left_body_entered(body):
	print("Left entered")
	score[1] += 1
	$Hud/ScoreRight.text = str(score[1])
	if score[1] >= 10:
		game_finished("Right wins !!!")
		return
	$BallTimer.start()


func _on_ball_off_right_body_entered(body):
	print("Right entered")
	score[0] += 1
	$Hud/ScoreLeft.text = str(score[0])
	if score[0] >= 10:
		game_finished("Left wins !!!")
		return
	$BallTimer.start()

func game_finished(message : String):
	game_ended = true
	$GameArea.visible = false
	$Hud/WinnerText.text = message
	$Hud/WinnerText.visible = true
	$Hud/NewGameText.visible = true
