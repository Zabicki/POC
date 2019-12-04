function result = gammaeps(y, sigma)
    result = exp(-y .^ 2 / (2 * sigma^2));
end