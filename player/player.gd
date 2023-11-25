extends CharacterBody2D

#Speed Handle
#Export Tag allows editing from plaeyr node inspector variable 
@export var speed: int = 35


#Handling Player Movement
func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection * speed


#Physics handled here
func _physics_process(delta):
	handleInput()
	move_and_slide()
