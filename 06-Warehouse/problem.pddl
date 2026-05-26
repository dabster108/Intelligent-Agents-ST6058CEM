; Problem: Robot must deliver two packages from shelves to dock,
; starting with empty battery at the charging bay.
;
; Warehouse layout (connected = bidirectional edges below):
;
;   [charge_bay] -- [aisle] -- [shelf_a]
;                     |
;                  [shelf_b]
;                     |
;                   [dock]

(define (problem deliver-two-packages)
  (:domain warehouse-robot)

  (:objects
    robo1                                  - robot
    pkg1 pkg2                             - package
    charge_bay aisle shelf_a shelf_b dock - location
  )

  (:init
    ; robot starts empty at the charging bay
    (robot-at robo1 charge_bay)
    (hand-empty robo1)
    (charger-at charge_bay)

    ; battery numerics
    (= (battery robo1) 0)
    (= (battery-capacity robo1) 20)

    ; packages on shelves
    (package-at pkg1 shelf_a)
    (package-at pkg2 shelf_b)

    ; bidirectional connectivity
    (connected charge_bay aisle)  (connected aisle charge_bay)
    (connected aisle shelf_a)     (connected shelf_a aisle)
    (connected aisle shelf_b)     (connected shelf_b aisle)
    (connected shelf_b dock)      (connected dock shelf_b)
  )

  (:goal (and
    (delivered pkg1)
    (delivered pkg2)
    (package-at pkg1 dock)
    (package-at pkg2 dock)
  ))
)