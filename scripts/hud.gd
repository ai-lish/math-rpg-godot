extends CanvasLayer

func _ready() -> void:
	_update_hud()
	GameState.leveled_up.connect(_update_hud)
	GameState.hp_changed.connect(_update_hp)
	GameState.player_died.connect(_on_player_died)

func _update_hud() -> void:
	var hud = $HBoxContainer
	hud/XPBar.value = GameState.xp
	hud/XPBar.max_value = GameState.xp_to_level_up()
	hud/LevelLabel.text = "Lv." + str(GameState.level)
	hud/CreditsLabel.text = str(GameState.credits)
	hud/StreakLabel.text = "🔥 " + str(GameState.streak)

func _update_hp(new_hp: int) -> void:
	$HBoxContainer/HPBar.value = new_hp

func _on_player_died() -> void:
	$DeathPanel.visible = true

func _on_restart_pressed() -> void:
	GameState.hp = GameState.max_hp
	GameState.save_state()
	$DeathPanel.visible = false
	_update_hud()
