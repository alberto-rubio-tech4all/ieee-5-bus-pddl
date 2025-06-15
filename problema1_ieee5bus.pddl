(define (problem ieee-5-bus-problema-1) (:domain planificacion-red-electrica)
(:objects 
    bus1 bus2 bus3 bus4 bus5 - ubicacion
    alta media baja - tension
)

(:init
    (es-generador bus2)
    (es-carga bus5)
    (es-transformador bus3)
    (= (capacidad-tension alta) 1000.0)
    (= (capacidad-tension media) 1000.0)
    (= (capacidad-tension baja) 1000.0)
    (= (generacion-disponible bus2) 100.0)
    (= (demanda bus5) 100.0)
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
    (puede-ofrecer bus2 alta)
    (puede-recibir bus2 alta)

    ; Tipos de tension de las cargas
    (puede-ofrecer bus5 baja)
    (puede-recibir bus5 baja)

    ; Tipos de tension los transformadores
    (puede-ofrecer bus3 baja)
    (puede-recibir bus3 alta)

    ; Dificultades de cada nodo
    (= (dificultad bus1) 5)
    (= (dificultad bus2) 5)
    (= (dificultad bus3) 5)
    (= (dificultad bus4) 5)
    (= (dificultad bus5) 5)

    ; Conexiones posibles, de acuerdo al modelo IEEE 14-bus
    (conexion-posible bus1 bus3)
    (conexion-posible bus3 bus1)

    (conexion-posible bus1 bus4)
    (conexion-posible bus4 bus1)

    (conexion-posible bus2 bus3)
    (conexion-posible bus3 bus2)

    (conexion-posible bus3 bus4)
    (conexion-posible bus4 bus3)

    (conexion-posible bus4 bus5)
    (conexion-posible bus5 bus4)
)

(:goal (and
    (satisfecha-demanda bus5)
    )
)
(:metric minimize (total-cost))

)


