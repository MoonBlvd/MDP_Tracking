% --------------------------------------------------------
% MDP Tracking
% Copyright (c) 2015 CVGL Stanford
% Licensed under The MIT License [see LICENSE for details]
% Written by Yu Xiang
% --------------------------------------------------------
%
% build the dres structure for images
% function dres_image = read_dres_image(opt, seq_set, seq_name, seq_num)
function dres_image = read_dres_image(opt, seq_set, img_folder, seq_num, sample_interval)
if nargin < 5
    sample_interval=1;
end

% dres_image.x = zeros(seq_num, 1);
% dres_image.y = zeros(seq_num, 1);
% dres_image.w = zeros(seq_num, 1);
% dres_image.h = zeros(seq_num, 1);
% dres_image.I = cell(seq_num, 1);
% dres_image.Igray = cell(seq_num, 1);
dres_image.x = [];
dres_image.y = [];
dres_image.w = [];
dres_image.h = [];
dres_image.I = {};
dres_image.Igray = {};
prev_i = 1;
for i = 1:seq_num
    if i ~= 1 && i < prev_i+sample_interval
        continue
    end
    
%     filename = fullfile(opt.mot, opt.mot2d, seq_set, seq_name, 'img1', sprintf('%06d.jpg', i));
%     filename = fullfile(opt.mot,'GRMN0195','img1', sprintf('%06d.jpeg', i))
%     filename = fullfile(opt.mot,seq_name,seq_set,'image_02', seq_ID,sprintf('%06d.png', i-1))
    filename = fullfile(img_folder,sprintf('%06d.png', i-1));
%     disp(filename);
%     I = imread(filename);
    disp(filename);
    I = imread(filename);
%     dres_image.x(i) = 1;
%     dres_image.y(i) = 1;
%     dres_image.w(i) = size(I, 2);
%     dres_image.h(i) = size(I, 1);
%     dres_image.I{i} = I;
%     dres_image.Igray{i} = rgb2gray(I);
    dres_image.x = [dres_image.x; 1];
    dres_image.y = [dres_image.y; 1];
    dres_image.w = [dres_image.w; size(I, 2)];
    dres_image.h = [dres_image.h; size(I, 1)];
    dres_image.I{end+1} = I;
    dres_image.Igray{end+1} = rgb2gray(I);
    prev_i  = i;
end
dres_image.I = dres_image.I';
dres_image.Igray = dres_image.Igray';

