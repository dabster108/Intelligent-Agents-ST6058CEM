(define
    (problem switch-problem)
    (:domain light-switch)
    (:objects
        icr3 lr4 lr5 - switch
    )
    (:init
        (on icr3)
        ; others are off by default
    )
    (:goal
        (and
            (on icr3)
            (on lr5)
            (on lr3)
            (not (on icr3))
        )
    )

)
