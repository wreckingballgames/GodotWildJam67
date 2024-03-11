class_name OverworldPlayer
extends OverworldActor


@export var interact_collider: Area2D

var targeted_interactable: Node2D


func _ready() -> void:
    super._ready()
    
    # Connect signals
    interact_collider.body_entered.connect(on_interact_collider_body_entered)
    interact_collider.body_exited.connect(on_interact_collider_body_exited)


func on_interact_collider_body_entered(body: Node2D) -> void:
    if body.is_in_group("interactable"):
        targeted_interactable = body


func on_interact_collider_body_exited(body: Node2D) -> void:
    targeted_interactable = null
