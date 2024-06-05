import 'package:flutter/material.dart';
import 'pagination_indicator.dart';
import 'pagination_listener.dart';

class AppPaginator extends StatelessWidget {
  const AppPaginator({
    required this.child,
    required this.isLoading,
    required this.onNextPage,
    this.onRefresh,
    this.margin = 0,
    super.key,
  });

  final bool isLoading;
  final Widget child;
  final double margin;
  final VoidCallback? onRefresh;
  final VoidCallback onNextPage;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => onRefresh?.call(),
      child: PaginationIndicator(
        enabled: isLoading,
        child: PaginationListener(
          margin: margin,
          onEdge: onNextPage,
          child: child,
        ),
      ),
    );
  }
}
