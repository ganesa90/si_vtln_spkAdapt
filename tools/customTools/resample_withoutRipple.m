function [sig_samp] = resample_withoutRipple(sig,SRC_RATE, TARGET_RATE, ord)
L = size(sig,2);
L_samp = ceil(L*TARGET_RATE/SRC_RATE);
[P Q] = rat(TARGET_RATE/SRC_RATE);
for iter1 = 1:size(sig,1)
    pad_sig = [sig(iter1,end:-1:1), sig(iter1,:), sig(iter1,end:-1:1)];
    pad_sig_samp = resample(pad_sig, P, Q, ord);
    sig_samp(iter1,:) = pad_sig_samp(L_samp+1:end-L_samp);
end
end