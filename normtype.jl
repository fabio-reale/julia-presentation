mutable struct Normal{T}
    μ::Vector{T}
    Σ::Matrix{T}
    Normal{T}(μ,Σ) where T =
        if length(μ) == size(Σ)[1] && length(μ) == size(Σ)[2]
            new(μ,Σ)
        else
            DimensionMismatch("dim(μ) = $(length(μ)), dim(Σ) = $(size(Σ))")
        end
end
Normal(μ::Vector{T}, Σ::Matrix{T}) where T = Normal{T}(μ,Σ);

function homocedastica(p::Int64, ρ)
    aux = ones(Float64,p,p)
    return (1-ρ)*one(aux)+ ρ*aux
end
homocedastica(μ, ρ) = homocedastica(length(μ), ρ)

↦(v::Vector, x::Normal) where T = Normal(x.μ+v, x.Σ)
↦(c::Matrix, x::Normal) where T = Normal(x.μ, c*x.Σ*c')
↦(y::Normal, x::Normal) where T = y.Σ ↦ y.μ ↦ x
padronizar(x::Normal) = real.(√x.Σ\one(x.Σ)) ↦ -x.μ ↦ x
import Base: one
one(x::Normal) = Normal(zero(x.μ), one(x.Σ))

#This one is crashing
#one(T::DataType, p::Int) = Normal( zero(Vector{T}(undef,p)), one(Matrix{T}(undef,p,p)) )

# Σ here isn't correct. data'*H*data is
#sample_normal(data::Matrix) = Normal(esp(data), data'*data)
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
