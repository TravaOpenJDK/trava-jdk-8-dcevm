Trava dcevm-8 
==============
[![Build Status](https://api.travis-ci.org/TravaOpenJDK/trava-jdk-8-dcevm.svg)](https://travis-ci.org/TravaOpenJDK/trava-jdk-8-dcevm) [![License](http://img.shields.io/:license-apache-blue.svg)](http://www.apache.org/licenses/LICENSE-2.0.html)

TravaOpenJDK8 is OpenJDK8 for developers. Since it is based on **dcevm** and integrated **HotswapAgent**, it allows **advanced hotswap** like method-field addition and many more. Trava is a build farm created and maintained by [HotswapProjects](https://github.com/HotswapProjects). Build is transparent as much as possible. [dcevm-8 source code](https://github.com/HotswapProjects/openjdk-jdk8u-dcevm) is built on [Travis](https://travis-ci.org/TravaOpenJDK/trava-jdk-8-dcevm) and the produced JDK images are bundled with [HotswapAgent](https://github.com/HotswapProjects/HotswapAgent). Building is exclusively based on [modified](https://github.com/TravaOpenJDK/openjdk-build/tree/travaopenjdk) AdoptOpenJDK [scripts](https://github.com/AdoptOpenJDK/openjdk-build).

## Install
Download [windows/linux/macos binaries](https://github.com/TravaOpenJDK/trava-jdk-8-dcevm/releases), unpack and set JAVA_HOME to it's location (or add it as JDK to your IDE).

## Configure
Use travaJDK as alternative jdk, do not use option `-XXaltjvm=dcevm`, since dcevm main JVM in this distribution. For HotswapAgent configuration look at [hotswapagent.org](http://hotswapagent.org/)
If you are using dcevm as alternative JVM via -XXaltjvm=dcevm, just extract `libjvm.so` from travaJDK package and move it to standard JVM directory. Graphical installation is not supported by travaJDK now.

## Build your binaries!
It is not necessary to use supplied binaries, you can build own binaries. It is simple and it can be done in several
clicks:

* Fork this repository
* Create user account on [Travis](https://travis-ci.org/)
* Change the **deploy** part in `.travis.yml` to upload the result to your repository
* Create tagged commit and wait for Travis to build your binaries!


## HOWTO deploy a new release

## New branch
In case a new branch is created in source repository, then modify `--branch` argument to new branch.

### Release with existing TAG
* If this repository has some updates since last tagged, then move tag:
```
    git push origin :refs/tags/${SOURCE_JDK_TAG}
    git tag -fa ${SOURCE_JDK_TAG}
    git push origin master --tags
```
* Cleanup binaries from Releases/
* Trigger tagged job on Travis (if not triggered automatically)

### Release with new TAG
Let's jdk source repository has new tag of value **TAGVAL**
* Set variable `SOURCE_JDK_TAG=` in `.tarvis.yml` to **TAGVAL**
* Commit and tag commit with **TAGVAL**
* Appropriate a new tagged job should be created on Travis automatically
