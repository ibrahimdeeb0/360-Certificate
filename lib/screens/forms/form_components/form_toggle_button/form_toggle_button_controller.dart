import '../../../../general_exports.dart';

enum FormToggleType {
  yesNoNA,
  passFailedNA,
  passFailed,
  trueFalse,
  multi,
  yesNo,
  trueFalseOnly,
  statTest,
  installation,
  gasTypeNatural,
}

class FormToggleButtonController extends GetxController {
  FormToggleButtonController({
    this.currentValue,
    this.toggleType,
  });

  String? currentValue;

  FormToggleType? toggleType;

  void onChangeCurrentValue() {
    if (toggleType == FormToggleType.yesNo) {
      // typing here code
      switch (currentValue) {
        case 'YES':
          currentValue = 'NO';

          break;

        case 'NO':
          currentValue = 'YES';

          break;

        default:
          currentValue = 'YES';

          break;
      }
    } else if (toggleType == FormToggleType.yesNoNA) {
      // typing here code
      switch (currentValue) {
        case 'N/A':
          currentValue = 'YES';

          break;
        case 'YES':
          currentValue = 'NO';

          break;

        case 'NO':
          currentValue = 'N/A';

          break;

        default:
          currentValue = 'N/A';

          break;
      }
    } else if (toggleType == FormToggleType.passFailed) {
      // typing here code
      switch (currentValue) {
        case 'PASSED':
          currentValue = 'FAILED';

          break;

        case 'FAILED':
          currentValue = 'PASSED';

          break;

        default:
          currentValue = 'PASSED';

          break;
      }
    } else if (toggleType == FormToggleType.passFailedNA) {
      // typing here code
      switch (currentValue) {
        case 'N/A':
          currentValue = 'PASS';

          break;
        case 'PASS':
          currentValue = 'FAILED';

          break;

        case 'FAILED':
          currentValue = 'N/A';

          break;

        default:
          currentValue = 'N/A';

          break;
      }
    } else if (toggleType == FormToggleType.trueFalse) {
      // typing here code
      switch (currentValue) {
        case 'N/A':
          currentValue = 'True';

          break;
        case 'True':
          currentValue = 'False';

          break;
        case 'False':
          currentValue = 'LIM';

          break;

        case 'LIM':
          currentValue = 'N/V';

          break;
        case 'N/V':
          currentValue = 'N/A';

          break;

        default:
          currentValue = 'N/A';

          break;
      }
    } else if (toggleType == FormToggleType.multi) {
      // typing here code
      switch (currentValue) {
        case 'N/A':
          currentValue = 'True';

          break;
        case 'True':
          currentValue = 'False';

          break;
        case 'False':
          currentValue = 'C1';

          break;

        case 'C1':
          currentValue = 'C2';

          break;
        case 'C2':
          currentValue = 'C3';

          break;
        case 'C3':
          currentValue = 'N/V';

          break;
        case 'N/V':
          currentValue = 'LIM';

          break;
        case 'LIM':
          currentValue = 'N/A';

          break;

        default:
          currentValue = 'N/A';

          break;
      }
    } else if (toggleType == FormToggleType.trueFalseOnly) {
      // typing here code
      switch (currentValue) {
        case 'True':
          currentValue = 'False';

          break;
        case 'False':
          currentValue = 'True';

          break;
        default:
          currentValue = 'False';
          break;
      }

      consoleLog(currentValue);
    } else if (toggleType == FormToggleType.statTest) {
      // typing here code
      switch (currentValue) {
        case 'N/A':
          currentValue = 'P';

          break;
        case 'P':
          currentValue = 'H';

          break;

        case 'H':
          currentValue = 'N/A';

          break;

        default:
          currentValue = 'N/A';

          break;
      }
    } else if (toggleType == FormToggleType.installation) {
      // typing here code
      switch (currentValue) {
        case 'N/A':
          currentValue = 'N';

          break;
        case 'N':
          currentValue = 'NE';

          break;

        case 'NE':
          currentValue = 'E';

          break;
        case 'E':
          currentValue = 'N/E';

          break;

        default:
          currentValue = 'N/A';

          break;
      }
    } else if (toggleType == FormToggleType.gasTypeNatural) {
      // typing here code
      switch (currentValue) {
        case 'N/A':
          currentValue = 'NG';

          break;
        case 'NG':
          currentValue = 'LPG';

          break;

        case 'LPG':
          currentValue = 'N/A';

          break;
        default:
          currentValue = 'N/A';

          break;
      }
    }
    update();
  }
}
