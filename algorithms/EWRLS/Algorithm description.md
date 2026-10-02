For the purpose of testing an estimation algorithm, the EWRLS (Equally Weighted Recursive Least Squares) algorithm was implemented using SCL and LAD. It utilizes the regression vector $\boldsymbol{\varphi}^{T}(i)$ constructed each iteration $i$ based on $\boldsymbol{u}^{T}$ and $\boldsymbol{y}^{T}$, which are the input and output vectors respectively. The aforementioned data is used to create an ARX model in the following form: 

$$
y(i) = \sum_{j = 1}^{r} a_{j}y(i-j) + \sum_{j = 1}^{q} b_{j}u(i-j) + n_{m}(i) \text{,}
$$

where $n_{m}(i)$ is the measurement noise. The algorithm itself is performed using the following equations:

$$
\begin{aligned}
\varepsilon(i) &= y(i)-\boldsymbol{\varphi}^{T}(i)\hat{\boldsymbol{\theta}}(i-1) \\
\boldsymbol{k}(i) &= \frac{\boldsymbol{P}(i-1)\boldsymbol{\varphi}(i)}{\lambda+\boldsymbol{\varphi}^{T}(i)\boldsymbol{P}(i-1)\boldsymbol{\varphi}(i)} \\
\hat{\boldsymbol{\theta}}(i) &= \hat{\boldsymbol{\theta}}(i-1) + \boldsymbol{k}(i)\varepsilon(i) \\
\boldsymbol{P}(i) &= \frac{1}{\lambda} \left(\boldsymbol{P}(i-1) - \boldsymbol{k}(i)\boldsymbol{\varphi}^{T}(i)\boldsymbol{P}(i-1) \right) \text{.}
\end{aligned}
$$

The implemented version of EWRLS can be run both online (the estimation is conducted while the process is taking place) or offline (after the fact). The first version does not use scheduling and suffers from a potential drawback: the larger the chosen model, the longer the calculation time, therefore it may be impossible to combine both a higher value of $r+q$ and low sampling time. The offline version is scheduled and capable of handling models of higher order. After each aforementioned equation the scheduler checks whether the calculations should be paused and resumed in the next cycle.
