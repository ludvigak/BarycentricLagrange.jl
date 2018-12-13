module BarycentricLagrange
# Reference:
# Barycentric Lagrange Interpolation.
# Berrut, J.-P., & Trefethen, L. N. (2004).
# SIAM Review, 46(3), 501–517. doi:10.1137/S36144502417716

export bclag_interp_eval
export bclag_interp_matrix
export bclag_interp_weights

function bclag_interp_weight(x, j, n)
    p = 1.0
    for k=1:j-1
        p *= x[j] - x[k]
    end
    for k=j+1:n
        p *= x[j] - x[k]
    end        
    return 1/p
end

"""
    w = bclag_interp_weights(x)

Compute weights for Barycentric Lagrange interpolation.
"""
function bclag_interp_weights(x)
    n = length(x)
    w = zeros(n)
    for j=1:n
        w[j] = bclag_interp_weight(x, j, n)
    end
    return w
end

function bclag_interp_eval(x::Vector, f::Vector, xx::Number, w::Vector)
    n = length(x)
    @assert length(f) == length(w) == n
    numer = 0.0
    denom = 0.0
    for j=1:n
        xdiff = xx-x[j]
        if xdiff==0
            return f[j]
        end
        tmp = w[j] / xdiff
        numer += f[j]*tmp
        denom += tmp
    end
    ff = numer/denom
    return ff
end

"""
    ff = bclag_interp_eval(x, f, xx [, w])

Barycentric Lagrange interpolation of `f` from points `x` to points `xx`

`w` is vector of weights, `w = bclag_interp_weights(x)` 
"""
function bclag_interp_eval(x::Vector, f::Vector, xx::Vector,
                           w=bclag_interp_weights(x))
    n = length(xx)
    ff = zeros(n)
    for j=1:n
        ff[j] = bclag_interp_eval(x, f, xx[j], w)
    end
    return ff
end

"""
    M = bclag_interp_matrix(x, xx [, w])

Compute the matrix `M` such that `ff = M*f` gives the barycentric Lagrange interpolation of `f` from points `x` to points `xx`.


`w` is vector of weights, `w = bclag_interp_weights(x)` 
"""
function bclag_interp_matrix(x, xx, w=bclag_interp_weights(x))
    n = length(x)
    N = length(xx)
    @assert length(w)==n
    B = zeros(N, n)
    denom = zeros(N)
    exact = zeros(Int64, N)
    for j=1:n
        for k=1:N
            xdiff = xx[k]-x[j]
            if xdiff != 0
                temp = w[j]/xdiff
                B[k,j] = temp
                denom[k] += temp
            else
                exact[k] = j
            end
        end
    end

    B ./= denom
    for jj=1:N
        if exact[jj] != 0
            @. B[jj,:] = 0.0
            B[jj + N*(exact[jj]-1)] = 1.0
        end
    end
    return B
end

end # module
