using LinearAlgebra
# Reminder to force Σ to be Symmetric. Then upgrade to positive definite
mutable struct Normal{T}
    μ::Vector{T}
    Σ::Matrix{T}
    Normal{T}(μ,Σ) where T =
        if length(μ) == size(Σ)[1] == size(Σ)[2]
            if issymmetric(Σ)
                new(μ,Σ)
            else
                error("Σ não é simétrica")
            end
        else
            DimensionMismatch("dim(μ) = $(length(μ)), dim(Σ) = $(size(Σ))")
        end
end
Normal(μ::Vector{T}, Σ::Matrix{T}) where T = Normal{T}(μ,Σ);

afim(v::Vector, x::Normal) = Normal(x.μ+v, x.Σ)
afim(x::Normal, v::Vector) = afim(v::Vector, x::Normal)
afim(m::Matrix, x::Normal) = Normal(m*x.μ, m*x.Σ*m')
afim(x::Normal, m::Matrix) = afim(m::Matrix, x::Normal)
afim(v::Vector, m::Matrix, x::Normal) = afim(m, afim(v,x))
padrão(x::Normal) = Normal(zero(x.μ), one(x.Σ))
padrão(::Type{Normal{T}}, p::Integer) where T = Normal( zero(Vector{T}(undef,p)), one(Matrix{T}(undef,p,p)) )

function homocedastica(T::Type, p::Integer, ρ)
    aux = ones(T,p,p)
    return (1-ρ)*one(aux)+ ρ*aux
end
homocedastica(μ, ρ) = Normal(μ, homocedastica(eltype(μ),length(μ), ρ))

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
