(define (domain planificacion-red-electrica)
  (:requirements :typing :fluents :action-costs :negative-preconditions :conditional-effects :disjunctive-preconditions :equality)

(:types
    ubicacion - object
    tension - object
)
(:predicates
    (es-generador ?u - ubicacion)
    (es-carga ?u - ubicacion)
    (es-transformador ?u - ubicacion)
    (conectado ?u1 ?u2 - ubicacion)
    (generador-activo ?g - ubicacion)
    (ruta-establecida ?x ?y - ubicacion)
    (puede-ofrecer ?u - ubicacion ?t - tension)
    (puede-recibir ?u - ubicacion ?t - tension)
    (satisfecha-demanda ?u - ubicacion)
    (conexion-posible ?x ?y - ubicacion)
)

(:functions
    (generacion-disponible ?g - ubicacion)
    (energia-en-ubicacion ?u - ubicacion)
    (demanda ?c - ubicacion)
    (total-cost)
    (dificultad ?u - ubicacion)
    (capacidad-maxima ?u - ubicacion)
    (capacidad-tension ?t - tension)
)

(:action conectar
    :parameters (?x ?y - ubicacion ?tension_linea - tension)
    :precondition (and
        (not (conectado ?x ?y))
        (not (conectado ?y ?x))
        (not (= ?x ?y))
        (conexion-posible ?x ?y)
        (puede-ofrecer ?x ?tension_linea)
        (puede-recibir ?y ?tension_linea)
        ; Verificamos si el origen es una carga
        (or 
            (not (es-carga ?x))
            (and 
                ; Y si lo es, la carga debe ser satisfecha antes de poder conectar nada desde ahi
                ; Asi forzamos a que primero se satisfaga la demanda de la carga y despues ya veremos
                ; si queda energia disponible para seguir conectando desde aqui
                (es-carga ?x)
                (satisfecha-demanda ?x)
            )
        )
        ; Verificamos si el origen es un generador
        (or 
            (not (es-generador ?x))
            (and 
                ; Y si lo es, el generador debe estar activo antes de poder conectar nada desde ahi
                ; Asi forzamos a que primero se active el generador y despues ya actuaremos con la energia
                ; real disponible para seguir conectando desde aqui
                (es-generador ?x)
                (generador-activo ?x)
            )
        )
    )
    :effect (and
        (conectado ?x ?y)
        (conectado ?y ?x)
        (increase (total-cost) (* (dificultad ?x) (dificultad ?y)))
        (when (>= (energia-en-ubicacion ?x) (capacidad-tension ?tension_linea))
            (and 
                (increase (energia-en-ubicacion ?y) (capacidad-tension ?tension_linea))
                (decrease (energia-en-ubicacion ?x) (capacidad-tension ?tension_linea))
            )
        )
        (when (< (energia-en-ubicacion ?x) (capacidad-tension ?tension_linea))
            (and
                (increase (energia-en-ubicacion ?y) (energia-en-ubicacion ?x))
                (decrease (energia-en-ubicacion ?x) (energia-en-ubicacion ?x))
            )
        )
    )
)

(:action activar-generacion
    :parameters (?u - ubicacion)
    :precondition (and 
        (es-generador ?u)
        (not (generador-activo ?u))
    )
    :effect (and 
        (increase (energia-en-ubicacion ?u) (generacion-disponible ?u))
        (generador-activo ?u)
    )
)

(:action consumir-energia
    :parameters (?u - ubicacion)
    :precondition (and 
        (es-carga ?u)
        (>= (energia-en-ubicacion ?u) (demanda ?u))
    )
    :effect (and 
        (decrease (energia-en-ubicacion ?u) (demanda ?u))
        (satisfecha-demanda ?u)
    )
)

(:action establecer-ruta-directa
  :parameters (?x ?y - ubicacion)
  :precondition (and 
    (conectado ?x ?y)
    (not (= ?x ?y))
  )
  :effect (and 
    (ruta-establecida ?x ?y)
    (ruta-establecida ?y ?x)
  )
)

(:action establecer-ruta-indirecta
  :parameters (?x ?y ?z - ubicacion)
  :precondition (and 
    (ruta-establecida ?x ?z)
    (ruta-establecida ?z ?y)
    (not (= ?x ?y))
  )
  :effect (and 
    (ruta-establecida ?x ?y)
    (ruta-establecida ?y ?x)
  )
)

(:action crear-transformador
    :parameters (?u - ubicacion ?tension_entrada ?tension_salida - tension)
    :precondition (and 
        (not (es-transformador ?u))
        (not (= ?tension_entrada ?tension_salida))
    )
    :effect (and 
        (es-transformador ?u)
        (puede-ofrecer ?u ?tension_salida)
        (puede-recibir ?u ?tension_entrada)
        (increase (total-cost) 100.0)
    )
)


)
