var documenterSearchIndex = {"docs": [

{
    "location": "#",
    "page": "BarycentricLagrange.jl Documentation",
    "title": "BarycentricLagrange.jl Documentation",
    "category": "page",
    "text": ""
},

{
    "location": "#BarycentricLagrange.jl-Documentation-1",
    "page": "BarycentricLagrange.jl Documentation",
    "title": "BarycentricLagrange.jl Documentation",
    "category": "section",
    "text": "Julia implementation of the barycentric Lagrange interpolation described in (Berrut & Trefethen, 2004)"
},

{
    "location": "#Examples-1",
    "page": "BarycentricLagrange.jl Documentation",
    "title": "Examples",
    "category": "section",
    "text": "using BarycentricLagrange\n# Data points and function values\nx = [0.0, 1.0, 2.0, 3.0, 4.0]\nf = x.^2\n# Evaluation points\nxx = [0.0, 0.1, 0.2, 0.3]\n# Direct interpolation\n@show bclag_interp_eval(x, f, xx)\n;\n# output\nbclag_interp_eval(x, f, xx) = [0.0, 0.01, 0.04, 0.09]# Save some time using precomputed weights\nw = bclag_interp_weights(x)\n@show bclag_interp_eval(x, f, xx, w)\n;\n# output\nbclag_interp_eval(x, f, xx, w) = [0.0, 0.01, 0.04, 0.09]# Using interpolation matrix\nM = bclag_interp_matrix(x, xx)\n@show size(M)\n@show M*f\n;\n# output\nsize(M) = (4, 5)\nM * f = [0.0, 0.01, 0.04, 0.09]# Compute matrix using precomputed weights\nM = bclag_interp_matrix(x, xx, w)\n# output\n4×5 Array{Float64,2}:\n 1.0       0.0       0.0       0.0       0.0\n 0.805837  0.35815  -0.254475  0.11115  -0.0206625\n 0.6384    0.6384   -0.4256    0.1824   -0.0336\n 0.495338  0.84915  -0.524475  0.22015  -0.0401625"
},

{
    "location": "#BarycentricLagrange.bclag_interp_eval-Union{Tuple{T}, Tuple{Array{T,1} where T,Array{T,1},Array{T,1} where T}, Tuple{Array{T,1} where T,Array{T,1},Array{T,1} where T,Array{T,1} where T}} where T",
    "page": "BarycentricLagrange.jl Documentation",
    "title": "BarycentricLagrange.bclag_interp_eval",
    "category": "method",
    "text": "ff = bclag_interp_eval(x, f, xx [, w])\n\nBarycentric Lagrange interpolation of f from points x to points xx\n\nw is vector of weights, w = bclag_interp_weights(x) \n\n\n\n\n\n"
},

{
    "location": "#BarycentricLagrange.bclag_interp_matrix",
    "page": "BarycentricLagrange.jl Documentation",
    "title": "BarycentricLagrange.bclag_interp_matrix",
    "category": "function",
    "text": "M = bclag_interp_matrix(x, xx [, w])\n\nCompute the matrix M such that ff = M*f gives the barycentric Lagrange interpolation of f from points x to points xx.\n\nw is vector of weights, w = bclag_interp_weights(x) \n\n\n\n\n\n"
},

{
    "location": "#BarycentricLagrange.bclag_interp_weights-Tuple{Array{T,1} where T}",
    "page": "BarycentricLagrange.jl Documentation",
    "title": "BarycentricLagrange.bclag_interp_weights",
    "category": "method",
    "text": "w = bclag_interp_weights(x)\n\nCompute weights for Barycentric Lagrange interpolation.\n\n\n\n\n\n"
},

{
    "location": "#Function-reference-1",
    "page": "BarycentricLagrange.jl Documentation",
    "title": "Function reference",
    "category": "section",
    "text": "Modules = [BarycentricLagrange]"
},

]}
