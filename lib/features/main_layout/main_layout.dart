// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:souqly/core/resources/constants_manager.dart';
// import 'package:souqly/features/cart/presentation/screens/cart_screen.dart';
// import 'package:souqly/features/home/presentation/screens/home_screen.dart';
// import 'package:souqly/features/categories/presentation/screens/categories_screen.dart';
// import 'package:souqly/features/orders/presentation/screens/orders_screen.dart';
// import 'package:souqly/features/profile/presentation/screens/profile_screen.dart';
//
// class MainLayout extends StatefulWidget {
//   const MainLayout({super.key});
//
//   @override
//   State<MainLayout> createState() => _MainLayoutState();
// }
//
// class _MainLayoutState extends State<MainLayout> {
//   int _currentIndex = AppConstants.homeTabIndex;
//
//   final List<Widget> _screens = const [
//     HomeScreen(),
//     CategoriesScreen(),
//     CartScreen(),
//     OrdersScreen(),
//     ProfileScreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppConstants.scaffoldBg,
//       body: IndexedStack(
//         index: _currentIndex,
//         children: _screens,
//       ),
//       bottomNavigationBar: _buildBottomNavBar(),
//     );
//   }
//
//   Widget _buildBottomNavBar() {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppConstants.cardBg,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 16,
//             offset: const Offset(0, -4),
//           ),
//         ],
//       ),
//       child: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               _NavItem(
//                 icon: Icons.home_outlined,
//                 activeIcon: Icons.home_rounded,
//                 label: 'Home',
//                 index: AppConstants.homeTabIndex,
//                 currentIndex: _currentIndex,
//                 onTap: (i) => setState(() => _currentIndex = i),
//               ),
//               _NavItem(
//                 icon: Icons.grid_view_outlined,
//                 activeIcon: Icons.grid_view_rounded,
//                 label: 'Categories',
//                 index: AppConstants.categoriesTabIndex,
//                 currentIndex: _currentIndex,
//                 onTap: (i) => setState(() => _currentIndex = i),
//               ),
//               _CartNavItem(
//                 currentIndex: _currentIndex,
//                 onTap: (i) => setState(() => _currentIndex = i),
//               ),
//               _NavItem(
//                 icon: Icons.receipt_long_outlined,
//                 activeIcon: Icons.receipt_long_rounded,
//                 label: 'Orders',
//                 index: AppConstants.ordersTabIndex,
//                 currentIndex: _currentIndex,
//                 onTap: (i) => setState(() => _currentIndex = i),
//               ),
//               _NavItem(
//                 icon: Icons.person_outline_rounded,
//                 activeIcon: Icons.person_rounded,
//                 label: 'Profile',
//                 index: AppConstants.profileTabIndex,
//                 currentIndex: _currentIndex,
//                 onTap: (i) => setState(() => _currentIndex = i),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class _NavItem extends StatelessWidget {
//   final IconData icon;
//   final IconData activeIcon;
//   final String label;
//   final int index;
//   final int currentIndex;
//   final void Function(int) onTap;
//
//   const _NavItem({
//     required this.icon,
//     required this.activeIcon,
//     required this.label,
//     required this.index,
//     required this.currentIndex,
//     required this.onTap,
//   });
//
//   bool get _isActive => index == currentIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onTap(index),
//       behavior: HitTestBehavior.opaque,
//       child: AnimatedContainer(
//         duration: AppConstants.animationDuration,
//         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
//         decoration: BoxDecoration(
//           color: _isActive
//               ? AppConstants.primaryColor.withOpacity(0.1)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               _isActive ? activeIcon : icon,
//               color: _isActive
//                   ? AppConstants.primaryColor
//                   : AppConstants.textSecondary,
//               size: 22.sp,
//             ),
//             SizedBox(height: 3.h),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 10.sp,
//                 fontWeight:
//                 _isActive ? FontWeight.w600 : FontWeight.w400,
//                 color: _isActive
//                     ? AppConstants.primaryColor
//                     : AppConstants.textSecondary,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class _CartNavItem extends StatelessWidget {
//   final int currentIndex;
//   final void Function(int) onTap;
//
//   const _CartNavItem({
//     required this.currentIndex,
//     required this.onTap,
//   });
//
//   bool get _isActive => AppConstants.cartTabIndex == currentIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => onTap(AppConstants.cartTabIndex),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           AnimatedContainer(
//             duration: AppConstants.animationDuration,
//             width: 48.w,
//             height: 48.w,
//             decoration: BoxDecoration(
//               color: _isActive
//                   ? AppConstants.primaryColor
//                   : AppConstants.primaryColor.withOpacity(0.12),
//               shape: BoxShape.circle,
//               boxShadow: _isActive
//                   ? [
//                 BoxShadow(
//                   color: AppConstants.primaryColor.withOpacity(0.35),
//                   blurRadius: 12,
//                   offset: const Offset(0, 4),
//                 ),
//               ]
//                   : [],
//             ),
//             child: Icon(
//               Icons.shopping_cart_outlined,
//               color: _isActive ? Colors.white : AppConstants.primaryColor,
//               size: 22.sp,
//             ),
//           ),
//           SizedBox(height: 3.h),
//           Text(
//             'Cart',
//             style: TextStyle(
//               fontSize: 10.sp,
//               fontWeight: _isActive ? FontWeight.w600 : FontWeight.w400,
//               color: _isActive
//                   ? AppConstants.primaryColor
//                   : AppConstants.textSecondary,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }