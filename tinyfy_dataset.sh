#! /usr/bin/env bash
# tinyfy_food_101.sh -- make a tiny version of the food-101 dataset

DATA_PATH=data/
FOOD_101=$DATA_PATH/food-101-split
FOOD_101_TINY=$DATA_PATH/food-101-tiny

CLASSES="apple_pie bibimbap cannoli edamame falafel french_toast ice_cream ramen sushi tiramisu"
TRAIN_SIZE=150
VALID_SIZE=50

function make_train_test_dirs {
    for cls in $CLASSES; do
        mkdir -p $FOOD_101_TINY/train/$cls $FOOD_101_TINY/valid/$cls
    done 
}

function tinyfy_data {
    INPUT_DIR=$1
    OUTPUT_DIR=$2
    OUTPUT_SIZE=$3

    for cls in $CLASSES; do
        echo "Copying first $OUTPUT_SIZE images from $INPUT_DIR/$cls to $OUTPUT_DIR/$cls ..."
        images=$(ls $INPUT_DIR/$cls | head -$OUTPUT_SIZE)
        for img in $images; do
            cp $INPUT_DIR/$cls/$img $OUTPUT_DIR/$cls/$img
        done
    done
}

make_train_test_dirs
tinyfy_data $FOOD_101/train $FOOD_101_TINY/train $TRAIN_SIZE
tinyfy_data $FOOD_101/valid $FOOD_101_TINY/valid $VALID_SIZE
