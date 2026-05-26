(define problem light-switch
    (problem switch-problem)
    (:domain light-switch)
    (:objects
        ic3 lr4 lr5 - switch
        s2 - switch
    )
    (:init
        (on icr3)
        ; other are not by default 
    )
    (:goal
        (and
            (on ic3)
            (on lr4)
            (on lr5)
            (not (on icr3))
        )
    )

)
