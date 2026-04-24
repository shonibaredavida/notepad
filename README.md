
# Color Note 📝

A lightweight, high-performance notepad application built with Flutter. **Color Note** simplifies productivity by combining the viewing and editing experience into a single, seamless workflow.

~~

## ✨ Features Implemented
  * **Unified Edit/View Screen:** No more switching pages. View your note and tap to edit instantly on the same interface.
  * **Persistent Local Storage:** Integrated with **Hive**, a lightning-fast NoSQL database, ensuring your notes are saved locally and load instantly.
  * **Full CRUD Functionality:** * **Create:** Quick-add notes.
  * **Read:** Clean list-view for easy browsing.    
  * **Update:** Real-time editing.    
  * **Delete:** Effortless note removal.
  * **Native State Management:** Built using Flutter’s core state management system for a reactive UI without the overhead of heavy third-party libraries.


~~  

  ## 🚀  How to Run the App

Ensure you have the Flutter SDK installed on your machine.
  1.  **Clone the Repository**    
  2.  **Install Dependencies**   run flutter pub get
  3.  **Run Build Runner** (Required for Hive adapters)    
    flutter pub run build_runner build --delete-conflicting-outputs
  4.  **Launch the App**  flutter run
