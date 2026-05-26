; Problem: Clean the house.
; Three rooms in a line. Two are dirty. Robot starts in living room.
;
; Layout:  [living] -- [hall] -- [kitchen]

(define (problem clean-house)
  (:domain vacuum)

  (:objects
    robo1                - robot
    living hall kitchen  - room
  )

  (:init
    (at robo1 living)

    (dirty living)
    (dirty kitchen)
    ; hall is clean

    ; bidirectional edges (must declare BOTH directions)
    (connected living hall)   (connected hall living)
    (connected hall kitchen)  (connected kitchen hall)
  )

  (:goal (and
    (not (dirty living))
    (not (dirty kitchen))
    (at robo1 living)
  ))
)