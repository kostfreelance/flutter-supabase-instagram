import 'package:integration_test/integration_test.dart';
import 'login_test.dart' as login;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  login.test();
}