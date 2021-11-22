#!/bin/bash
clang_path="${HOME}/project/clang-12/bin/clang"
gcc_path="${HOME}/project/clang-12/bin/aarch64-linux-gnu-"
gcc_32_path="${HOME}/project/clang-12/bin/arm-linux-gnueabi-"
args="-j32 O=out \
	ARCH=arm64 \
	SUBARCH=arm64 \
	DTC_EXT=dtc "

args+="CC=$clang_path \
	CLANG_TRIPLE=aarch64-linux-gnu- \
	CROSS_COMPILE=$gcc_path "

args+="CROSS_COMPILE_ARM32=$gcc_32_path "
export KBUILD_BUILD_USER="Cepheus"
export KBUILD_BUILD_HOST="YCKernel"
make $args cepheus_defconfig&&make $args LD=${HOME}/project/clang-12/bin/ld.lld AR=${HOME}/project/clang-12/bin/llvm-ar NM=${HOME}/project/clang-12/bin/llvm-nm OBJCOPY=${HOME}/project/clang-12/bin/llvm-objcopy OBJDUMP=${HOME}/project/clang-12/bin/llvm-objdump STRIP=${HOME}/project/clang-12/bin/llvm-strip

