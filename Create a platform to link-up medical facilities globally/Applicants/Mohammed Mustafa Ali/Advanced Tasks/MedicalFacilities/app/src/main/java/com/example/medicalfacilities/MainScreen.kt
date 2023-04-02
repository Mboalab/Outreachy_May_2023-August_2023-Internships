package com.example.medicalfacilities

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.appcompat.widget.SearchView
import androidx.recyclerview.widget.RecyclerView
import androidx.viewpager2.widget.ViewPager2
import com.google.android.material.tabs.TabLayout

class MainScreen : AppCompatActivity() {

    private lateinit var tabLayout: TabLayout
    private lateinit var viewPager2: ViewPager2
    private lateinit var adapter:FragmentPageMainScreenAdapter


    private lateinit var searchView:SearchView


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main_screen)


        tabLayout=findViewById(R.id.tabLayoutMainScreen)
        viewPager2=findViewById(R.id.viewPager2MainScreen)
        adapter= FragmentPageMainScreenAdapter(supportFragmentManager,lifecycle)


        searchView=findViewById(R.id.searchView)

        tabLayout.addTab(tabLayout.newTab().setText("Facilities"))
        tabLayout.addTab(tabLayout.newTab().setText("Hospitals"))
        viewPager2.adapter=adapter


        tabLayout.addOnTabSelectedListener(object :TabLayout.OnTabSelectedListener{
            override fun onTabSelected(tab: TabLayout.Tab?) {
                if (tab != null) {
                    viewPager2.currentItem=tab.position
                }
            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {

            }

            override fun onTabReselected(tab: TabLayout.Tab?) {

            }


        })

        viewPager2.registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback() {

            override fun onPageSelected(position: Int) {
                super.onPageSelected(position)
                tabLayout.selectTab(tabLayout.getTabAt(position))


            }

        })

    }
}