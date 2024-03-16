class_name OverworldPlayer
extends OverworldActor


@export var interact_collider: Area2D

var target_interactable: Node2D
var persistent_statistics: PlayerPersistentStatistics = preload("res://resources/player/player_persistent_statistics.tres")


func _ready() -> void:
    super._ready()
    
    # Connect signals
    interact_collider.area_entered.connect(on_interact_collider_area_entered)
    interact_collider.area_exited.connect(on_interact_collider_area_exited)


func _physics_process(delta: float) -> void:
    super._physics_process(delta)
    
    update_collider_position(interact_collider)


func handle_interaction() -> void:
    print(target_interactable)


func on_interact_collider_area_entered(area: Area2D) -> void:
    if area.is_in_group("interactable"):
        target_interactable = area


func on_interact_collider_area_exited(area: Area2D) -> void:
    target_interactable = null
