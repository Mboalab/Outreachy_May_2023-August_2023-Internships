import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mboathoscope/buttons/RecordingList.dart';
import 'package:mboathoscope/buttons/headerHalf.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:provider/provider.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import '../buttons/textButton.dart';
import '../providers/play_audio_provider.dart';
import '../providers/record_audio_provider.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7FF),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            headerHalf(),
            RecordAndPlayScreen()
            // RecordingList()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffF3F7FF),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor:  Color(0xffF3F7FF),
            icon: ImageIcon(
              AssetImage("assets/images/img_profile.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/img_explore.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/img_recordings.png"),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/img_setting.png"),
            ),
            label: '',
          )
        ],
        selectedItemColor:  const Color(0xff3D79FD),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}



class RecordAndPlayScreen extends StatefulWidget {
  const RecordAndPlayScreen({Key? key}) : super(key: key);

  @override
  State<RecordAndPlayScreen> createState() => _RecordAndPlayScreenState();
}

class _RecordAndPlayScreenState extends State<RecordAndPlayScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _recordProvider = Provider.of<RecordAudioProvider>(context);
    final _playProvider = Provider.of<PlayAudioProvider>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          _recordProvider.recordedFilePath.isEmpty ?_recordingSection():_recordingSection(),
          SizedBox(height: 30),
          const Text(
            'Press and hold the button to transmit the sound',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding:  EdgeInsets.only(top: 10.0, bottom: 150.0, left: 35.0, right: 35.0),
            child: Column(
              children: [
                Text(
                  'Please ensure that you are wearing noise cancelling headphones',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 90),
                _recordProvider.recordedFilePath.isEmpty ?_audioPlayingSection():_audioPlayingSection(),
              ],
            ),
          ),
            const SizedBox(height: 40),

        ],
      ),
    );
  }


  _recordingSection() {
    final _recordProvider = Provider.of<RecordAudioProvider>(context);
    final _recordProviderWithoutListener =
    Provider.of<RecordAudioProvider>(context, listen: false);

    if (_recordProvider.isRecording) {
      return InkWell(
        onTap: () async => await _recordProviderWithoutListener.stopRecording(),
        child: RippleAnimation(
          repeat: true,
          color: const Color(0xff3D79FD),
          minRadius: 50,
          ripplesCount: 6,
          child: _commonIconSection(),
        ),
      );
    }

    return InkWell(
      onTap: () async => await _recordProviderWithoutListener.recordVoice(),
      child: _commonIconSection(),
    );
  }

  _commonIconSection() {
    return Padding(
      padding: const EdgeInsets.only(
          right: 15.0,
          left: 15.0,
          top: 0.0,
          bottom: 0.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex:3,
                child: Stack(
                  children:[
                    Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/img_round.png',
                        height: 80,
                        width: 80,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/img_heart.png',
                              height: 25,
                              width: 25,
                            ),
                            const Text(
                              'heart',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child:

                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xff3D79FD),
                    borderRadius: BorderRadius.circular(100),
                  ),


                  child: const Icon(Icons.keyboard_voice_rounded,
                      color: Colors.white, size: 65),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 17.0, right: 17.0),
                  child:TextButton(
                    style: flatButtonStyle,
                    onPressed: (){},
                    child: Text(
                      'Save',
                      style: const TextStyle(
                        color:  Color(0xff3D79FD),
                      ),
                    ),
                  )

                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _audioPlayingSection() {
    final _recordProvider = Provider.of<RecordAudioProvider>(context);
    final _playProvider = Provider.of<PlayAudioProvider>(context);

    Provider.of<PlayAudioProvider>(context, listen: false);

    return Column(
      children: [
        Text(
          'Recording',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15,),
        Container(
          width: MediaQuery.of(context).size.width - 50,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            children: [
              _audioControllingSection(_recordProvider.recordedFilePath),
              _audioProgressSection(),

              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Container(
                  child: GestureDetector(
                    onTap: ()=> _recordingSection(),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: Colors.black,

                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.0,),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Container(
                  child: GestureDetector(
                    onTap: () => _recordProvider.clearOldData(),
                    child: Icon(
                          Icons.delete_sweep_outlined,
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
              SizedBox(width: 5.0,),
              Padding(
                padding: const EdgeInsets.only(right:0.5),
                child: Container(
                  child: GestureDetector(
                    onTap: () {
                      
                    },
                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  _audioControllingSection(String songPath) {
    final _playProvider = Provider.of<PlayAudioProvider>(context);
    final _playProviderWithoutListen =
    Provider.of<PlayAudioProvider>(context, listen: false);

    return IconButton(
      onPressed: () async {
        if (songPath.isEmpty) return;

        await _playProviderWithoutListen.playAudio(File(songPath));
      },
      icon: CircleAvatar(
        maxRadius: 15.0,
        backgroundColor: Colors.black,
        child: Icon(
            _playProvider.isSongPlaying ? Icons.pause : Icons.play_arrow_rounded),
      ),
      color: const Color(0xff3D79FD),
      iconSize: 30,
    );
  }

  _audioProgressSection() {
    final _playProvider = Provider.of<PlayAudioProvider>(context);

    return Expanded(
        child: Container(
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: LinearPercentIndicator(
            percent: _playProvider.currLoadingStatus,
            backgroundColor: Colors.black26,
            progressColor: const Color(0xff071433),
            linearStrokeCap: LinearStrokeCap.roundAll,
          ),
        ));
  }


}




