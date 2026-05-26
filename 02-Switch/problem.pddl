(define
    (problem switch-problem)
    (:domain light-switch)
    (:objects
        ic3 lr4 lr5 - switch
    )
    (:init
        (on ic3)
        ; others are off by default
    )
    (:goal
        (and
            (on ic3)
            (on lr4)
            (on lr5)
            (not (on ic3))
        )
    )

)
