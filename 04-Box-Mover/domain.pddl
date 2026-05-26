; Domain: Single robot arm at a workbench, moving boxes between places.
;   - CAPACITY constraint via complementary predicates:
;       (hand-empty ?a)  XOR  (holding ?a ?b)
;   - effects that BOTH add and delete facts to keep state consistent
;   - object identity matters: the picked box must be the same one dropped

(define (domain box-mover)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    arm box place
  )
  (:predicates
    (box-at ?b - box ?p - place)
    (holding ?a - arm ?b - box)
    (hand-empty ?a - arm)
  )
  ; Pick a box up from a place. Hand must be empty.
  (:action pick-up
    :parameters (?a - arm ?b - box ?p - place)
    :precondition (and
      (box-at ?b ?p)
      (hand-empty ?a)
    )
    :effect (and
      (holding ?a ?b)
      (not (hand-empty ?a))
      (not (box-at ?b ?p))
    )
  )
  ; Put the held box down at a place. Hand becomes empty.
  (:action put-down
    :parameters (?a - arm ?b - box ?p - place)
    :precondition (holding ?a ?b)
    :effect (and
      (box-at ?b ?p)
      (hand-empty ?a)
      (not (holding ?a ?b))
    )
  )
)