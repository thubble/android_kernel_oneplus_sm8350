#!/bin/bash

PATH=/home/thubble/src/aospa-op9/prebuilts/clang/host/linux-x86/clang-r522817/bin:$PATH \
	make \
		ARCH=arm64 \
		CC=clang \
		CLANG_TRIPLE=aarch64-linux-gnu- \
		REAL_CC=clang \
		AR=llvm-ar \
		LLVM_NM=llvm-nm \
		OBJCOPY=llvm-objcopy \
		LD=ld.lld \
		NM=llvm-nm \
		LLVM=1 \
		LLVM_IAS=1 \
		-j16 \
		O=out \
	vendor/lahaina-qgki_defconfig

scripts/config --file out/.config \
	-d CONFIG_THINLTO	# Build with full LTO instead of thin (Android default)

PATH=/home/thubble/src/aospa-op9/prebuilts/clang/host/linux-x86/clang-r522817/bin:$PATH \
        make \
                ARCH=arm64 \
                CC=clang \
                CLANG_TRIPLE=aarch64-linux-gnu- \
                REAL_CC=clang \
                AR=llvm-ar \
                LLVM_NM=llvm-nm \
                OBJCOPY=llvm-objcopy \
                LD=ld.lld \
                NM=llvm-nm \
                LLVM=1 \
                LLVM_IAS=1 \
                -j16 \
                O=out
