extends Node2D

var oxy = 0
var fuel = 0
var heat = 0

var strength = 0

var particleEmitter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	particleEmitter = $LogClipart/GPUParticles2D
	particleEmitter.amount = 0
	particleEmitter.emitting = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func calcStrength() -> void: 
	if (fuel == 0 or heat == 0 or oxy == 0):
		#no fire
		particleEmitter.emitting = false	
		pass
	else:
		#calculate the fire
		particleEmitter.emitting = true
		strength = (fuel+heat+oxy)/3
		particleEmitter.amount_ratio = strength/100
		pass
	pass

func _on_control_fuel_updated(number) -> void:
	fuel = number
	calcStrength()
	pass # Replace with function body.


func _on_control_heat_updated(number) -> void:
	heat = number
	calcStrength()
	pass # Replace with function body.


func _on_control_oxy_updated(number) -> void:
	oxy = number
	calcStrength()
	pass # Replace with function body.
