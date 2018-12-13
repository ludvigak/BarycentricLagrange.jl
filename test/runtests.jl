using BarycentricLagrange
using Compat
using Compat.Test
using Compat.LinearAlgebra

F = x -> sin(x)

n = 100
x = cos.((0:n)*pi/n) # Chebyshev nodes
f = F.(x)
w = bclag_interp_weights(x)

xx = collect(-1:0.01:1)
ref = F.(xx)

@testset "BarycentricLagrange" begin
    @test norm(bclag_interp_eval(x, f, xx)-ref, Inf) <  2e-15
    @test norm(bclag_interp_eval(x, f, xx, w)-ref, Inf) <  2e-15

    M1 = bclag_interp_matrix(x, xx)
    @test norm(M1*f-ref, Inf) <  2e-15

    M2 = bclag_interp_matrix(x, xx, w)
    @test norm(M2*f-ref, Inf) <  2e-15    
end
