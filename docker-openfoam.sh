#!/bin/sh

readonly DOCKER_VERSION="$(sudo docker --version)"
echo "$DOCKER_VERSION"

#pull image from docker-hub
sudo docker pull openfoam/openfoam7-paraview56

#format image to get ID and assign to OPENFOAM_IMAGE_ID 
readonly OPENFOAM_IMAGE_ID="$(sudo docker images --format "{{.ID}}" openfoam/openfoam7-paraview56)"

# add env vars to list 
#redirect output to /dev/null
tee env.list 2>&1 > /dev/null << EOF 
FOAM_TUTORIALS=/opt/openfoam7/tutorials
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
LD_LIBRARY_PATH=/opt/ThirdParty-7/platforms/linux64Gcc/gperftools-svn/lib:/opt/paraviewopenfoam56/lib/paraview-5.6:/opt/openfoam7/platforms/linux64GccDPInt32Opt/lib/openmpi-system:/opt/ThirdParty-7/platforms/linux64GccDPInt32/lib/openmpi-system:/usr/lib/x86_64-linux-gnu/openmpi/lib:/home/openfoam/platforms/linux64GccDPInt32Opt/lib:/opt/site/7/platforms/linux64GccDPInt32Opt/lib:/opt/openfoam7/platforms/linux64GccDPInt32Opt/lib:/opt/ThirdParty-7/platforms/linux64GccDPInt32/lib:/opt/openfoam7/platforms/linux64GccDPInt32Opt/lib/dummy
MPI_BUFFER_SIZE=20000000
WM_PROJECT_INST_DIR=/opt
XDG_CONFIG_HOME=/home/openfoam/.config
FOAM_RUN=/home/openfoam/run
QT_GRAPHICSSYSTEM=native
ParaView_MAJOR=5.6
HOSTNAME=c175ddeaa1cd
WM_THIRD_PARTY_DIR=/opt/ThirdParty-7
WM_LDFLAGS=-m64
FOAM_APP=/opt/openfoam7/applications
WM_CXXFLAGS=-m64 -fPIC -std=c++0x
FOAM_UTILITIES=/opt/openfoam7/applications/utilities
FOAM_APPBIN=/opt/openfoam7/platforms/linux64GccDPInt32Opt/bin
ParaView_DIR=/opt/paraviewopenfoam56
WM_PRECISION_OPTION=DP
FOAM_SOLVERS=/opt/openfoam7/applications/solvers
FOAM_EXT_LIBBIN=/opt/ThirdParty-7/platforms/linux64GccDPInt32/lib
WM_CC=gcc
FOAM_USER_APPBIN=/home/openfoam/platforms/linux64GccDPInt32Opt/bin
FOAM_SIGFPE=
PWD=/opt/openfoam7
HOME=/home/openfoam
WM_PROJECT_USER_DIR=/home/openfoam
WM_OPTIONS=linux64GccDPInt32Opt
WM_LINK_LANGUAGE=c++
WM_OSTYPE=POSIX
WM_PROJECT=OpenFOAM
ParaView_INCLUDE_DIR=/opt/paraviewopenfoam56/include/paraview-5.6
FOAM_LIBBIN=/opt/openfoam7/platforms/linux64GccDPInt32Opt/lib
MPI_ARCH_PATH=/usr/lib/x86_64-linux-gnu/openmpi
WM_CFLAGS=-m64 -fPIC
ParaView_GL=mesa
WM_ARCH=linux64
FOAM_SRC=/opt/openfoam7/src
uid=98765
FOAM_ETC=/opt/openfoam7/etc
FOAM_SETTINGS=
FOAM_SITE_APPBIN=/opt/site/7/platforms/linux64GccDPInt32Opt/bin
TERM=xterm
user=openfoam
FOAM_SITE_LIBBIN=/opt/site/7/platforms/linux64GccDPInt32Opt/lib
WM_COMPILER_LIB_ARCH=64
WM_COMPILER=Gcc
ParaView_VERSION=5.6.0
WM_DIR=/opt/openfoam7/wmake
WM_LABEL_SIZE=32
WM_ARCH_OPTION=64
WM_PROJECT_VERSION=7
WM_LABEL_OPTION=Int32
WM_MPLIB=SYSTEMOPENMPI
FOAM_INST_DIR=/opt
WM_COMPILE_OPTION=Opt
SHLVL=1
WM_COMPILER_TYPE=system
WM_CXX=g++
FOAM_USER_LIBBIN=/home/openfoam/platforms/linux64GccDPInt32Opt/lib
PV_PLUGIN_PATH=/opt/openfoam7/platforms/linux64GccDPInt32Opt/lib/paraview-5.6
FOAM_MPI=openmpi-system
FOAM_JOB_DIR=/opt/jobControl
WM_PROJECT_DIR=/opt/openfoam7
PATH=/opt/ThirdParty-7/platforms/linux64Gcc/gperftools-svn/bin:/opt/paraviewopenfoam56/bin:/home/openfoam/platforms/linux64GccDPInt32Opt/bin:/opt/site/7/platforms/linux64GccDPInt32Opt/bin:/opt/openfoam7/platforms/linux64GccDPInt32Opt/bin:/opt/openfoam7/bin:/opt/openfoam7/wmake:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
OMPI_MCA_btl_vader_single_copy_mechanism=none
_=/usr/bin/env
OLDPWD=/home/openfoam
EOF

