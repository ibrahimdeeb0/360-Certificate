import '../constants/index.dart';

String baseUrl = currentMode == AppMode.dev
    ? 'http://ahm-jer.com/ahm-services/public/api'
    : 'https://production_api';

// *************** Api body keys ****************

const String apiUserData = 'user_data';
const String fcmToken = 'fcm_token';
const String keyName = 'name';
const String keyIsRequired = 'is_required';
const String keyDetails = 'description';
const String keyImage = 'image';
const String keyTitle = 'title';
const String keySubTitle = 'sub_title';
const String keyLatitude = 'latitude';
const String keyLongitude = 'longitude';
const String keyType = 'type';
const String keyTime = 'time';
const String keyId = 'id';
const String keyUrl = 'url';
const String keyData = 'data';
const String keyKey = 'key';
const String keyFcmToken = 'fcm_token';
const String keyIcon = 'icon';
const String keyAttachments = 'attachments';
const String keyMessage = 'message';
const String keyFollowUs = 'follow_us';
const String keyForceUpdate = 'force_update';
const String keyAndroidVersion = 'android_version_number';
const String keyAndroidUrl = 'android_url';
const String keyIosVersion = 'ios_version_number';
const String keyIosUrl = 'ios_url';
const String keyCancel = 'Cancel';
const String keyNeverShowIt = 'never_show_it_again';
const String keyUpdate = 'Update';
const String keyAppShouldBeUpdated = 'You should update the app';
const String keyGoToSettings = 'go_to_settings';
const String keyEnableLocation = 'enable_location';
const String keyAllowLocation = 'allow_location';
const String keyAllowNotification = 'allow_notification';
const String keyOnPress = 'on_press';
const String keyIsSelected = 'is_selected';
const String keyValue = 'value';
const String keyItems = 'items';

// *************** Api request function keys ***************
const String keyRequestFunction = 'requestFunction';
const String keySendOtp = '/send-otp';
const String keyVerifyOtp = '/verify';
const String keyCompleteProfile = '/customer/complete-profile';
const String keyAddNewCar = '/customer/new-car';
const String keyGetCara = '/customer/cars';

// *************** Dialog content ***************
const String keyText = 'text';
const String keyImageUrl = 'image_url';
const String keyNoInternetConnection = 'no_internet_connection';
const String keyNotificationsPermission = 'notifications_permission';
const String keyLocationPermission = 'location_permission';
const String keyEnableLocationService = 'enable_location_service';

// *************** General Keys ***************
const String iconPath = 'icon_path';
const String keyActiveIconColor = 'active_icon_color';
const String keyInActiveIconColor = 'in_active_icon_color';

const String firebaseKeyAhmLong = 'ahm_long';
const String firebaseKeyAhmLat = 'ahm_lat';
const String firebaseKeyCarLong = 'car_long';
const String firebaseKeyCarLat = 'car_lat';
const String firebaseKeyWinchLong = 'winch_long';
const String firebaseKeyWinchLat = 'winch_lat';
const String firebaseKeyIsWinchAcceptTrip = 'is_winch_accept_trip';
const String firebaseKeyIsWinchRejectTrip = 'is_winch_reject_trip';
const String firebaseKeyIsUserAcceptTrip = 'is_user_accept_trip';
const String firebaseKeyIsTripStarted = 'is_trip_started';
const String firebaseKeyIsUserCancelTrip = 'is_user_cancel_trip';
const String firebaseKeyIsUserCancelSearch = 'is_user_cancel_search';

//********** App Keys ***************/
const String keyCarNumber = 'car_num';
const String keyCarFactoryYear = 'car_model';
const String keyCarVin = 'car_vin';
