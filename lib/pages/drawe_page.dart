import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vesatogo_task/common/back_function.dart';
import 'package:vesatogo_task/common/color_helper.dart';
import 'package:vesatogo_task/main.dart';
import 'package:vesatogo_task/pages/listview_page.dart';
import 'package:vesatogo_task/pages/post_job.dart';

class DrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _selectionScreen();
  }
}

class _selectionScreen extends State<DrawerPage> {
  void launchURL(var url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          Card(
              child: Container(
// height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.04,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                      "https://cdn1.iconfinder.com/data/icons/business-users/512/circle-512.png"),
                  backgroundColor: LightColor.grey,
                ),
                Container(
                  height: height * 0.02,
                ),
                Text(
                  "Domas Bitvinskas",
                  style: GoogleFonts.montserrat(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                FlatButton(
                  onPressed: () {
                    launchURL("https://graphql.jobs/");
                  },
                  child: Text(
                    "Checkout my Work",
                    style: GoogleFonts.montserrat(fontSize: 14),
                  ),
                ),
                Container(
                  height: height * 0.02,
                ),
              ],
            ),
          )),
          ListTile(
            leading: Icon(Icons.home_repair_service),
            title: Text(
              "All Jobs",
              style: GoogleFonts.montserrat(fontSize: 15),
            ),
            onTap: () {
              BackFunction.commonNavigator(context, MyApp());
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box_rounded),
            title: Text(
              "Post Job",
              style: GoogleFonts.montserrat(fontSize: 15),
            ),
            onTap: () {
              BackFunction.commonNavigator(
                  context,
                  PostJobs(
                    fromPage: "Drawer_page",
                  ));
            },
          ),
        ],
      ),
    );
  }
}
