import 'package:flutter/material.dart';
import 'package:mboathoscope/buttons/waveform_button.dart';
import 'package:provider/provider.dart';

import '../providers/recording_provider.dart';

class RecordingList extends StatefulWidget {
  final int? recordNum;

  const RecordingList({super.key, this.recordNum});

  @override
  State<RecordingList> createState() => _RecordingListState();
}

class _RecordingListState extends State<RecordingList> {
  @override
  void initState() {
    super.initState();
    context.read<RecordingProvider>().countFiles();
    context.read<RecordingProvider>().startListening(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    List<String> filesToBePlayed =
        context.watch<RecordingProvider>().filesToBePlayed;
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  left: 18.0,
                ),
                child: Text(
                  'Recordings',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            // height: 300,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  context.watch<RecordingProvider>().filesInFolder.length,
              itemBuilder: (context, index) {
                final item =
                    context.read<RecordingProvider>().filesInFolder[index];

                final audioFile = filesToBePlayed[index];
                return ListTile(
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 70,
                        child: WaveformButton(
                          file: audioFile,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: GestureDetector(
                          onTap: () {
                            null;
                            //to do task
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                       
                        flex: 10,
                        child: IconButton(
                          onPressed: () {
                              context
                            .read<RecordingProvider>()
                            .deleteRecordedFile(audioFile, ()=> setState(() {
                              
                            }));
                          },
                          icon: const Icon(
                            Icons.delete_sweep_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Expanded(
                        flex: 10,
                        child: Icon(
                          Icons.share,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Stack(children: <Widget>[
                          Positioned(
                            child: Image.asset(
                              'assets/images/img_notiblack.png',
                            ),
                          ),
                          const Positioned(
                            top: 0.03,
                            left: 10,
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xff3D79FD),
                              foregroundColor: Colors.white,
                            ), //CircularAvatar
                          ),
                        ]),
                      ),
                    ],
                  ),
                  subtitle: Text(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineSmall,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
