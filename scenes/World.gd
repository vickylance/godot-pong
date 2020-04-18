extends Node2D

export var PLAYER_SPEED := 400

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var leftPlayerPos = $leftPlayer.position
	var rightPlayerPos = $rightPlayer.position
	
	leftPlayerPos.y += (Input.get_action_strength("left_player_down") - Input.get_action_strength("left_player_up")) * PLAYER_SPEED * delta
	rightPlayerPos.y += (Input.get_action_strength("right_player_down") - Input.get_action_strength("right_player_up")) * PLAYER_SPEED * delta

	var leftPlayerHeight = $leftPlayer.get_rect().size.y / 2
	var rightPlayerHeight = $rightPlayer.get_rect().size.y / 2
	leftPlayerPos.y = clamp(leftPlayerPos.y, leftPlayerHeight, get_viewport_rect().size.y - leftPlayerHeight)
	rightPlayerPos.y = clamp(rightPlayerPos.y, rightPlayerHeight, get_viewport_rect().size.y - rightPlayerHeight)
	
	$leftPlayer.position = leftPlayerPos
	$rightPlayer.position = rightPlayerPos
