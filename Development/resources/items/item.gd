class_name Item
extends Resource


enum Type
{
    CONSUMABLE,
    EQUIPMENT,
    KEY,
}

@export var id: int
@export var type: Type
@export var name: String
@export var description: String
