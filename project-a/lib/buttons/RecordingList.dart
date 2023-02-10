import 'package:flutter/material.dart';
import 'package:mboathoscope/buttons/WaveformButton.dart';

class RecordingList extends StatelessWidget {
  //final List<ListItem> items;

  const RecordingList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 230,
          child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  //final item = items[index];
                  return ListTile(
                    title: Row(
                      children: <Widget>[
                        const Expanded(
                          flex: 70,
                          child: WaveformButton(),
                        ),
                         Expanded(
                          flex: 10,
                          child: GestureDetector(
                            onTap: (){
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
                          child: Stack(
                            children: <Widget>[
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
                            ]
                          ),
                        ),
                      ],
                    ),
                    subtitle: const Text("Recording 1"),
                  );
                },
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