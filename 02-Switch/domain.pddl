;Header and description

(define 
    (domain light-switch)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        switch
    )
    (:predicates
        (on ?s - switch)
    )
    (:action turn-on
        :parameters (?s - switch)
        :precondition (not (on ?s))
        :effect (on ?s)
    )
    (:action turn-off
        :parameters (?s - switch)
        :precondition (on ?s)
        :effect (not (on ?s))
    )
)