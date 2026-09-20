#!/bin/bash

# Mark used executables with executable bit.
chmod +x "./compiler_gnu_linux/bin/u.._build_system1" &&\
chmod +x "./compiler_gnu_linux/bin/u.._compiler1" &&\
chmod +x "./compiler_gnu_linux/bin/u.._cpp_header_converter" &&\
# Create a file containing git revision.
git rev-parse HEAD > git_revision.txt &&\
# Run the Ü build system.
./compiler_gnu_linux/bin/u.._build_system1 build --target-cpu skylake
