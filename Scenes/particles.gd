extends Spatial


# starts particle system on spawn

func _ready():
	for child in get_children():
		child.emitting = true
