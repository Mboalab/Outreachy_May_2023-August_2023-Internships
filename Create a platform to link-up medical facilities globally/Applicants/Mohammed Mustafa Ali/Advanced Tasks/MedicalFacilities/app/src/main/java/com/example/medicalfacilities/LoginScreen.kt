package com.example.medicalfacilities

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.viewpager2.widget.ViewPager2
import androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
import com.google.android.material.tabs.TabLayout

class LoginScreen : AppCompatActivity() {

    private lateinit var tabLayout: TabLayout
    private lateinit var viewPager2: ViewPager2
    private lateinit var adapter:FragmentAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_login_screen)

        tabLayout=findViewById(R.id.tabLayout)
        viewPager2=findViewById(R.id.viewPager2)
        adapter=FragmentAdapter(supportFragmentManager,lifecycle)


        tabLayout.addTab(tabLayout.newTab().setText("Login"))
        tabLayout.addTab(tabLayout.newTab().setText("Hospital Sign-Up"))
        viewPager2.adapter=adapter

        tabLayout.addOnTabSelectedListener(object:TabLayout.OnTabSelectedListener{
            override fun onTabSelected(tab: TabLayout.Tab?) {
                if(tab!=null){
                    viewPager2.currentItem=tab.position
                }
            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {

            }

            override fun onTabReselected(tab: TabLayout.Tab?) {

            }


        })

        viewPager2.registerOnPageChangeCallback(object:OnPageChangeCallback(){

            override fun onPageSelected(position:Int){
                super.onPageSelected(position)
                tabLayout.selectTab(tabLayout.getTabAt(position))

            }
        })


    }
}