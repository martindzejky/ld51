extends Node2D


func _process(delta):
    # animate the hand based on the timer
    var percentage = 1.0 - $timer.time_left / $timer.wait_time
    $hand.rotation = -PI/2 + percentage * PI*2

func _on_timer_timeout():
    get_tree().change_scene_to_file("res://scenes/end.tscn")