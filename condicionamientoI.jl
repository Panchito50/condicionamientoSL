

```markdown
[nombre del archivo]: numerocondicion.md
[contenido del archivo inicio]
---
numbering:
  enumerator: 2.8.%s
---
(section-linsys-condition-number)=

# Condicionamiento de sistemas lineales

```{index} número de condición; de un sistema lineal
```

Estamos listos para considerar el condicionamiento de resolver el sistema lineal cuadrado $\mathbf{A}\mathbf{x}=\mathbf{b}$. En este problema, los datos son $\mathbf{A}$ y $\mathbf{b}$, y la solución es $\mathbf{x}$. Tanto los datos como el resultado son multidimensionales, así que usaremos normas para medir sus magnitudes.

La motivación para la definición del número de condición relativo en el Capítulo 1 fue cuantificar la respuesta del resultado a perturbaciones de los datos. Por simplicidad, comenzamos permitiendo perturbaciones solo a $\mathbf{b}$ mientras $\mathbf{A}$ permanece fijo.

Sea $\mathbf{A}\mathbf{x}=\mathbf{b}$ perturbado a

```{math}
  \mathbf{A}(\mathbf{x}+\mathbf{h}) = \mathbf{b}+\mathbf{d}.
```

El número de condición debería ser el cambio relativo en la solución dividido por el cambio relativo en los datos,

```{math}
  \frac{\quad\dfrac{\| \mathbf{h} \| }{\| \mathbf{x} \| }\quad}{\dfrac{\| \mathbf{d} \| }{\| \mathbf{b} \|}} 
  = \frac{\| \mathbf{h} \|\;\| \mathbf{b} \| }{\| \mathbf{d} \|\; \| \mathbf{x} \| }.
```

Podemos acotar $\| \mathbf{h} \|$ en términos de $\| \mathbf{d} \|$:

```{math}
\begin{split}
  \mathbf{A}\mathbf{x} +  \mathbf{A} \mathbf{h} &= \mathbf{b} + \mathbf{d}, \\
  \mathbf{A} \mathbf{h} &= \mathbf{d},\\
  \mathbf{h} &= \mathbf{A}^{-1} \mathbf{d},\\
  \| \mathbf{h} \| &\le \| \mathbf{A}^{-1}\| \,\| \mathbf{d} \|,
\end{split}
```

donde hemos aplicado $\mathbf{A}\mathbf{x}=\mathbf{b}$ y {eq}`normineq1`.
Dado que también $\mathbf{b}=\mathbf{A}\mathbf{x}$ implica $\| \mathbf{b} \|\le
\| \mathbf{A} \|\, \| \mathbf{x} \|$, derivamos

```{math}
   \frac{\| \mathbf{h} \|\; \| \mathbf{b} \|}{\| \mathbf{d} \|\; \| \mathbf{x} \|} 
   \le \frac{\bigl(\| \mathbf{A}^{-1} \|\, \| \mathbf{d} \|\bigr)
    \bigl(\| \mathbf{A} \|\,\| \mathbf{x} \|\bigr)}{\| \mathbf{d} \|\,\| \mathbf{x} \|} 
    = \| \mathbf{A}^{-1}\| \, \| \mathbf{A} \|.
