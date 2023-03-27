# Data Collection Tool

## Task Objective

In order to create a platform that links-up medical facilities globally, we need to find a way to get information about hospitals. To provide authencity, it is essential to get information from the source (in this case, the hospitals).
The aim of this task is to create a data collection tool that will be used by the hospitals to sign-up for the system and post information about them. The tool should take into consideration the name, location, services and facilities available, with other relevant information.

## My Solution

In other to create a data collection tool for hospitals, I built a simple web application. I used Reactjs for the Frontend and Django for the backend.

### Reasons why I followed this approach was because of the following:

- To get information from hospital that will be used for the proposed platform, it will be easier and efficient if hospitals information is automatically saved into a backend(database) where we can retrieve with just simple API calls.
- The website will provide a way to improve user experience while collecting data. We can improve website based on users' feedback.
- Using ready-made data collection tool might look unoriginal to standard hospitals, in my suggestion.

### Approach

Informations I included on the form include:

- Hospital Name
- Country
- State/Region
- City
- Address
- Website URL
- Hospital Email Address
- Hotline
- Operating Hours
- Ownership
- Facility Level
- Facility Type
- Bed Spaces
- Services Offered
- Facilities Available

I researched for list of services offered in hospitals (60 in number), and also facilities available (15 in number) . I plan to add and remove based on user/mentor feedback, and also with discovery of new ones.

When user/hospital register and fill in the form, they can see their information on their homepage. And I plan to work further on this website by adding the edit functionality which is already avaialable on the backend.

## Relevant Links

### Repositories

- Link to the Frontend Repository: [Frontend Repository](https://github.com/psalmuelle/Mboalab-Task_Frotend)
- Link to Backend Repository: [Backend Repository](https://github.com/psalmuelle/Mboalab-Task_Django)

### Live links

- Link to Live Website: [Live Website](https://mboalab-task.onrender.com/)
- Link to access the backend api: [API](https://daniel2345.pythonanywhere.com/api/)

In other to use the api for the proposed platform, there is a _Get_ method that returns a list of data collected from all hospitals that have signed up for the system. You can try it out using [https://daniel2345.pythonanywhere.com/api/hospital/all/](https://daniel2345.pythonanywhere.com/api/hospital/all/).

## Ways to improve the Data collection website

- Add more functionalities to improve user experience, like
  - Allow users to edit, and delete their information
  - Provide extra layer of security to prevent unauthorised people from putting on fake data on the website
  - Add more services, facilities and other data that might be useful for the platform
- Improve UI to fit that of the platform to give uniformity in design and structure

Feebacks on ways it can be improved is welcome! I hope to keep working and iterate on the idea to create a platform that connects hospitals globally.

Thank you!
