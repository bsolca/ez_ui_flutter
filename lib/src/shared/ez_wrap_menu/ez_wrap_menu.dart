import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:impostor/src/shared/ez_button/data/ez_button_enum.dart';
import 'package:impostor/src/shared/ez_button/ez_button.dart';
import 'package:impostor/src/shared/ez_item/ez_sidebar_item.dart';
import 'package:impostor/src/shared/ez_popover/ez_popover.dart';
import 'package:impostor/src/shared/ez_wrap_menu/data/ez_wrapper_tiem.dart';
import 'package:impostor/src/utils/responsive/presentation/responsive_layout.dart';

/// A widget that displays a list of items in a wrap menu.
class EzWrapMenu extends ConsumerStatefulWidget {
  /// Creates an item in the wrap menu.
  const EzWrapMenu({
    super.key,
    required this.items,
    required this.initialSelectedItem,
  });

  /// A list of items in the wrap menu.
  final List<EzWrapMenuItem> items;

  /// The index of the initial selected item.
  final int initialSelectedItem;

  @override
  ConsumerState<EzWrapMenu> createState() => _EzWrapMenuState();
}

class _EzWrapMenuState extends ConsumerState<EzWrapMenu> {
  int selectedItemIndex = 0;
  Size size = Size.zero;

  @override
  void initState() {
    super.initState();
    selectedItemIndex = widget.initialSelectedItem;
  }

  final controller = MenuController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      compact: (_, __) {
        return EzPopover(
          offset: Offset.zero,
          width: size.width,
          controller: controller,
          items: List.generate(widget.items.length, (index) {
            final item = widget.items[index];
            return EzItem(
              svgPath: null,
              icon: item.icon,
              text: item.text,
              isSelected: false,
              onTap: () {
                setState(() {
                  selectedItemIndex = index;
                });
                item.onPressed.call();
                controller.close();
              },
            );
          }),
          child: LayoutBuilder(
            builder: (context, constraints) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  size = constraints.biggest;
                });
              });
              return EzButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                text: widget.items[selectedItemIndex].text,
              );
            },
          ),
        );
      },
      medium: (_, __) {
        return Wrap(
          spacing: 8,
          children: List.generate(widget.items.length, (index) {
            final item = widget.items[index];
            final isSelected = index == selectedItemIndex;

            return EzButton(
              key: ValueKey(index),
              onPressed: () {
                setState(() {
                  selectedItemIndex = index;
                });
                item.onPressed();
              },
              text: item.text,
              prefixIcon: item.icon,
              type: isSelected ? EzButtonType.regular : EzButtonType.link,
            );
          }),
        );
      },
    );
  }
}
