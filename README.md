# WeatherApp 

## App Screens (Initial Version)

###  Home Screen
![Home Screen](output/home.png)

###  City List Screen
![City List](output/city_list.png)

###  Weather Detail Screen
![Detail View](output/detail_view.png)

---

##  Project Structure

### Views (UI Screens)
- `ContentView.swift` →  Home screen  
- `ListScreen.swift` → City list screen   
- `DetailScreen.swift` → Weather detail screen  

### Models (Data)
- `Location.swift` → City model  
- `Temperature.swift` → Temperature model   
- `Weather.swift` → Weather type and system icon mapping  
- `LocationData.swift` → Static list of cities with coordinates  

---

##  Updated Features (Latest Version)

updated the app using **real-time weather data** from the **Open-Meteo API**.

###  Home Screen (Updated)
![Home Screen Latest](output/home_latest.png)

###  City List Screen (Updated)
![City List Latest](output/city_list_latest.png)

###  Weather Detail Screen (Updated)
![Detail View Latest](output/detail_view_latest.png)


##  New Features

- Integrated **Open-Meteo Weather API**
- Fetches **live temperature** using latitude & longitude
- Weather icons are shown based on temperature range
- Detail screen now updates dynamically from API
- Separated UI and logic using **MVVM architecture**


