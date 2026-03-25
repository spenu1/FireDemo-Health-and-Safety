extends Control

signal fuelUpdated()
signal heatUpdated()
signal oxyUpdated()

var fuelSlid
var oxySlid
var heatSlid

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fuelSlid = $FuelSlider
	oxySlid = $Oxygen
	heatSlid = $Heat
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass


func _on_fuel_slider_value_changed(value: float) -> void:
	fuelUpdated.emit(fuelSlid.value)
	pass # Replace with function body.


func _on_heat_value_changed(value: float) -> void:
	heatUpdated.emit(heatSlid.value)
	pass # Replace with function body.


func _on_oxygen_value_changed(value: float) -> void:
	oxyUpdated.emit(oxySlid.value)
	pass # Replace with function body.
