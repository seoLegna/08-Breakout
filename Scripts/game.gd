extends Node

export var score = 0
export var lives = 3

func increase_score(s):
 score += int(s)
 find_node("Score").update_score()
 if score == 980:
  get_tree().change_scene("res://Scenes/Win.tscn")
  print("You Win!")
 
func decrease_lives():
 lives -= 1
 find_node("Lives").update_lives()
 if lives <= 0:
  get_tree().change_scene("res://Scenes/End.tscn")
  print("Arghhhhh.... You lost! Try again!")
