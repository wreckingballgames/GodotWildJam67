extends Node


enum TileInfo
{
    TILE_WIDTH = 32,
    TILE_HEIGHT = 32,
    TILE_CENTER_X = TILE_WIDTH / 2,
    TILE_CENTER_Y = TILE_HEIGHT / 2,
}

enum EventID
{
    NO_EVENT,
    TRANSITION_TO_FIELD,
    TRANSITION_TO_TOWN,
    TRANSITION_TO_FORT_FLOOR_1,
    TRANSITION_TO_FORT_FLOOR_2,
}

var ScenePaths = {"field": "res://scenes/maps/field.tscn",
        "town": "res://scenes/maps/town.tscn",
        "fort_floor1": "res://scenes/maps/fort_floor1.tscn",
        "fort_floor2": "res://scenes/maps/fort_floor2.tscn"}

enum EquipmentSlot
{
    WEAPON,
    ARMOR,
    ACCESSORY_1,
    ACCESSORY_2,
}
