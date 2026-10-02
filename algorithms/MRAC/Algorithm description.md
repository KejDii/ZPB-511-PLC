The Model Reference Adaptive Control (MRAC) algorithm was originally introduced in the 1950s for the control of aerospace systems affected by parametric uncertainties [1]. The fundamental principle of MRAC is the continuous adjustment of controller parameters such that the dynamics of the actual plant closely follow those of a predefined reference model, which generates the desired trajectory for the system output [1]. Unlike classical fixed-gain controllers, MRAC updates the controller parameters online based on the instantaneous control error, enabling compensation for parametric uncertainties, variations in operating conditions, and external disturbances through continuous adaptation of the controller gains.
In this work, a direct MRAC approach is employed, in which the controller parameters are updated directly according to adaptation laws [1].

Both the plant model and the reference model are described using standard state-space matrix equations, relating the state vectors $\mathbf{x}(t)$ and $\mathbf{x}_m(t)$, the control input $\mathbf{u}(t)$, and the corresponding outputs $\mathbf{y}(t)$ and $\mathbf{y}_m(t)$. The reference model, defined by the matrices $\mathbf{A}_m$ and $\mathbf{B}_m$, specifies the desired system dynamics with respect to the reference signal $\mathbf{r}(t)$.

The control error is defined as the difference between the plant state and the reference model state:

$$
\mathbf{e}(t) = \mathbf{x}(t) - \mathbf{x}_m(t) ,
$$

The general MRAC control law is given by:

$$
u(t) = \mathbf{k}_x^{T}(t)\mathbf{x}(t) + k_r(t)r(t) - \mathbf{w}^T(t)\,\varphi(x)
$$

where $\mathbf{k}_x(t)$ and $k_r(t)$ denote the adaptive gain vectors associated with state feedback and the reference input, respectively. The term $\mathbf{w}^T(t)\,\varphi(x)$ represents a compensation component accounting for system nonlinearities and disturbances, where $\varphi(x)$ is a vector of nonlinear basis functions (e.g., radial basis functions), and $\mathbf{w}(t)$ is the corresponding vector of adaptive weights. This control structure is commonly referred to in the literature as a direct MRAC formulation [1], [2].

In this work, the term $\mathbf{w}^T(t)\,\varphi(x)$ was not included in the final control law. The resulting simplified control structure preserves the adaptive properties of the MRAC scheme while significantly facilitating its implementation on a PLC platform.

To ensure the stability of the adaptive MRAC scheme, Lyapunov-based stability analysis is commonly employed. Accordingly, a classical Lyapunov candidate function is adopted in the following form [1]:

$$
V = \mathbf{e}^T \mathbf{P} \mathbf{e} + \tilde{\mathbf{k}}_x^T \mathbf{\Gamma}_x \tilde{\mathbf{k}}_x + \tilde{\mathbf{k}}_r^T \mathbf{\Gamma}_r \tilde{\mathbf{k}}_r
$$

where $\mathbf{e}(t)$ denotes the control error, $\tilde{\mathbf{k}}_x$ and $\tilde{\mathbf{k}}_r$ represent the parameter estimation errors relative to their ideal values, and $\mathbf{\Gamma}_x$ and $\mathbf{\Gamma}_r$ are positive-definite adaptation gain matrices.

The matrix $\mathbf{P}$ is obtained from the Lyapunov equation [1]:

$$
\mathbf{A}_m^{T} \mathbf{P} + \mathbf{P}\,\mathbf{A}_m = -\mathbf{Q}
$$

where $\mathbf{Q}$ is a positive-definite weighting matrix.

Based on the matrix $\mathbf{P}$ and the structure of the plant model, the adaptation direction is defined as:

$$
\boldsymbol{\psi}(t) = \mathbf{B}^{T} \mathbf{P} \mathbf{e}(t)
$$

The adaptation laws of the controller parameters are derived using a gradient-based approach [1], [2] and are given by:

$$
\begin{aligned}
\dot{k}_r(t) &= -\gamma_r\, r(t)\, \psi(t) \\
\dot{\mathbf{k}}_x(t) &= -\gamma_x, \mathbf{x}(t), \psi(t)
\end{aligned}
$$

where $\gamma_r$ and $\gamma_x$ are positive adaptation gains associated with the reference channel and state feedback, respectively.

The above adaptation laws can be augmented with an additional term $-\sigma\,k(t)$ ($\sigma$-modification) to prevent unbounded growth of the controller parameters [1]. 

---

### References
[1] - P. A. Ioannou and J. Sun,Robust adaptive control.   USA: Prentice-Hall,Inc., 1995.
[2] - V.  Stepanyan  and  K.  Krishnakumar,  “Input  and  output  performance  ofm-mrac in the presence of bounded disturbances,” 08 2010.
