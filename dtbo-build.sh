#!/bin/bash

mkdtboimg create out/dtbo.img \
	--page_size=4096 \
	`find -L out/arch/arm64/boot/dts/ -name \*.dtbo`
