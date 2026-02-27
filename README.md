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

## A3 → A4

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
