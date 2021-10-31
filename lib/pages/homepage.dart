import 'package:election_exit_poll_07610585/models/poll_item.dart';
import 'package:election_exit_poll_07610585/pages/poll_page.dart';
import 'package:election_exit_poll_07610585/services/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {
  late Future<List<PollItem>> _pollList;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: const DecorationImage(
            image: const AssetImage("assets/images/bg.png"),
            fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/vote_hand.png",
            height: 150,
            width: 150,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'EXIT POLL',
              style: GoogleFonts.robotoMono(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  color: Colors.grey.shade100
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'เลือกตั้ง อบต.',
              style: GoogleFonts.prompt(
                decoration: TextDecoration.none,
                fontSize: 20,
                color: Colors.grey.shade100
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'รายชื่อผู้สมัครรับเลือกตั้ง\n'
                    'นายกองค์การบริหารส่วนตำบลเขาพระ\n'
                    'อำเภอเมืองนครนายก จังหวัดนครนายก',
              textAlign: TextAlign.center,
              style: GoogleFonts.prompt(
                  decoration: TextDecoration.none,
                  fontSize: 15,
                  color: Colors.grey.shade100,
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      PollPage.routeName,
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                  ),
                  child: Text(
                    'ดูผล',
                    style: GoogleFonts.prompt(
                        decoration: TextDecoration.none,
                        fontSize: 20,
                        color: Colors.grey.shade100
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
