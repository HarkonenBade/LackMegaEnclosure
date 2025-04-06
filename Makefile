BUILD_LIST = build/outer_foot.stl \
			 build/outer_foot_l.stl \
			 build/outer_foot_r.stl \
			 build/outer_lower_top.stl \
 			 build/outer_lower_top_l.stl \
 			 build/outer_lower_top_r.stl \
			 build/outer_upper_top.stl \
			 build/centre_foot.stl \
			 build/centre_foot_n.stl \
			 build/centre_lower_top.stl \
			 build/centre_lower_top_n.stl \
			 build/centre_upper_top.stl \
			 build/handle.stl \
			 build/foot.stl \
			 build/fix_plate.stl \
			 build/hinge_cover_plate.stl \
			 build/hinge_backing_plate.stl \
			 build/handle_backing_plate.stl \
			 build/door_panel.svg \
			 build/door.svg

all: build $(BUILD_LIST)

build:
	mkdir build

build/outer_foot.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_foot.stl -D 'RENDER="outer_foot"' build.scad

build/outer_foot_l.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_foot_l.stl -D 'RENDER="outer_foot_l"' build.scad

build/outer_foot_r.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_foot_r.stl -D 'RENDER="outer_foot_r"' build.scad

build/outer_lower_top.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_lower_top.stl -D 'RENDER="outer_lower_top"' build.scad

build/outer_lower_top_l.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_lower_top_l.stl -D 'RENDER="outer_lower_top_l"' build.scad

build/outer_lower_top_r.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_lower_top_r.stl -D 'RENDER="outer_lower_top_r"' build.scad

build/outer_upper_top.stl: build build.scad outer_feet.scad shared.scad
	openscad -o build/outer_upper_top.stl -D 'RENDER="outer_upper_top"' build.scad

build/centre_foot.stl: build build.scad centre_feet.scad shared.scad
	openscad -o build/centre_foot.stl -D 'RENDER="centre_foot"' build.scad

build/centre_foot_n.stl: build build.scad centre_feet.scad shared.scad
	openscad -o build/centre_foot_n.stl -D 'RENDER="centre_foot_n"' build.scad

build/centre_lower_top.stl: build build.scad centre_feet.scad shared.scad
	openscad -o build/centre_lower_top.stl -D 'RENDER="centre_lower_top"' build.scad

build/centre_lower_top_n.stl: build build.scad centre_feet.scad shared.scad
	openscad -o build/centre_lower_top_n.stl -D 'RENDER="centre_lower_top_n"' build.scad

build/centre_upper_top.stl: build build.scad centre_feet.scad shared.scad
	openscad -o build/centre_upper_top.stl -D 'RENDER="centre_upper_top"' build.scad

build/handle.stl: build build.scad handle.scad shared.scad
	openscad -o build/handle.stl -D 'RENDER="handle"' build.scad

build/fix_plate.stl: build build.scad handle.scad shared.scad
	openscad -o build/fix_plate.stl -D 'RENDER="fix_plate"' build.scad

build/foot.stl: build build.scad foot.scad shared.scad
	openscad -o build/foot.stl -D 'RENDER="foot"' build.scad

build/hinge_cover_plate.stl: build build.scad cover_and_backing_plates.scad shared.scad
	openscad -o build/hinge_cover_plate.stl -D 'RENDER="hinge_cover_plate"' build.scad

build/hinge_backing_plate.stl: build build.scad cover_and_backing_plates.scad shared.scad
	openscad -o build/hinge_backing_plate.stl -D 'RENDER="hinge_backing_plate"' build.scad

build/handle_backing_plate.stl: build build.scad cover_and_backing_plates.scad shared.scad
	openscad -o build/handle_backing_plate.stl -D 'RENDER="handle_backing_plate"' build.scad

build/door.svg: build door.scad
	openscad -o build/door.svg door.scad

build/door_panel.svg: build door_panel.scad
	openscad -o build/door_panel.svg door_panel.scad

