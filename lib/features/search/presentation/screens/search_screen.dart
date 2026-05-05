import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqly/core/resources/constants_manager.dart';
import 'package:souqly/core/routes_managers/routes.dart';
import 'package:souqly/core/widget/product_card.dart';
import 'package:souqly/di.dart';
import 'package:souqly/features/Auth/presentation/bloc/auth_state.dart';
import 'package:souqly/features/home/data/models/HomeResponse.dart';
import 'package:souqly/features/search/presentation/bloc/search_bloc.dart';
import 'package:souqly/features/search/presentation/bloc/search_events.dart';
import 'package:souqly/features/search/presentation/bloc/search_state.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SearchBloc>()..add(LoadAllProducts()),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            _buildSearchField(context),
            SizedBox(height: 8.h),
            Expanded(child: _buildResults()),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      color: AppConstants.cardBg,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(Icons.arrow_back_ios_new_rounded, size: 14.sp, color: AppConstants.textPrimary),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            'Search',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: AppConstants.textPrimary),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          color: AppConstants.cardBg,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppConstants.borderColor),
        ),
        child: Row(
          children: [
            SizedBox(width: 12.w),
            Icon(Icons.search_rounded, color: AppConstants.textHint, size: 18.sp),
            SizedBox(width: 8.w),
            Expanded(
              child: TextField(
                autofocus: true,
                onChanged: (query) =>
                    context.read<SearchBloc>().add(SearchQueryChanged(query)),
                style: TextStyle(fontSize: 12.sp, color: AppConstants.textPrimary),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppConstants.searchHint,
                  hintStyle: TextStyle(fontSize: 12.sp, color: AppConstants.textHint),
                  isDense: true,
                ),
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.query.isEmpty) return const SizedBox.shrink();
                return GestureDetector(
                  onTap: () => context.read<SearchBloc>().add(SearchQueryChanged('')),
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(Icons.close_rounded, size: 16.sp, color: AppConstants.textHint),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResults() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.status == RequestStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.query.isEmpty) {
          return _buildEmptyState('Search for products...', Icons.search_rounded);
        }

        if (state.results.isEmpty) {
          return _buildEmptyState('No results for "${state.query}"', Icons.inbox_outlined);
        }

        return _buildGrid(context, state.results);
      },
    );
  }

  Widget _buildEmptyState(String message, IconData icon) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 48.sp, color: AppConstants.textHint),
          SizedBox(height: 12.h),
          Text(message, style: TextStyle(fontSize: 13.sp, color: AppConstants.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context, List<ProductModel> products) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length,
        itemBuilder: (_, i) {
          final product = products[i];
          return ProductCard(
            name: product.name ?? '',
            price: double.tryParse(product.price ?? '0') ?? 0,
            imageUrl: product.image?.toString(),
            onTap: () => Navigator.pushNamed(
              context,
              Routes.productDetails,
              arguments: product,
            ),
            onAddToCart: () {},
          );
        },
      ),
    );
  }
}