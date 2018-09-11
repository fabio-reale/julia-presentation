mutable struct Normal{T}
    μ::Vector{T}
    Σ::Matrix{T}
    Normal{T}(μ,Σ) where T =
        if length(μ) == size(Σ)[1] == size(Σ)[2]
            new(μ,Σ)
        else
            DimensionMismatch("dim(μ) = $(length(μ)), dim(Σ) = $(size(Σ))")
        end
end
Normal(μ::Vector{T}, Σ::Matrix{T}) where T = Normal{T}(μ,Σ);

import Base: *, one
*(v::Vector, x::Normal) = Normal(x.μ+v, x.Σ)
function *(c::Matrix, x::Normal)
    sq = real.(√c)
    Normal(x.μ, sq*x.Σ*sq')
end
*(y::Normal, x::Normal) = y.Σ * (y.μ * x)
padronizar(x::Normal) = real.(√x.Σ\one(x.Σ)) * (-x.μ * x)
one(x::Normal) = Normal(zero(x.μ), one(x.Σ))
one(::Type{Normal{T}}, p::Integer) where T = Normal( zero(Vector{T}(undef,p)), one(Matrix{T}(undef,p,p)) )

function homocedastica(p::Int64, ρ)
    aux = ones(Float64,p,p)
    return (1-ρ)*one(aux)+ ρ*aux
end
homocedastica(μ, ρ) = homocedastica(length(μ), ρ)

esp(data::Matrix, n) = vec(sum(data,dims=1)./n)
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
    S = (data'*H*data)/(n-1)
    return Normal(μ, S)
end
