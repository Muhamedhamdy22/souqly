// import 'package:flutter/material.dart';
// import 'package:souqly/core/routes_managers/routes.dart';
// import 'package:souqly/features/auth/presentation/screens/sign_in_screen.dart';
// import 'package:souqly/features/auth/presentation/screens/sign_up_screen.dart';
// import 'package:souqly/features/cart/presentation/screens/cart_screen.dart';
// import 'package:souqly/features/main_layout/main_layout.dart';
// import 'package:souqly/features/products/presentation/screens/products_screen.dart';
// import 'package:souqly/features/product_details/presentation/screens/product_details_screen.dart';
//
// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.signInRoute:
//         return MaterialPageRoute(builder: (_) => SignInScreen());
//
//       case Routes.signUpRoute:
//         return MaterialPageRoute(builder: (_) => SignUpScreen());
//
//       case Routes.mainRoute:
//         return MaterialPageRoute(builder: (_) => const MainLayout());
//
//       case Routes.cartRoute:
//         return MaterialPageRoute(builder: (_) => const CartScreen());
//
//       case Routes.productsScreenRoute:
//         {
//           final catId = settings.arguments as String;
//           return MaterialPageRoute(
//             builder: (_) => ProductsScreen(catId: catId),
//           );
//         }
//
//       case Routes.productDetails:
//         {
//           final product = settings.arguments as ProductModel;
//           return MaterialPageRoute(
//             builder: (_) => ProductDetailsScreen(product: product),
//           );
//         }
//
//       default:
//         return unDefinedRoute();
//     }
//   }
//
//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(
//         appBar: AppBar(
//           title: const Text('No Route Found'),
//         ),
//         body: const Center(
//           child: Text('No Route Found'),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:souqly/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:souqly/features/main_layout/main_layout.dart';
import 'package:souqly/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:souqly/features/products/presentation/screens/products_screen.dart';
// import 'package:souqly/features/cart/presentation/screens/cart_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        {
          final catId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => ProductsScreen(catId: catId),
          );
        }

      case Routes.productDetails:
        {
          final product = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product),
          );
        }

      case Routes.cartRoute:
      // return MaterialPageRoute(builder: (_) => const CartScreen());
        return unDefinedRoute();

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      ),
    );
  }
}