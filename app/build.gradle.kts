plugins {
    alias(libs.plugins.android.application)
    id("com.google.wff.validatorplugin")
}

android {
    namespace = "com.dessalines.lcd_black"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.dessalines.lcd_black"
        minSdk = 34
        targetSdk = 34
        versionCode = 2
        versionName = "1.1"
    }

    if (project.hasProperty("RELEASE_STORE_FILE")) {
        signingConfigs {
            create("release") {
                storeFile = file(project.property("RELEASE_STORE_FILE")!!)
                storePassword = project.property("RELEASE_STORE_PASSWORD") as String?
                keyAlias = project.property("RELEASE_KEY_ALIAS") as String?
                keyPassword = project.property("RELEASE_KEY_PASSWORD") as String?

                // Optional, specify signing versions used
                enableV1Signing = true
                enableV2Signing = true
            }
        }
    }

    buildTypes {
        debug {
            isMinifyEnabled = true
        }
        release {
            if (project.hasProperty("RELEASE_STORE_FILE")) {
                signingConfig = signingConfigs.getByName("release")
            }
            isMinifyEnabled = true
            // Ensure shrink resources is false, to avoid potential for them
            // being removed.
            isShrinkResources = false
        }
    }
}
