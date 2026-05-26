(define (problem hello)
        (:domain hello-world)
        (:objects
                myself - agent
        )
        (:init
                (breathing)
        )

        (:goal
                (and
                        (greet myself)
                )
        )
)