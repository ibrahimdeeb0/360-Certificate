import '../../../../../general_exports.dart';

class MinorAddNote extends StatelessWidget {
  const MinorAddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Notes',
        withShadow: true,
      ),
      body: CommonContainer(
        style: appContainerStyles.containerStyles,
        paddingTop: 0.02,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CommonText(
                'Add a Notes',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
                fontWeight: FontWeight.bold,
              ),
              CommonContainer(
                borderBottomWidth: 2,
                borderBottomColor: Colors.grey[300],
                marginBottom: 0.02,
                paddingBottom: 0.02,
                child: Column(
                  children: <Widget>[
                    const CommonInput(
                      topLabelText: 'Type',
                      value: 'Private Certificate Note',
                      suffix: Icon(Icons.keyboard_arrow_down),
                    ),
                    const CommonInput(
                      topLabelText: 'Note:',
                      maxLines: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility,
                            color: Color(AppColors.primary),
                          ),
                          label: CommonText(
                            'View',
                            style: appTextStyles.h3BoldStyle(),
                          ),
                        ),
                        CommonContainer(
                          backgroundColor: Colors.grey[400],
                          height: 0.03,
                          width: 0.005,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red[900],
                          ),
                          label: CommonText(
                            'Delete',
                            style: appTextStyles.h3BoldStyle(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*

Column(
            children: <Widget>[
              0.02.boxHeight,
              CommonText(
                'Add a Notes',
                fontColor: AppColors.primary,
                fontSize: fontH2,
                marginBottom: 0.02,
              ),
              CommonText(
                'No Notes are added. Add your first note',
                fontColor: Colors.grey[700],
                marginBottom: 0.1,
              ),
              CommonButton(
                onPress: () {},
                text: 'Add a Note',
              ),
            ],
          ),

*/