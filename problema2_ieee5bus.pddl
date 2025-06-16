(define (problem ieee-5-bus-problema-2) (:domain planificacion-red-electrica)
(:objects 
    bus1 bus2 bus3 bus4 bus5 - ubicacion
    alta baja - tension
)

(:init
    (es-generador bus1)
    (es-generador bus2)
    (es-carga bus1)
    (es-carga bus3)
    (es-carga bus5)
    (= (capacidad-tension alta) 1000.0)
    ;(= (capacidad-tension media) 1000.0)
    (= (capacidad-tension baja) 1000.0)
    (= (generacion-disponible bus1) 40.4)
    (= (generacion-disponible bus2) 100.0)
    (= (demanda bus1) 20.0)
    (= (demanda bus3) 80.0)
    (= (demanda bus5) 40.0)
    (= (total-cost) 0.0)
    (= (capacidad-maxima bus1) 1000.0)
    (= (capacidad-maxima bus2) 1000.0)
    (= (capacidad-maxima bus3) 1000.0)
    (= (capacidad-maxima bus4) 1000.0)
    (= (capacidad-maxima bus5) 1000.0)
    (= (energia-en-ubicacion bus1) 0.0)
    (= (energia-en-ubicacion bus2) 0.0)
    (= (energia-en-ubicacion bus3) 0.0)
    (= (energia-en-ubicacion bus4) 0.0)
    (= (energia-en-ubicacion bus5) 0.0)
    ; Tipos de tension de los generadores
    (puede-ofrecer bus1 alta)
    (puede-recibir bus1 alta)
    (puede-ofrecer bus2 alta)
    (puede-recibir bus2 alta)
    ; Tipos de tension de las cargas
    (puede-ofrecer bus3 baja)
    (puede-recibir bus3 baja)
    ;(puede-ofrecer bus4 baja)
    ;(puede-recibir bus4 baja)
    (puede-ofrecer bus5 baja)
    (puede-recibir bus5 baja)

    ; Dificultades de cada nodo
    (= (dificultad bus1) 7)
    (= (dificultad bus2) 22)
    (= (dificultad bus3) 13)
    (= (dificultad bus4) 4)
    (= (dificultad bus5) 30)

    ; Conexiones posibles, de acuerdo al modelo IEEE 14-bus
    (conexion-posible bus1 bus2)
    (conexion-posible bus2 bus1)

    (conexion-posible bus1 bus3)
    (conexion-posible bus3 bus1)

    (conexion-posible bus1 bus4)
    (conexion-posible bus4 bus1)

    (conexion-posible bus2 bus3)
    (conexion-posible bus3 bus2)

    (conexion-posible bus2 bus4)
    (conexion-posible bus4 bus2)

    (conexion-posible bus2 bus5)
    (conexion-posible bus5 bus2)

    (conexion-posible bus3 bus4)
    (conexion-posible bus4 bus3)

    (conexion-posible bus4 bus5)
    (conexion-posible bus5 bus4)
)

(:goal (and
    (satisfecha-demanda bus1)
    (satisfecha-demanda bus3)
    (satisfecha-demanda bus5)
    )
)
(:metric minimize (total-cost))

)


