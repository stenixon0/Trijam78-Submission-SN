extends KinematicBody2D

export (float) var gravity = 49

export (float) var drag = 0.98

export (float) var airspeed = 200.0

var velocity = Vector2()

func _ready():
	position = Vector2(270, 20)

func _get_input():
	if Input.is_action_pressed("PlayerMoveLeft"):
		velocity.x = -airspeed
	elif Input.is_action_pressed("PlayerMoveRight"):
		velocity.x = airspeed
	else:
		velocity.x = 0
#	else:
#		velocity.x *= drag
#		if velocity.x :
#			velocity.x = 0
# can't figure out how to apply drag


func _physics_process(delta):
	_get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity)
