import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:contributors_ui/contributors_ui.dart';

void main() {
  const MethodChannel channel = MethodChannel('contributors_ui');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ContributorsUi.platformVersion, '42');
  });
}
