extends CharacterBody3D


@onready var head: Node3D = $head
@onready var eyes: Camera3D = $head/Camera3D

var speed_of_look := 0.04

var speed = 50.0

const JUMP_VELOCITY = 40.5

var is_runing : bool = true

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * speed_of_look)
		eyes.rotate_x(-event.relative.y * speed_of_look)
		eyes.rotation.x = clamp(eyes.rotation.x, deg_to_rad(-45), deg_to_rad(100))


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("run"):
		if is_runing:
			speed = 70.0
			is_runing  = false
			print("sspeed iss 70")
		else:
			speed = 50.0
			is_runing = true
			print("speed iss 50")


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	move_and_slide()
