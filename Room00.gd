extends Node

var roda = 0
var quantidadeCubos = 1
var posicaoInicial = Vector3(0,0,-32)
var resolucaoX = 60
var triangulos = 0

func _ready():
	pass # Replace with function body.


func _process(_delta):
#atualizando tela
	$Label.text = " Test Polygons 3D\n FPS: " + str(Engine.get_frames_per_second())\
	+ "\n Cubes: " + str(quantidadeCubos)\
	+ "\n Triangles: " + str(quantidadeCubos *6 * 2)
	#+ "\n Static memory: " + str(OS.get_static_memory_usage())\
	#+ "\n Dynamic memory: " + str(OS.get_dynamic_memory_usage())\
	#+ "\n Cubos: " + str(quantidadeCubos)
	#+ "\n Draw Call: " + str(VisualServer.get_render_info(VisualServer.INFO_DRAW_CALLS_IN_FRAME))\
	#+ "\n Cubos: " + str(quantidadeCubos)\
	#+ "\n Vertices: " + str(VisualServer.get_render_info(VisualServer.INFO_VERTICES_IN_FRAME))\



func _on_ButtonMais_pressed():
	var c = load("res://Cubinho.tscn")
	var b = c.instance()
	b.add_to_group("Cubos")
	add_child(b)
	if posicaoInicial.x > resolucaoX:
		posicaoInicial.z = posicaoInicial.z + 3
		posicaoInicial.x =  3
	else:
		posicaoInicial.x = posicaoInicial.x + 3
		
	var Osprite = get_tree().get_nodes_in_group("Cubos")
	var ultimosprite = Osprite[Osprite.size()-1]
	#$Textura64.position = posicaoInicial
	ultimosprite.translation = posicaoInicial
	quantidadeCubos = quantidadeCubos +1


func _on_ButtonMenos_pressed():
	var Osprite = get_tree().get_nodes_in_group("Cubos")
	var ultimosprite = Osprite[Osprite.size()-1]
	if Osprite.size() > 1:
		ultimosprite.Deletar()
		quantidadeCubos = quantidadeCubos -1


func _on_ButtonRoda_pressed():
	get_tree().call_group("Cubos","Rodar")
