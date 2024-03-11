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

enum ActorInfo
{
    ACTOR_WIDTH = 32,
    ACTOR_HEIGHT = 64,
}
