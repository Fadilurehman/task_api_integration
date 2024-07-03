# Flutter JSONPlaceholder App

This Flutter application fetches and displays data from the JSONPlaceholder API. The app allows users to view posts, comments, and user details.

## Features

- **Home Screen**: Displays a list of posts fetched from the JSONPlaceholder API. Each post item shows the post title and body.
- **Post Detail Screen**: When a post is tapped, navigates to a detail screen displaying the post title, body, and the author's name. Also displays a list of comments associated with the post.
- **User Detail Screen**: When the author's name is tapped, navigates to a user detail screen displaying the user's name, username, email, and address.

## API Integration

The following endpoints are used:
- [https://jsonplaceholder.typicode.com/posts](https://jsonplaceholder.typicode.com/posts)
- [https://jsonplaceholder.typicode.com/posts/{id}](https://jsonplaceholder.typicode.com/posts/{id})
- [https://jsonplaceholder.typicode.com/comments?postId={postId}](https://jsonplaceholder.typicode.com/comments?postId={postId})
- [https://jsonplaceholder.typicode.com/users/{id}](https://jsonplaceholder.typicode.com/users/{id})

## State Management

The app uses the Provider package for state management.

## UI/UX

The app has a clean and user-friendly UI with appropriate icons and styling for navigation. It handles loading and error states gracefully.

## Project Structure

lib/
├── main.dart
├── models/
│ ├── post.dart
│ ├── comment.dart
│ └── user.dart
├── providers/
│ ├── post_provider.dart
│ └── user_provider.dart
├── screens/
│ ├── home_screen.dart
│ ├── post_detail_screen.dart
│ └── user_detail_screen.dart
└── services/
└── api_service.dart
└── test/
└──api_service_test.dart


## Getting Started

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter

### Installation

1. Clone the repository:
    ```bash
    git clone 
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

### Running the App

Run the app on an emulator or connected device:
```bash
flutter run