```

```{index} número de condición; de una matriz
```

Es posible mostrar que esta cota es ajustada, en el sentido de que las desigualdades son de hecho igualdades para algunas elecciones de $\mathbf{b}$ y $\mathbf{d}$. Este resultado motiva una nueva definición.

::::{prf:definition} Número de condición de una matriz
:label: definition-matrixcond
El {term}`número de condición de una matriz` de una matriz cuadrada invertible $\mathbf{A}$ es

```{math}
:label: mxcond
\kappa(\mathbf{A}) = \| \mathbf{A}^{-1}\| \, \| \mathbf{A} \|.
```

Este valor depende de la elección de la norma; se usa un subíndice en $\kappa$ como $1$, $2$, o $\infty$ si se necesita aclaración. Si $\mathbf{A}$ es singular, definimos $\kappa(\mathbf{A}) = \infty$.
::::

## Resultado principal

El número de condición de la matriz {eq}`mxcond` es igual al número de condición de resolver un sistema de ecuaciones lineales. Aunque derivamos este hecho anteriormente solo para perturbaciones de $\mathbf{b}$, un enunciado similar se cumple cuando $\mathbf{A}$ es perturbada.

Usando una notación tradicional $\Delta$ para la perturbación en una cantidad, podemos escribir lo siguiente.

````{prf:theorem} Condicionamiento de sistemas lineales
Si $\mathbf{A}(\mathbf{x} + \Delta \mathbf{x}) = \mathbf{b} + \Delta \mathbf{b}$, entonces

```{math}
:label: linsyscondb
\frac{\| \Delta \mathbf{x} \|}{\| \mathbf{x} \|} \le \kappa(\mathbf{A}) \frac{\| \Delta \mathbf{b} \|}{\| \mathbf{b} \|}.
```

Si $(\mathbf{A}+\Delta \mathbf{A}) (\mathbf{x} + \Delta \mathbf{x}) = \mathbf{b}$, entonces

```{math}
:label: linsyscondA
\frac{\| \Delta \mathbf{x} \|}{\| \mathbf{x} \|} \le \kappa(\mathbf{A}) \frac{\| \Delta \mathbf{A} \|}{\| \mathbf{A} \|},
```

en el límite $\| \Delta \mathbf{A} \| \to 0$.
````

Nótese que para cualquier norma matricial inducida,

```{math}
  1 = \| \mathbf{I} \| = \| \mathbf{A} \mathbf{A}^{-1} \| \le \| \mathbf{A} \|\, \| \mathbf{A}^{-1} \| = \kappa(\mathbf{A}).
```

Un número de condición de 1 es lo mejor que podemos esperar—en ese caso, la perturbación relativa de la solución tiene el mismo tamaño que la de los datos. Un número de condición de tamaño $10^t$ indica que en aritmética de punto flotante, aproximadamente $t$ dígitos se pierden (es decir, se vuelven incorrectos) al calcular la solución $\mathbf{x}$. Y si $\kappa(\mathbf{A}) > \epsilon_\text{mach}^{-1}$, entonces para fines computacionales la matriz es efectivamente singular.

::::{prf:example} Número de condición de una matriz
:label: demo-condition-bound

`````{tab-set}
````{tab-item} Julia
:sync: julia
:::{embed} #demo-condition-bound-julia
:::
```` 

````{tab-item} MATLAB
:sync: matlab
:::{embed} #demo-condition-bound-matlab
:::
```` 

````{tab-item} Python
:sync: python
:::{embed} #demo-condition-bound-python
:::
```` 
`````

::::

## Residual y error hacia atrás

Supongamos que $\mathbf{A}\mathbf{x}=\mathbf{b}$ y $\tilde{\mathbf{x}}$ es una estimación calculada de la solución $\mathbf{x}$. La cantidad más natural para estudiar es el error, $\mathbf{x}-\tilde{\mathbf{x}}$. Normalmente no podemos calcularlo porque no conocemos la solución exacta. Sin embargo, podemos calcular algo relacionado.

```{index} ! residual; de un sistema lineal
```

::::{prf:definition} Residual de un sistema lineal
:label: definition-linresidual
Para el problema $\mathbf{A}\mathbf{x}=\mathbf{b}$, el **residual** en una estimación de solución $\tilde{\mathbf{x}}$ es

```{math}
:label: residual
  \mathbf{r} = \mathbf{b} - \mathbf{A}\tilde{\mathbf{x}}.
