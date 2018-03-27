% --------------------------------------------------------
% MDP Tracking
% Copyright (c) 2015 CVGL Stanford
% Licensed under The MIT License [see LICENSE for details]
% Written by Yu Xiang
% --------------------------------------------------------
%
% compile cpp files
% change the include and lib path if necessary
function compile

include = ' -I/usr/local/include/opencv/ -I/usr/local/include/ -I/usr/include/opencv/';
lib = ' -lopencv_core -lopencv_highgui -lopencv_imgproc -lopencv_video';
eval(['mex -v GCC=/usr/bin/gcc-4.9 lk.cpp -O' include lib]);

mex -v GCC='/usr/bin/gcc-4.9' distance.cpp 
mex -v GCC='/usr/bin/gcc-4.9' imResampleMex.cpp 
mex -v GCC='/usr/bin/gcc-4.9' warp.cpp

disp('Compilation finished.');