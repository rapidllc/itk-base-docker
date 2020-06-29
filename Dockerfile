FROM slicer/buildenv-qt5-centos7:latest
MAINTAINER Sam Horvath <sam.horvath@kitware.com>

ENV ITK_GIT_TAG v5.0.1
RUN cd $BUILD_PATH && git clone --depth 1 -b ${ITK_GIT_TAG} git://github.com/InsightSoftwareConsortium/ITK.git /ITK && \
    mkdir /ITK-build && \
    cd /ITK-build && \
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DBUILD_EXAMPLES:BOOL=OFF \
        -DBUILD_TESTING:BOOL=OFF \
        -DBUILD_SHARED_LIBS:BOOL=OFF \
        -DCMAKE_POSITION_INDEPENDENT_CODE:BOOL=ON \
        -DITK_LEGACY_REMOVE:BOOL=ON \
        -DITK_BUILD_DEFAULT_MODULES:BOOL=ON \
        -DITK_USE_SYSTEM_LIBRARIES:BOOL=OFF \
        -DModule_ITKIONRRD:BOOL=ON \
        -DModule_ITKIOMeta:BOOL=ON \
        -DModule_ITKIOGDCM:BOOL=ON \
        -DModule_ITKIOPNG:BOOL=ON \
        -DModule_ITKGroup_IO:BOOL=ON \
        -DModule_ITKThresholding:BOOL=ON \
        -DModule_ITKTransform:BOOL=ON \
        -DITK_USE_GPU:BOOL=OFF \
        /ITK && \
    make