```

::::

```{index} error hacia atrás; en un sistema lineal
```

Obviamente, un residual cero significa que $\tilde{\mathbf{x}}=\mathbf{x}$, y tenemos la solución exacta. ¿Qué sucede más generalmente? Nótese que $\mathbf{A}\tilde{\mathbf{x}}=\mathbf{b}-\mathbf{r}$. Es decir, $\tilde{\mathbf{x}}$ resuelve el problema del sistema lineal para un lado derecho que se cambia por $-\mathbf{r}$. Esto es precisamente lo que significa error hacia atrás.

Por lo tanto, el residual y el error hacia atrás son lo mismo para un sistema lineal. ¿Cuál es la conexión con el error (hacia adelante)? Podemos reconectar con {eq}`linsyscondb` mediante la definición $\mathbf{h} = \tilde{\mathbf{x}}-\mathbf{x}$, en cuyo caso

$$\mathbf{d} = \mathbf{A}(\mathbf{x}+\mathbf{h})-\mathbf{b}=\mathbf{A}\mathbf{h} = -\mathbf{r}.$$

Así, {eq}`linsyscondb` es equivalente a

```{math}
:label: residualcond
  \frac{\| \mathbf{x}-\tilde{\mathbf{x}} \|}{\| \mathbf{x} \|} \le
  \kappa(\mathbf{A}) \frac{\| \mathbf{r} \|}{\| \mathbf{b} \|}.
```

La ecuación {eq}`residualcond` dice que la brecha entre el error relativo y el residual relativo es una multiplicación por el número de condición de la matriz.

```{prf:observation}
Al resolver un sistema lineal, todo lo que se puede esperar es que el error hacia atrás, no el error, sea pequeño.
```

## Ejercicios

``````{exercise}
:label: problem-cond-hilbert

⌨ Consulta @demo-condition-bound para la definición de una matriz de Hilbert. Haz una tabla de los valores de $\kappa(\mathbf{H}_n)$ en la norma 2 para $n=2,3,\ldots,16$. Especula por qué el crecimiento de $\kappa$ parece ralentizarse en $n=13$.
``````

``````{exercise}
:label: problem-cond-verify

⌨ El propósito de este problema es verificar, como en @demo-condition-bound, la cota de error

```{math}
:numbered: false
\frac{\| \mathbf{x}-\tilde{\mathbf{x} \|}}{\| \mathbf{x} \|} \le \kappa(\mathbf{A})
\frac{\| \mathbf{h} \|}{\| \mathbf{b} \|}.
```

Aquí $\tilde{\mathbf{x}}$ es una aproximación numérica a la solución exacta $\mathbf{x}$, y $\mathbf{h}$ es una perturbación desconocida causada por el redondeo de la máquina. Asumiremos que $\| \mathbf{h} \|/\| \mathbf{b} \|$ es aproximadamente `eps()`.

`````{tab-set}
````{tab-item} Julia
:sync: julia

Usa el paquete `MatrixDepot`. Para cada $n=10,20,\ldots,70$, sea `A = matrixdepot("prolate", n, 0.4)` y sea $\mathbf{x}$ con componentes $x_k=k/n$ para $k=1,\ldots,n$. Define `b = A*x` y sea `xtilde` la solución producida numéricamente por backslash.
````

````{tab-item} MATLAB
:sync: matlab

Para cada $n=10,20,\ldots,70$, sea `A = gallery("prolate", n, 0.4)` y sea $\mathbf{x}$ con componentes $x_k=k/n$ para $k=1,\ldots,n$. Define `b = A*x` y sea `xtilde` la solución producida numéricamente por backslash.
````

