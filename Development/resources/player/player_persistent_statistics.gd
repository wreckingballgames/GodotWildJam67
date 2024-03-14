class_name PlayerPersistentStatistics
extends Resource


@export var player_inventory: PlayerInventory = preload("res://resources/player/player_inventory.tres")
@export var combat_statistics: PlayerCombatStatistics = preload("res://resources/player/player_combat_statistics.tres")
@export var money: int = 0
@export var experience_points: int = 0
@export var experience_level: int = 0
@export var max_health: int = 0
@export var current_health: int = 0
@export var max_tp: int = 0
@export var current_tp: int = 0
@export var max_pp: int = 0
@export var current_pp: int = 0
