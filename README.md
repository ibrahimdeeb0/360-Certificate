# 360 Certificate

To build dev version you have to do::

1- change bundle name in all app

    from "com.app.certificate360" to "com.app.certificate360dev"

2- change app icon from pubSpec.yaml to production icon call 'launcher_debug_icon' then run this command `flutter pub run flutter_launcher_icons:main`

3- change `development` to `true` from `general_constants`

4- run this command to build apk dev version `flutter build apk --release`

# -------

To build production version you have to do::

1- change bundle name in all app

    from "com.app.certificate360dev" to "com.app.certificate360"

2- change app icon from pubSpec.yaml to production icon call 'launcher_icon' then run this command `flutter pub run flutter_launcher_icons:main`

3- change `development` to `false` from `general_constants`

4- run this command to build apk production version `flutter build apk --release`
or run this to build aap `flutter build appbundle`
