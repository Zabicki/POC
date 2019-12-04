function data_filtered =bilateral_fit_local(data,local_window,sigma)
    s=size(data);
    Nx=s(2);
    h=fspecial('gaussian',local_window,25);

    data_filtered=zeros(1,Nx);

    for i=1:Nx
        patch=reshape(data(:,i),local_window);

        [Y, X]=size(patch);
        mid=patch(round(Y/2),round(X/2));

        value=patch-mid;
        value_dists=zeros(Y,X);
        for y=1:Y
            for x=1:X
                value_dists(y,x)=exp( -((value(y,x))^2) / (2*(sigma^2)) );
            end
        end

        m=h.*value_dists;
        normalized=sum(sum(m));
        m=m/normalized;

        data_filtered(1,i)=sum(sum(patch.*m));
    end
end