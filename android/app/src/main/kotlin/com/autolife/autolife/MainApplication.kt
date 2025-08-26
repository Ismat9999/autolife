package com.autolife.autolife

import android.app.Application

import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("uz_UZ") // Your preferred language. Not required, defaults to system language
        MapKitFactory.setApiKey("6b455ac5-2a58-49c8-ab02-506d26377f39") // Your generated API key
    }
}