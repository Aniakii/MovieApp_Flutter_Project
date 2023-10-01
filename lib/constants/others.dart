import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../data/models/sort_menu_item.dart';
import 'color_palette.dart';
import 'enums.dart';

BoxDecoration cardDecoration = BoxDecoration(
  color: AppColors.grey,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(15.0),
    topRight: Radius.circular(15.0),
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      spreadRadius: 7,
      blurRadius: 5,
      offset: const Offset(5, 5),
    ),
  ],
);

List<SortMenuItem> getSortMenuItems(BuildContext context) {
  return [
    SortMenuItem(
        icon: Icons.sort_by_alpha,
        description: S.of(context)!.sortFromAtoZ,
        sortType: SortingType.fromAtoZ),
    SortMenuItem(
        icon: Icons.sort_by_alpha,
        description: S.of(context)!.sortFromZtoA,
        sortType: SortingType.fromZtoA),
    SortMenuItem(
        icon: Icons.star_border,
        description: S.of(context)!.sortWorstRate,
        sortType: SortingType.worstRate),
    SortMenuItem(
        icon: Icons.star,
        description: S.of(context)!.sortBestRate,
        sortType: SortingType.bestRate),
    SortMenuItem(
        icon: Icons.expand_less,
        description: S.of(context)!.sortMostPopular,
        sortType: SortingType.mostPopular),
    SortMenuItem(
        icon: Icons.expand_more,
        description: S.of(context)!.sortLeastPopular,
        sortType: SortingType.leastPopular),
    SortMenuItem(
        icon: Icons.restart_alt,
        description: S.of(context)!.sortDefaultSorting,
        sortType: SortingType.defaultSorting),
  ];
}

List<PopupMenuItem<SortingType>> getPopUpItems(BuildContext context) {
  List<PopupMenuItem<SortingType>> preparedWidgets = [];
  for (SortMenuItem sortMenuItem in getSortMenuItems(context)) {
    preparedWidgets.add(
      PopupMenuItem<SortingType>(
        value: sortMenuItem.sortType,
        child: Row(
          children: [
            Icon(sortMenuItem.icon),
            const SizedBox(width: 8.0),
            Text(sortMenuItem.description),
          ],
        ),
      ),
    );
  }
  return preparedWidgets;
}
