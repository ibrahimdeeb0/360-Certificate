import '../constants/index.dart';

String baseUrl = currentMode == AppMode.dev
    ? 'https://360connect.app/cert_app/api'
    : 'https://go.360connect.app/api/engineers';

// *************** Api body keys ****************

const String apiUserData = 'user_data';
const String fcmToken = 'fcm_token';
const String keyName = 'name';
const String keyEmail = 'email';
const String keyIsRequired = 'is_required';
const String keyDetails = 'description';
const String keyImage = 'image';
const String keyTitle = 'title';
const String keyColor = 'color';
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
const String keyForm = 'form';
const String formKey = 'form_key';
const String keyFormData = 'form_data';
const String keyStatus = 'status';
const String keyRoute = 'route';

// *************** Api request function keys ***************
const String keyRequestFunction = 'requestFunction';
const String keySendOtp = '/send-otp';
const String keyVerifyOtp = '/verify';
const String keyCompleteProfile = '/complete-register';
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
const String keyFormId = 'form_id';
const String keyCertId = 'cert_id';
const String keyCustomerId = 'customer_id';
const String keySiteId = 'site_id';
const String keyTemplateData = 'template_data';
const String keyFormStatus = 'form_status';
const String keyFormDataStatus = 'form_data_status';
const String keyFormRoute = 'form_route';
const String keyNameTemp = 'name_temp';

// *************** Woosmap Keys ***************
const String publicKey = 'woos-5b6fb592-1146-3acf-a259-e3fc6ddd77a4';
const String urlAutocomplete =
    'https://api.woosmap.com/localities/autocomplete';
const String urlDetails = 'https://api.woosmap.com/localities/details';
const String language = 'gb';
const String types = 'postal_code|address|locality';
const String components = '';

const String keySiteName = 'site_name';
const String keyAddress = 'address';
const String keyStreet = 'street';
const String keyCity = 'city';
const String keyState = 'state';
const String keyPostcode = 'postcode';
const String keyCountry = 'country';
const String keyCountryId = 'country_id';

// *************** Forms Names ***************

const String formNamePortableApplianceTesting = 'Portable Appliance Testing';
const String formNameLandlordHomeownerGazSafetyRecord =
    'Landlord/Homeowner Gas Safety Record';
const String formNameMinorElectricalInstallationWorksCert =
    'Minor Electrical Installation Works Cert';
const String formNameElectricalDangerNotification =
    'Electrical Danger Notification';
const String formNameDomesticElectricalInstallationCertificate =
    'Domestic Electrical Installation Certificate';
const String formNameDomesticElectricalInstallationConditionReport =
    'Domestic Electrical installation Condition report';

const String formKeyGazSafetyData = 'gaz_safety_data';
const String formKeyFormData = 'form_data';
const String formKeyFromCertificate = 'from_certificate';
