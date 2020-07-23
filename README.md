# Image Classification on Food-101

Welcome! This repo is home to our submission for `Fellowship.ai`'s Fall 2020 Food-101 Challenge. Using progressive re-sizing with 8 augmentations at training time and 4 augmentations at test time, we're able to achieve `90.07%` accuracy on the validation set. Along the way we've tried a variety of approaches, including label smoothing and mixup. This README summarizes our results and points you to the correct notebook for each training run.

The best place to start is our [prototype notebook](notebooks/food-101-tiny/MS-food-101-tiny-fastai2.ipynb), which contains detailed explanations of all of our experiments conducted on a small subset of the `food-101` dataset that we call `food-101-tiny`. The `food-101-tiny` dataset contains 150 training images and 50 validation images from ten classes of foods: `apple pie, bibimbap, cannoli, edamame, falafel, french toast, ice cream, ramen, sushi, and tiramisu`. You can find the `food-101-tiny` dataset on [kaggle](https://www.kaggle.com/msarmi9/food101tiny).

To quickly jump to the notebook detailing our best training run, [click here](notebooks/kaggle-resize-02/MS-food-101-fastai2-kaggle-resize-02.ipynb).

# Summary of Results

The table below summarizes the results of our training runs on the `Food-101` dataset with links to each notebook. A pre-trained `resnet-50` with Adam as the optimizer and cross entropy as the loss are used throughout.

| Experiment | Epochs | Train Loss | Valid Loss | Valid Accuracy | TTA Accuracy |
|------------|--------|------------|------------|----------------|--------------|
| [Progressive Resizing](notebooks/kaggle-resize-01/MS-food-101-fastai2-kaggle-resize-01.ipynb) | 16 | 0.3877 | 0.4283 | 0.8820 | 0.8964 |
| [Progressive Resizing](notebooks/colab-resize-01/MS-food-101-fastai2-colab-resize-01.ipynb) | 16 | 0.4144 | 0.3990 | 0.8874 | 0.8952 |
| [Progressive Resizing](notebooks/kaggle-resize-02/MS-food-101-fastai2-kaggle-resize-02.ipynb) | 18  | 0.3341 | 0.4094 | 0.8878 | __0.9007__ |
| [Progressive Resizing](notebooks/colab-resize-02/MS-food-101-fastai2-colab-resize-02.ipynb) | 20 | 0.2809 | 0.4090 | 0.8870 | 0.8952 |
| [Resize + Label Smoothing](notebooks/colab-smooth-01/MS-food-101-fastai2-colab-smooth-01.ipynb) | 24 | 1.0312 | 1.1634 | 0.8941 | 0.8984 |
| [Resize + Label Smoothing](notebooks/colab-smooth-02/MS-food-101-fastai2-colab-smoooth-02.ipynb) | 24 | 0.9968 | 1.1621 | 0.8929 | 0.8993 |
| [Resize + MixUp](notebooks/colab-mixup-01/MS-food-101-fastai2-colab-mixup-01.ipynb) | 26 | 1.4152 | 0.3996 | 0.8940 | 0.8995 |
| Label Smoothing | 11 | 1.0873 | 1.1955 | 0.8816 | |

# Summary of Findings

This section summarizes the key findings from our experiments:

* Progressive resizing provides a significant performance boost with no added training cost or model complexity.
* Label smoothing helps models generalize by tempering the confidence of their predictions. To our surpise, label smoothing by itself was able to match our progressive resizing baseline with significantly fewer epochs.
* MixUp can boost performance but may require many more epochs to converge.
