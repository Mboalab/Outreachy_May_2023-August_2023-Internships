# Create a Platform to Link Up Medical Facilities UX Research

This document details the UX Research for an application that connects medical facilities worldwide. 



## Our primary objectives include:

1. **Making the search process simple and intuitive**: Patients can use the app to search for medical facilities based on their location, specialty, availability, and cost. The app can match patients with medical facilities that meet their specific needs, allowing them to book appointments and receive care more efficiently.

   Patients should be able to easily search for hospitals based on location, specialty, or other relevant criteria. The search function should be prominently displayed on the app's homepage and should use language that is clear and easy to understand.

2. **Provide relevant information**: Patients will be looking for a variety of information about hospitals, including their specialties, facilities, ratings, and patient reviews. Make sure this information is easily accessible and presented in a way that is easy to understand.

3. **Use maps and visual aids**: Patients may be unfamiliar with the geography of the countries and regions where they are searching for hospitals. Use maps and other visual aids to help patients understand where hospitals are located and how they are situated in relation to other landmarks.

4. **Considering language barriers**: Patients may be searching for hospitals in countries where they do not speak the local language. Consider offering language translation services or other resources that can help patients communicate with hospital staff.

5. **Ensure data privacy and security**: Patients will be sharing sensitive information about their health and personal data as they search for hospitals. We will make sure the app meets relevant data privacy and security standards and that patient data is protected at all times.

6. **Testing and iteration:** As with any UX design, we are going to test the app with real users and get feedback on what's working and what needs improvement. Use that feedback to iterate and improve the UX of our app over time.

By keeping these tips and considerations in mind, we can create a UX that meets the needs of patients who are looking for information on available hospitals worldwide. 

### Must have features 

An application such as this that links medical facilities worldwide should have the following base features:

1. **Hospital & User profiles**: The app should allow patients and medical professionals to create and manage their own user profiles. This can help ensure that the app provides personalized recommendations and relevant information to each user. 

2. **Search and booking**: The app should allow patients to search for medical facilities based on their location, specialty, availability, and cost. Patients should be able to book appointments and receive confirmation through the app.

3. **Multilingual support**: The app should provide support for multiple languages, allowing patients and medical professionals from different countries and cultures to communicate effectively.

4. **Booking & Secure messaging**: The app should provide a booking & secure messaging system that allows patients to communicate with medical professionals and receive updates on their care, as well as book appointments

   

Overall, an application that links medical facilities worldwide should have features that allow patients and medical professionals to search, book, communicate, and receive care more efficiently and effectively. By providing access to telemedicine, electronic medical records, real-time monitoring, multilingual support, secure messaging, and payment and billing systems, the app can help improve the quality and accessibility of healthcare for patients around the world.



### 	Nice to Have features

1. **Telemedicine**: The app should provide patients with access to remote consultations with medical professionals, allowing them to receive medical advice and support without leaving their home.
2. **Electronic medical records**: The app should provide medical professionals with access to electronic medical records, allowing them to view a patient's medical history, test results, and treatment plans. This can help ensure that patients receive appropriate and effective care, even if they are being treated by different medical facilities, while maintaning extreme privacy
3. **Real-time monitoring**: The app should collect data from wearable devices, such as smartwatches or fitness trackers, to monitor patients in real-time. This can help medical professionals identify potential health problems before they become serious and intervene quickly to prevent complications.
4. **Payment and billing**: The app should provide a payment and billing system that allows patients to pay for medical services and medical professionals to receive payment for their services. Hospitals can choose to accept payments for reservations depending on their policies.



## Users and scenarios 

Here are a few user expectations based on preliminary research carried out concerning this project. Included are some examples of potential app users, and a few scenarios that would lead them to need an application such as one that links up medical facilities together. 

**Target users included:** 

- **Patients**
- **Doctors & Medical professionals**
- **Administrator staff**





### **Persona 1**

**Name:** **Lillian Brown**

**Type: Patient - Pregnant**

**Age: 28**

**User Description**: 

Liliane is a pregnant lady, expecting her first child, and is incredibly nervous about the whole process and looking for the best care possible. She is looking for information on hospitals or birthing centers that offer obstetric care and childbirth services, she’s relativiely tech savvy, and well knowledgeable about technology. 

She utilises technology to simplify her daily life. He would rather order food on an application, than go to a restaurant.

She would like to have the ability to review different hospitals, and compare the best hospital offering child birth services, by comparing and looking at previous reviews.

Offer educational resources: Many pregnant women may have questions about childbirth, pregnancy, and postpartum care. We can consider offering educational resources such as articles, videos, or FAQs to help them make informed decisions about where to give birth.

**Pain points**

She prefers a seamless and intuitive user experience with the technology she interacts with. Her pain points are technology that doesn’t work as it should, bad user experiences and anything that over complicates the process.

The app should heavily rely on suggestions, For example, (autocomplete searching, recommending hospitals that fit the need she is interested, while maintaining privacy, maybe automatically sorting hospitals by closest location, or services offered etc) to ease the process of searching. She should also have the ability to filter hospitals by previous reviews and ratings.



### **Persona 2:** 

**Type: Hospital administrative staff**

**Name: Abigail zen**

**Age: 48** 

**User Description**: 

Abigail is an administrative staff of a hospital looking for information on hospitals around them to aid in transferring patients to.

Not very tech savvy, but can easily use a computer. Prefers an experience that is helpful, easy to understand and not overly complicated.

She prefers (Large and visible call to actions), would prefer limited steps to reach their goal. And an easy to understand interface. Her pain points can include extremely small text, overcrowded and complicated screens. 



### **Persona 3**

**Name: Dr.Ndo Ebenezar**

**Type: Doctor and Medical Professionnal**

**Age: 38**

**User Description**: 

Dr. Ndo is medical professional trying to get info on available hospitals worldwide. 

He will need to quickly find hospitals that can provide the necessary care and treatments for their patients.Therefore, the search functionality should be fast and efficient, with filters that allow him to narrow down their search based on specific criteria such as location, specialty, and available services.

He should be able to also have access to detailed information about a hospital, that would typicallby be too much for a regular user to understand. So hospitals shoudl also detailed descriptions of the services they offer, as well as implied descriptions. A doctor can then look up those detailed descriptions to fully understand what the hospital does, while a regular patient, migh be satisfied with just the basic information,

This introduces an ability to show more information obout a hospital, which may be necessary for a doctor, but not so much for a regular person.



## **Competitor Research** 

During my research I havent seen that many applications are serve as a direct competitor to us, most applications are directed for more enterprise use cases such as hospital admiration. This shows an opening in the market for an application like ours that targets the average person and individual looking for a place to find relevant hospitals and medical facilities.

1. **[Veradigm](https://veradigm.com/), formerly Allscripts**: Allscripts is an EHR platform that offers solutions for hospitals and healthcare facilities of all sizes. It allows healthcare providers to access patient records, order medications and tests, and communicate with other healthcare providers in real-time.
2. **[Cerner](https://www.cerner.com/)**: Cerner is a healthcare technology company that offers a range of solutions for hospitals and healthcare providers, including EHR, revenue cycle management, and population health management. It allows healthcare providers to share patient data and collaborate with each other to improve patient outcomes.



## **Technical Stuff**

I plan to complete the product design and UI, including an interactive prototype using **Figma**, as well as develop a simple MVP using **Flutter**. For the backend, I intend to use **[AppWrite](https://appwrite.io/)**, and open source easy-to-use self hosted backend, made to work extremely well with Flutter, and a very good alternative to Firebase, but without the vendor lock-in.