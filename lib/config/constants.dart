// ignore_for_file: constant_identifier_names
import 'package:oddo_fe/config/theme/app_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum Environment { DEV, QA, STG, PROD }

class Constants {
  static AppConfig? _config;
  static bool _isDefined = false;
  static String? _appVersion;
  static String? _builNumber;

  static void setEnvironment(String env) {
    if (_isDefined) {
      return;
    }
    switch (env) {
      case 'dev':
        _config = _configDev();
        break;
      case 'qa':
        _config = _configQa();
        break;
      case 'stg':
        _config = _configStg();
        break;
      case 'prod':
        _config = _configProd();
        break;
      default:
        _config = _configDev();
        break;
    }
    _isDefined = true;
  }

  static Future<void> initPackageInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    _builNumber = packageInfo.buildNumber;
  }

  static String? get appVersion => '$_appVersion+$_builNumber';

  static AppConfig? get appConfig => _config;

  static AppConfig _configDev() {
    return AppConfig(
      env: 'dev',
      baseUrl: 'https://api-dev.rightlife.com',
    );
  }

  static AppConfig _configQa() {
    return AppConfig(
      env: 'qa',
      baseUrl: 'https://qa.rightlife.com/api',
    );
  }

  static AppConfig _configStg() {
    return AppConfig(
      env: 'stg',
      baseUrl: 'https://stage.rightlife.com/api',
    );
  }

  static AppConfig _configProd() {
    return AppConfig(
      env: 'prod',
      baseUrl: 'https://app.rightlife.com/api',
    );
  }
}
