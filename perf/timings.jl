using BarycentricLagrange
using BenchmarkTools

# Chebyshev nodes
n = 100
x = cos.((0:n)*pi/n)
w = bclag_interp_weights(x)

F = x -> sin(x)
f = F.(x)

xx = collect(-1:0.01:1)
ref = F.(xx)

# Benchmarks
println("Direct eval")
@btime bclag_interp_eval(x, f, xx)
println("Compute weights")
@btime bclag_interp_weights(x)
println("Eval with weights")
@btime bclag_interp_eval(x, f, xx, w)

println("Direct matrix")
@btime bclag_interp_matrix(x, xx)
println("Matrix with weights")
@btime bclag_interp_matrix(x, xx, w)
M = bclag_interp_matrix(x, xx)
println("Matrix apply")
@btime M*f
