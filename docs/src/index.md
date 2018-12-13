# BarycentricLagrange.jl Documentation

Julia implementation of the barycentric Lagrange interpolation described in ([Berrut & Trefethen, 2004](http://dx.doi.org/10.1137/S0036144502417715))

## Examples

```jldoctest examples
using BarycentricLagrange
# Data points and function values
x = [0.0, 1.0, 2.0, 3.0, 4.0]
f = x.^2
# Evaluation points
xx = [0.0, 0.1, 0.2, 0.3]
# Direct interpolation
@show bclag_interp_eval(x, f, xx)
;
# output
bclag_interp_eval(x, f, xx) = [0.0, 0.01, 0.04, 0.09]
```

```jldoctest examples
# Save some time using precomputed weights
w = bclag_interp_weights(x)
@show bclag_interp_eval(x, f, xx, w)
;
# output
bclag_interp_eval(x, f, xx, w) = [0.0, 0.01, 0.04, 0.09]
```

```jldoctest examples
# Using interpolation matrix
M = bclag_interp_matrix(x, xx)
@show size(M)
@show M*f
;
# output
size(M) = (4, 5)
M * f = [0.0, 0.01, 0.04, 0.09]
```

```jldoctest examples
# Compute matrix using precomputed weights
M = bclag_interp_matrix(x, xx, w)
# output
4×5 Array{Float64,2}:
 1.0       0.0       0.0       0.0       0.0
 0.805837  0.35815  -0.254475  0.11115  -0.0206625
 0.6384    0.6384   -0.4256    0.1824   -0.0336
 0.495338  0.84915  -0.524475  0.22015  -0.0401625
```

## Function reference
```@autodocs
Modules = [BarycentricLagrange]
```