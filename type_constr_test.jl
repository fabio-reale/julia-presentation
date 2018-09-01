mutable struct Normal{T}
    μ::Vector{T}
    Σ::Matrix{T}
    Normal{T}(μ,Σ) where T =
        if length(μ) == size(Σ)[1] && length(μ) == size(Σ)[2]
            new(μ,Σ)
        else
            error("Dimension Mismatch!\n")
        end
end
Normal(μ::Vector{T}, Σ::Matrix{T}) where T = Normal{T}(μ,Σ);

import Base: *
*(x::Normal{T}, y::Normal{T}) where T = Normal(y.Σ * (x.μ - y.μ), y.Σ * x.Σ * y.Σ')

# Σ here isn't correct. data'*H*data is
#sample_normal(data::Matrix) = Normal(esp(data), data'*data)
esp(data::Matrix, n) = vec(sum(data,dims=1))./n
esp(data::Matrix) = esp(data, size(data)[1])

function h_matrix(T, n)
    J = ones(T,n,n)
    return one(J)-(J/n)
end
h_matrix(data::Matrix{T}) where T = h_matrix(T,size(data)[2])

function sample_normal(data::Matrix{T}) where T
    n, vars = size(data)
    μ = esp(data, n)
    H = h_matrix(T, n)
    Σ = (data'*H*data)/(n-1)
    return Normal(μ, Σ)
end
