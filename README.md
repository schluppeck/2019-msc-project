# 2019-msc-project
code for 2019 msc cog neurosci project

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

## Some local technical stuff

I have set up thigns on my computer (mac) as follows
1. `git clone`ed the ``2019-msc-project`` folder

2. made a "symbolic link" to the data location... e.g. 

```bash
# ln -s REAL_LOC SHORTCUT_LOC
ln -s ~/OneDrive\ -\ The\ University\ of\ Nottingham//Users/lpzds1/The\ University\ of\ Nottingham/2019-msc-cogneuro-research-project\ -\ General/angio angio
```
