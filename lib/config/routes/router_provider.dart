import 'package:demo_product_clear_architech/main_wrapper.dart';
import 'package:demo_product_clear_architech/presentation/pages/add_page.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/forgot_password/forgot_password_page.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/login/login_page.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/reset_password/reset_password_page.dart';
import 'package:demo_product_clear_architech/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:demo_product_clear_architech/presentation/pages/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class RouterProvider {
  RouterProvider._();
  static final _rootNavigationKey = GlobalKey<NavigatorState>();
  static final _rootNavigationHome =
      GlobalKey<NavigatorState>(debugLabel: "shellHome");
  static final _rootNavigationLogin =
      GlobalKey<NavigatorState>(debugLabel: "shellLogin");

  static String initR = "/home";
  static final GoRouter router = GoRouter(
      initialLocation: initR,
      navigatorKey: _rootNavigationKey,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return MainWrapper(
                navigationShell: navigationShell,
              );
            },
            branches: [
              StatefulShellBranch(navigatorKey: _rootNavigationHome, routes: [
                GoRoute(
                    path: "/home",
                    name: "home",
                    builder: (context, state) {
                      return HomePage(
                        key: state.pageKey,
                      );
                    },
                    routes: [
                      GoRoute(
                          path: "addPage",
                          name: "addPage",
                          builder: (context, state) {
                            return AddPage(
                              key: state.pageKey,
                            );
                          })
                    ])
              ]),
              StatefulShellBranch(
                  initialLocation: "/login",
                  navigatorKey: _rootNavigationLogin,
                  routes: [
                    GoRoute(
                        path: "/login",
                        name: "login",
                        builder: (context, state) {
                          return LoginPage(
                            key: state.pageKey,
                          );
                        },
                        routes: [
                          GoRoute(
                              path: "signUp",
                              name: "signUp",
                              builder: (context, state) {
                                return SignUpPage(
                                  key: state.pageKey,
                                );
                              }),
                          GoRoute(
                              path: "forgotPassword",
                              name: "forgotPassword",
                              builder: (context, state) {
                                return ForgotPasswordPage(
                                  key: state.pageKey,
                                );
                              }),
                        ]),
                    GoRoute(
                        path: "/resetPassword",
                        name: "resetPassword",
                        builder: (context, state) {
                          return ResetPasswordPage(
                            key: state.pageKey,
                          );
                        }),
                  ]),
            ])
      ]);
}
