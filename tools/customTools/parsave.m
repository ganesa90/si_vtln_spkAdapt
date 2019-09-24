% Custom function to save files when running a parallel process.
function parsave(varargin)
if nargin < 2
    display('ERROR: At least 2 arguments required');
    display('EXAMPLE: parsave(filename,variable1)');
end
if ischar(varargin{1})==0
    display('ERROR: First argument must be file name');
end
for i = 1:nargin-1
    expr = strcat(inputname(i+1),'=',mat2str(varargin{i+1}),';');
    eval(expr);
end
opfname = strcat(varargin{1});
save(opfname,inputname(2));
for i = 3:nargin
    save(opfname,inputname(i),'-append');
end
end


