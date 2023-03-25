
# Digital Stethoscope AI App

#### Task Details(Advanced Task - Additional)
Additional Task: also write the trainthesound.md file that have researched material related 'how the sound file can be trained by ML using simplest algorithm of ML' (Research based)

### Author: 
Sumaya Ahmed Salihs


#### Audio Data
An audio data is an analog sound in a digital form which preserves the main nature of the original. Physics defines it as a wave of vibrations traveling through a medium like air/water and finally becoming audible. It has three main features which are time period, amplitude and frequency. These features are going to be the main focus during the analysis of an audio data.

#### Time Period: 
It represents how long an audio data takes to complete one cycle of vibrations. It simply how long it takes for the audio to end. 

#### Amplitude: 
This represents the intensity of the sound. And it is realized as the loudness of the audio data and measured in decibels.

#### Frequency: 
It represents the number of sound vibrations per second. It is categorized as either low or high pitch.

#### Audio file format
It is an unstructured data which means it cannot be accessed from columns and rows on an excel sheet or Iterative data type, e.g. List, Map etc. One can store audio data in a variety of file formats like mp3, mp4, wav etc.


#### Audio Data Transformation
It is very important to note that audio data analysis involves working with images rather than listening. This fact forms the fundamentals of processing audio data(i.e. obtaining of sound data and getting ML predictions).

#### Waveform 
A waveform is simple visual representation of an audio signal that shows how an amplitude changes over time. With this form of audio representation/visualization, one is unable to tell what is happening on the audio data\'92s frequency.


#### Spectrum
Unlike the waveform representation, the Spectrum allows one to analyze the audio\'92s frequency but just like waveform, it also misses another vital characteristics of an audio data, which is time period.


#### Spectrogram
It covers the limitations presents in both a waveform and a spectrum by allowing for all three(time period, frequency and amplitude) characteristics of an audio data to be analyzed or visualized. Typically it achieves this by representing the time on the x-axis, frequency on y-axis and the amplitude using color. The loudness of  the sound is directly proportional to the brightness of the color with no sound represented with color black. 


### Audio Analysis
There are four significant stages or phases to analyzing an audio data and there are:
1. Obtain: This is where we collect as much audio data files in standard formats to make it easy to work with. The audio files should be specific to the projects, in the case of the digital stethoscope, we will have audio data files containing hearts or lungs beats/sounds.
2.	Prepare Data/Analyze Data: This is where the audio data is converted into a format that can be used in a ML Algorithm. 
3.	Extract: This is where audio data features are extracted from the various audio representations, e.g. waveform where amplitude and time can be extracted.
4.	Select of ML Algorithm for Training: this is where an appropriate ML Algorithm is selected to be used for Training of the audio data characteristics, i.e. time period, amplitude and frequency. It is also where Insights are realized or uncovered.

We will go through all the 4 steps in details in order to explain how we are going to process a sound file, which is the main goal of the research.

### Obtain
By the end of this phase, we should have a database/storage containing all the sound files we plan to use for our training. Among areas where sound files specific to our project can be obtained is a Medical Open Source Database which contains sounds from the organs we are interested in which is the heart or lungs or a mixture of both.


### Prepare Data/Analyze Data
After obtaining our data, it is now time to prepare for extraction and training. Without this stage, one will just be stacked to data in formats that are totally unusable in Step 3(Data Extraction) and 4(Data Training). In this step, we have two main goals, the first is to able to Classify our data. In most cases data sets come with metadata, contains relevant details of file such as filename, file use case(lung recording of a chronic hypertensive patient), file path etc. There are other times when datasets will come as void/corrupted/null, no metadata, half empty etc. In this cases you can expect less accurate or misleading outcomes after training. We will concentrate on a fairly reliable dataset and how to go about it. So we will create an agenda for the preprocessing. The agenda is we are going to group our dataset into two. Let\'92s say our dataset contains  a mixture of sound data of heartbeats of persons living with hypertension and persons without hypertension. In this case our agenda for grouping our data set will be:

    1.	Folder 1: data of heartbeats/sounds from hypertensives
    2.	Folder 2: data of heartbeats/sounds from non-hypertensive.

