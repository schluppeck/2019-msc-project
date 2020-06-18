# step by step - raw data to cleaned up 
# volume reconstruction
#
# ds 2020-06


## NOTE - just some ideas here for now, not a fully debugged
#  and working script. you may have to adapt things to work with
#  your data paths and filenames

# environment variables
source ~/python/vmtk-build/Install/vmtk_env.sh

# change directory
pushd ~/matlab/2019-msc-project/angio

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

## marching cubes for
cutoff=1400 
surf_mc=mc_surface.vtp
surf_mcvtk=mc_surface


vmtkmarchingcubes -ifile ${voi_file} \
    -l ${cutoff} \
    -ofile ${surf_mcvtk}_${cutoff}.vtk \
    --pipe vmtksurfaceviewer


# vmtksurfacesmoothing -ofile ${surf_mcvtk}_${cutoff}_smoothed.vtk \ 
# vmtklevelsetsegmentation -ifile image_volume_voi.vti -ofile level_sets.vti

# get back to where we started
popd

# run_vmtk.sh