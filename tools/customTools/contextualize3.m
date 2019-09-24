function mat_contxt = contextualize3(mat_inp,context,step)
% create contextual info for input APs
% ==============================================================
feat_dim = size(mat_inp,1);
if context == 0
    mat_contxt = mat_inp;
else
    mat_g = mat_inp;
    clear mat_inp;
    mat_rshft = mat_g;
    mat_lshft = mat_g;
    for iter = 1:context
        buff_r = [];
        buff_l = [];
        for iter2 = 1:step
            buff_r = [buff_r mat_rshft(:,1)];
            buff_l = [buff_l mat_lshft(:,end)];
        end
        mat_rshft = [buff_r mat_rshft(:,1:end-step)];
        mat_lshft = [mat_lshft(:,step+1:end) buff_l];
        mat_g = [mat_rshft; mat_g; mat_lshft];
    end
    mat_contxt = zeros(size(mat_g));
    cdim = 2*context+1;
    for i = 1:feat_dim
        from = 1+cdim*(i-1);
        to = from+cdim-1;
        mat_contxt(from:to,:) = mat_g(i:feat_dim:end,:);
    end
end
%
