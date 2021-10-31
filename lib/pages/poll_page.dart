import 'package:election_exit_poll_07610585/models/poll_item.dart';
import 'package:election_exit_poll_07610585/services/api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PollPage extends StatefulWidget {
  static const routeName = '/poll_list_page';

  const PollPage({Key? key}) : super(key: key);

  @override
  _PollPageState createState() => _PollPageState();
}

class _PollPageState extends State<PollPage> {

  late Future<List<PollItem>> _pollList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<PollItem>>(
          future: _pollList,
          builder: (context, snapshot){
            if(snapshot.connectionState != ConnectionState.done){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ผิดพลาด :${snapshot.error}',
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _pollList = _loadPoll();
                        });
                      },
                      child: Text(
                        'ลองอีกครั้ง',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            }
            if(snapshot.hasData){
              return ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var pollItem = snapshot.data![index];

                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.all(8.0),
                    elevation: 5.0,
                    shadowColor: Colors.black.withOpacity(0.2),
                    child: InkWell(
                      onTap: () {

                      },
                      child: Row(
                        children: <Widget>[

                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                       '${pollItem.number}',
                                        style: GoogleFonts.prompt(fontSize: 20.0),
                                      ),
                                      Text(
                                        pollItem.title,
                                        style: GoogleFonts.prompt(fontSize: 15.0),
                                      ),
                                      Text(
                                        pollItem.fullname,
                                        style: GoogleFonts.prompt(fontSize: 15.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return SizedBox.shrink();
          }
      ),
    );
  }

  Future<List<PollItem>> _loadPoll() async {
    List list = await Api().fetch('foods');
    var pollList = list.map((item) => PollItem.fromJson(item)).toList();
    return pollList;
  }



  @override
  initState() {
    super.initState();
    _pollList = _loadPoll();

  }
}
