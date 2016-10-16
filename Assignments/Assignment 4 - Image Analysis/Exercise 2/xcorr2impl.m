% xcorr2impl.m
% Implementation of xcorr2 for Image Analysis - APiE
% Written by: Alex Aalbertsberg (s1008129)

function crosscorr = xcorr2impl(a,b)

% Matrix dimensions
sizea = size(a);
sizeb = size(b);
% Cross-correlation dimension
sizec = sizea+sizeb-1;

% padding matrices with xcorr dimension
paddinga = zeros(sizec);
paddingb = zeros(sizec);

%fill top half of padding matrix with values of a
paddinga(1:sizea(1),1:sizea(2)) = a;
%fill top half of padding matrix with values of b inverted
paddingb(1:sizeb(1),1:sizeb(2)) = b(end:-1:1,end:-1:1);

%apply fourier fast transforms to padding matrices
ffta = fft2(paddinga);
fftb = fft2(paddingb);

% inverse fft pointwise product of previous 2 ffts
crosscorr = ifft2(ffta.*fftb);