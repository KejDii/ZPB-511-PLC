The Kalman Filter was first introduced in 1960 by Rudolf E. Kalman [1] as a solution to the Wiener problem [2] formulated within the state-space perspective. It is an algorithm that utilizes a series of measurements, characterized by the presence of white noise, to estimate unknown variables with higher accuracy than a single measurement. Consequently, the Kalman Filter can be characterized as both an optimal estimator and a spectral whitener.

The algorithm relies on a set of recursive matrix equations. Implementing these equations typically involves one of two approaches. The first utilizes a dedicated matrix function library—since PLCs natively operate on primitive data arrays—which allows for a direct transcription of the mathematical equations into the controller environment. This approach was adopted in the development of this article. The second approach involves writing code that operates directly on scalars and arrays, which necessitates specific programming strategies to emulate matrix operations.

Implementing the Kalman Filter on digital devices encounters a critical challenge regarding the error covariance update equation. Numerical errors (e.g. round-off errors) can compromise the symmetry and positive definiteness of the covariance matrix, leading to filter divergence and incorrect estimation. A robust solution to this problem is the use of the so-called Joseph stabilized form (1). Although this formulation is computationally more expensive, it provides greater numerical stability. The equation was originally derived by Peter Joseph and described in the seminal work [3].

$$
\begin{aligned}
\mathbf{P}(k|k) &= \bigl(\mathbf{I} - \mathbf{K}(k) \mathbf{C}(k)\bigr) \mathbf{P}(k) \bigl(\mathbf{I} - \mathbf{K}(k) \mathbf{C}(k)\bigr)^T \\ 
&\quad + \mathbf{K}(k) \mathbf{R}(k) \mathbf{K}(k)^T
\end{aligned} \tag{1}
$$

[1] R.  E.  Kalman,  “A  New  Approach  to  Linear  Filtering  and  PredictionProblems,”Journal  of  Basic  Engineering,  vol.  82,  no.  1,  pp.  35–45,Mar. 1960. [Online]. Available: https://asmedigitalcollection.asme.org/fluidsengineering/article-abstract/82/1/35/397706/A-New-Approach-to-Linear-Filtering-and-Prediction
[2] P.   A.   M.   and   N.   Wiener,   “The   Extrapolation,   Interpolation   andSmoothing  of  Stationary  Time  Series,  with  Engineering  Applications.”Journal  of  the  Royal  Statistical  Society.  Series  A  (General),  vol.  113,no.  3,  p.  413,  1950.  [Online].  Available:  https://www.jstor.org/stable/10.2307/2981007?origin=crossref
[3] R.  S.  Bucy  and  P.  D.  Joseph, Filtering  for  stochastic  processes  withapplications  to  guidance,  ser.  Interscience  tracts  in  pure  and  appliedmathematics.    New York: Interscience Publ, 1968, no. 23.
