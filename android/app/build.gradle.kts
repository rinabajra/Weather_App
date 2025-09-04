plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "xk.weatherApp"
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    flavorDimensions += "app"

    productFlavors {
        create("dev") {
            dimension = "app"
            manifestPlaceholders["appIcon"] = "@mipmap/ic_launcher_dev"
            manifestPlaceholders["deeplinkScheme"] = "xk.weatherApp.dev"
            manifestPlaceholders["appName"] = "Weather App - DEV"
            applicationIdSuffix = ".dev"
        }
        create("prod") {
            dimension = "app"
            manifestPlaceholders["appIcon"] = "@mipmap/ic_launcher"
            manifestPlaceholders["deeplinkScheme"] = "xk.weatherApp"
            manifestPlaceholders["appName"] = "Weather App"
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions { jvmTarget = JavaVersion.VERSION_11.toString() }

    defaultConfig {
        applicationId = "xk.weatherApp"
        minSdk = 24
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter { source = "../.." }
