package com.example.medicalfacilities

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button

class HospitalRegistration : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_hospital_registration)

        val registerHospitalButton: Button =findViewById(R.id.btn_hospitalRegistration)

        registerHospitalButton.setOnClickListener {

            val intent= Intent(this,MainScreen::class.java)
            startActivity(intent)
            finish()
        }
    }
}