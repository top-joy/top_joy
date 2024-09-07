package com.example.top_joy

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity(){
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine){
        MapKitFactory.setApiKey("ede88ac5-e446-426a-aacc-e61b86c99a43")
        super.configureFlutterEngine(flutterEngine)
    }
}