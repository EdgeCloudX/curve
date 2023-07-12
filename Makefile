# Copyright (C) 2021 Jingli Chen (Wine93), NetEase Inc.

.PHONY: list build install image clean

prefix?= "$(PWD)/projects"
release?= 0
only?= "*"
tag?= "cloudx2021/curvebs:unknown"
tgt_pkg?= ""

list:
	@bash util/build.sh --list

build:
	@bash util/build.sh --only=$(only) --release=$(release)

install:
	@bash util/install.sh --prefix=$(prefix) --only=$(only)

image:
	@bash util/image.sh $(tag) $(tgt_pkg)

clean:
	@bazel clean

#action 使用的脚本
pre_image:
	@bash util/pre_image.sh $(tag) $(tgt_pkg)

#action 使用的脚本
image_build:
	@bash util/docker_build.sh $(tag) $(tgt_pkg)
