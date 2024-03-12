extends Node


enum CommandType
{
    Move,
    Interact,
}

enum TileInfo
{
    TILE_WIDTH = 32,
    TILE_HEIGHT = 32,
    TILE_CENTER_X = TILE_WIDTH / 2,
    TILE_CENTER_Y = TILE_HEIGHT / 2,
}

enum EventID
{
    NoEvent,
    TransitionToTown,
    TransitionToFortFloor1,
}

var ScenePaths = {"town": "res://scenes/maps/town.tscn",
        "fort_floor1": "res://scenes/maps/fort_floor1.tscn"}
