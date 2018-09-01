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
*(x::Normal{T}, y::Normal{T}) where T = Normal(y.Σ*(x.μ-y.μ), y.Σ*(x.Σ)*y.Σ')
esp(data::Matrix) = vec(sum(data,dims=1))./length(data)

# Σ here isn't correct. data'*H*data is
sample_normal(data::Matrix) = Normal(esp(data), data'*data)
