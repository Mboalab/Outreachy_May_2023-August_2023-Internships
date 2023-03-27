# Task 1: Develop a Data Collection Tool



Hello, here is a proposed UI Design for the data collection tool for the Platform to link up medical facilities. This tool is envisioned as an easy to use Web app, which will be developed with Flutter, and hosted online. The tool is meant mainly for hospital administrators where they can add their hospitals

## Key Features

- User Authentication and account creation.
- Users can add hospitals and medical facilities to the tool, included all the hospital details which may be useful for those searching.
- Users can edit, and manage details about hospitals that they added to the tool.
- Information added to the tool will be added to the central database where the client application will get data from.

This tool is meant mainly for hospital administrators and medical personnel who are willing to add their medical facilities to the database.

Making this tool a Web application will make it very easy for anyone to use, by simply just visiting the site, and signing up, without having to download any sort of application.



## Design Considerations


![Data Collection tool presentation](https://user-images.githubusercontent.com/92654117/227012342-7f2b1064-9841-49ca-8969-865aa7c3ac42.jpg)


[Data Collection Tool Figma Design](https://www.figma.com/proto/2XpR22cOaDDZGy8At1Q5xd/Mboa-Lab-Data-Collection--Tool?node-id=9-879&scaling=min-zoom&page-id=9%3A626)

This is a draft design proposal for the look and functionality of the tool. This design is by no means the final version but an early MVP. It features a simple

- Authentication screens

- A simple application, where the user can add a Hospital or Medical Facility.

- A Medical facility/Hospital has some basic information such as 

  - Name
  - Description
  - Location
  - Gallery of pictures (still to be implemented)
  - Basic Contact information (phone, email, website)
  - And a Google Map Location (Still to be implemented)

- In addition to the basic information about a Medical facility, facilities will also have some essential "medical" information which can include we have grouped into 2 main groups. **Facilities** and **Services**

  - A Facility can be considered as the facilities the hospital can offer, these can be facilities such as a Dialyses Centre, an Imaging Centre, Operating Rooms, the different types of wards available (male, female , pediatric, maternity, private), Pharmacies, Laboratories, even recreational facilities.

  - A Service can be considered services the medical facility can offer. These can include services such as imaging services like CT Scanning, MRIs, Ultrasounds, or other services such as consultations,  lab tests etc.

    

I remain open for you feedback on how to improve the tool in any way possible. Thank you.

  

## Technical Considerations and Code

[Data Collection Tool GitHub Repository](https://github.com/nlewin20/Mboalab_data_collection_tool)

Here is a link to the github repository of the tool.

This tool will be built as a Flutter Web App. And I intend to use **AppWrite** as a backend and database for both this tool. AppWrite is an easy to use, open-source, self hosted backend alternative to Firebase. It features databases, authentication, cloud functions etc.


