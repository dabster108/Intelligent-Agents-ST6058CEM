; Domain: Warehouse delivery robot
; Robot navigates between locations, picks/drops packages,
; scans for verification, recharges when battery low.

(define (domain warehouse-robot)

  (:requirements :strips :typing :negative-preconditions :numeric-fluents)

  (:types
    robot
    package
    location
  )

  (:predicates
    (robot-at    ?r - robot    ?l - location)
    (package-at  ?p - package  ?l - location)
    (holding     ?r - robot    ?p - package)
    (hand-empty  ?r - robot)
    (connected   ?l1 - location ?l2 - location)
    (charger-at  ?l - location)
    (scanned     ?p - package)
    (delivered   ?p - package)
  )

  (:functions
    (battery          ?r - robot)
    (battery-capacity ?r - robot)
  )

  ; Move robot between connected locations. Consumes 1 battery unit.
  (:action move
    :parameters (?r - robot ?from - location ?to - location)
    :precondition (and
      (robot-at ?r ?from)
      (connected ?from ?to)
      (>= (battery ?r) 1)
    )
    :effect (and
      (not (robot-at ?r ?from))
      (robot-at ?r ?to)
      (decrease (battery ?r) 1)
    )
  )

  ; Recharge robot to full capacity at a charger location.
  (:action recharge
    :parameters (?r - robot ?l - location)
    :precondition (and
      (robot-at ?r ?l)
      (charger-at ?l)
      (< (battery ?r) (battery-capacity ?r))
    )
    :effect (and
      (assign (battery ?r) (battery-capacity ?r))
    )
  )

  ; Scan package barcode before pickup (verification step).
  (:action scan
    :parameters (?r - robot ?p - package ?l - location)
    :precondition (and
      (robot-at ?r ?l)
      (package-at ?p ?l)
      (not (scanned ?p))
    )
    :effect (and
      (scanned ?p)
    )
  )

  ; Pick up scanned package at current location.
  (:action pick-up
    :parameters (?r - robot ?p - package ?l - location)
    :precondition (and
      (robot-at ?r ?l)
      (package-at ?p ?l)
      (scanned ?p)
      (hand-empty ?r)
    )
    :effect (and
      (holding ?r ?p)
      (not (hand-empty ?r))
      (not (package-at ?p ?l))
    )
  )

  ; Drop package at current location. Marks delivered.
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
      (delivered ?p)
    )
  )

)