import 'package:soaurl/app/data/data.dart';

class SettingsService extends GetxService {
  final bool showAd = true;

  Future<SettingsService> init() async {
    print('$runtimeType ready!');
    return this;
  }
}
