function fourier(img)
    fale = img;
    fobraz = fft2(fale);
    fshift = fftshift(fobraz);
 
    A = abs(fobraz);
    A = log10(A+1);
 
    F = angle(fobraz.*(A>0.0001));
 
    figure();
    subplot(2,2,1); title('original');
    imshow(fale, [])
 
    subplot(2,2,2); title('amplitude');
    imshow(A, [])
 
    subplot(2,2,3); title('phase')
    imshow(F,[])
 
    subplot(2,2,4); title('fourier')
    imshow(fshift, [])
end