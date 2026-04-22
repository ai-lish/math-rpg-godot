extends CanvasLayer

func _ready() -> void:
	_update_hud()
	GameState.leveled_up.connect(_update_hud)
	GameState.hp_changed.connect(_update_hp)
	GameState.player_died.connect(_on_player_died)

func _update_hud() -> void:
	var hud = get_node("HBoxContainer")
	hud.get_node("XPBar").value = GameState.xp
	hud.get_node("XPBar").max_value = float(GameState.xp_to_next_level())
	hud.get_node("LevelLabel").text = "Lv." + str(GameState.level)
	hud.get_node("CreditsLabel").text = str(GameState.credits)
	hud.get_node("StreakLabel").text = "Streak: " + str(GameState.streak)

func _update_hp(new_hp: int) -> void:
	get_node("HBoxContainer").get_node("HPBar").value = float(new_hp)

func _on_player_died() -> void:
	get_node("DeathPanel").visible = true

func _on_restart_pressed() -> void:
	GameState.hp = GameState.max_hp
	GameState.save_state()
	get_node("DeathPanel").visible = false
	_update_hud()
