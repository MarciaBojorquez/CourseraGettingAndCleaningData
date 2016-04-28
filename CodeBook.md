# Introduction

The script `run_analysis.r`performs the steps required in the course project.

* First, all the similar data is merged using the `rbind()` function. By similar, we address those files having the same number of columns and referring to the same entities.
* Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from `features.txt`.
* We take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
* Dataset descriptive column names.
* Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called `averages_data.txt`.

# Variables

* `xtrain`, `ytrain`, `xtest`, `ytest`, `subjecttrain` and `subjecttest` contain the data from the downloaded files.
* `xdata`, `ydata` and `subjectdata` merge the previous datasets to further analysis.
* `features` contains the correct names for the `xdata` dataset, which are applied to the column names stored in `meanstd`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `all` merges `xdata`, `ydata` and `subjectdata` in a big dataset.
* Finally, `result` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
