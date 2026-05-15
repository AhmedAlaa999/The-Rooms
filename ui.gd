extends CanvasLayer

var cherries = 0
var timer = 30
var ended = false

@onready var cherries_text = $Panel/Label
@onready var timer_text = $Panel/Label2
@onready var result = $Panel/ResultLabel

@onready var win_sound = $WinSound
@onready var lose_sound = $LoseSound


func _process(delta):

	if ended:
		return

	timer -= delta

	timer_text.text = "Timer: " + str(int(timer))
	cherries_text.text = "Cherries: " + str(cherries)

	if timer <= 0:

		ended = true

		result.text = "YOU LOSE"
		result.modulate = Color.RED

		get_tree().paused = true

		lose_sound.process_mode = Node.PROCESS_MODE_ALWAYS
		lose_sound.play()

		await get_tree().create_timer(4, true, false, true).timeout

		get_tree().paused = false
		get_tree().reload_current_scene()


func add_cherry():

	if ended:
		return

	cherries += 1

	if cherries == 10:

		ended = true

		result.text = "YOU WIN"
		result.modulate = Color.GREEN

		get_tree().paused = true

		win_sound.process_mode = Node.PROCESS_MODE_ALWAYS
		win_sound.play()

		await get_tree().create_timer(4, true, false, true).timeout
#Im Human
		get_tree().paused = false
		get_tree().reload_current_scene()
