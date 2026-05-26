; Domain: Mobile robot carries packages between locations.
;   - COMBINE navigation with carrying
;   - longer precondition chains: be AT a location AND hand-empty AND package there
;   - the planner must INTERLEAVE navigation and manipulation actions

(define (domain delivery-bot)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    robot package location
  )
  (:predicates
    (robot-at ?r - robot ?l - location)
    (package-at ?p - package ?l - location)
    (holding ?r - robot ?p - package)
    (hand-empty ?r - robot)
    (connected ?from - location ?to - location)
  )
  (:action move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and
      (robot-at ?r ?from)
      (connected ?from ?to)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
    )
  )
  (:action pick-up
    :parameters (?r - robot ?p - package ?l - location)
    :precondition (and
      (robot-at ?r ?l)
      (package-at ?p ?l)
      (hand-empty ?r)
    )
    :effect (and
      (holding ?r ?p)
      (not (hand-empty ?r))
      (not (package-at ?p ?l))
    )
  )
  (:action drop
    :parameters (?r - robot ?p - package ?l - location)
    :precondition (and
      (robot-at ?r ?l)
      (holding ?r ?p)
    )
    :effect (and
      (not (holding ?r ?p))
      (hand-empty ?r)
      (package-at ?p ?l)
    )
  )
)