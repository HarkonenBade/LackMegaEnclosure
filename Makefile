BUILD_LIST = build/outer_foot.stl build/outer_lower_top.stl build/outer_upper_top.stl build/centre_foot.stl build/centre_lower_top.stl build/centre_upper_top.stl

all: build $(BUILD_LIST)

build:
	mkdir build

build/outer_foot.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_foot.stl -D 'RENDER="outer_foot"' build.scad

build/outer_lower_top.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_lower_top.stl -D 'RENDER="outer_lower_top"' build.scad

build/outer_upper_top.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_upper_top.stl -D 'RENDER="outer_upper_top"' build.scad

build/centre_foot.stl: build build.scad centre_feet.scad shared.scad
	openscad -o build/centre_foot.stl -D 'RENDER="centre_foot"' build.scad

build/centre_lower_top.stl: build build.scad centre_feet.scad shared.scad
	openscad -o build/centre_lower_top.stl -D 'RENDER="centre_lower_top"' build.scad

build/centre_upper_top.stl: build build.scad centre_feet.scad shared.scad
	openscad -o build/centre_upper_top.stl -D 'RENDER="centre_upper_top"' build.scad
