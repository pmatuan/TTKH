format long
out = daycung(0,1,0.02)
function out = f(x)
    out = x - cos(x);
end
function out = derivative(x)
    out = 1 + sin(x);
end

function out = chiadoi(a, b, e)
    c = (a+b)/2;
    if f(c) == 0
        out = c;
    elseif f(a) == 0
        out = a;
    elseif f(b) == 0
        out = b;
    else
        if abs(a-b) < e
            out = c;
        elseif f(a)*f(c) < 0
            out = chiadoi(a,c,e);
        elseif f(c)*f(b) < 0
            out = chiadoi(c,b,e);
        end
    end
end

function out = daycung(x0, x1, eps)
    tmp = (x0 * f(x1) - x1 * f(x0))/(f(x1) - f(x0));
    if f(tmp) == 0 
        out = tmp;
    elseif f(x0) == 0
        out = x0;
    elseif f(x1) == 0
        out = x1;
    else
        if abs(x0-x1) < eps
            out = tmp;
        elseif f(x0)*f(tmp) < 0
            out = daycung(x0, tmp, eps);
        elseif f(tmp)*f(x1) < 0
            out = daycung(tmp, x1, eps);
        end
    end 
end

function out = newton(w, eps)
    while abs(f(w(end))) > eps
        w_new = w(end) - f(w(end))/derivative(w(end));
        w = [w w_new];
    end
    out = w;
end

function out = cattuyen(w, eps)
    while abs(f(w(end))) > eps
        sk = (f(w(end)) - f(w(end-1)))/(w(end) - w(end-1));
        w_new = w(end) - f(w(end))/sk;
        w = [w w_new];
    end
    out = w;
end