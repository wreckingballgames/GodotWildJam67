class_name Item
extends Resource


enum ItemType
{
    CONSUMABLE,
    EQUIPMENT,
    KEY,
}

@export var id: int
@export var type: ItemType
