### Here is how we can train sound files with ML
- Obtaining sound data from free or paid sources, or collecting it yourself (like we do in the digital stethoscope app via recording)
- Preprocessing the sound data by converting it to a common format, sampling rate and duration
  - NB: in the digital stethoscope app, we use the aac format and a sample rate of 44100 
- Extracting features from the sound data such as spectrograms, mel-frequency cepstral coefficients (MFCCs), zero-crossing rate, etc. 
- Splitting the sound data into train, validation and test sets 
- Choosing an ML algorithm such as logistic regression, k-nearest neighbors (KNN), support vector machines (SVM), decision trees, random forests, etc. 
- Training the ML algorithm on the train set and tuning its hyperparameters on the validation set 
- Evaluating the ML algorithm on the test set using metrics such as accuracy, precision, recall, F1-score, etc. 
- Deploying the ML algorithm to perform sound classification or inference tasks