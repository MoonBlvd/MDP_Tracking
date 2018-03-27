# Learning to Track: Online Multi-Object Tracking by Decision Making

Created by Yu Xiang at CVGL, Stanford University.

### Introduction

**MDP_Tracking** is a online multi-object tracking framework based on Markov Decision Processes (MDPs).

http://cvgl.stanford.edu/projects/MDP_tracking/

### License

MDP_Tracking is released under the MIT License (refer to the LICENSE file for details).

### Citation

If you find MDP_Tracking useful in your research, please consider citing:

    @inproceedings{xiang2015learning,
        Author = {Xiang, Yu and Alahi, Alexandre and Savarese, Silvio},
        Title = {Learning to Track: Online Multi-Object Tracking by Decision Making},
        Booktitle = {International Conference on Computer Vision (ICCV)},
        Year = {2015}
    }

### Usage on the 2D MOT benchmark

1. Download the 2D MOT benchmark (data and development kit) from https://motchallenge.net/data/2D_MOT_2015/

2. Set the path of the MOT dataset in global.m

3. Run compile.m. OpenCV is needed.

4. For validataion, use MOT_cross_validation.m

5. For testing, use MOT_test.m

We provide our own detection using SubCNN [1] on the 2D MOT 2015 dataset [here](https://drive.google.com/open?id=0B4WdmTHU8V7VeVlISVhMNjQ3N1k).

Important: make sure libsvm-3.20 in the 3rd_party directory is used. Other versions of libsvm may not be compatible with the code.

### Usage on the KITTI tracking dataset

1. Download the KITTI tracking benchmark (data, development kit and detections) from http://www.cvlibs.net/datasets/kitti/eval_tracking.php

2. Check out the kitti branch
    ```Shell
    git checkout kitti
    ```

3. Set the path of the KITTI tracking dataset in global.m

4. Run compile.m. OpenCV is needed.

5. For validataion, use KITTI_cross_validation.m

6. For testing, use KITTI_test.m

We provide our own detection using SubCNN [1] on the KITTI tracking dataset [here](https://drive.google.com/open?id=0B4WdmTHU8V7Vd29GeFBqdl9yQXM).

### MY CHANGES!!!
To run the code correctly in WATSON, I had to make the following changes:

In ```imResample.cpp```, change the data type of ```ns```,``` ms[3]```, ```nCh``` to ```size_t```

In ```compile.m```, add ```-v GCC='/usr/bin/gcc-4.9'``` because MATLAB R2017a doesn't support gcc-5

Add following lines to ```~/.zshrc``` file

	export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH
	export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4:libopencv_imgproc.so.2.4:libopencv_video.so.2.4

Then I make a link for ```libstdc++.so.6``` since the one installed with matlab doesn't have ```GLIBCXX_3.4.21```

	sudo ln -s /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /usr/local/MATLAB/R2017b/sys/os/glnxa64/libstdc++.so.6
	
Finally, compile the code.

### References

[1] Y. Xiang, W. Choi, Y. Lin and S. Savarese. Subcategory-aware Convolutional Neural Networks for Object Proposals and Detection. In IEEE Winter Conference on Applications of Computer Vision (WACV), 2017.

### Contact

If you find any bug or issue of the software, please contact yuxiang at umich dot edu
