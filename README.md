# 2019-msc-project

code and ideas for 2019 msc cog neurosci project

There are some video recordings associated with this in this [youtube playlist]( https://www.youtube.com/playlist?list=PLCZfmSQp7dzK95qF-pDgDh0hdlxMWJ8Ca)

project makes use of a combination of tools, including:

- FSL (https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/)
- Matlab (https://www.mathworks.com)
- VMTK - vascular modelling toolkit (http://vmtk.org)

## rendering with `fsleyes`

- load in t2w image
- superimpose the MRA images and restrict to high intensity values

```bash
fsleyes -h
fsleyes --fullhelp
# or online documentation!
```

Look through the [online documentation of FSL](https://users.fmrib.ox.ac.uk/~paulmc/fsleyes/userdoc/latest/command_line.html).

## basic maximum intensity projection (`MIP`)

- widely used in radiology setting
- explore ideas around MIP 
  - how to do this for **main** axes
  - how to do this for intermediate angles?
- how could you visualise? 
- how can we use template data?

### starting point

```matlab
% read data
fname = 'angio_brain.nii';
d = nifitread(fname);
% do stuff
```

see also `minimalMIP.m`

## using *vascular modelling toolkit*

- http://www.vmtk.org/
- **note** installation instructions for  `windows` and `macos`, as well as some binary packages you can just download are there - but I had to compile on my computer (which can be a bit of  pain.)
- for some command that I have started working with, check out `run_vmtk.sh` (but need to have `vtmk` installed)

**why might this be useful??** - can surface reconstruct, render into images / videos and also do geometric analysis on the resulting segemented datasets.

This will allow us to compare numbers to the published atlas and also work on a analysis flow for comparing intact / damaged vessels.

## Some local technical stuff

I have set up thigns on my computer (mac) as follows
1. `git clone`ed the ``2019-msc-project`` folder

2. made a "symbolic link" to the data location... e.g. 

```bash
# ln -s REAL_LOC SHORTCUT_LOC
ln -s ~/OneDrive\ -\ The\ University\ of\ Nottingham//Users/lpzds1/The\ University\ of\ Nottingham/2019-msc-cogneuro-research-project\ -\ General/angio angio
```
