# grocery

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Firebase realtimedatabase doc
https://firebase.google.com/docs/reference/rest/database

// to send http request 
- Install http package
- Import package as http
- use http object to send request
- to send data
http.post(url)
url = URI.https()
url can be constructed using a URI class (has several constructor) which in turn uses a http constructor to create url that point at a http backend , at server which uses https protocl