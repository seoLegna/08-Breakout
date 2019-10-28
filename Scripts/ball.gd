extends RigidBody2D

export var maxspeed = 300

signal lives
signal score

func _ready():
 contact_monitor = true
 set_max_contacts_reported(4)
 var GameNode = get_node("/root/Game")
 connect("score", GameNode, "increase_score")
 connect("lives", GameNode, "decrease_lives")

func _physics_process(delta):
 var bodies = get_colliding_bodies()
 for body in bodies:
  if body.is_in_group("Tiles"):
   emit_signal("score",body.score)
   body.queue_free()
  if body.get_name() == "Paddle":
   pass
  
 if position.y > get_viewport_rect().end.y:
  emit_signal("lives")
  queue_free()
  print("The ball died!")