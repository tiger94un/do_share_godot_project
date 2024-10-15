extends GPUParticles3D

@onready var fule: Timer = $Timer



@onready var mesh_instance: MeshInstance3D = $MeshInstance3D



var NEW_TEXT_MESH = preload("res://for player/gdscript/gdscript for the door handle/new_text_mesh.tres")
var the_mount_of_time_in_candle: float  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fule.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	make_lable_text_changes()

func make_lable_text_changes():
	mesh_instance.mesh = NEW_TEXT_MESH
	NEW_TEXT_MESH.text = str(ceil(fule.time_left))

	


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
