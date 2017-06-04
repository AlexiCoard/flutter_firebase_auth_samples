# flutter_firebase_auth_samples

This project contains sample code to connect to an application using Flutter and Firebase. As more auth methods will be implemented, the examples will be added.

## Why such a project ?

The aim of this repois  to help Flutter developers to easily add a login solution to their apps and also to provide an example of what a login page could looks like.

## Setup a Flutter Firebase application

### Android

Take a look at Brandon Donnelson's video at the following link : https://youtu.be/t_SgDznY99k

Or follow the following steps :

* In Firebase, create a new project and add a new Android app
* Enter your app id (same as `applicationId` in the directory `android/app/build.gradle`)
* Enter a name for your app
* Enter your SHA-1 key, you can get it with the following command :
```
keytool -exportcert -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
```
* Add this line in your ``android/build.gradle`` file in the dependencies
```
classpath 'com.google.gms:google-services:3.0.0'
```
* Add this line in your ``android/app/build.gradle`` at the bottom of your file, add the line
```
apply plugin: 'com.google.gms.google-services'
```

Copy the `google-services.json` in the `android/app/src` directory. You can get this file on your firebase app.

Now your app is linked to Firebase.

### iOS

Take a look at Brandon Donnelson's video at the following link : https://youtu.be/DrarVlOMg2c

TODO : Write step to step tutorial

## Contributing

If you wish to contribute to this repository, feel free to create a branch and make a pull request !

#### Important : Git config core.autocrlf

In order to prevent full file rewrite between Windows and Unix systems, please set your git config ``auto.crlf`` parameter to false using the following line.

```
cd myProject
git config --global core.autocrlf false
```

NB : the ``--global`` is not mandatory but it prevents havingthe same problems with other projects.


## Author

Alexi Coard <alexi.coard[at]gmail.com>

## Coming features

* iOS firebase link
* More auth methods.

## Some useful links

[Flutter](http://flutter.io/)
[Firebase](https://firebase.google.com/)
