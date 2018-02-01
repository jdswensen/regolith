# Regolith

> A layer of unconsolidated rocky material covering bedrock.

## Setup
Clone this repo and run `./bootstrap` to install required packages to the system. After installing the build system dependencies, run the following:

```
mkdir -p ${HOME}/projects/yocto-regolith
cd ${HOME}/projects/yocto-regolith
repo init https://github.com/jdswensen/regolith.git
repo sync
```

This will initialize the build system and download the source recipes.


## Building
```
cd ${HOME}/projects/yocto-regolith
source setenv
bitbake regolith-image
```

By default, Regolith builds for a qemuarm target. The target can be changed by modifying the `MACHINE` variable in the `conf/local.conf` file.

### Build Times
Running the build takes a *long* time. Yocto is downloading and building the Linux kernel plus every library, application, or script specified by Regolith. Build times will vary by system configuration. Here are some benchmarks for estimated build times.
