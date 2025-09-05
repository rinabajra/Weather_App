# Weather App

Simple weather app with OpenWeather API

Tool versions:
Flutter version 3.36.0 in channel master
Java Version 11
Dart 3.10.0

👩🏻‍🏫 Instructions on how to run the project:
1. First have Flutter and Dart configured in your VSCode or another IDE 
2. Set up a simulator/emulator or a real device connected for testing
3. Clone the repository from github
4. Upgrade the flutter version to the latest version, for this project i used Flutter 3.36.0 in channel master
5. Don't forget to install dependencies with flutter clean + flutter pub get

The app is available in two flavors: dev (Development) and prod (Production), even tho the api is the same for both right now, I left the option so if in the future there's a test API or staging backend we use the development flavors and for releases the Production flavor.

-  To run the dev flavor : flutter run --flavor dev -t lib/main_dev.dart
-  To run the prod flavor : flutter run --flavor prod -t lib/main_prod.dart (for real device use : flutter run --release --flavor prod -t lib/main_prod.dart)
- For each flavor (dev and prod) there are two different icons and app names, the dev flavor includes "dev" word in it
  
<img width="86" height="86" alt="Screenshot 2025-09-05 at 09 35 51" src="https://github.com/user-attachments/assets/4a886a3e-4873-47b7-bc75-e19e7c3b7dac" /><img width="86" height="86" alt="Screenshot 2025-09-05 at 09 36 24" src="https://github.com/user-attachments/assets/0964e34b-afcc-4b97-9b0f-903f0dff1218" />

1. Splashcreen => Is shown till the app is initialized
2. Onboarding => Gives a glimpse of what the app is for
   - Onboarding consists of the app icon, translation button, two slideable images + text, the animation dots and the start button
   - There's the ability to change the language in three languages for now : English, Deutsch and Albanian (the choosen language is saved even if u close the app)
     
     ![onboarding](https://github.com/user-attachments/assets/103e8238-91b3-4326-b07a-2dc1a7c97f26)



  
4. Once u press Start Now on the Onboarding, there's no going back cause the onboarding is shown only the first time the app is installed
   - Home consists of the information given from OpenWeather API, the time is synced every 1 seond
   - The background image changes depending on whats the weather => cloudy,rainy,sunny or snowy
   - You can refresh the data by dragging down the scroll
     
     ![home](https://github.com/user-attachments/assets/832a9cc5-85df-48c4-9071-c32f34551884)
5. Menu Settings Page includes:
   - Back button (goes back on home page) and translation button
   - Search Field, calls the OpenWeather geocoding API for City searches,restricted to one request every 0.5 seconds
   - Button "Choose your location" to see the weather of my current location
   - and the change units buttons
   - The Choosen City, Language and Unit are all saved locally, so even if u close the app u don't have to change the settings again
     
![menu+home](https://github.com/user-attachments/assets/f79e8e98-ea5e-431f-8468-57be20193b71)

6. The App is tested and worked properly in both platforms => IOS and Android.

Notes: The design is based on the IOS weather app, the icons and images are generated with AI, the small weather icons are from OpenWeather api.

For further questions, you can write me on email.



© 2025 Rina Bajra. All rights reserved.
     




