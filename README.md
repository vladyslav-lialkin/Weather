# Weather

## Overview

<div style="width: 1000px; height 600px;"><img src="https://github.com/vladyslav-lialkin/Weather/assets/64835724/2bf3c114-e1ae-4956-a5ba-c04629d591fe" width="30%" height="30%" align="right"></div>

Weather is a weather app that is identical to the one in iOS 17, built with SwiftUI! Get the current weather from London!
The application includes:

User Interface:
- SwiftUI
- Stacks (HStack, VStack, ZStack)
- ScrollView
- Images, Label, and Text
- Shape, Rectangle, and Circle
- Gradients
- ProgressView

Map Integration:
- MapKit
  
Layout and Geometry:
- GeometryReader
  
Data Handling:
- Parsing JSON using Codable
- Error Handling
  
Architecture:
- MVVM (Model-View-ViewModel)

## Custom Views

To recreate the original app, I created custom views for a dynamic user experience. One of them simulates the sliding effect by dynamically reducing in size, and the other is a custom ProgressViewStyle that displays the current temperature as a circle on top of the ProgressView.

- CustomView: A dynamic interface created with SwiftUI to achieve a sliding effect.
- CustomProgressViewStyle: A custom ProgressViewStyle that uses SwiftUI to display the current temperature as a circular overlay on top of the ProgressView.

## Getting Started

> This app is not available on the App Store.

### Prerequisites

- A valid API key from WeatherAPI 
- A Mac running macOS Sonoma
- Xcode 15

### Installation

1. Clone or download the project to your local machine
2. Open the project in Xcode
3. Replace `YOURAPIKEY` with your valid Weather API key in `WeatherViewModel.swift`

```swift
class WeatherViewModel: ObservableObject {
    func fetchWeather() async throws {
        let weatherApiKey = "YOURAPIKEY"
```

4. Run the simulator

## Acknowledgements

The free API was used in the development of this project.

- [WeatherAPI](https://www.weatherapi.com)
