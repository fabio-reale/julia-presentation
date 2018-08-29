function exp_alt(x, n::Int)
    if n == 0
        return one(x)
    end
    if n == 1
        return x
    end
    #=if n == 2
        return x*x
    end=#
    if n%2 == 1
        m = div(n,2)
        y = exp_alt(x, m)
        return x*y*y
    else
        m = div(n,2)
        y = exp_alt(x, m)
        return y*y
    end
end

rotation(θ) = [cos(θ) -sin(θ);
               sin(θ) cos(θ)]
