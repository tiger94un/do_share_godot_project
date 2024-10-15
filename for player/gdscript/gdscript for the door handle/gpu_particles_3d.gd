extends GPUParticles3D

@onready var fule: Timer = $Timer

@onready var textforfule: Label = $Timer/Label

@onready var mesh_instance: MeshInstance3D = $MeshInstance3D

@onready var just_3d : Label3D = $Label3D

var just_reblaceit : TextMesh
var the_mount_of_time_in_candle: float  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fule.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	make_lable_text_changes()

func make_lable_text_changes():
	textforfule.text =  str(ceil(fule.time_left))
	just_3d.text = textforfule.text
	

	


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
