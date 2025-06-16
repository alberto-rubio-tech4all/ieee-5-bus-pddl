(define (problem ieee-5-bus-problema-3) (:domain planificacion-red-electrica)
(:objects 
    bus1 bus2 bus3 bus4 bus5 - ubicacion
    alta media baja - tension
)

(:init
    (es-generador bus1)
    (es-generador bus2)
    (es-generador bus3)
    (es-carga bus2)
    (es-carga bus3)
    (es-carga bus4)
    (es-carga bus5)
    (= (capacidad-tension alta) 100.0)
    (= (capacidad-tension media) 50.0)
    (= (capacidad-tension baja) 10.0)
    (= (generacion-disponible bus1) 232.4)
    (= (generacion-disponible bus2) 40.0)
    (= (generacion-disponible bus3) 20.0)
    (= (demanda bus2) 21.7)
    (= (demanda bus3) 94.2)
    (= (demanda bus4) 47.8)
    (= (demanda bus5) 7.6)
    (= (total-cost) 0.0)
    (= (capacidad-maxima bus1) 300.0)
    (= (capacidad-maxima bus2) 300.0)
    (= (capacidad-maxima bus3) 300.0)
    (= (capacidad-maxima bus4) 150.0)
    (= (capacidad-maxima bus5) 150.0)
    (= (energia-en-ubicacion bus1) 0.0)
    (= (energia-en-ubicacion bus2) 0.0)
    (= (energia-en-ubicacion bus3) 0.0)
    (= (energia-en-ubicacion bus4) 0.0)
    (= (energia-en-ubicacion bus5) 0.0)
    ; Tipos de tension de los generadores
    (puede-ofrecer bus1 media)
    (puede-recibir bus1 media)
    (puede-ofrecer bus2 alta)
    (puede-recibir bus2 alta)
    (puede-ofrecer bus3 alta)
    (puede-recibir bus3 alta)
    ; Tipos de tension de las cargas
    (puede-ofrecer bus4 baja)
    (puede-recibir bus4 baja)
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

    (conexion-posible bus1 bus5)
    (conexion-posible bus5 bus1)

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
    (satisfecha-demanda bus2)
    (satisfecha-demanda bus3)
    (satisfecha-demanda bus4)
    (satisfecha-demanda bus5)
    )
)
(:metric minimize (total-cost))

)


