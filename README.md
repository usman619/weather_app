# Weather App

A Flutter application to get real-time weather information for any city. This app uses the OpenWeatherMap API to fetch the current weather data.

## Features

- Fetches current weather information.
- Displays temperature, humidity, and weather conditions.
- Simple and clean user interface.
- Ability to search for weather data by city name.
- Responsive design compatible with both Android and iOS.
- Add version 2 in which weather animations are used Lottie package.

## Screenshots


<img src="assets/screenshot/screenshot1.png" alt="Screenshot1" width="360" height="800">
<img src="assets/screenshot/screenshot2.png" alt="Screenshot2" width="360" height="800">

## Figma Prototype
![Figma Prototype V1](https://www.figma.com/proto/aGG8dl0cxIMbH8jWaPtmoX/weather_app_mockup?node-id=1-2&t=aiClW9ft3FwKjtNL-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1)

![Figma Prototype V2](https://www.figma.com/proto/1dwV3OPH120RkPbBilAgFi/weather_app(v2)?node-id=3-4&viewport=658%2C507%2C1&t=RROrx8buSDY9BmKE-0&scaling=scale-down&content-scaling=fixed&page-id=0%3A1)

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/) installed on your machine.
- An API key from [OpenWeatherMap](https://openweathermap.org/).

### Packages used
## For V1 (home_screen.dart)
- ![intl](https://pub.dev/packages/intl)
- ![equatable](https://pub.dev/packages/equatable)
- ![weather](https://pub.dev/packages/weather)
- ![bloc](https://pub.dev/packages/bloc)
- ![flutter_bloc](https://pub.dev/packages/flutter_bloc)
- ![geolocator](https://pub.dev/packages/geolocator)
- ![flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- ![flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
## For V2 (home_screen_v2.dart)
- All the the above packages are included.
- ![google_fonts](https://pub.dev/packages/google_fonts)
- ![lottie](https://pub.dev/packages/lottie)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/usman619/weather_app.git
   cd weather_app
2. Install the dependencies:
    ```bash
    flutter pub get
3. Run using the following command:
    ```bash
    flutter run
