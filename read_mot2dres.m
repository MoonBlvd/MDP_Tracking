% --------------------------------------------------------
% MDP Tracking
% Copyright (c) 2015 CVGL Stanford
% Licensed under The MIT License [see LICENSE for details]
% Written by Yu Xiang
% --------------------------------------------------------
%
% read MOT file
function dres = read_mot2dres(filename,sample_interval)

if nargin < 2
    sample_interval=1;
end

fid = fopen(filename, 'r');
% <frame>, <id>, <bb_left>, <bb_top>, <bb_width>, <bb_height>, <conf>, <x>, <y>, <z>
C = textscan(fid, '%d %d %f %f %f %f %f %f %f %f', 'Delimiter', ',');
fclose(fid);

% build the dres structure for detections
dres.fr = C{1};
dres.id = C{2};
dres.x = C{3};
dres.y = C{4};
dres.w = C{5};
dres.h = C{6};
dres.r = C{7};

seq_num = size(dres.fr,1);
downsampled_idx = [];
prev_i = 0;
for i = 1:seq_num
    if i ~= 1 && i < prev_i+sample_interval
        continue
    end
    idx = find(dres.fr==i);
    downsampled_idx = [downsampled_idx idx']; 
    prev_i = i;
end

dres.fr = dres.fr(downsampled_idx);
dres.id = dres.id(downsampled_idx);
dres.x = dres.x(downsampled_idx);
dres.y = dres.y(downsampled_idx);
dres.w = dres.w(downsampled_idx);
dres.h = dres.h(downsampled_idx);
dres.r = dres.r(downsampled_idx);