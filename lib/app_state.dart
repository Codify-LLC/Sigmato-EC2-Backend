import 'package:freedom/backend/document.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _currentFormPageNumber =
        prefs.getInt('ff_currentFormPageNumber') ?? _currentFormPageNumber;
    _currentForm2PageNumber =
        prefs.getInt('ff_currentForm2PageNumber') ?? _currentForm2PageNumber;
    _nationality = prefs.getString('ff_nationality') ?? _nationality;
    _creditCard = prefs.getBool('ff_creditCard') ?? _creditCard;
    _personalLoan = prefs.getBool('ff_personalLoan') ?? _personalLoan;
    _carLoan = prefs.getBool('ff_carLoan') ?? _carLoan;
    _storeCard = prefs.getBool('ff_storeCard') ?? _storeCard;
  }

  late SharedPreferences prefs;

  String OTP = '';

  String phoneNumber = '';

  bool signIn = false;

  String whatAreYouLookingFor = 'Purchase';

  String typeOfAddress = "Current";

  String parentalLeave = "";
  String ownSharesInCompany = "";
  String kindOfEmployee = "";
  bool previousAddress = false;
  bool currentAddress = false;

  bool applicant1occupation = false;
  bool applicant2occupation = false;

  String releaseFromEquity = "";

  String PurchaseOptionSelected = '';

  String RemortgageOptionSelected = '';

  List<Map> creditCardList = [];
  List<Map> personalLoanList = [];
  List<Map> carLoanList = [];
  List<Map> storeCardList = [];

  List<Document> identityDoc = [];
  List<Document> addressProof = [];
  List<Document> bankStatement = [];
  List<Document> employmentSlip = [];

  int _currentFormPageNumber = 1;
  int get currentFormPageNumber => _currentFormPageNumber;
  set currentFormPageNumber(int _value) {
    _currentFormPageNumber = _value;
    prefs.setInt('ff_currentFormPageNumber', _value);
  }

  int _currentForm2PageNumber = 1;
  int get currentForm2PageNumber => _currentForm2PageNumber;
  set currentForm2PageNumber(int _value) {
    _currentForm2PageNumber = _value;
    prefs.setInt('ff_currentFormPage2Number', _value);
  }

  String numberOfApplicants = 'Single Applicant';

  //FORM2
  bool addproperty = false;

  bool Loading = false;

  String _nationality = 'United Kingdom';
  String get nationality => _nationality;
  set nationality(String _value) {
    _nationality = _value;
    prefs.setString('ff_nationality', _value);
  }

  bool? _creditCard;
  bool get creditCard => _creditCard!;
  set creditCard(bool _value) {
    _creditCard = _value;
    prefs.setBool('ff_creditCard', _value);
  }

  bool? _personalLoan;
  bool get personalLoan => _personalLoan!;
  set personalLoan(bool _value) {
    _personalLoan = _value;
    prefs.setBool('ff_personalLoan', _value);
  }

  bool? _carLoan;
  bool get carLoan => _carLoan!;
  set carLoan(bool _value) {
    _carLoan = _value;
    prefs.setBool('ff_carLoan', _value);
  }

  bool? _storeCard;
  bool get storeCard => _storeCard!;
  set storeCard(bool _value) {
    _storeCard = _value;
    prefs.setBool('ff_storeCard', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
