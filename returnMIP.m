function s = returnMIP(array, orientation)
% returnMIP - return a MIP from a 3d image
% 
%  returns
%    s / the slice with MIP

 
% if orientation is not given, keep the last (3rd?) index fixed
if nargin < 2, orientation = 3; end
 
% pick data, keeping dimension=?orientation? fixed 
switch orientation
    case 1
        s = max(array,[],1); 
    case 2
        s =  max(array,[],2); 
    case 3
        s =  max(array,[],3); 
end
 
% now also make sure that s doesn't have 
% some weird extraneous dimensions - GOTCHA
s = squeeze(s);
 
end
