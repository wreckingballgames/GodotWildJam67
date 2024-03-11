class_name OverworldActor
extends Node2D


@export var controller: OverworldActorController
@export var obstacle_collider: Area2D
@export var trigger_collider: Area2D
@export var hazard_collider: Area2D

@onready var last_position: Vector2 = global_position


func _ready() -> void:
    controller.command_dispatched.connect(on_command_received)


func _physics_process(delta: float) -> void:
    enforce_screen_bounds()


func on_command_received(command: Command) -> void:
    if command.type == GlobalData.CommandType.Move:
        handle_movement(command as MoveCommand)


func handle_movement(command: MoveCommand) -> void:
    last_position = global_position
    
    if command.direction == Vector2.LEFT:
        global_position.x -= GlobalData.TileInfo.TILE_WIDTH
    elif command.direction == Vector2.RIGHT:
        global_position.x += GlobalData.TileInfo.TILE_WIDTH
    
    if command.direction == Vector2.UP:
        global_position.y -= GlobalData.TileInfo.TILE_HEIGHT
    elif command.direction == Vector2.DOWN:
        global_position.y += GlobalData.TileInfo.TILE_HEIGHT


func handle_obstacle_collision(body: Node2D) -> void:
    global_position = last_position;


func handle_trigger_collision(body: Node2D) -> void:
    pass


func handle_hazard_collision(body: Node2D) -> void:
    pass


func enforce_screen_bounds() -> void:
    var viewport_rect: Rect2 = get_viewport_rect()
    
    if global_position.x < viewport_rect.position.x:
        global_position.x = viewport_rect.position.x
    elif global_position.x >= viewport_rect.size.x:
        global_position.x = viewport_rect.size.x - GlobalData.ActorInfo.ACTOR_WIDTH
    
    if global_position.y < viewport_rect.position.y:
        global_position.y = viewport_rect.position.y
    elif global_position.y >= viewport_rect.size.y:
        global_position.y = viewport_rect.size.y - GlobalData.ActorInfo.ACTOR_HEIGHT
