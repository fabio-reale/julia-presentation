"""
    myexp(x, n::Integer)

Retorna `x*x*...*x`, n vezes. Retorna o mesmo que `x*myexp(x, n-1)`, se n > 0.
"""
function myexp(x, n::Integer)
    if n < 0
        return error("myexp(x, n) where n ∈ ℕ")
    elseif n == 0
        return one(x)
    elseif n == 1
        return x
    elseif n%2 == 1
        m = n÷2
        y = myexp(x, m)
        return x*y*y
    else
        m = n÷2
        y = myexp(x, m)
        return y*y
    end
end
myexp(x, n::Float64) = myexp(x, convert(Int,n))
