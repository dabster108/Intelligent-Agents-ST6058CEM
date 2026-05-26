; Problem: Carry one package from the shelf to the dock.
;
; Layout: [shelf] -- [aisle] -- [dock]

(define (problem deliver-one)
  (:domain delivery-bot)

  (:objects
    robo1              - robot
    pkg1              - package
    shelf aisle dock  - location
  )

  (:init
    (robot-at robo1 shelf)
    (hand-empty robo1)
    (package-at pkg1 shelf)

    (connected shelf aisle) (connected aisle shelf)
    (connected aisle dock)  (connected dock aisle)
  )

  (:goal (package-at pkg1 dock))
)