Also, it very important to account for a mechanism to remove noise from sounds. Often times medically collected datasets are collected in noisy environments with a number of patients and medical staff lurking around and going about their duties.
Our focus will be on the sound in each of the folders in itself. We are able to use this approach because we expect both folders to have distinct sound data characteristics. We can now dive into the extraction phase in the next stage.


### Extraction
This is where we leverage our technologies. In this case, we can use the ML library librosa which is commonly used for working with sounds in python. The goal of using this tool is to use it to extract the features of the sound, i.e. frequency, amplitude and time period. In the case of our agenda, we extract the sound in its spectrogram form so we can have visibility of all of its features. After that, we save our extracted sound data into one consolidated folder and prepare for the next stage, which is the Training stage.


### Training Stage:
The first factor we will look at in the last stage is the type of ML Algorithm we are going to use. It is also important to note that this phase will be divided into two main sections, i.e. the Training stage and then Testing. It actualized by dividing/splitting dataset into two, 80% for training and 20% for testing.
For Training, the MFCC(Mel-Frequency Cepstral Coefficients) algorithm is going to be used. MFCC is an algorithm that has been widely used in automatic speech and recognition since 1980s. It was introduced by Davis and Mermelstein. The purpose of the MFCC algorithm is to extract the characteristics of the sound(i.e. frequency and time period) for use in the identification of the features for classification. After getting all the extracted features of the audio, they are all going to be consolidated into one database. This database is going to be split into two, 80% for Training and 20% for Testing. Now a model will be created for the training, and since our goal for training falls under Binary Classification, i.e. either Hypertensive or not Hypertensive, we are going to go with one of the popularly know Binary Classification algorithm which is Support Vector Machines(SVM). SVM is a type of classification algorithm that classifies data based on its features. An SVM will classify any new element in one of the two classes proposed(i.e. either hypertensive/non hypertensive).  When the algorithm is fed inputs, its groups and classify the data and then create the outputs. As new data get fed into it, .e. an unknown sound data/file, The algorithm will accurately classify it, i.e. hypertensive as opposed to non-hypertensive in the Testing phase


## References:
1.	Altexsoft (2022). Data Preparation for Machine Learning | DataRobot Artificial Intelligence Wiki. [online] DataRobot. Available at: https://www.datarobot.com/wiki/data-preparation/
2.	Simplilearn.com. (n.d.). Support Vector Machine (SVM) in R: Taking a Deep Dive. [online] Available at: https://www.simplilearn.com/tutorials/data-science-tutorial/svm-in-r 
3.	Simplilearn.com. (n.d.). Classification in Machine Learning: What it is and Classification Models [Updated] | Simplilearn. [online] Available at: https://www.simplilearn.com/tutorials/machine-learning-tutorial/classification-in-machine-learning#what_is_classification
4.	Ogola, W. (2021). Machine Learning for Audio Classification. [online] Engineering Education (EngEd) Program | Section. Available at: https://www.section.io/engineering-education/machine-learning-for-audio-classification/#
5.	Zeinali, Y. and Niaki, S.T.A. (2021). Heart sound classification using signal processing and machine learning algorithms. Machine Learning with Applications, p.100206.
6.	Korstanje, J. (2021). Machine Learning on Sound and Audio data. [online] Medium. Available at: https://towardsdatascience.com/machine-learning-on-sound-and-audio-data-3ae03bcf5095
7.	Doshi, K. (2021). Audio Deep Learning Made Simple: Sound Classification, step-by-step. [online] Medium. Available at: https://towardsdatascience.com/audio-deep-learning-made-simple-sound-classification-step-by-step-cebc936bbe5
