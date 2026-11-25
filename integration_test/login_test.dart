import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fsi/main.dart' as app;
import 'package:fsi/core/widgets/app_snack_bar.dart';

void test() => group('LOGIN', () {
  testWidgets('all cases', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    Finder loginEmailTextField = find.byKey(const Key('login_email_textfield'));
    Finder loginPasswordTextField = find.byKey(const Key('login_password_textfield'));
    Finder loginButton = find.byKey(const Key('login_button'));
    Finder errorSnackbar = find.byKey(AppSnackBarType.error.key);
    expect(loginEmailTextField, findsOneWidget);
    expect(loginPasswordTextField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    await tester.enterText(loginEmailTextField, 'nonexistent@gmail.com');
    await tester.enterText(loginPasswordTextField, 'nonexistent');
    await tester.pumpAndSettle();
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    expect(errorSnackbar, findsOneWidget);
    expect(find.textContaining('invalid_credentials'), findsOneWidget);
    await tester.pump(AppSnackBar.duration);
    await tester.pumpAndSettle();

    await tester.enterText(loginEmailTextField, 'demo1@gmail.com');
    await tester.enterText(loginPasswordTextField, 'wrongpassword');
    await tester.pumpAndSettle();
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    expect(errorSnackbar, findsOneWidget);
    expect(find.textContaining('invalid_credentials'), findsOneWidget);
    await tester.pump(AppSnackBar.duration);
    await tester.pumpAndSettle();
    
    await tester.enterText(loginEmailTextField, 'demo1@gmail.com');
    await tester.enterText(loginPasswordTextField, 'demodemo');
    await tester.pumpAndSettle();
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    expect(errorSnackbar, findsNothing);
    expect(loginEmailTextField, findsNothing);
  });
});