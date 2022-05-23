CC = gcc
CFLAGS = -g -Wall -O 
export TARGET = demo

export OBJ = function.o main.o
export BUILD_PATH = $(PWD)
export SUBDIR = main_dir sub_dir
export OBJDIR = $(BUILD_PATH)

export code_version = $(shell (git rev-parse --short HEAD))
export code_branch = $(shell (git branch))
export code_date= $(shell (git log -1 --format=%cd ))

$(info $(code_version))
$(info $(code_branch))
$(info $(code_date))

all:sub_target $(TARGET)

$(TARGET):$(OBJ) 
	$(CC) $^ -o $(OBJDIR)/$@ 
	@echo "-------build target success-------"

sub_target:
	@echo "-------start build sub dir-------"
	make -C main_dir
	make -C sub_dir
	@echo "-------build sub dir end-------"

clean:
	rm -rf $(OBJDIR)/*.o $(TARGET) main_dir/*.o sub_dir/*.o
