// import 'package:flutter/material.dart';

import '../general_exports.dart';

//******************* Current App Mode *******************//
//*** change current mode when you want to edit mode ***//

const AppMode currentMode = AppMode.dev;

//******************* ^^^^^^^ *******************//

enum AppMode {
  // Production Mode
  prod,
  // Development Mode
  dev,
}

String currentModeText = currentMode == AppMode.dev ? '-dev' : '';
bool viewLog = currentMode == AppMode.dev;
bool isRTL = false;

void setIsRTL(BuildContext context) => isRTL = Directionality.of(context)
    .toString()
    .contains(TextDirection.rtl.name.toLowerCase());

const String testImage =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHenJrvh8LffllQs65XTRsOP5V6gyw-dK6Ww&usqp=CAU';

int? unReadNotifications = 0;

int toHome = 0;
// int toInvoices = 1;
int toCustomers = 1;
// int toMyCars = 2;
// int toNotifications = 3;
int toMore = 2;

// padding Top Content Screen
double paddingTopScreens = DEVICE_HEIGHT * 0.03;

const double paddingChild = 8.0;
const double paddingFormsCard = 0.026;

const String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

final RegExp capitalLetterPattern = RegExp('[A-Z]');

const String fontFamilyType = 'Careem';
