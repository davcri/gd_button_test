extends Control

var count = 0

func _ready():
	$Button.connect("pressed", self, "_on_Button_pressed")

	var msg = "emulate_touch_from_mouse = " + str(ProjectSettings.get('input_devices/pointing/emulate_touch_from_mouse'))
	log_msg(msg, Color.beige)
	msg = "emulate_mouse_from_touch = " + str(ProjectSettings.get('input_devices/pointing/emulate_mouse_from_touch'))
	log_msg(msg, Color.beige)
	log_msg('')


func _input(event):
	var col
	if event is	InputEventMouseButton:
		col = Color.orange
	if event is InputEventScreenTouch:
		col = Color.aquamarine
	if !col:
		col = Color.gray

#		return
	var msg = " _input event = {ev}".format({ 'ev': event})
	log_msg(msg, col)


func _on_Button_pressed():
	count += 1
	var msg = " Button pressed {c} times!".format({ 'c': count})
	log_msg(msg)


func log_msg(msg, col = null):
	print(msg)
	var bbc_text = $Panel/MarginContainer/RichTextLabel
	if col:
		bbc_text.push_color(col)
	bbc_text.append_bbcode(msg + '\n')
	if col:
		bbc_text.pop()
