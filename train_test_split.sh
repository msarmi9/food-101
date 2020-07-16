#! /usr/bin/env bash
# train_test_split.sh -- split Food-101 dataset into Imagenet-style train/ and valid/ folders.

DATA_PATH=data
IMAGE_PATH=$DATA_PATH/images
META_PATH=$DATA_PATH/meta

CLASSES=$META_PATH/classes.txt
TRAIN_IMAGES=$META_PATH/train.txt
TEST_IMAGES=$META_PATH/test.txt

TRAIN_DIR=$DATA_PATH/train
TEST_DIR=$DATA_PATH/valid

function make_train_test_dirs {
    echo "Creating $TRAIN_DIR and $TEST_DIR dirs ..."
    while read cls; do
        mkdir -p $TRAIN_DIR/$cls $TEST_DIR/$cls
    done < $CLASSES
}

function copy_images {
    IMAGE_NAMES=$1
    OUTPUT_DIR=$2
    echo "Copying images from $IMAGE_NAMES to $OUTPUT_DIR ..."

    while read img; do
        cp $IMAGE_PATH/$img.jpg $OUTPUT_DIR/$img.jpg
    done < $IMAGE_NAMES
}

make_train_test_dirs
copy_images $TRAIN_IMAGES $TRAIN_DIR
copy_images $TEST_IMAGES $TEST_DIR
