extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ROTATION_DEGREES_PER_TICK = 5.0
const ACC_PER_TICK = 100
var orientation = 0.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		velocity.y -= ACC_PER_TICK * cos(self.rotation)
		velocity.x -= ACC_PER_TICK * -sin(self.rotation)
	if Input.is_action_pressed("ui_down"):
		velocity.y += ACC_PER_TICK * cos(self.rotation)
		velocity.x += ACC_PER_TICK * -sin(self.rotation)
	if Input.is_action_pressed("ui_right"):
		self.rotation_degrees += ROTATION_DEGREES_PER_TICK * 60 * delta
	if Input.is_action_pressed("ui_left"):
		self.rotation_degrees -= ROTATION_DEGREES_PER_TICK * 60 * delta
	
	move_and_slide()
	velocity = velocity * .90 * 60.0 * delta
