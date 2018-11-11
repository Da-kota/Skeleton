pushd %cd%

if not exist build mkdir build
cd build
if not exist release mkdir release
cd release
cmake -GNinja ..\..
ninja

cd ..

if not exist unittest mkdir unittest
cd unittest
cmake -GNinja -DUNITTEST=ON ..\..
ninja
ninja test

popd
