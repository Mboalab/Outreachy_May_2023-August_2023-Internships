package com.example.medicalfacilities

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Button


class Second : Fragment() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        val view=inflater.inflate(R.layout.fragment_second, container, false)
        val registerButton = view.findViewById<Button>(R.id.register_button)
            .setOnClickListener {
                val intent = Intent(activity, HospitalRegistration::class.java)
                startActivity(intent)
            }

        return view
    }


}