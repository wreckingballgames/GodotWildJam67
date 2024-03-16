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
    BEGIN_ZAPLING_BATTLE,
    BEGIN_BOSS_BATTLE,
}

var ScenePaths = {"field": "res://scenes/maps/field.tscn",
        "town": "res://scenes/maps/town.tscn",
        "fort_floor1": "res://scenes/maps/fort_floor1.tscn",
        "fort_floor2": "res://scenes/maps/fort_floor2.tscn",
        "zapling_battle": "res://scenes/battle/zapling_battle.tscn",
        "boss_battle": "res://scenes/battle/boss_battle.tscn"}

enum EquipmentSlot
{
    WEAPON,
    ARMOR,
    ACCESSORY_1,
    ACCESSORY_2,
}
