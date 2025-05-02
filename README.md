# Movie-Search-App
This is an iOS mobile app that will allow us to search for the movies and check their IMDB ratings.
# 🎬 Movie Search App

An elegant iOS application built using **SwiftUI** and the **MVVM** design pattern that allows users to **search for movies** and view their **IMDb ratings, release years, posters**, and short descriptions. It fetches data from the OMDb API and offers a clean, responsive UI for movie exploration.

---

## 🔍 Features

- 🔎 Search for movies by title
- 🎞 View movie details:
  - Poster image
  - IMDb rating
  - Release year
  - Short plot summary
- 🧠 Built with **MVVM** architecture
- 📱 Beautiful, responsive UI using **SwiftUI**
- 🌐 Asynchronous networking with URLSession
- 💾 Optional local caching for faster subsequent searches (future)

---

## 🛠 Tech Stack

| Technology     | Description                        |
|----------------|------------------------------------|
| SwiftUI        | Declarative UI framework           |
| Combine        | Data binding and reactive updates  |
| MVVM           | Clean architectural pattern        |
| URLSession     | Networking layer                   |
| OMDb API       | Movie data source (https://omdbapi.com) |

---

## 🧭 App Flow

1. User enters a movie title in the search bar.
2. The app fetches results from the OMDb API.
3. Matching movies are listed with thumbnails and titles.
4. Tapping on a movie shows a detailed view with IMDb rating, release year, and plot.

---

## 📁 Project Structure

MovieSearchApp/
│
├── Models/
│   └── Movie.swift
│
├── ViewModels/
│   ├── MovieSearchViewModel.swift
│   └── MovieDetailViewModel.swift
│
├── Views/
│   ├── MovieSearchView.swift
│   └── MovieDetailView.swift
│
├── Networking/
│   └── MovieAPIService.swift
│
├── Resources/
│   ├── Assets.xcassets
│   └── LaunchScreen.storyboard
│
├── SupportingFiles/
│   └── Info.plist
│
└── MovieSearchApp.swift


---

## 🚀 Getting Started

### Prerequisites

- Xcode 15+
- iOS 15+
- A valid OMDb API key (free from https://www.omdbapi.com/apikey.aspx)

### Setup Instructions

1. Clone the repository:

   git clone https://github.com/yourusername/MovieSearchApp.git
   cd MovieSearchApp
2. Open MovieAPIService.swift and replace YOUR_API_KEY with your OMDb API key:


private let apiKey = "YOUR_API_KEY"
3. Open the project in Xcode and run on the simulator or a real device:

open MovieSearchApp.xcodeproj

### Screenshots


![Simulator Screenshot - iPhone 15 Pro - 2024-09-08 at 01 32 38](https://github.com/user-attachments/assets/3de4f38a-71dd-48a7-a18d-1f9a19355661)
![Simulator Screenshot - iPhone 15 Pro - 2024-09-08 at 01 32 17](https://github.com/user-attachments/assets/906f5e69-6349-420d-80b5-0b072ac300a9)
