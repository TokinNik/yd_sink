import 'dart:async';

import 'package:flutter/material.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class GInfList<T> extends StatelessWidget {
  const GInfList({
    super.key,
    required this.items,
    required this.onRender,
    required this.onLoadMore,
    required this.onRefresh,
    required this.isLoading,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.physics,
    this.onEmpty,
    this.scrollController,
  });

  final List<T> items;
  final bool isLoading;
  final Widget Function(T item, int index) onRender;
  final Widget Function()? onEmpty;
  final Future Function() onLoadMore;
  final Future Function() onRefresh;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: InfiniteList(
        centerLoading: true,
        itemCount: items.length,
        isLoading: isLoading,
        onFetchData: onLoadMore,
        itemBuilder: (context, index) => onRender(items[index], index),
      ),
    );
  }
}
