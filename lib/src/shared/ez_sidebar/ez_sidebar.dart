import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/shared/ez_divider/ez_divider.dart';
import 'package:impostor/src/shared/ez_sidebar/ez_sidebar_consts.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_footer_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_header_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar/model/ez_sidebar_item_data.codegen.dart';
import 'package:impostor/src/shared/ez_sidebar/widgets/ez_sidebar_footer.dart';
import 'package:impostor/src/shared/ez_sidebar/widgets/ez_sidebar_footer_item.dart';
import 'package:impostor/src/shared/ez_sidebar/widgets/ez_sidebar_header.dart';
import 'package:impostor/src/shared/ez_sidebar/widgets/ez_sidebar_indicator_widget.dart';
import 'package:impostor/src/shared/ez_sidebar/widgets/ez_sidebar_items_list.dart';
import 'package:impostor/src/shared/ez_sidebar_layout/ez_sidebar_layout_consts.dart';
import 'package:impostor/src/utils/extension/widget_ref_extension.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

/// A [EzSidebar] widget that displays a customizable navigation sidebar.
class EzSidebar extends ConsumerWidget {
  /// Creates the sidebar widget.
  const EzSidebar({
    super.key,
    required this.headerData,
    required this.footerData,
    required this.items,
    required this.currentIndex,
    required this.onItemTap,
    required this.scrollController,
    required this.itemHeights,
    required this.updateItemHeight,
  });

  /// The header data of the sidebar
  final EzSidebarHeaderData headerData;

  /// The footer data of the sidebar
  final EzSidebarFooterData footerData;

  /// The list of items in the sidebar
  final List<EzSidebarItemData> items;

  /// The index of the currently selected item
  final int currentIndex;

  /// The callback function that is called when an item is tapped
  final ValueChanged<int> onItemTap;

  /// The scroll controller of the sidebar
  final ScrollController scrollController;

  /// The list of item heights
  final List<double> itemHeights;

  /// The callback function that is called when an item height is updated
  final void Function(int, double) updateItemHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final footerItems = items.whereType<BottomSidebarItemData>().toList();
    final isCompact = ref.isCompactScreen;

    return Container(
      padding: isCompact ? EzSidebarConsts.sidebarPadding : EdgeInsets.zero,
      width: EzSidebarConsts.sidebarWidth,
      margin: isCompact ? EzSidebarLayoutConsts.contentMargin : EdgeInsets.zero,
      decoration: isCompact
          ? ShapeDecoration(
              color: EzSidebarLayoutConsts.getContentColor(colorScheme),
              shape: EzSidebarLayoutConsts.getContentShapeBorder(
                colorScheme,
              ),
            )
          : null,
      child: Column(
        children: [
          EzSidebarHeader(
            onTap: headerData.onTap,
            appName: headerData.appName,
            avatarUrl: headerData.avatarUrl,
            items: headerData.items,
          ),
          const EzDivider(),
          Expanded(
            child: ClipRect(
              child: Stack(
                children: [
                  WebSmoothScroll(
                    controller: scrollController,
                    child: CustomScrollView(
                      controller: scrollController,
                      physics: const NeverScrollableScrollPhysics(),
                      slivers: [
                        EzSidebarItemsList(
                          items: items,
                          currentIndex: currentIndex,
                          onItemTap: onItemTap,
                          updateItemHeight: updateItemHeight,
                        ),
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: footerItems
                                .map(
                                  (e) => EzSidebarFooterItem(
                                    text: e.text,
                                    icon: e.icon,
                                    svgPath: e.svgPath,
                                    onTap: e.onTap,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  EzSidebarIndicatorWidget(
                    scrollController: scrollController,
                    itemHeights: itemHeights,
                    selectedIndex: currentIndex,
                    indicatorColor: EzSidebarConsts.getIndicatorColor(
                      Theme.of(context).colorScheme,
                    ),
                    indicatorPadding: EzSidebarConsts.indicatorVerticalPadding,
                  ),
                ],
              ),
            ),
          ),
          if (!isCompact) const EzDivider(),
          if (!isCompact)
            EzSidebarFooter(
              name: footerData.name,
              email: footerData.email,
              onTap: footerData.onTap,
              items: footerData.items,
              avatarUrl: footerData.avatarUrl,
            ),
        ],
      ),
    );
  }
}
