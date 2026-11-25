import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fsi/features/auth/presentation/screens/login_screen.dart';
import 'package:fsi/features/auth/presentation/screens/register_screen.dart';
import 'package:fsi/features/post/presentation/screens/post_list_screen.dart';
import 'package:fsi/features/post/presentation/screens/post_detail_screen.dart';
import 'package:fsi/features/post/presentation/screens/post_add_screen.dart';
import 'package:fsi/features/profile/presentation/screens/profile_list_screen.dart';
import 'package:fsi/features/profile/presentation/screens/profile_detail_screen.dart';
import 'package:fsi/features/profile/presentation/screens/profile_edit_screen.dart';
import 'package:fsi/features/chat/presentation/screens/chat_list_screen.dart';
import 'package:fsi/features/chat/presentation/screens/chat_detail_screen.dart';
import 'package:fsi/features/follow/presentation/screens/following_screen.dart';
import 'package:fsi/features/follow/presentation/screens/followers_screen.dart';
import 'package:fsi/features/comment/presentation/screens/comments_screen.dart';
import '../providers/supabase_provider.dart';
import '../widgets/app_tabs.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  final supabaseClient = ref.watch(supabaseClientProvider);
  List<RouteBase> nestedRotes = [
    AppRoute(
      path: '${PostDetailScreen.path}/:postId',
      builder: (_, state) =>
        PostDetailScreen(postId: state.pathParameters['postId']!)
    ),
    AppRoute(
      path: '${ProfileDetailScreen.path}/:profileId',
      builder: (_, state) =>
        ProfileDetailScreen(profileId: state.pathParameters['profileId']!)
    ),
    AppRoute(
      path: '${ProfileEditScreen.path}/:profileId',
      builder: (_, state) =>
        ProfileEditScreen(profileId: state.pathParameters['profileId']!)
    ),
    AppRoute(
      path: '${FollowingScreen.path}/:profileId',
      builder: (_, state) =>
        FollowingScreen(profileId: state.pathParameters['profileId']!)
    ),
    AppRoute(
      path: '${FollowersScreen.path}/:profileId',
      builder: (_, state) =>
        FollowersScreen(profileId: state.pathParameters['profileId']!)
    ),
    AppRoute(
      path: '${CommentsScreen.path}/:postId',
      builder: (_, state) =>
        CommentsScreen(postId: state.pathParameters['postId']!)
    ),
    AppRoute(
      path: '${ChatDetailScreen.path}/:profileId',
      builder: (_, state) =>
        ChatDetailScreen(profileId: state.pathParameters['profileId']!)
    )
  ];
  return GoRouter(
    initialLocation: supabaseClient.auth.currentSession != null ?
      PostListScreen.path : LoginScreen.path,
    refreshListenable: _GoRouterRefreshStream(supabaseClient.auth.onAuthStateChange),
    redirect: (_, state) {
      if (
        supabaseClient.auth.currentSession == null &&
        ![LoginScreen.path, RegisterScreen.path].contains(state.matchedLocation)
      ) {
        return LoginScreen.path;
      }
      return null;
    },
    routes: [
      AppRoute(
        path: LoginScreen.path,
        builder: (_, _) =>
          const LoginScreen()
      ),
      AppRoute(
        path: RegisterScreen.path,
        builder: (_, _) =>
          const RegisterScreen()
      ),
      AppRoute(
        path: PostAddScreen.path,
        builder: (_, state) =>
          PostAddScreen(
            fileType: state.uri.queryParameters['fileType']!,
            filePath: Uri.decodeComponent(state.uri.queryParameters['filePath']!)
          )
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, _, navigationShell) =>
          AppTabs(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              AppRoute(
                path: PostListScreen.path,
                builder: (_, _) =>
                  const PostListScreen(),
                routes: nestedRotes
              )
            ]
          ),
          StatefulShellBranch(
            routes: [
              AppRoute(
                path: ProfileListScreen.path,
                builder: (_, _) =>
                  const ProfileListScreen(),
                routes: nestedRotes
              )
            ]
          ),
          StatefulShellBranch(
            routes: [
              AppRoute(
                path: ChatListScreen.path,
                builder: (_, _) =>
                  const ChatListScreen(),
                routes: nestedRotes
              )
            ]
          ),
          StatefulShellBranch(
            routes: [
              AppRoute(
                path: '/${ProfileDetailScreen.path}',
                builder: (_, _) =>
                  const ProfileDetailScreen(),
                routes: nestedRotes
              )
            ]
          )
        ]
      )
    ]
  );
}

class AppRoute extends GoRoute {
  AppRoute({
    required super.path,
    required Widget Function(BuildContext, GoRouterState) builder,
    super.routes
  }) : super(
    pageBuilder: (context, state) =>
      CustomTransitionPage(
        key: state.pageKey,
        opaque: false,
        child: builder(context, state),
        transitionsBuilder: (_, a1, a2, child) =>
          CupertinoPageTransition(
            primaryRouteAnimation: a1,
            secondaryRouteAnimation: a2,
            linearTransition: false,
            child: child
          )
      )
  );
}

extension AppRouterBuildContext on BuildContext {
  String get rootPath {
    final currentPath = GoRouterState.of(this).matchedLocation;
    final segments = currentPath.split('/').where((s) => s.isNotEmpty).toList();
    return '/${segments.first}';
  }
}

class _GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _sub;

  _GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _sub = stream.listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}