using LinearAlgebra, Statistics
# Reminder to force Σ to be symmetric
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
function Base.show(io::IO, x::Normal)
    summary(io,x)
    print(io,"\nμ = ",x.μ)
    print(io, "\n\nΣ = ", x.Σ[1,:])
    for i in 2:length(x.μ)
        print(io,"\n    ", x.Σ[i,:])
    end
end

afim(v::Vector, x::Normal) = Normal(x.μ+v, x.Σ)
afim(m::Matrix, x::Normal) = Normal(m*x.μ, m*x.Σ*m')
afim(v::Vector, m::Matrix, x::Normal) = afim(m, afim(v,x))

padrão(x::Normal) = Normal(zero(x.μ), one(x.Σ))
padrão(::Type{Normal{T}}, p::Integer) where T = Normal( zero(Vector{T}(undef,p)), one(Matrix{T}(undef,p,p)) )
padrão(T::Type, p::Integer) = padrão(Normal{T},p)

function homocedastica(T::Type, p::Integer, ρ)
    aux = ones(T,p,p)
    return (1-ρ)*one(aux)+ ρ*aux
end
homocedastica(μ, ρ) = Normal(μ, homocedastica(eltype(μ),length(μ), ρ))


function samplenormal(data::Matrix{T}) where T
    μ = vec( mean(data, dims=1) )
    S = cov(data, dims=1)
    return Normal(μ, S)
end
