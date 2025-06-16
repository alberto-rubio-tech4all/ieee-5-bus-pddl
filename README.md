# 🧠 Planificación automática en redes eléctricas con PDDL

Este repositorio contiene los ficheros fuente del dominio y de los tres problemas utilizados en la comparativa de planificadores presentada en el artículo:

> **Comparativa de Planificadores Clásicos en un Dominio Simplificado de Red Eléctrica IEEE 5-bus**

El trabajo evalúa distintas variantes de los planificadores **Metric-FF** y **ENHSP** sobre una formulación en PDDL del sistema eléctrico IEEE 5-bus, adaptado para tareas de planificación automática con métricas numéricas.

---

## 📂 Estructura del repositorio

```text
📦ieee-5-bus-pddl
┣ 📄domain.pddl             # Definición del dominio (generación, transformación, consumo, tensiones)
┣ 📄problem1.pddl           # Problema 1 - Baja complejidad (una carga, un generador)
┣ 📄problem2.pddl           # Problema 2 - Complejidad media (varias cargas y generadores)
┣ 📄problem3.pddl           # Problema 3 - Alta complejidad (restricciones de tensión y capacidad)
┗ 📄README.md               # Este archivo
```

---

## 🔍 Descripción

El dominio modela una red eléctrica con buses que pueden tener generadores, cargas o transformadores, y contempla:

- Tres niveles de tensión (alta, media y baja)
- Fluents numéricos para modelar energía, demanda, capacidad, coste, etc.
- Acciones como activar generadores, conectar buses, construir transformadores, consumir energía
- Métrica de optimización basada en el coste total

Cada problema representa un caso con distinta complejidad topológica, energética y estratégica, y está diseñado para evaluar la eficiencia y escalabilidad de los algoritmos de planificación.

---

## 🚀 Planificadores utilizados

Los ficheros pueden ser ejecutados en los siguientes planificadores:

- [Metric-FF](https://fai.cs.uni-saarland.de/hoffmann/metric-ff.html)
- [ENHSP](https://sites.google.com/view/enhsp/)

Requieren soporte para acciones numéricas y funciones de coste (extensión de PDDL 2.1).

---

## 📘 Referencia académica

Si deseas citar este trabajo, puedes utilizar la siguiente referencia (formato APA):

> Rubio Martínez, A. (2025). *Comparativa de Planificadores Clásicos en un Dominio Simplificado de Red Eléctrica IEEE 5-bus*. Universidad Internacional de La Rioja.

---

## 📝 Licencia

Este trabajo se distribuye bajo los términos de la licencia Creative Commons Attribution-NonCommercial 4.0 International (CC BY-NC 4.0).  
Puedes copiar, adaptar y compartir libremente el contenido con fines **no comerciales**, siempre que se cite adecuadamente al autor original.

[![Licencia CC BY-NC 4.0](https://licensebuttons.net/l/by-nc/4.0/88x31.png)](https://creativecommons.org/licenses/by-nc/4.0/)
