package com.example.medicalfacilities

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView


class Facilities : Fragment() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

    }

    //private lateinit var recyclerView:RecyclerView
    private var mList=ArrayList<ItemsData>()
    private lateinit var adapter: ItemsAdapter

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment

        val view=inflater.inflate(R.layout.fragment_facilities, container, false)

        val recyclerView:RecyclerView=view.findViewById(R.id.recyclerView) //POSSIBLE ERROR HERE

        recyclerView.setHasFixedSize(true)
        adapter=ItemsAdapter(mList)
        recyclerView.layoutManager=LinearLayoutManager(context,LinearLayoutManager.HORIZONTAL,false) //POSSIBLE ERROR HERE ALSO

        addDataToList()

        recyclerView.adapter=adapter

        return view
    }

    private fun addDataToList(){

        mList.add(ItemsData("M.R.I",R.drawable.mrimachine,"FCFA 10000"))
        mList.add(ItemsData("X-Ray",R.drawable.xray,"FCFA 5000"))
        mList.add(ItemsData("Blood Test",R.drawable.bloodtest,"FCFA 500"))
        mList.add(ItemsData("C.T Scan",R.drawable.ctscan,"FCFA 12000"))
        mList.add(ItemsData("Ultrasound",R.drawable.ultrasound,"FCFA 9000"))


    }

}