import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._(); // prevent instantiation

  // -------------------------------------------------------------------------
  // API
  // -------------------------------------------------------------------------
  static const String baseUrl = "http://192.168.1.5:8000/api/";
  static const String storageUrl = "http://192.168.1.5:8000";

  // -------------------------------------------------------------------------
  // Shared Preferences Keys
  // -------------------------------------------------------------------------
  static const String tokenKey = "token";
  static const String userIdKey = "userId";
  static const String isLoggedInKey = "isLoggedIn";
  static const String cartCountKey = "cartCount";

  // -------------------------------------------------------------------------
  // Strings – General
  // -------------------------------------------------------------------------
  static const String appName = "Souqly";
  static const String currency = "EGP";
  static const String searchHint = "Search for products...";
  static const String noInternet = "No internet connection";
  static const String somethingWentWrong = "Something went wrong, try again";

  // -------------------------------------------------------------------------
  // Strings – Auth
  // -------------------------------------------------------------------------
  static const String signIn = "Sign In";
  static const String signUp = "Sign Up";
  static const String logout = "Logout";
  static const String forgotPassword = "Forgot password?";
  static const String email = "Email";
  static const String password = "Password";
  static const String confirmPassword = "Confirm Password";
  static const String fullName = "Full Name";
  static const String phone = "Phone";
  static const String dontHaveAccount = "Don't have an account? ";
  static const String alreadyHaveAccount = "Already have an account? ";

  // -------------------------------------------------------------------------
  // Strings – Home
  // -------------------------------------------------------------------------
  static const String categories = "Categories";
  static const String featuredProducts = "Featured Products";
  static const String bestSellers = "Best Sellers";
  static const String newArrivals = "New Arrivals";
  static const String seeAll = "See All";
  static const String offers = "Special Offers";

  // -------------------------------------------------------------------------
  // Strings – Product
  // -------------------------------------------------------------------------
  static const String addToCart = "Add to Cart";
  static const String addToWishlist = "Add to Wishlist";
  static const String removeFromWishlist = "Remove from Wishlist";
  static const String productDetails = "Product Details";
  static const String description = "Description";
  static const String reviews = "Reviews";
  static const String inStock = "In Stock";
  static const String outOfStock = "Out of Stock";
  static const String quantity = "Quantity";

  // -------------------------------------------------------------------------
  // Strings – Cart
  // -------------------------------------------------------------------------
  static const String cart = "My Cart";
  static const String emptyCart = "Your cart is empty";
  static const String checkout = "Checkout";
  static const String delete = "Delete";
  static const String totalPrice = "Total Price";
  static const String subTotal = "Subtotal";
  static const String deliveryFee = "Delivery Fee";
  static const String discount = "Discount";
  static const String couponCode = "Coupon Code";
  static const String applyCoupon = "Apply Coupon";

  // -------------------------------------------------------------------------
  // Strings – Orders
  // -------------------------------------------------------------------------
  static const String myOrders = "My Orders";
  static const String orderDetails = "Order Details";
  static const String orderPlaced = "Order Placed Successfully!";
  static const String orderNumber = "Order #";
  static const String trackOrder = "Track Order";

  static const String statusPending = "Pending";
  static const String statusProcessing = "Processing";
  static const String statusShipped = "Shipped";
  static const String statusDelivered = "Delivered";
  static const String statusCancelled = "Cancelled";

  // -------------------------------------------------------------------------
  // Strings – Profile
  // -------------------------------------------------------------------------
  static const String profile = "My Profile";
  static const String editProfile = "Edit Profile";
  static const String myAddresses = "My Addresses";
  static const String paymentMethods = "Payment Methods";
  static const String notifications = "Notifications";
  static const String settings = "Settings";
  static const String helpCenter = "Help Center";
  static const String privacyPolicy = "Privacy Policy";
  static const String termsConditions = "Terms & Conditions";

  // -------------------------------------------------------------------------
  // UI – Durations
  // -------------------------------------------------------------------------
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 2);
  static const Duration snackBarDuration = Duration(seconds: 3);
  static const Duration carouselAutoPlay = Duration(seconds: 4);

  // -------------------------------------------------------------------------
  // UI – Sizes & Pagination
  // -------------------------------------------------------------------------
  static const int carouselItemCount = 3;
  static const int homeProductsLimit = 10;
  static const int paginationLimit = 20;
  static const double deliveryFeeValue = 25.0;
  static const double freeDeliveryThreshold = 300.0;

  // -------------------------------------------------------------------------
  // Bottom Nav – Tab Indices
  // -------------------------------------------------------------------------
  static const int homeTabIndex = 0;
  static const int categoriesTabIndex = 1;
  static const int cartTabIndex = 2;
  static const int ordersTabIndex = 3;
  static const int profileTabIndex = 4;

  // -------------------------------------------------------------------------
  // Colors
  // -------------------------------------------------------------------------
  static const Color primaryColor = Color(0xFFFF6B2C);
  static const Color primaryLight = Color(0xFFFFF0E8);
  static const Color scaffoldBg = Color(0xFFF8F8F8);
  static const Color cardBg = Colors.white;
  static const Color textPrimary = Color(0xFF222222);
  static const Color textSecondary = Color(0xFF888888);
  static const Color textHint = Color(0xFFBBBBBB);
  static const Color dividerColor = Color(0xFFEEEEEE);
  static const Color borderColor = Color(0xFFE8E8E8);
  static const Color errorColor = Color(0xFFE53935);
  static const Color successColor = Color(0xFF43A047);
  static const Color starColor = Color(0xFFFFC107);
}