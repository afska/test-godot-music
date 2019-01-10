extends Node2D

var BPM = 150
var MODULUS = modulus(BPM)
var last_section = 0
var scene = preload("res://pulse.tscn")
onready var music_stream = $AudioStreamPlayer

func _ready():
	music_stream.play()

func _process(delta):
	var position = music_stream.get_playback_position()
	var section = int(position / MODULUS)
	if section != last_section: create_pulse()
	last_section = section

func modulus(bpm):
	return 60.0 / bpm
	
func create_pulse():
	var pulse = scene.instance()
	pulse.position.x = rand_range(1, 500)
	pulse.position.y = rand_range(1, 500)
	add_child(pulse)