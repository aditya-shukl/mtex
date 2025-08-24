
cs = crystalSymmetry('m-3m');  % Example: cubic crystal symmetry
ss = symmetry('-1');
%%

grains = load("C:\Users\aditya7c\Work Folders/drex/projects/alpha_Fe_deformed/pole_figure_plotting/rex_iron_grains.mat");
grains=grains.array;
grains=grains(34,:,:)
%nGrains = size(grains.array,1);
oriMatrices = permute(grains, [2 3 1]);
%%
% Step 3: Define the crystallographic directions to be plotted
% Example: {100}, {110}, and {111} poles
%h = [Miller(1,0,0,cs), Miller(1,1,0,cs), Miller(1,1,1,cs)];
h = Miller({0,-1,1},cs);
%%
r = ori * h
%%
plot(r)

%%
ori = orientation.byMatrix(oriMatrices,cs);

%%
plotPDF(ori, h);
mtexColorbar;

%% if you want to plot ipfs
r = vector3d.X;  % rolling direction
t = vector3d.Y;  % transverse direction
n = vector3d.Z;  % normal direction
plotIPDF((ori), n, 'antipodal');

%%

index=3
display(r(:,index))
plot(r(:,index))

%%
%r_dfxm = vector3d(1,1,0);
r_dfxm = vector3d(-0.01424997,-0.06247557,0.99794476);
plot(r_dfxm)
hold on;

% Label the Cartesian axes
annotate([xvector, yvector, zvector], ...
         {'X', 'Y', 'Z'}, ...
         'FontSize', 14, 'FontWeight', 'bold');

hold off;