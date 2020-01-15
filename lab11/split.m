function split(img,wsp1,wsp2,wsp3,wsp4)
    global segRes;
    global index;
    global mRes;
    sd_threshold = 0.05;
    size_limit = 4;
    squarevec = img(wsp1:wsp2,wsp3:wsp4);
    vec = squarevec(:);
    mean_vec = mean(vec);
    std_vec = std(vec);
    if(std_vec>=sd_threshold && wsp2-wsp1>=size_limit && wsp4-wsp3>=size_limit)      
        xMid = wsp3 + floor((wsp4-wsp3) / 2);
        yMid = wsp1 + floor((wsp2-wsp1) / 2);
        split(img,wsp1,yMid,wsp3,xMid);
        split(img,yMid+1,wsp2,wsp3,xMid);
        split(img,wsp1,yMid,xMid+1,wsp4);
        split(img,yMid+1,wsp2,xMid+1,wsp4);        
       
    else
        segRes(wsp1:wsp2,wsp3:wsp4) = index;
        mRes(wsp1:wsp2,wsp3:wsp4) = mean_vec;
        index = index+1;        
    end
       
end