import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mboathoscope/buttons/WaveformButton.dart';
import 'package:mboathoscope/providers/recording_provider.dart';
import 'package:mboathoscope/utils/record_util.dart';
import 'package:path/path.dart';

class RecordingList extends ConsumerStatefulWidget {
  const RecordingList({
    super.key,
  });

  @override
  ConsumerState<RecordingList> createState() => _RecordingListState();
}

class _RecordingListState extends ConsumerState<RecordingList> {
  Future<List<FileSystemEntity>>? recordigs;

  @override
  void initState() {
    recordigs = RecordUtil.getRecordigs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final refresh = ref.watch(refleshRecordingList);
    if(refresh['refreshlist']!){
      recordigs=RecordUtil.getRecordigs();
    }
    return SizedBox(
        height: 230,
        child: FutureBuilder<List<FileSystemEntity>>(
          future: recordigs,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Please wait"),
              );
            }
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No recordigs"),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                //final item = items[index];
                return ListTile(
                  title: Row(
                    children: <Widget>[
                       Expanded(
                        flex: 70,
                        child: WaveformButton(recordPath: snapshot.data![index].path,),
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
                      const Expanded(
                        flex: 10,
                        child: Icon(
                          Icons.delete_sweep_outlined,
                          color: Colors.black,
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
                  subtitle:  Text(basename(snapshot.data![0].path)),
                );
              },
            );
          },
        ));
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
