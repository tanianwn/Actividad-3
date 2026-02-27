# Actividad-3

# Robot Cartesiano 4GDL
## Sistema de referencia
<p align="center">
  <img src="https://github.com/user-attachments/assets/d1dc1293-3cec-44a9-b42c-86b106e3942e" width="600" alt="Robot 6GDL"/>
</p>

## L1 → L2
### Descripción
- Rotación negativa de -90° alrededor del eje X1
- Traslación positiva en el eje Z1

### Matriz de rotación en X (forma general)

$$
R_x(\theta)=
\begin{bmatrix}
1 & 0 & 0 \\
0 & \cos\theta & -\sin\theta \\
0 & \sin\theta & \cos\theta
\end{bmatrix}
$$

### Matriz de rotación en Z (forma general)

$$
R_z(\theta)=
\begin{bmatrix}
\cos\theta & -\sin\theta & 0 \\
\sin\theta & \cos\theta & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Evaluación en $-90^\circ$

$$
R_x(-90^\circ)=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
0 & -1 & 0
\end{bmatrix}
$$

### Multiplicación

$$
R = R_x(-90^\circ) R_z(\theta_1)
$$

$$
R =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
0 & -1 & 0
\end{bmatrix}
\begin{bmatrix}
\cos\theta_1 & -\sin\theta_1 & 0 \\
\sin\theta_1 & \cos\theta_1 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Resultado

$$
R_{12} =
\begin{bmatrix}
\cos\theta_1 & -\sin\theta_1 & 0 \\
0 & 0 & 1 \\
-\sin\theta_1 & -\cos\theta_1 & 0
\end{bmatrix}
$$

### Vector de traslación

$$
P =
\begin{bmatrix}
0 \\
0 \\
L_1
\end{bmatrix}
$$

### Matriz de transformación homogénea

$$
T_{12} =
\begin{bmatrix}
\cos\theta_1 & -\sin\theta_1 & 0 & 0 \\
0 & 0 & 1 & 0 \\
-\sin\theta_1 & -\cos\theta_1 & 0 & L_1 \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

---

## A2 → A3

### Descripción
- Rotación negativa de -90° alrededor del eje Y2
- Traslación positiva en el eje X2

### Matriz de rotación en Y (forma general)

$$
R_y(\theta)=
\begin{bmatrix}
\cos\theta & 0 & \sin\theta \\
0 & 1 & 0 \\
-\sin\theta & 0 & \cos\theta
\end{bmatrix}
$$

### Matriz de rotación en Z (forma general)

$$
R_z(\theta)=
\begin{bmatrix}
\cos\theta & -\sin\theta & 0 \\
\sin\theta & \cos\theta & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Evaluación en $-90^\circ$

$$
R_y(-90^\circ)=
\begin{bmatrix}
0 & 0 & -1 \\
0 & 1 & 0 \\
1 & 0 & 0
\end{bmatrix}
$$

### Multiplicación

$$
R = R_y(-90^\circ) R_z(\theta_2)
$$

$$
R =
\begin{bmatrix}
0 & 0 & -1 \\
0 & 1 & 0 \\
1 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
\cos\theta_2 & -\sin\theta_2 & 0 \\
\sin\theta_2 & \cos\theta_2 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Resultado

$$
R_{23} =
\begin{bmatrix}
0 & 0 & -1 \\
\sin\theta_2 & \cos\theta_2 & 0 \\
\cos\theta_2 & -\sin\theta_2 & 0
\end{bmatrix}
$$

### Vector de traslación

$$
P =
\begin{bmatrix}
L_2 \\
0 \\
0
\end{bmatrix}
$$

### Matriz de transformación homogénea

$$
T_{23} =
\begin{bmatrix}
0 & 0 & -1 & L_2 \\
\sin\theta_2 & \cos\theta_2 & 0 & 0 \\
\cos\theta_2 & -\sin\theta_2 & 0 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

---

## L3 → L4

### Descripción
- No existe rotación
- Traslación negativa en el eje Z3

### Resultado

$$
R_{34} = I =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 1 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Vector de traslación

$$
P =
\begin{bmatrix}
0 \\
0 \\
-L_3
\end{bmatrix}
$$

### Matriz de transformación homogénea

$$
T_{34} =
\begin{bmatrix}
1 & 0 & 0 & 0 \\
0 & 1 & 0 & 0 \\
0 & 0 & 1 & -L_3 \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

# Robot sistema de interacción 6GDL
## Sistema de referencia
<p align="center">
  <img src="https://github.com/user-attachments/assets/4a4405c0-86dd-42cf-8dac-3ba86d2063c0" width="600" alt="Robot 6GDL"/>
</p>
# Robot de Interacción 6GDL

## 00 → 01

### Descripción
- Rotación alrededor del eje Z0 con ángulo $\theta_1$
- Rotación positiva de 90° alrededor del eje Y0
- Traslación en $D_1$ sobre el eje Z0

