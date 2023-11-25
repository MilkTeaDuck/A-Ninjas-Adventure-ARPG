extends CharacterBody2D

#Speed Handle
#Export Tag allows editing from plaeyr node inspector variable 
@export var speed: int = 35
#On Load load animations
@onready var animations = $AnimationPlayer


#Handling Player Movement
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed

#Handling Animation 
func updateAnimation():
	if velocity.length() == 0:
		animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up" 
		
		animations.play("walk" + direction)
	


#Physics handled here
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
