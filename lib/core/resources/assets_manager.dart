const String _imagePath = "assets/images";
const String _iconsPath = "assets/icons";
const String _fontsPath = "assets/fonts";

// ---------------------------------------------------------------------------
// Images
// ---------------------------------------------------------------------------
abstract class ImageAssets {
  // Splash
  static const String splashLogo = "$_imagePath/splash_logo.png";

  // Home – Carousel
  static const String carouselSlider1 = "$_imagePath/carousel_1.png";
  static const String carouselSlider2 = "$_imagePath/carousel_2.png";
  static const String carouselSlider3 = "$_imagePath/carousel_3.png";

  // Home – Sections
  static const String categoryImage = "$_imagePath/category_image.png";
  static const String brandImage = "$_imagePath/brands_section_image.png";

  // Product
  static const String productPlaceholder = "$_imagePath/product_placeholder.png";

  // Cart & Wishlist
  static const String emptyCart = "$_imagePath/empty_cart.png";
  static const String emptyWishlist = "$_imagePath/empty_wishlist.png";

  // Orders
  static const String orderSuccess = "$_imagePath/order_success.png";

  // Profile
  static const String avatarPlaceholder = "$_imagePath/avatar_placeholder.png";
}

// ---------------------------------------------------------------------------
// Icons
// ---------------------------------------------------------------------------
abstract class IconsAssets {
  // BottomNavBar
  static const String icHome = "$_iconsPath/ic_home.png";
  static const String icCategory = "$_iconsPath/ic_category.png";
  static const String icCart = "$_iconsPath/ic_cart.png";
  static const String icOrders = "$_iconsPath/ic_orders.png";
  static const String icProfile = "$_iconsPath/ic_profile.png";

  // Actions
  static const String icSearch = "$_iconsPath/ic_search.png";
  static const String icFilter = "$_iconsPath/ic_filter.png";
  static const String icDelete = "$_iconsPath/ic_delete.png";
  static const String icEdit = "$_iconsPath/ic_edit.png";
  static const String icArrowRight = "$_iconsPath/ic_arrow_right.png";

  // Wishlist
  static const String icHeart = "$_iconsPath/ic_heart.png";
  static const String icHeartFilled = "$_iconsPath/ic_heart_filled.png";

  // Cart Controls
  static const String icMinus = "$_iconsPath/ic_minus.png";
  static const String icPlus = "$_iconsPath/ic_plus.png";

  // Misc
  static const String icNotification = "$_iconsPath/ic_notification.png";
  static const String icLocation = "$_iconsPath/ic_location.png";
}

// ---------------------------------------------------------------------------
// Fonts
// ---------------------------------------------------------------------------
abstract class FontAssets {
  static const String poppins = "$_fontsPath/Poppins";
}