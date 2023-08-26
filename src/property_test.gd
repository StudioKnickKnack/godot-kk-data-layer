extends Node

@export var my_name : StringProperty = StringProperty.new("Alice")
var last_observed_name : String

@export var some_vector : Vector3Property = Vector3Property.new(Vector3.ZERO)
var last_observed_vector : Vector3

func _enter_tree() -> void:
	print("running property_test")

	assert(my_name.value == "Alice")
	assert(some_vector.value == Vector3.ZERO)

	my_name.subscribe(when_my_name_changed)
	assert(last_observed_name == "Alice")
	
	some_vector.subscribe(when_some_vector_changed)
	assert(last_observed_vector == Vector3.ZERO)

	my_name.value = "Robert"
	assert(last_observed_name == "Robert")
	
	some_vector.value = Vector3.FORWARD
	assert(last_observed_vector == Vector3.FORWARD)

	print("all tests done")

func when_my_name_changed(new_name : String) -> void:
	print("my name changed to:", new_name)
	last_observed_name = new_name
	
func when_some_vector_changed(new_vector : Vector3) -> void:
	print("some vector changed to:", new_vector)
	last_observed_vector = new_vector
