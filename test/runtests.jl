using BarycentricLagrange
using Compat
using Compat.Test
using Compat.LinearAlgebra

@testset "BarycentricLagrange" begin

    function dotest(F)
        # Chebyshev source nodes
        n = 100
        x = cos.((0:n)*pi/n)
        w = bclag_interp_weights(x)
        # Equispaced evluation nodes
        xx = collect(-1:0.01:1)
        
        f = F.(x)
        ref = F.(xx)
        
        @test norm(bclag_interp_eval(x, f, xx)-ref, Inf) <  2e-15
        @test norm(bclag_interp_eval(x, f, xx, w)-ref, Inf) <  2e-15

        M1 = bclag_interp_matrix(x, xx)
        @test norm(M1*f-ref, Inf) <  2e-15

        M2 = bclag_interp_matrix(x, xx, w)
        @test norm(M2*f-ref, Inf) <  2e-15    
    end

    @testset "Real-valued" begin
        F = x -> cos(x)
        dotest(F)
    end
    
    @testset "Complex-valued" begin
        F = x -> exp(1im*x)
        dotest(F)
    end
    
end
