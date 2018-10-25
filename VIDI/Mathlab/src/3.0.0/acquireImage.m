function acquireImage(block)
setup(block)


function setup(block)
 %% Register number of input and output ports
  block.NumInputPorts  = 0;
  block.NumOutputPorts = 3;

  %% Setup functional port properties to dynamically
  %% inherited.
%  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 
%   block.InputPort(1).DirectFeedthrough = true;
%   block.InputPort(1).Dimensions = 1;
%   block.InputPort(1).SamplingMode = 'sample';
  block.OutputPort(1).DatatypeID = 3;
  block.OutputPort(1).Dimensions = [480 640];
  block.OutputPort(1).SamplingMode = 'sample';
  block.OutputPort(2).DatatypeID = 3;
  block.OutputPort(2).Dimensions = [480 640];
  block.OutputPort(2).SamplingMode = 'sample';
  block.OutputPort(3).DatatypeID = 3;
  block.OutputPort(3).Dimensions = [480 640];
  block.OutputPort(3).SamplingMode = 'sample';
  
  %% Set block sample time to inherited
  block.SampleTimes = [-1 0];
  
  %% Run accelerator on TLC
  block.SetAccelRunOnTLC(true);
  
  %% Register methods
  block.RegBlockMethod('Outputs',                 @acquireImageReal);