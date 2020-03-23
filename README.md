# e3-supercycleEngine

# Introduction

ESS Site-specific EPICS module : [supercycleEngine](https://github.com/icshwi/supercycleEngine.git).

## "e3" environment

-   [e3 Training](https://github.com/icshwi/e3training)
-   [e3 Installation](https://github.com/icshwi/e3training/blob/master/workbook/chapter1.md)
-   [e3 Module Installation](https://github.com/icshwi/e3training/blob/master/workbook/chapter3.md)

# Requirements

-   "e3"
-   "e3 Timing Group" which includes e3-devlib2, e3-mrfioc2 and e3-supercycleEngine(comming soon)

# Building & Installation

-   Edit "configure/CONFIG_MODULE" and "configure/RELEASE"
-   run TOP: "make init && make build && make install"

# Run IOC

-   iocsh.bash cmds/\$(filename).cmd
