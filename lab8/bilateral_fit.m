function  filtred = bilateral_fit(data, local_window,sigma,method)
    w_n = sum(gammaeps(data, 2), 'all');
    if(method == 0)
        filtred = colfilt(data, local_window, 'sliding', @convulsion_fit_local,  local_window, sigma);  
    else
        filtred = colfilt(data, local_window, 'sliding', @bilateral_fit_local,  local_window, sigma);
    filtred = filtred / w_n;
    end
end