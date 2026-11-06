# SolarVision AI — Solar Panel Fault Classification

A MATLAB-based computer vision project that classifies solar photovoltaic (PV) panel thermal images into supported fault/condition classes using transfer learning with MobileNetV2.

> **Final test accuracy: 90.31%** on the fixed test split for the seven supported classes. Class 5 was excluded from training because only two images were available. Class 6 remains challenging due to limited data.

## Project highlights

- Transfer learning using **MobileNetV2**
- Thermal-image classification across seven supported labels: **1, 2, 3, 4, 6, 7, 8**
- Fixed train/validation/test split for repeatable evaluation
- Experiments with class weighting and oversampling to address class imbalance
- MATLAB demo script for selecting an image and viewing the predicted class and confidence
- Test-set confusion matrix and per-class precision, recall, and F1-score

## Final test results

| Class | Precision (%) | Recall (%) | F1-score (%) | Test images |
|---|---:|---:|---:|---:|
| 1 | 82.50 | 86.84 | 84.62 | 38 |
| 2 | 76.92 | 66.67 | 71.43 | 15 |
| 3 | 83.33 | 100.00 | 90.91 | 5 |
| 4 | 67.90 | 83.33 | 74.83 | 66 |
| 6 | 25.00 | 33.33 | 28.57 | 3 |
| 7 | 100.00 | 75.00 | 85.71 | 4 |
| 8 | 96.59 | 92.96 | 94.74 | 426 |

- **Overall test accuracy:** 90.31% (503 correct out of 557)
- **Macro F1-score:** approximately 71.54%

Accuracy is influenced by the large number of Class 8 test samples. Macro F1 gives a more balanced view across classes. Class 6 has only three test samples, so its metrics are highly uncertain.

## Dataset and split

The project uses the `PV_Fault_Classification_Dataset` directory organized by class folders. The fixed split was saved in `models/SolarVision_FixedSplit.mat`.

Supported classes: `1, 2, 3, 4, 6, 7, 8`

Class `5` was not included in model training because only two images were available. Do not interpret the demo prediction on a Class 5 image as a valid class-5 evaluation.

## Requirements

- MATLAB
- Deep Learning Toolbox
- MobileNetV2 support package / pretrained network availability in MATLAB
- Image Processing Toolbox (for image handling and resizing)

Exact toolbox requirements may vary with MATLAB version.

## Run the demo

1. Clone or download this repository.
2. Open MATLAB and set the Current Folder to the project root.
3. Ensure the trained model file is present at `models/SolarVision_FinalModel.mat`.
4. Run:

```matlab
SolarVision_Demo
```

5. Select a solar-panel thermal image. The script displays the predicted supported class and confidence.

## Repository layout

```text
SolarVision_AI/
├── SolarVision_Demo.m
├── README.md
├── data/
│   └── PV_Fault_Classification_Dataset/
│       └── PV_Fault_Classification_Dataset/
│           ├── 1/
│           ├── 2/
│           ├── 3/
│           ├── 4/
│           ├── 5/
│           ├── 6/
│           ├── 7/
│           └── 8/
└── models/
    ├── SolarVision_FinalModel.mat
    ├── SolarVision_FinalMetrics.csv
    ├── SolarVision_FinalConfusionMatrix.png
    └── SolarVision_FixedSplit.mat
```

Large dataset and model files may exceed GitHub limits. Consider keeping them outside Git or using Git LFS / a dataset hosting service. Check dataset license and redistribution permissions before publishing images.

## Limitations and future work

- The dataset is strongly imbalanced; Class 8 dominates the sample count.
- Class 6 has very few images and low test recall (33.33% on only three samples).
- Class 5 was excluded due to insufficient examples.
- Future work: gather more examples for rare classes, validate on independent field images, test calibration, and explore stronger imbalance-aware methods.

## Author

**Roshan Jena**  
Electrical & Electronics Engineering | MATLAB | Computer Vision | Deep Learning
