# Step 1 : Access and explore the data 
Normal heart involves two sound S1 (lub) sound components associated with closing valves systole and S2 (dub) sound component associated with opening valves diastole .Doctors can find heart diseases from listening to the heartbeat by using a stethoscope.

This means if the sound can be identified by a doctor ,then if the labelled sound is used to train a Machine learning model,it can also learn to classify the sound as either normal or abnormal.

To be able to train a model,we have to identify the techniques doctors use to identify a normal heartbeat which include;

Counting the number of times the heart beats every minute (bpm) during rest. This is known as the resting heart rate which varies within people.

Heart sounds can be described by their **intensity**, **pitch**, **location**, **quality** and **timing** in the cardiac cycle.

A normal heartbeat sound has a clear pattern of “lub dub, dub lub”, with the time dub to lub is greater than the time from lub to dub and its rate is 60–100 beats per minute (lub and dub).

A murmur heartbeat sound has a noise pattern whooshing, roaring, rumbling or turbulent fluid between lub to dub or dub to lub and symptoms of many heart disease.




# Step 2 : Pre-Processing

Most heart sound is found in low frequency components and noise in the higher frequencies.So it is ideal to apply a filter to produce more salient sound.

Extracting and identifying features  for classification such as Time Domain Features,Frequency domain features,Perceptual features and windowing features using the Mel-Frequency Cepstral Coefficients algorithm.

Splitting dataset into train,test and validate dataset


# Step 3 : Develop a predictive model 
Adding necessary layers such as dense,dropout and activation layers  to a chosen model e.g sequential model
Training the model with train dataset


# Step 4: Test  and Evaluate the model
This will involve developing a confusion matrix to evaluate the models performance  on the test dataset.

,# Step 5: Optimization of the model
Through tuning hypaparameters such as number of epochs,batch size.

# Step 6: Hosting the model 
The model can be deployed on a real device or hosted by uploading it on a storage medium like 4sync and creating a downloadable link which can be embedded into an application that is containerised and deployed on a cloud platform like Microsoft azure or AWS.


# Tools
Jupyter notebooks

Python

MFCC Algorithm

Librosa library
