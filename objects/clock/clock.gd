extends Node2D


func _process(delta):
    # animate the hand based on the timer
    var percentage = 1.0 - $timer.time_left / $timer.wait_time
    $hand.rotation = -PI/2 + percentage * PI*2

func _on_timer_timeout():
    # reveal mouse if hidden
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

    # reset carried items
    Hand.reset()

    # submit pizza on the plate if there's any
    get_tree().call_group("plate", "submitPizza")

    get_tree().change_scene_to_file("res://scenes/end.tscn")
