extends Node2D

var oxy = 0
var fuel = 0
var heat = 0

var strength = 0

var particleEmitter
var fireSprite
var fLight

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	particleEmitter = self.get_node("LogClipart").get_node("GPUParticles2D")
	fLight = get_node("FireLight")
	#particleEmitter.amount = 1
	particleEmitter.emitting = false
	fLight.energy = 0.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !(fuel == 0 or heat == 0 or oxy == 0):
		fLight.energy += randf_range(-0.5,0.5)
		if (fLight.energy <= ((strength/100)*2) * 0.95):
			fLight.energy = ((strength/100)*2) * 0.95
		if (fLight.energy > ((strength/100)*2) * 1.05):
			fLight.energy = ((strength/100)*2) * 1.05
	pass


func calcStrength() -> void: 
	if (fuel == 0 or heat == 0 or oxy == 0):
		#no fire
		particleEmitter.emitting = false	
		fLight.energy = 0
		pass
	else:
		#calculate the fire
		particleEmitter.emitting = true
		strength = (fuel+heat+oxy)/3
		particleEmitter.amount_ratio = strength/100
		fLight.energy = ((strength/100)*2)
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
