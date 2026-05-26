(define (problem rearrange-boxes)
  (:domain box-mover)

  (:objects
    arm1         - arm
    boxA boxB    - box
    in out       - place
  )

  (:init
    (hand-empty arm1)
    (box-at boxA in)
    (box-at boxB in)
  )

  (:goal (and
    (box-at boxA out)
    (box-at boxB out)
  ))
)