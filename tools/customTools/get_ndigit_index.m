function str = get_ndigit_index(x,n)
base_num = 10^(n-1);
base_str = num2str(base_num);
digit_diff = length(num2str(base_num)) - length(num2str(x));
str = [];
if digit_diff == 0
    str=num2str(x);
else
    for i = 1:digit_diff
        str = [str '0'];
    end
    str = [str num2str(x)];
end
