import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vesatogo_task/common/color_helper.dart';

class ListViewCarf extends StatelessWidget {
  var title;
  var description;

  ListViewCarf({this.title, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: MediaQuery.of(context).size.height * .2,
            color: LightColor.navyBlue1,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  left: -170,
                  top: -170,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: LightColor.lightBlue2,
                  ),
                ),
                Positioned(
                  left: -160,
                  top: -190,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: LightColor.lightBlue1,
                  ),
                ),
                Positioned(
                  right: -170,
                  bottom: -170,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: LightColor.yellow2,
                  ),
                ),
                Positioned(
                  right: -160,
                  bottom: -190,
                  child: CircleAvatar(
                    radius: 130,
                    backgroundColor: LightColor.yellow,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("  " + title.toString(),
                        style: GoogleFonts.poppins(
                            color: LightColor.yellow,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        description.toString(),
                        style: GoogleFonts.muli(
                            textStyle: Theme.of(context).textTheme.display1,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: LightColor.lightGrey),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}