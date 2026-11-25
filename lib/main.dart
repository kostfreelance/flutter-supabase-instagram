import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fsi/core/config/supabase_config.dart';
import 'package:fsi/core/router/app_router.dart';
import 'package:fsi/core/theme/app_theme.dart';
import 'package:fsi/core/widgets/app_screen_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SupabaseConfig.url,
    publishableKey: SupabaseConfig.publishableKey
  );
  runApp(ProviderScope(child: const App()));
}

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
    AppScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_) =>
        MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Supabase Instagram',
          theme: AppTheme.light,
          routerConfig: ref.watch(appRouterProvider)
        )
    );
}
