import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vesatogo_task/common/back_function.dart';
import 'package:vesatogo_task/pages/drawe_page.dart';
import 'package:vesatogo_task/pages/update_job.dart';
import 'package:vesatogo_task/widget/button_page.dart';

class DescriptionPage extends StatefulWidget {
  var title, applyUrl, companyName, locationName, description, id;

  DescriptionPage(
      {@required this.description,
      @required this.title,
      @required this.applyUrl,
      @required this.companyName,
      @required this.locationName,
      @required this.id});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _selectionScreen();
  }
}

class _selectionScreen extends State<DescriptionPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        drawer: DrawerPage(),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                // color: Colors.black,
                height: height / 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(80)),
                          gradient: LinearGradient(
                              colors: [
                                Colors.deepPurple.shade900,
                                Colors.deepPurple,
                                Colors.deepPurple.shade300
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                      height: height / 3,
                      width: width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   height: height * .02,
                          // ),
                          Text(
                            widget.title.toString(),
                            style: GoogleFonts.abhayaLibre(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: height * .02,
                          ),
                          Text(
                            "Company name:" +
                                " " +
                                widget.companyName.toString(),
                            style: GoogleFonts.abhayaLibre(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: height * .01,
                          ),
                          Text(
                            "Location:" + " " + widget.locationName.toString(),
                            style: GoogleFonts.abhayaLibre(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        right: 100,
                        left: 100,
                        bottom: -30,
                        child: Center(
                            child: Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 70,
                        ))
                        // Container(
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.all(Radius.circular(10)),
                        //       gradient: LinearGradient(
                        //           colors: [
                        //             Colors.purpleAccent,
                        //             Colors.purple,
                        //             Colors.deepPurple,
                        //           ],
                        //           begin: Alignment.topLeft,
                        //           end: Alignment.bottomRight)),
                        //   height: height * .1,
                        //   child: Center(
                        //       child: Icon(
                        //     Icons.star,
                        //     color: Colors.white,
                        //         size: 40,
                        //   )),
                        // ),
                        ),
                    Positioned(
                      child: IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            scaffoldKey.currentState.openDrawer();
                          }),
                      right: 10,
                      top: 10,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                // color: Colors.red,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Text(
                      widget.description.toString(),
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                  ),
                ),
              )),
              Row(
                children: [
                  Expanded(
                    child: MaterialButtonClassPage(
                      height: height * .06,
                      radius: BorderRadius.circular(05),
                      buttonName: "Apply?",
                      onPress: () {
                        launchURL();
                      },
                      color: Colors.purpleAccent.shade700,
                      minwidth: width,
                      fontSize: 14,
                      left: 2,
                      right: 2,
                    ),
                  ),
                  Expanded(
                    child: MaterialButtonClassPage(
                      height: height * .06,
                      radius: BorderRadius.circular(05),
                      buttonName: "Update?",
                      onPress: () {
                        BackFunction.commonNavigator(
                            context,
                            UpdateJob(
                              id: widget.id.toString(),
                              title: widget.title.toString(),
                              description: widget.description.toString(),
                            ));
                      },
                      color: Colors.purpleAccent.shade700,
                      minwidth: width,
                      fontSize: 14,
                      left: 2,
                      right: 2,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  void launchURL() async {
    await canLaunch(widget.applyUrl.toString())
        ? await launch(widget.applyUrl.toString())
        : throw 'Could not launch ${widget.applyUrl.toString()}';
  }
}
