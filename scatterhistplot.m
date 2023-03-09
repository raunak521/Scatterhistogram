numdata = xlsread('Grammage_Thickness_d33.xlsx','Sheet1','B2:E39');

[~, strdata] = xlsread('Grammage_Thickness_d33.xlsx', 'Sheet1', 'A2:A39');
strdata = cellstr(strdata);

save('finaldata.mat', 'numdata', 'strdata');

load('finaldata.mat')

loading=numdata(:,1);
d33=numdata(:,2);

a = scatterhist(loading, d33, 'Group', strdata, 'Kernel', 'on', ...
    'Location', 'SouthEast', 'Direction', 'out', ...
    'LineStyle', {'-', '-.', ':', '--'}, 'LineWidth', [2, 2, 2, 2], ...
    'Marker', 'o', 'MarkerSize', [4, 4, 4, 4]);

% Get the handles to the histogram objects
h = findobj(a(2:end), 'Type', 'histogram');

% Get the group colors
groupColors = get(a(2:end), 'Color');

% Set the fill color and transparency of the histogram bars
for i = 1:length(h)
    h(i).FaceColor = groupColors{i};
    h(i).FaceAlpha = 0.1; % set the transparency to 0.1
end