### Matriz de rotación en Y (forma general)

$$
R_y(\theta)=
\begin{bmatrix}
\cos\theta & 0 & \sin\theta \\
0 & 1 & 0 \\
-\sin\theta & 0 & \cos\theta
\end{bmatrix}
$$

### Matriz de rotación en Z (forma general)

$$
R_z(\theta)=
\begin{bmatrix}
\cos\theta & -\sin\theta & 0 \\
\sin\theta & \cos\theta & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Evaluación en $90^\circ$

$$
R_y(90^\circ)=
\begin{bmatrix}
0 & 0 & 1 \\
0 & 1 & 0 \\
-1 & 0 & 0
\end{bmatrix}
$$

### Multiplicación

$$
R = R_y(90^\circ) R_z(\theta_1)
$$

$$
R =
\begin{bmatrix}
0 & 0 & 1 \\
0 & 1 & 0 \\
-1 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
\cos\theta_1 & -\sin\theta_1 & 0 \\
\sin\theta_1 & \cos\theta_1 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Resultado

$$
R_{01} =
\begin{bmatrix}
0 & 0 & 1 \\
\sin\theta_1 & \cos\theta_1 & 0 \\
-\cos\theta_1 & \sin\theta_1 & 0
\end{bmatrix}
$$

### Vector de traslación

$$
P =
\begin{bmatrix}
0 \\
0 \\
D_1
\end{bmatrix}
$$

### Matriz de transformación homogénea

$$
T_{01} =
\begin{bmatrix}
0 & 0 & 1 & 0 \\
\sin\theta_1 & \cos\theta_1 & 0 & 0 \\
-\cos\theta_1 & \sin\theta_1 & 0 & D_1 \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

---

## 01 → 02

### Descripción
- No existe rotación de transformación fija
- Rotación alrededor del eje Z1 con ángulo $\theta_2$
- Traslación negativa de $a_2\sin\theta_2$ sobre el eje X1
- Traslación positiva de $a_2\cos\theta_2$ sobre el eje Y1

### Matriz de rotación en Z (forma general)

$$
R_z(\theta)=
\begin{bmatrix}
\cos\theta & -\sin\theta & 0 \\
\sin\theta & \cos\theta & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Resultado

$$
R_{12} = R_z(\theta_2) =
\begin{bmatrix}
\cos\theta_2 & -\sin\theta_2 & 0 \\
\sin\theta_2 & \cos\theta_2 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Vector de traslación

$$
P =
\begin{bmatrix}
-a_2\sin\theta_2 \\
a_2\cos\theta_2 \\
0
\end{bmatrix}
$$

### Matriz de transformación homogénea

$$
T_{12} =
\begin{bmatrix}
\cos\theta_2 & -\sin\theta_2 & 0 & -a_2\sin\theta_2 \\
\sin\theta_2 & \cos\theta_2 & 0 & a_2\cos\theta_2 \\
0 & 0 & 1 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

---

## 02 → 03

### Descripción
- Rotación alrededor del eje Z2 con ángulo $\theta_3$
- Rotación negativa de -90° alrededor del eje Y2
- Rotación negativa de -90° alrededor del eje Z2
- Traslación positiva de $a_3\sin\theta_3$ sobre el eje X2
- Traslación positiva de $a_3\cos\theta_3$ sobre el eje Y2

### Matriz de rotación en Y (forma general)

$$
R_y(\theta)=
\begin{bmatrix}
\cos\theta & 0 & \sin\theta \\
0 & 1 & 0 \\
-\sin\theta & 0 & \cos\theta
\end{bmatrix}
$$

### Matriz de rotación en Z (forma general)

$$
R_z(\theta)=
\begin{bmatrix}
\cos\theta & -\sin\theta & 0 \\
\sin\theta & \cos\theta & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Evaluación en $-90^\circ$

$$
R_y(-90^\circ)=
\begin{bmatrix}
0 & 0 & -1 \\
0 & 1 & 0 \\
1 & 0 & 0
\end{bmatrix}
\qquad
R_z(-90^\circ)=
\begin{bmatrix}
0 & 1 & 0 \\
-1 & 0 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Multiplicación

$$
R = R_y(-90^\circ)\, R_z(-90^\circ)\, R_z(\theta_3)
$$

$$
R =
\begin{bmatrix}
0 & 0 & -1 \\
0 & 1 & 0 \\
1 & 0 & 0
\end{bmatrix}
\begin{bmatrix}
0 & 1 & 0 \\
-1 & 0 & 0 \\
0 & 0 & 1
\end{bmatrix}
\begin{bmatrix}
\cos\theta_3 & -\sin\theta_3 & 0 \\
\sin\theta_3 & \cos\theta_3 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Resultado

