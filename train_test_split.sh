#! /usr/bin/env bash
# train_test_split.sh -- split Food-101 dataset into Imagenet-style train/ and test/ folders.

# Food-101 subdirs
DATA_PATH=data
IMAGE_PATH=$DATA_PATH/images
META_PATH=$DATA_PATH/meta

# Input files specifying train-test splits 
CLASSES=$META_PATH/classes.txt
TRAIN_IMAGES=$META_PATH/train.txt
TEST_IMAGES=$META_PATH/test.txt

# Output dirs
TRAIN_DIR=$DATA_PATH/train
TEST_DIR=$DATA_PATH/test

# Create subdirs for each train class and a flat test dir
function make_train_test_dirs {
    echo "Creating $TRAIN_DIR and $TEST_DIR dirs ..."
    while read cls; do
        mkdir -p $TRAIN_DIR/$cls
    done < $CLASSES
    mkdir $TEST_DIR
}

# Copy train images to class subdirs 
function copy_train_images {
    echo "Copying images from $TRAIN_IMAGES to $TRAIN_DIR ..."
    while read img; do
        cp $IMAGE_PATH/$img.jpg $TRAIN_DIR/$img.jpg
    done < $TRAIN_IMAGES
}

# Copy test images to directly under test/
function copy_test_images {
    echo "Copying images from $TEST_IMAGES to $TEST_DIR ..."
    while read img; do
        FILE=$(basename $img) 
        cp $IMAGE_PATH/$img.jpg $TEST_DIR/$FILE.jpg
    done < $TEST_IMAGES
}

make_train_test_dirs
copy_train_images
copy_test_images

