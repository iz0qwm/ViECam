function acquireImageReal(block)
image = imread('http://192.168.1.7/jpg/image.jpg');
block.OutputPort(1).Data = image(:,:,1);
block.OutputPort(2).Data = image(:,:,2);
block.OutputPort(3).Data = image(:,:,3);
