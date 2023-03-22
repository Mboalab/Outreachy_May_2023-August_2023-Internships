

**RESEARCH TASK BY INONGO MAGDALENE**

Sound event recognition and classification are exciting and vital applications in the era of the

Internet of Things (IoT). These Sound events carry information that is useful for our daily lives. A

study by Karunaratna et al [1] was done to find which ML algorithms are most suitable for sound

event recognition and classification. It was found that mainly convolutional neural networks

(CNN), Support vector machine (SVM), Multilayer perception (MLP) algorithms are used for

Sound event recognition and classification. After carrying an experiment to identify sound events

like crying, siren etc on the ESC-50 dataset, the results showed that the CNN has the highest

accuracy of 82%.


**Audio Classification**

We will start with sound files, convert them into spectrograms, input them into a CNN plus Linear

Classifier model, and produce predictions about the class to which the sound belongs.

<div id="top" align="center">

<img src="https://miro.medium.com/v2/resize:fit:828/format:webp/1*7YbBTqwF2dMAuQwOrD_hXQ.png" alt="Workflow of the training process"/>
  </div>

*Figure 1. workflow of the sound classification*[2]


**Prepare training data**

The training data for this sound classification problem will be the features (X) which are the audio

file paths and the corresponding target labels (Y) which are the class names. If the dataset made

available for training has a metadata file, then this file will contain information about each audio

files.

On the other hand, if the dataset just contains audio files arranged in a folder structure from which

class labels can be derived, then we will do the following:

• Scan the directory and prepare a list of all the audio file paths.

• Extract the class label from each file name, or from the name of the parent sub-folder

• Map each class name from text to a numeric class ID


**Audio Pre-processing**

Here, we have to load the audio data from the file and process it so that it is in a format that the

model expects. This audio preprocessing can be done dynamically at runtime when we will be

reading and loading the audio files. Considering the that like images, audio data can be fairly large

and memory-intensive, we don’t want to read the entire dataset into memory all at once ahead of

time. So we will want to keep the audio file name in our training data. Then at runtime, as we train

the model one batch at a time, we will load the audio data for that batch and process it by applying

a series of transforms to the audio.

The audio can be converted to a Mel Spectrogram[2], as from literature they are crucial for audio

deep learning as they capture the essential features of the audio and are often the most suitable

way to input audio data into machine learning models.


**Model**

Since the data consist of spectrogram images, we can build a CNN classification architecture to

process them, the size of the architecture will depend on the amount of data available. We can also

decide to use pre-trained models like VGG16 or VGG19 on our dataset, like I said it really depends

on how large our dataset is and how fast we want our model to have significant results.

After deciding to build a model from scratch or use a pretrained model, we can create a training

loop to train the model, as part of the training loop, we would evaluate the model on the validation

data. We would then do inference on unseen data, one way is by keeping aside a test audio dataset

from the original data.


**References**

[1] Karunaratna , Maduranga. 2021. Sound Event Recognition and Classification Using Machine Learning
 Techniques, international research conference.

[2] ketan Doshi. 2021. Audio Deep Learning Made Simple: Sound Classification, step by step
, towards data science.