$$
R_{23} =
\begin{bmatrix}
-\sin\theta_3 & -\cos\theta_3 & 0 \\
-\cos\theta_3 & \sin\theta_3 & 0 \\
0 & 0 & -1
\end{bmatrix}
$$

### Vector de traslación

$$
P =
\begin{bmatrix}
a_3\sin\theta_3 \\
a_3\cos\theta_3 \\
0
\end{bmatrix}
$$

### Matriz de transformación homogénea

$$
T_{23} =
\begin{bmatrix}
-\sin\theta_3 & -\cos\theta_3 & 0 & a_3\sin\theta_3 \\
-\cos\theta_3 & \sin\theta_3 & 0 & a_3\cos\theta_3 \\
0 & 0 & -1 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

---

## 03 → 04

### Descripción
- Rotación alrededor del eje Z3 con ángulo $\theta_4$
- Rotación negativa de -90° alrededor del eje X3
- Traslación negativa de $D_4$ sobre el eje Z3

### Matriz de rotación en X (forma general)

$$
R_x(\theta)=
\begin{bmatrix}
1 & 0 & 0 \\
0 & \cos\theta & -\sin\theta \\
0 & \sin\theta & \cos\theta
\end{bmatrix}
$$

### Matriz de rotación en Z (forma general)

$$
R_z(\theta)=
\begin{bmatrix}
\cos\theta & -\sin\theta & 0 \\
\sin\theta & \cos\theta & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Evaluación en $-90^\circ$

$$
R_x(-90^\circ)=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
0 & -1 & 0
\end{bmatrix}
$$

### Multiplicación

$$
R = R_x(-90^\circ) R_z(\theta_4)
$$

$$
R =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & 1 \\
0 & -1 & 0
\end{bmatrix}
\begin{bmatrix}
\cos\theta_4 & -\sin\theta_4 & 0 \\
\sin\theta_4 & \cos\theta_4 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Resultado

$$
R_{34} =
\begin{bmatrix}
\cos\theta_4 & -\sin\theta_4 & 0 \\
0 & 0 & 1 \\
-\sin\theta_4 & -\cos\theta_4 & 0
\end{bmatrix}
$$

### Vector de traslación

$$
P =
\begin{bmatrix}
0 \\
0 \\
-D_4
\end{bmatrix}
$$

### Matriz de transformación homogénea

$$
T_{34} =
\begin{bmatrix}
\cos\theta_4 & -\sin\theta_4 & 0 & 0 \\
0 & 0 & 1 & 0 \\
-\sin\theta_4 & -\cos\theta_4 & 0 & -D_4 \\
0 & 0 & 0 & 1
\end{bmatrix}
$$

---

## 04 → 05

### Descripción
- Rotación alrededor del eje Z4 con ángulo $\theta_5$
- Rotación positiva de 90° alrededor del eje X4
- Traslación negativa de $a_4\cos\theta_5$ sobre el eje X4
- Traslación negativa de $a_4\sin\theta_5$ sobre el eje Y4

### Matriz de rotación en X (forma general)

$$
R_x(\theta)=
\begin{bmatrix}
1 & 0 & 0 \\
0 & \cos\theta & -\sin\theta \\
0 & \sin\theta & \cos\theta
\end{bmatrix}
$$

### Matriz de rotación en Z (forma general)

$$
R_z(\theta)=
\begin{bmatrix}
\cos\theta & -\sin\theta & 0 \\
\sin\theta & \cos\theta & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Evaluación en $90^\circ$

$$
R_x(90^\circ)=
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & -1 \\
0 & 1 & 0
\end{bmatrix}
$$

### Multiplicación

$$
R = R_x(90^\circ) R_z(\theta_5)
$$

$$
R =
\begin{bmatrix}
1 & 0 & 0 \\
0 & 0 & -1 \\
0 & 1 & 0
\end{bmatrix}
\begin{bmatrix}
\cos\theta_5 & -\sin\theta_5 & 0 \\
\sin\theta_5 & \cos\theta_5 & 0 \\
0 & 0 & 1
\end{bmatrix}
$$

### Resultado

$$
R_{45} =
\begin{bmatrix}
\cos\theta_5 & -\sin\theta_5 & 0 \\
0 & 0 & -1 \\
\sin\theta_5 & \cos\theta_5 & 0
\end{bmatrix}
$$

### Vector de traslación

$$
P =
\begin{bmatrix}
-a_4\cos\theta_5 \\
-a_4\sin\theta_5 \\
0
\end{bmatrix}
$$

### Matriz de transformación homogénea

$$
T_{45} =
\begin{bmatrix}
\cos\theta_5 & -\sin\theta_5 & 0 & -a_4\cos\theta_5 \\
0 & 0 & -1 & -a_4\sin\theta_5 \\
\sin\theta_5 & \cos\theta_5 & 0 & 0 \\
0 & 0 & 0 & 1
\end{bmatrix}
$$