````{tab-item} Python
:sync: python
Necesitarás importar el paquete `rogues` de PyPi. Para cada $n=10,20,\ldots,70$, sea `A = rogues.prolate(n, 0.4)` y sea $\mathbf{x}$ con componentes $x_k=k/n$ para $k=1,\ldots,n$. Define `b = A@x` y sea `xtilde` la solución producida numéricamente por `numpy.linalg.solve`.
```` 
`````

Haz una tabla que incluya columnas para $n$, el número de condición de $\mathbf{A}$, el error relativo observado en $\tilde{\mathbf{x}}$, y el lado derecho de la desigualdad anterior. Deberías encontrar que la desigualdad se cumple en todos los casos.
``````

``````{exercise}
:label: problem-cond-triangular

⌨ @problem-linearsystems-triangillcond sugiere que las soluciones de sistemas lineales

```{math}
:numbered: false
\mathbf{A} = \begin{bmatrix} 1 & -1 & 0 & \alpha-\beta & \beta \\ 0 & 1 & -1 &
0 & 0 \\ 0 & 0 & 1 & -1 & 0 \\ 0 & 0 & 0 & 1 & -1  \\ 0 & 0 & 0 & 0 & 1
\end{bmatrix}, \quad
\mathbf{b} = \begin{bmatrix} \alpha \\ 0 \\ 0 \\ 0 \\ 1 \end{bmatrix}
```

se vuelven menos precisas a medida que $\beta$ aumenta. Usando $\alpha=0.1$ y $\beta=10,10^2,\ldots,10^{12}$, haz una tabla con columnas para $\beta$, $|x_1-1|$, y el número de condición de la matriz.
``````

``````{exercise}
:label: problem-cond-vandermonde

⌨ Sea $\mathbf{A}_n$ la versión $(n+1)\times(n+1)$ de la matriz de Vandermonde en @vandersystem basada en los nodos de interpolación igualmente espaciados $t_i=i/n$ para $i=0,\ldots,n$. Usando la norma 1, grafica $\kappa(\mathbf{A}_n)$ como función de $n$ para $n=4,5,6,\ldots,20$, usando una escala logarítmica en el eje $y$. (La gráfica es casi una línea recta.)

``````

``````{exercise}
:label: problem-cond-unpivoted

⌨ La matriz $\mathbf{A}$ en {eq}`plu-stab-A` tiene factores LU sin pivotamiento dados en {eq}`plu-stab-LU` en función del parámetro $\epsilon$. Para $\epsilon = 10^{-2},10^{-4},\ldots,10^{-10}$, haz una tabla con columnas para $\epsilon$, $\kappa(\mathbf{A})$, $\kappa(\mathbf{L})$, y $\kappa(\mathbf{U})$. (Esto muestra que la solución mediante factorización LU sin pivotamiento es arbitrariamente inestable.)
``````

``````{exercise}
:label: problem-cond-inverse

✍  Define $\mathbf{A}_n$ como la matriz $n\times n$ $\displaystyle\begin{bmatrix}
1 & -2 & & &\\
& 1 & -2 & & \\
& & \ddots & \ddots & \\
& & & 1 & -2 \\
& & & & 1
\end{bmatrix}.$

**(a)** Escribe $\mathbf{A}_2^{-1}$ y $\mathbf{A}_3^{-1}$.

**(b)** Escribe $\mathbf{A}_n^{-1}$ en el caso general $n>1$. (Si es necesario, observa algunos casos más en la computadora hasta que estés seguro del patrón). Haz un argumento claro de por qué es correcto.

**(c)** Usando la norma $\infty$, encuentra $\kappa(\mathbf{A}_n)$.
``````

``````{exercise}
:label: problem-cond-product

✍ **(a)** Demuestra que para matrices no singulares $\mathbf{A}$ y $\mathbf{B}$ de $n\times n$, $\kappa(\mathbf{A}\mathbf{B})\le \kappa(\mathbf{A})\kappa(\mathbf{B})$.

**(b)** Muestra mediante un ejemplo que el resultado de la parte (a) no puede ser una igualdad en general.
``````

``````{exercise}
:label: problem-cond-diagonal
✍  Sea $\mathbf{D}$ una matriz diagonal $n\times n$, no necesariamente invertible. Demuestra que en la norma 1,

```{math}
:numbered: false
\kappa(\mathbf{D}) = \frac{\max_i |D_{ii}|}{\min_i |D_{ii}|}.
```

(Pista: Consulta @problem-norms-diagnorm.)
``````
[contenido del archivo fin]
```

**Respuesta concisa**: Sí, puedes copiar todo el texto de una vez. Es el archivo completo traducido.
