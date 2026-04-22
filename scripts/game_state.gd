extends Node

var player_name: String = "Player"
var level: int = 1
var exp: int = 0
var xp: int = 0  # Alias for exp
var exp_to_next: int = 100
var hp: int = 100
var max_hp: int = 100
var attack: int = 10
var defense: int = 5
var credits: int = 0

var streak: int = 0
var correct_answers: int = 0
var questions_answered: int = 0
var current_difficulty: int = 1  # 1=easy, 2=medium, 3=hard

signal leveled_up
signal hp_changed(new_hp: int)
signal player_died

func xp_to_next_level() -> int:
    return exp_to_next

func add_xp(amount: int) -> void:
    exp += amount
    xp = exp  # Keep in sync
    while exp >= exp_to_next:
        exp -= exp_to_next
        level_up()

func level_up() -> void:
    level += 1
    exp_to_next = int(exp_to_next * 1.5)
    max_hp += 10
    hp = max_hp
    attack += 5
    defense += 3
    emit_signal("leveled_up")
    print("Level up! Now level ", level)

func lose_hp(amount: int) -> void:
    hp = max(0, hp - amount)
    emit_signal("hp_changed", hp)
    if hp <= 0:
        emit_signal("player_died")
        print("Game Over!")
        # Reset for simplicity
        hp = max_hp
        exp = 0
        xp = 0

func save_state() -> void:
    # In a real game, save to file
    print("State saved: Level ", level, " EXP ", exp)

func _ready() -> void:
    print("GameState loaded")
