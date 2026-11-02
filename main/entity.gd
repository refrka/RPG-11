class_name Entity extends Node2D





func get_component(component_script: Script) -> Component:

	var components = get_children().filter(func(c): return c is Component)

	for component in components:

		if component.get_script() == component_script:

			return component

	return null




func has_component(component_script: Script) -> bool:

	return get_component(component_script) != null




func is_interactable() -> bool:

	return has_component(InteractableComponent)

	