import '../../general_exports.dart';

class LicenseDetails extends StatelessWidget {
  const LicenseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Header(
        title: 'License Details',
      ),
      body: CommonContainer(
        style: appContainerStyles.containerStyles,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CommonText(
              'For Electrical Certificates',
              marginTop: 0.03,
              marginBottom: 0.01,
              fontSize: fontH2,
              fontColor: Color(AppColors.primary),
            ),
            CommonContainer(
              style: appContainerStyles.cardStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.info_outline,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 0.75.flexWidth,
                        child: CommonText(
                          "Please note that you won't be able to create Certificates without valid license number   ",
                          fontColor: Colors.grey[600],
                          fontSize: fontH3,
                          textAlign: TextAlign.start,
                          marginLeft: 0.01,
                        ),
                      ),
                    ],
                  ),
                  const CommonText(
                    'License number',
                    marginTop: 0.02,
                    marginBottom: 0.01,
                    fontSize: fontH3,
                  ),
                  SearchWithWooz(
                    searchWithWoozController: SearchWithWoozController(),
                    showJustOneSite: true,
                  ),
                ],
              ),
            ),
            CommonText(
              'For Gas Certificates',
              marginTop: 0.03,
              marginBottom: 0.01,
              fontSize: fontH2,
              fontColor: Color(AppColors.primary),
            ),
            CommonContainer(
              style: appContainerStyles.cardStyle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Icon(
                        Icons.info_outline,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 0.75.flexWidth,
                        child: CommonText(
                          "Please note that you won't be able to create Certificates without valid Gas Safe Register number",
                          fontColor: Colors.grey[600],
                          fontSize: fontH3,
                          textAlign: TextAlign.start,
                          marginLeft: 0.01,
                        ),
                      ),
                    ],
                  ),
                  const CommonText(
                    'Gas Safe Register number',
                    marginTop: 0.02,
                    marginBottom: 0.01,
                    fontSize: fontH3,
                  ),
                  SearchWithWooz(
                    searchWithWoozController: SearchWithWoozController(),
                    showJustOneSite: true,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const CommonButton(
              text: 'Save',
            ),
          ],
        ),
      ),
    );
  }
}
