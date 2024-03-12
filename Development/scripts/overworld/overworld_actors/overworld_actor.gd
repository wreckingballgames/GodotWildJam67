class_name OverworldActor
extends Node2D


@export var controller: OverworldActorController
@export var obstacle_collider: Area2D
@export var trigger_collider: Area2D
@export var hazard_collider: Area2D

var forward: Vector2 = Vector2.LEFT
var is_obstacle_ahead: bool = false


func _ready() -> void:
    # Connect signals
    controller.command_dispatched.connect(on_command_received)
    obstacle_collider.body_entered.connect(_on_obstacle_collider_body_entered)
    obstacle_collider.body_exited.connect(_on_obstacle_collider_body_exited)


func _physics_process(delta: float) -> void:
    update_collider_position(obstacle_collider)


func on_command_received(command: Command) -> void:
    if command.type == GlobalData.CommandType.Move:
        handle_movement(command as MoveCommand)
    elif command.type == GlobalData.CommandType.Interact:
        handle_interaction()


func handle_movement(command: MoveCommand) -> void:
    if command == null:
        return
    
    # If forward is not the same direction as command direction, turn, don't move
    # Otherwise, move in that direction (i.e., the direction the actor is already facing)
    if forward != command.direction:
        forward = command.direction
        return
    
    if is_obstacle_ahead:
        return
    
    if command.direction == Vector2.LEFT:
        global_position.x -= GlobalData.TileInfo.TILE_WIDTH
    elif command.direction == Vector2.RIGHT:
        global_position.x += GlobalData.TileInfo.TILE_WIDTH
    
    if command.direction == Vector2.UP:
        global_position.y -= GlobalData.TileInfo.TILE_HEIGHT
    elif command.direction == Vector2.DOWN:
        global_position.y += GlobalData.TileInfo.TILE_HEIGHT


func handle_interaction() -> void:
    pass


## Used to update certain colliders to stick out ahead of OverworldPlayer.
func update_collider_position(collider: Area2D) -> void:
    if forward == Vector2.LEFT or forward == Vector2.RIGHT:
        collider.global_position = global_position + (forward * GlobalData.TileInfo.TILE_CENTER_X)
    if forward == Vector2.UP or forward == Vector2.DOWN:
        collider.global_position = global_position + (forward * GlobalData.TileInfo.TILE_CENTER_Y)


func _on_obstacle_collider_body_entered(body: Node2D) -> void:
    is_obstacle_ahead = true


func _on_obstacle_collider_body_exited(body: Node2D) -> void:
    is_obstacle_ahead = false
