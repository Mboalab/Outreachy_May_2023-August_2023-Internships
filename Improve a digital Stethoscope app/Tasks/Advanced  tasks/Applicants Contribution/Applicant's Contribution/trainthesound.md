# Step 1 : Access and explore the data 
Normal heart involves two sound S1 (lub) sound components associated with closing valves systole and S2 (dub) sound component associated with opening valves diastole .Doctors can find heart diseases from listening to the heartbeat by using a stethoscope.

This means if the sound can be identified by a doctor ,then if the labelled sound is used to train a Machine learning model,it can also learn to classify the sound as either normal or abnormal.

To be able to train a model,we have to identify the techniques doctors use to identify a normal heartbeat which include;

Counting the number of times the heart beats every minute (bpm) during rest. This is known as the resting heart rate which varies within people.

Heart sounds can be described by their **intensity**, **pitch**, **location**, **quality** and **timing** in the cardiac cycle.

A normal heartbeat sound has a clear pattern of “lub dub, dub lub”, with the time dub to lub is greater than the time from lub to dub and its rate is 60–100 beats per minute (lub and dub).

A murmur heartbeat sound has a noise pattern whooshing, roaring, rumbling or turbulent fluid between lub to dub or dub to lub and symptoms of many heart disease.

To train a model, we need to get access to a very large labelled dataset of heart and lung sounds either through collection or by using a already available dataset such as PhysioNet/CinC Challenge dataset.




# Step 2 : Pre-Processing

Most heart sound is found in low frequency components and noise in the higher frequencies.So it is ideal to apply methods such as filtering, normalisation and segmentation to produce more salient sound which will affect our model performance positively.


# Step 3 : Feature Extraction

Extracting and identifying features  for classification such as Time Domain Features,Frequency domain features,Perceptual features and windowing features using the Mel-Frequency Cepstral Coefficients algorithm.

# Step 4 : Prepare the dataset

Splitting dataset into train,test and validate dataset using libraries such as sckit learn.


# Step 5 : Develop  predictive models.

There are various machine learning models that can be used for the task, so the selection highly depends on the kind of data we have and our end goal.

We can experiment with various models such as convolutional neural networks (CNNs), recurrent neural networks (RNNs), support vector machines (SVMs) and K-NN and get the best performing model model.

## **I would choose to consider** a CNN because of its ability to detect patterns in complex data such as sound.

I would do this by adding necessary layers such as convolutional layers to extract features by passing a filter, pooling layers to downsample the data to reduce its dimensionality, and fully connected layers to perform classification based on the features extracted by the earlier layers.

# Step 6: Train the model
  I will then train the model by feeding it a large number of sound recordings from the train dataset along with their corresponding labels. The CNN would learn to identify patterns in the data that are associated with different heart or lung conditions.

# Step 7: Test  and Evaluate the model
This will involve developing a confusion matrix to evaluate the models performance  on the test dataset.

# Step 8: Optimization of the model
Through tuning hypaparameters such as number of epochs,batch size.

# Step 9: Hosting the model 
The model can be deployed on a real device or hosted by uploading it on a storage medium like 4sync and creating a downloadable link which can be embedded into an application that is containerised and deployed on a cloud platform like Microsoft azure or AWS.


# Tools
Jupyter notebooks

Python

MFCC Algorithm

Librosa library
