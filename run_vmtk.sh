# step by step - raw data to cleaned up 
# volume reconstruction
#
# ds 2020-06


## NOTE - just some ideas here for now, not a fully debugged
#  and working script. you may have to adapt things to work with
#  your data paths and filenames

# environment variables - assuming you have installed
source ~/python/vmtk-build/Install/vmtk_env.sh

# change directory
pushd ./angio

## - BET / remove skull
#iraw=WIP_ANGIO_20200305103645_401
#ifile=401_brain
iraw=angio
ifile=${iraw}_brain

# run the command to skull strip
bet ${iraw}.nii ${ifile}.nii

# - make a volume of interest file
voi_file=${ifile}_voi.vti

# interactive - check for non-interactive
vmtkimagereader -ifile ${ifile}.nii \
    --pipe vmtkimagevoiselector \
    -ofile ${voi_file}

## marching cubes for segmenting...

cutoff=1400 # intensity threshold
surf_mcvtk=mc_surface # filename

# run the MC command
vmtkmarchingcubes -ifile ${voi_file} \
    -l ${cutoff} \
    -ofile ${surf_mcvtk}_${cutoff}.vtk \
    --pipe vmtksurfaceviewer

# get back to where we started
popd

# run_vmtk.sh