#run detached image with env var file and mounted volume
echo "Image ID: $OPENFOAM_IMAGE_ID"
readonly OPENFOAM_CONTAINER_NAME="my_container"
sudo docker container run --env-file ./env.list -it -u 0 --rm -d --name="$OPENFOAM_CONTAINER_NAME" "$OPENFOAM_IMAGE_ID" bash


#add environment variables and move necessary files
sudo docker exec -i "$OPENFOAM_CONTAINER_NAME" echo "Adding required environment variables..."
sleep 1s
sudo docker exec -it "$OPENFOAM_CONTAINER_NAME" bash -c "cd /opt/openfoam7/ && touch env.list && env >> ./env.list"
sudo docker exec -it "$OPENFOAM_CONTAINER_NAME" bash -c "mkdir /home/openfoam/system/"
sudo docker exec -it "$OPENFOAM_CONTAINER_NAME" bash -c "cp /opt/openfoam7/etc/controlDict /home/openfoam/system/"


#echo exec to ensure internal exec commands are working
sudo docker exec -i "$OPENFOAM_CONTAINER_NAME" echo "Connected to container successfully! Running simulation..."
sleep 2s
#define env vars, run sim
sudo docker exec -it my_container bash -c "/opt/openfoam7/tutorials/incompressible/icoFoam/elbow/Allclean && /opt/openfoam7/tutorials/incompressible/icoFoam/elbow/Allrun"
echo "\nSimulation complete!\n"
sleep 2s

#copy VTK file to host machine - NOT NECESSARY
#sudo docker cp my_container:/opt/openfoam7/tutorials/incompressible/simpleFoam/rotorDisk/VTK .

#export files to host
echo "Exporting files to /openfoam_results"
sleep 2s
cd /
mkdir -p openfoam_results && cd openfoam_results
#echo message
sleep 3s
if sudo docker cp $OPENFOAM_CONTAINER_NAME:/opt/openfoam7/tutorials/incompressible/icoFoam/elbow .; then
    echo "\nSuccess!\n\nYou can find the results in /openfoam_resuts.\n"
else
    echo "\nCannot export data! Exiting container..."
    sudo docker container stop my_container
    exit 1
fi

sleep 2s
echo "Exiting docker container...\n"

#show Steam Locomotive
sudo apt-get install sl
sl

#stop container
sudo docker container stop my_container