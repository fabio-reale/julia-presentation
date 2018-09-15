"""
    myexp(x, n::Integer)

Retorna `x*x*...*x`, n vezes. Retorna o mesmo que `x*myexp(x, n-1)`, se n > 0.
"""
function myexp(x, n::Integer)
    if n < 0
        return error("myexp(x, n) where n ∈ ℕ")
    end
    if n == 0
        return one(x)
    end
    if n == 1
        return x
    end
    if n%2 == 1
        m = n÷2
        y = myexp(x, m)
        return x*y*y
    else
        m = n÷2
        y = myexp(x, m)
        return y*y
    end
end

#=
rotation(θ) = [cos(θ) -sin(θ);
               sin(θ) cos(θ)]
=#
