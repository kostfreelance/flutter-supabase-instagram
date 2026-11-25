import 'package:flutter/material.dart';
import 'app_loader_indicator.dart';

class InfinityListView<T> extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final bool? reverse;
  final bool hasMore;
  final Widget Function(List<T>, int) itemWidget;
  final List<T> items;
  final ScrollController? controller;
  final Function() onLoadMore;

  const InfinityListView({
    super.key,
    this.padding,
    this.reverse,
    required this.hasMore,
    required this.itemWidget,
    required this.items,
    this.controller,
    required this.onLoadMore
  });

  @override
  Widget build(BuildContext context) =>
    NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (hasMore && (n is ScrollUpdateNotification)) {
          final metrics = n.metrics;
          if (metrics.pixels >= (metrics.maxScrollExtent - AppLoaderIndicator.size)) {
            onLoadMore();
          }
        }
        return false;
      },
      child: ListView.builder(
        padding: padding ?? EdgeInsets.zero,
        physics: AlwaysScrollableScrollPhysics(),
        reverse: reverse ?? false,
        controller: controller,
        itemCount: items.length + (hasMore ? 1 : 0),
        itemBuilder: (_, index) {
          if (index < items.length) {
            return itemWidget(items, index);
          }
          return AppLoaderIndicator();
        }
      )
    );
}