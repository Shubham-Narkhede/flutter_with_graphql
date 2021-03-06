import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:vesatogo_task/common/back_function.dart';
import 'package:vesatogo_task/common/color_helper.dart';
import 'package:vesatogo_task/common/controller_data.dart';
import 'package:vesatogo_task/common/validation_data.dart';
import 'package:vesatogo_task/network/graphql_data.dart';
import 'package:vesatogo_task/pages/drawe_page.dart';
import 'package:vesatogo_task/pages/listview_page.dart';
import 'package:vesatogo_task/widget/button_page.dart';
import 'package:vesatogo_task/widget/custom_textinputdata.dart';

class UpdateJob extends StatefulWidget {
  var id, description, title;

  UpdateJob(
      {@required this.id, @required this.description, @required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _selectionScreen();
  }
}

class _selectionScreen extends State<UpdateJob> {
  @override
  void initState() {
    AllControllers.profileDescController =
        TextEditingController(text: widget.description.toString());
    AllControllers.nameController =
        TextEditingController(text: widget.title.toString());
    // TODO: implement initState
    super.initState();
  }

  bool postjobautoValidate = false;
  final GlobalKey<FormState> postjobformKeyValidate = GlobalKey<FormState>();
  final postjobscaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: postjobscaffoldKey,
        drawer: DrawerPage(),
        body: SafeArea(
            child: Form(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * .1,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(80)),
                        gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple.shade900,
                              Colors.deepPurple,
                              Colors.deepPurple.shade300
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Center(
                      child: Text(
                        "Update Job",
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          postjobscaffoldKey.currentState.openDrawer();
                        }),
                    right: 10,
                    top: 10,
                  )
                ],
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                        onTap: () {
                          ValidationData.customToast(
                              "You only change Description of job!",
                              Colors.red,
                              Colors.white,
                              ToastGravity.BOTTOM);
                        },
                        child: AbsorbPointer(
                          absorbing: true,
                          child: Padding(
                            child: CustomTextInputData(
                              onChanged: () {},
                              title: "Job Title:",
                              hintText: "Job Title",
                              textEditingController:
                                  AllControllers.nameController,
                              formFieldValidator: ValidationData.nameValidator,
                              textInputType: TextInputType.text,
                              textCapitalization: TextCapitalization.words,
                              obsecureText: false,
                              filledColor: LightColor.grey,
                              fill: false,
                              enabledborderColor: Colors.black12,
                              input_text_color: Colors.black,
                              titleColor: Colors.black,
                              hint_text_color: Colors.black45,
                              error_text_color: Colors.black54,
                              content_padding: 15,
                              borderColor: Colors.black,
                              blurRadius: 2,
                              spreadRadius: 2,
                              right: 20,
                              left: 20,
                              dy: 2,
                              dx: 2,
                              maxline: 1,
                            ),
                            padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                          ),
                        )),
                    Padding(
                      child: CustomTextInputData(
                        onChanged: () {},
                        title: "Description:",
                        hintText: "Description",
                        textEditingController:
                            AllControllers.profileDescController,
                        formFieldValidator: ValidationData.descValidator,
                        textInputType: TextInputType.text,
                        textCapitalization: TextCapitalization.sentences,
                        obsecureText: false,
                        filledColor: LightColor.grey,
                        fill: false,
                        enabledborderColor: Colors.black12,
                        input_text_color: Colors.black,
                        titleColor: Colors.black,
                        hint_text_color: Colors.black45,
                        error_text_color: Colors.black54,
                        content_padding: 15,
                        borderColor: Colors.black,
                        blurRadius: 2,
                        spreadRadius: 2,
                        right: 20,
                        left: 20,
                        dy: 2,
                        dx: 2,
                        maxline: 3,
                      ),
                      padding: EdgeInsets.only(left: 7, right: 7, top: 9),
                    ),
                    Container(
                      height: height * .05,
                    ),
                    MaterialButtonClassPage(
                      height: height * .06,
                      radius: BorderRadius.circular(05),
                      buttonName: "Submit",
                      onPress: () {
                        validateInputs();
                        showSnakbar();
                      },
                      color: Colors.purpleAccent.shade700,
                      minwidth: width,
                      fontSize: 14,
                      left: 25,
                      right: 25,
                    ),
                    Container(
                      height: height * .05,
                    ),
                  ],
                ),
              ))
            ],
          ),
          autovalidate: postjobautoValidate,
          key: postjobformKeyValidate,
        )));
  }

  void validateInputs() {
    if (postjobformKeyValidate.currentState.validate()) {
      setState(() {
        postjobformKeyValidate.currentState.save();
        addJobData();
      });
    } else {
      setState(() {
        postjobautoValidate = true;
        hideSnakbar();
      });
    }
  }

  Future addJobData() async {
    GraphQLClient client = clientToQuery();
    QueryResult result = await client.mutate(
      MutationOptions(
        document: updateJob(
            AllControllers.profileDescController.text.toString(),
            widget.id.toString()),
      ),
    );
    if (result.exception == null) {
      ValidationData.customToast(
          "Success!", Colors.white, Colors.black, ToastGravity.CENTER);
      AllControllers.profileDescController.clear();
      hideSnakbar();
    } else {
      hideSnakbar();
      ValidationData.customToast(result.exception.toString(), Colors.red,
          Colors.white, ToastGravity.CENTER);
    }
  }

  showSnakbar() {
    postjobscaffoldKey.currentState.showSnackBar(new SnackBar(
        backgroundColor: Colors.black26,
        content: Row(
          children: [
            CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              backgroundColor: Colors.black87,
            ),
            SizedBox(
              height: 0,
              width: 20,
            ),
            Text(
              "Validating Data...",
              style: GoogleFonts.roboto(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        )));
  }

  hideSnakbar() {
    postjobscaffoldKey.currentState.hideCurrentSnackBar();
  }
}
