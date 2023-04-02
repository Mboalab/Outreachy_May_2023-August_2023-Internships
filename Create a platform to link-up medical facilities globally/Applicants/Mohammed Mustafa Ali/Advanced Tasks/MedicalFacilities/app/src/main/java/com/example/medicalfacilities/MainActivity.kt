package com.example.medicalfacilities

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.view.WindowManager
import android.widget.Button
import android.widget.TableLayout
import androidx.viewpager2.widget.ViewPager2

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val startButton: Button=findViewById(R.id.btn_getStarted)

        startButton.setOnClickListener {

            val intent= Intent(this,LoginScreen::class.java)
            startActivity(intent)
            finish()
        }
    }
}