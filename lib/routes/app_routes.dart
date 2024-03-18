import 'package:mindweave/presentation/splash_screen/splash_screen.dart';
import 'package:mindweave/presentation/splash_screen/binding/iphone_13_pro_max_one_binding.dart';
import 'package:mindweave/presentation/get_started_screen/get_started_screen.dart';
import 'package:mindweave/presentation/get_started_screen/binding/get_started_binding.dart';
import 'package:mindweave/presentation/continue_sign_in_screen/continue_sign_in_screen.dart';
import 'package:mindweave/presentation/continue_sign_in_screen/binding/sign_up_binding.dart';
import 'package:mindweave/presentation/bottom_nav/bottom_nav.dart';
import 'package:mindweave/presentation/bottom_nav/binding/discover_container_binding.dart';
import 'package:mindweave/presentation/prompt_screen/prompt_screen.dart';
import 'package:mindweave/presentation/prompt_screen/binding/prompt_binding.dart';
import 'package:mindweave/presentation/login_screen/login_screen.dart';
import 'package:mindweave/presentation/login_screen/binding/login_binding.dart';
import 'package:mindweave/presentation/register_screen/register_screen.dart';
import 'package:mindweave/presentation/register_screen/binding/register_binding.dart';
import 'package:mindweave/presentation/profile_screen/profile_screen.dart';
import 'package:mindweave/presentation/profile_screen/binding/profile_binding.dart';
import 'package:mindweave/presentation/payment/payment_two_screen.dart';
import 'package:mindweave/presentation/payment/binding/payment_two_binding.dart';
import 'package:get/get.dart';

import '../presentation/Home_page/home_page.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';

  static const String getStartedScreen = '/get_started_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String discoverPage = '/discover_page';

  static const String bottomNav = '/discover_container_screen';

  static const String promptScreen = '/prompt_screen';

  static const String loginScreen = '/login_screen';

  static const String registerScreen = '/register_screen';

  static const String profileScreen = '/profile_screen';

  static const String paymentTwoScreen = '/payment_two_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: discoverPage,
      page: () => HomePage(),
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      bindings: [
        Iphone13ProMaxOneBinding(),
      ],
    ),
    GetPage(
      name: getStartedScreen,
      page: () => GetStartedScreen(),
      bindings: [
        GetStartedBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => ContinueSignInScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: bottomNav,
      page: () => BottomNav(),
      bindings: [
        DiscoverContainerBinding(),
      ],
    ),
    GetPage(
      name: promptScreen,
      page: () => PromptScreen(),
      bindings: [
        PromptBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterScreen(),
      bindings: [
        RegisterBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => ProfileScreen(),
      bindings: [
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: paymentTwoScreen,
      page: () => PaymentTwoScreen(),
      bindings: [
        PaymentTwoBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        Iphone13ProMaxOneBinding(),
      ],
    )
  ];
}
