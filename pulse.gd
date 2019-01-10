extends Node2D

var opacity = 1
var radius = 20

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	opacity = max(opacity - 2 * delta, 0);
	radius += radius * delta
	update()
	if (opacity == 0): queue_free()
	
func _draw():
	draw_circle(Vector2(0,0), radius, Color(1, 1, 1, opacity))