import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ValidationData {
  static String nameValidator(String fullName) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return 'Please enter name';
    } else if (!regExp.hasMatch(fullName)) {
      return 'Please enter valid name';
    }
    return null;
  }

  static String descValidator(String fullName) {
    // String patttern = r'^[A-Z a-z 0-9,.\-]+$';
    // RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return 'Please enter description';
    } else if (fullName.length < 6) {
      return 'Please enter valid description';
    }
    return null;
  }

  static String emailValidator(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Please enter email";
    } else if (!regExp.hasMatch(value)) {
      return "Please enter valid email";
    } else {
      return null;
    }
  }

  static String passwordValidator(String value) {
    if (value.length == 0) {
      return "Please enter password";
    } else if (value.length < 6) {
      return "Password must be greater than 6 characters";
    } else {
      return null;
    }
  }



  static String tokenValidator(String value) {
    if (value.length == 0) {
      return "Please enter birth date";
    } else if (value.length < 1) {
      return "Please select proper date";
    } else {
      return null;
    }
  }

  static String mobileValidator(String value) {
    // String patttern = r'(^^(?:[+0]6)?[0-6]{10}$)';
    // RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (value.length < 5) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static String addressValidator(String fullName) {
    // String patttern = r'^[A-Z a-z 0-9,.\-]+$';
    // RegExp regExp = new RegExp(patttern);
    // if (fullName.length == 0) {
    //   return 'Please enter address';
    // } else if (!regExp.hasMatch(fullName)) {
    //   return 'Please enter valid address';
    // }
    // return null;

    if (fullName.length == 0) {
      return 'Please enter address';
    } else if (fullName.length < 3) {
      return 'Please enter valid address';
    } else {
      return null;
    }
  }

  static String urlValidator(String fullName) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return 'Please enter url';
    } else if (!regExp.hasMatch(fullName)) {
      return 'Please enter valid url';
    }
    return null;
  }

  static String stateValidator(String fullName) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return 'Please enter state name';
    } else if (!regExp.hasMatch(fullName)) {
      return 'Please enter valid state name';
    }
    return null;
  }

  static String countryValidator(String fullName) {
    String patttern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = new RegExp(patttern);
    if (fullName.length == 0) {
      return 'Please enter country name';
    } else if (!regExp.hasMatch(fullName)) {
      return 'Please enter valid country name';
    }
    return null;
  }

  static String zipValidator(String fullName) {
    if (fullName.length == 0) {
      return "Please enter post code";
    } else if (fullName.length < 3) {
      return "Please enter valid post code";
    } else {
      return null;
    }
  }

  static String eduDetails(String fullName) {
    if (fullName.length == 0) {
      return "Please enter educational details";
    } else if (fullName.length < 3) {
      return "Please enter valid educational details";
    } else {
      return null;
    }
  }

  static String profileDescriptionDetails(String fullName) {
    if (fullName.length == 0) {
      return "Please enter about you";
    } else if (fullName.length < 3) {
      return "Please enter valid description about you";
    } else {
      return null;
    }
  }

  static String profCard(String fullName) {
    if (fullName.length == 0) {
      return "Please enter professional card details";
    } else if (fullName.length < 3) {
      return "Please enter valid professional card details";
    } else {
      return null;
    }
  }

  static String maxRad(String fullName) {
    if (fullName.length == 0) {
      return "Please enter maximum radius";
    } else if (fullName.length < 2) {
      return "Please enter valid  maximum radius";
    } else {
      return null;
    }
  }

  static String bankDetails(String fullName) {
    if (fullName.length == 0) {
      return "Please enter bank account number";
    } else if (fullName.length < 9) {
      return "Please enter valid  bank account number";
    } else {
      return null;
    }
  }

  static String enterAmount(String fullName) {
    if (fullName.length == 0) {
      return "Please enter amount";
    } else if (fullName.length < 1) {
      return "Please enter valid amount";
    } else {
      return null;
    }
  }

  static String rejectionReasonAmount(String fullName) {
    if (fullName.length == 0) {
      return "Please rejection reason";
    } else if (fullName.length < 3) {
      return "Please enter valid rejection reason";
    } else {
      return null;
    }
  }

  // static String dateValidation(String fullName) {
  //   if (fullName.length == 0) {
  //     return "Please enter bank account number";
  //   } else if (fullName.length < 9) {
  //     return "Please enter valid  bank account number";
  //   } else {
  //     return null;
  //   }
  // }

  static String otpValidator(String value) {
    if (value.length == 0) {
      return "Please enter date";
    } else {
      return null;
    }
  }

  static bool autoValidate = false;
  static final GlobalKey<FormState> formKeyValidate = GlobalKey<FormState>();
  static final scaffoldKey = GlobalKey<ScaffoldState>();

  static final GlobalKey<ScaffoldState> forgetPasswordScaffoldKey =
      new GlobalKey<ScaffoldState>();
  static bool forgetPasswordautoValidate = false;
  static final GlobalKey<FormState> forgetPasswordformKeyValidate =
      GlobalKey<FormState>();

  static final GlobalKey<ScaffoldState> signInscaffoldKey =
      new GlobalKey<ScaffoldState>();
  static bool signinautoValidate = false;
  static final GlobalKey<FormState> signinformKeyValidate =
      GlobalKey<FormState>();

  static customToast(
      var message, Color bgColor, Color textColor, ToastGravity gravity) {
    return Fluttertoast.showToast(
        timeInSecForIosWeb: 2,
        msg: message,
        backgroundColor: bgColor,
        textColor: textColor,
        gravity: gravity);
  }
}
