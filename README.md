A clone of **google_maps_flutter** but use **simple_platform_view** instead of **AndroidView** for performance optimization

## Getting started

Please check the [simple_platform_view](https://pub.dev/packages/simple_platform_view) package before using this package, as simple_platform_view comes with several drawbacks that need to be considered beforehand.

## Usage

| Platform | Status    |
|----------|-----------|
| Android  | 	✅    |
| iOS      | 	❌     |

#### Download the custom engine
[simple_platform_view](https://pub.dev/packages/simple_platform_view) requires modifications to the engine itself. Therefore, to run it on Android, you need to use a modified version of Flutter.

Download the custom Flutter version [Here](https://github.com/XuanTung95/flutter/releases).

Unzip the downloaded `flutter.zip` file.

Run the following command to download the custom engine artifacts for the first time:

```
   $ path_to_custom_version/flutter/bin/flutter doctor
```

Then use it same as a normal Flutter installation:

```
   $ path_to_custom_version/flutter/bin/flutter build apk
```

Add the following dependency to your pubspec.yaml file:

```
dependencies:
  google_maps_flutter:
  simple_google_maps_flutter:
```

#### Android:
Replace the default GoogleMapsFlutterPlatform.instance with the modified version:

  ```dart
    import 'package:simple_google_maps_flutter/simple_google_maps_flutter.dart';

    @override
    void initState() {
        super.initState();
        if (Platform.isAndroid) {
            SimpleGoogleMapsFlutterAndroid.registerWith();
        }
    }
  ```

If you are using Google Map inside a scroll view, add this to your `MaterialApp` to prevent issues with `StretchingOverscrollIndicator`:

  ```dart
    import 'package:simple_platform_view/simple_platform_view.dart';

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        // Fix StretchingOverscrollIndicator issues
        scrollBehavior: SimplePlatformViewScrollBehavior(),
      );
    }
  ```

Other usage is just like google_maps_flutter package

#### iOS:

**iOS is not supported**

| Demo                       |
| ------------------------------|
| <img src="https://raw.githubusercontent.com/XuanTung95/simple_google_maps_flutter/master/images/demo.gif" width="220" height="450"> |
