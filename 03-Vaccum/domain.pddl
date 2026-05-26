; Domain: Vacuum robot
;   - relational predicate (connected ?r1 ?r2) encoding a GRAPH
;   - agent tracked by location: (at ?robot ?room)
;   - action with multiple typed parameters reading/writing several predicates

(define (domain vacuum)

  (:requirements :typing :negative-preconditions)

  (:types
    robot
    room
  )

  (:predicates
    (at        ?r - robot ?rm - room)
    (dirty     ?rm - room)
    (connected ?from - room ?to - room)
  )

  ; Robot moves along a connected edge of the room graph.
  (:action move
    :parameters (?r - robot ?from - room ?to - room)
    :precondition (and
      (at ?r ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (at ?r ?from))
      (at ?r ?to)
    )
  )

  ; Clean the current room if it is dirty.
  (:action vacuum
    :parameters (?r - robot ?rm - room)
    :precondition (and
      (at ?r ?rm)
      (dirty ?rm)
    )
    :effect (not (dirty ?rm))
  )
)