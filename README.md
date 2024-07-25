# MWE toolbox

A minimal toolbox to demonstrate use of Github Actions and recent MATLAB tools to build and release MATLAB toolboxes in an open, automated, and reproducible manner.

This repository aims to demonstrate:

- [ ] Testing code on multiple OSes using Github Actions.
- [ ] Exporting livescripts as HTML to be used in online documentation.
- [ ] Publishing online documentation using Github Pages and hugo.
- [x] Building mex files using cmake.
- [ ] Compiling toolboxes into the mltbx format.
- [ ] Automating release of toolboxes built by Github Actions to the file exchange.

## Working with the toolbox

This toolbox uses `cmake` to build mex files, ensure `cmake` is installed on your system.

Clone the git repository:

```bash
git clone "https://github.com/DavidRConnell/githubaction-toolbox-mwe"
cd mwe-toolbox
```

To build mex files:

``` bash
cmake -B build .
cmake --build build
```

The compiled mex files will be in the `build` directory. When the toolbox is packaged, `cmake` will handle moving the mex files to the appropriate place so they can be used in the toolbox. When developing the toolbox, MATLAB will not be able to find them in the `build` directory. To get around this, link the resulting files to the `toolbox/+mwe/private` directory. By linking rather than copying the files, changes when modifying and rebuilding the mex source files will be reflected on the binaries MATLAB sees.

``` bash
mkdir -p toolbox/+mwe/private
cd toolbox/+mwe/private
ln -s ../../../build/mex/*."$mexext" .
cd ../../.. # return to package root
```

Where the value of `$mexext` depends on the OS and can be found by calling `mexext` in MATLAB or looking at the files in `build/mex`.

Any time a new mex file is added to `mex`, cmake will build it but it will not be linked to the toolbox so the above linking will need to done again.

Now toolbox functions can be run in MATLAB once the toolbox has been added to MATLAB's path. Inside MATLAB run:

``` matlab
addpath toolbox
```

Each time MATLAB is started, the toolbox will need to be readded to the path.

## Running tests

Tests can be run by directly calling the test runner in MATLAB, by using the `buildtool`, or through `cmake`.

`buildtool` uses the configuration from the `buildfile.m` to determine different tasks that can be run. We have set it up such that testing is the default behavior so either `buildtool` or `buildtool test` will run the `test` task.

Having `cmake` run the tests can be useful when there are several tests files to run as it can run the test files in parallel. At the command line run:

```bash
ctest --test-dir build --output-on-failure --parallel $nprocs
```

Where `$nprocs` is the number of parallel processes to run. If any test has failed, the `--rerun-failed` flag can be added to the end of the command which will cause `ctest` to only run the tests that have failed.
