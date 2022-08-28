extends Spatial


# Declare member variables here. Examples:
var roda = false
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if roda == true:
		self.rotate_y(0.02)

func Deletar():
	self.queue_free()

func Rodar():
	#self.rotate_y(0.5)
	if roda == false:
		roda = true
	else:
		roda = false
