%% example script for exploring skeltonisation
%
% ds 2020-7
%
% this code is based on the example in Test_Skeleton3D

%% this is where the data get loaded in

fname = 'vesselProbabilities.nii.gz';
data = niftiread( fname ) ;
hdr = niftiinfo( fname );

%% turn data into a binary image
% - simple thresholding
%   anything that's bigger than 10
% - something more complicated 
testvol = data > 50; % was before
 
%% use the code to create the skeleton

% the business is happening here...
tic
skel = Skeleton3D(testvol);
toc

% could use volumeViewer() to look at this

%%
figure();

col=[.7 .7 .8];

hiso = patch(isosurface(testvol,0),'FaceColor',col,'EdgeColor','none');
hiso2 = patch(isocaps(testvol,0),'FaceColor',col,'EdgeColor','none');

axis equal;axis off;
axis('vis3d')
lighting phong;
isonormals(testvol,hiso);
alpha(0.5);
set(gca,'DataAspectRatio',[1 1 1])
camlight;
hold on;
w=size(skel,1);
l=size(skel,2);
h=size(skel,3);
[x,y,z]=ind2sub([w,l,h],find(skel(:)));
plot3(y,x,z,'square','Markersize',4,'MarkerFaceColor','r','Color','r');            
set(gcf,'Color','white');
view(140,80)
