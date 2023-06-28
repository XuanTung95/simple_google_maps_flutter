A clone of **google_maps_flutter** but use **simple_platform_view** instead of **AndroidView** for performance optimization

## Getting started

Please check the [simple_platform_view](https://github.com/XuanTung95/simple_platform_view) package before using this package, as simple_platform_view comes with several drawbacks that need to be considered beforehand.

## Usage

| Platform | Status     |
|----------|------------|
| Android  | 	✅     |
| iOS      | 	✅     |

Add the following dependency to your pubspec.yaml file:

```
dependencies:
  google_maps_flutter:
  simple_google_maps_flutter:
```

#### Android:
**Make FlutterView transparent (required)**

Add the following code to MainActivity.kt:
  ```java
    import androidx.annotation.NonNull;
    import io.flutter.embedding.android.FlutterActivity;
    import io.flutter.embedding.android.FlutterActivityLaunchConfigs.BackgroundMode;

    public class MainActivity extends FlutterActivity {

        @NonNull
        @Override
        protected BackgroundMode getBackgroundMode() {
            return BackgroundMode.transparent;
        }
    }
  ```

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

Other usage is just like google_maps_flutter package

#### iOS:

**Register PlatformViewFactory**

Add this to AppDelegate.swift to register PlatformViewFactory to `SimplePlatformViewPlugin`:
  ```swift
import GoogleMaps
import simple_platform_view;

@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GMSServices.provideAPIKey("")
        let fakeRegistry = SimplePlatformViewPlugin.createFakeFlutterPluginRegistry(realPluginRegistry: self);
        GeneratedPluginRegistrant.register(with: fakeRegistry);
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
  ```

Replace the default GoogleMapsFlutterPlatform.instance with the modified version:

  ```dart
    import 'package:simple_google_maps_flutter/simple_google_maps_flutter.dart';

    @override
    void initState() {
        super.initState();
        if (Platform.isIOS) {
          SimpleGoogleMapsFlutterIOS.registerWith();
        }
    }
  ```

| Demo                       |
| ------------------------------|
| <img src="https://raw.githubusercontent.com/XuanTung95/simple_google_maps_flutter/master/images/demo.gif" width="220" height="450"> |
