# Mayaz Meteor

A weather app that can be run on both Android & IOS. Made with Flutter.

### System requirements

Dart SDK Version 2.18.0 or greater.
Flutter SDK Version 3.3.0 or greater.

### Application structure

After successful build, your application structure should look like this:

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── presentation                - It contains widgets of the screens
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### How to format your code?

- if your code is not formatted then run following command in your terminal to format code
  ```
  dart format .
  ```

### How you can improve code readability?

Resolve the errors and warnings that are shown in the application.

### Libraries and tools used

- BLoC - State management
  https://bloclibrary.dev
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image

### Pages
#### Home
![image](https://github.com/tawsifrm/Flutter_Weather_App/assets/121325051/e38f4b1b-4271-45a0-9e13-f156aee577e9)
#### Navbar
![image](https://github.com/tawsifrm/Flutter_Weather_App/assets/121325051/03ab4b5c-6569-4158-8ff4-5b036a70cff4)
#### Radar
![image](https://github.com/tawsifrm/Flutter_Weather_App/assets/121325051/0d234cb8-816f-4b7c-89ad-3309364879d2)
#### News
![image](https://github.com/tawsifrm/Flutter_Weather_App/assets/121325051/a2bb295c-801d-4249-8754-2ccc6c6b3b25)
