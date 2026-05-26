;Header and description

(define (domain hello-world)
    (:requirements :negative-preconditions :typing)
    (:types
        agent
    )
    (:predicates
        (greet ?a - agent)
        (breathing)
    ) 

    (:action breath
        :parameters ()
        :precondition (and )
        :effect (and 
            (breathing)
        )
    )
    

    (:action hello-world
        :parameters (?a - agent)
        :precondition (and
            (breathing)
            (not (greet ?a))
        )
        :effect (and
            (greet ?a)
        )
    )

)