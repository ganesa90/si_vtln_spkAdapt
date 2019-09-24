function plotTV(varargin)
if nargin == 1
    TV_act = varargin{1};
end
if nargin == 2
    TV_act = varargin{1};
    TV_pred = varargin{2};
end
TV_lab = ['GLO ';'VEL ';' LA ';' LP ';'TBCL';'TBCD';'TTCL';'TTCD'];
for i = 1:8
subplot(4,2,i)
plot(TV_act(i,:));
xlabel(TV_lab(i,:));
if nargin == 2
    hold on;
    plot(TV_pred(i,:),'r');
    hold off;
end
end
