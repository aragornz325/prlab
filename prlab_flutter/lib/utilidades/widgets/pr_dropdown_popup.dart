// ignore_for_file: inference_failure_on_untyped_parameter, avoid_dynamic_calls

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';

const double tileHeight = 50;
const double selectAllButtonHeight = 40;
const double searchOptionHeight = 40;

class PRDropdownPopup extends StatefulWidget {
  /// Mutiple selection dropdown for List of Maps.
  const PRDropdownPopup({
    required this.list,
    required this.onChanged,
    this.initiallySelected = const [],
    this.whenEmpty = '',
    this.label = 'label',
    this.id = 'id',
    this.numberOfItemsLabelToShow = 3,
    this.itemsIconList,
    this.selectedItemColor = Colors.grey,
    this.unSelectedItemColor = Colors.white,
    this.width,
    this.dropdownButtonIcon,
    this.iconsColor = Colors.black,
    this.isLarge = false,
    this.includeSelectAll = false,
    this.hasAvatar = false,
    this.oneMinimumSelected = false,
    this.itemhaveIcons = false,
    this.includeSearch = false,
    this.textStyle = const TextStyle(fontSize: 15),
    this.duration = const Duration(milliseconds: 300),
    this.checkboxFillColor,
    this.splashColor,
    this.listTextStyle,
    this.padding,
    this.multiSelect = false,
    super.key,
  }) : isSimpleList = false;

  /// Mutiple selection dropdown for simple List.
  const PRDropdownPopup.simpleList({
    required this.list,
    required this.onChanged,
    this.initiallySelected = const [],
    this.whenEmpty = '',
    this.numberOfItemsLabelToShow = 3,
    this.itemsIconList,
    this.selectedItemColor = Colors.grey,
    this.unSelectedItemColor = Colors.white,
    this.width,
    this.isLarge = false,
    this.includeSelectAll = false,
    this.oneMinimumSelected = false,
    this.hasAvatar = false,
    this.itemhaveIcons = false,
    this.dropdownButtonIcon,
    this.iconsColor = Colors.black,
    this.includeSearch = false,
    this.textStyle = const TextStyle(fontSize: 15),
    this.duration = const Duration(milliseconds: 300),
    this.checkboxFillColor,
    this.splashColor,
    this.listTextStyle,
    this.padding,
    this.multiSelect = false,
    super.key,
  })  : label = '',
        id = '',
        isSimpleList = true;
  final bool multiSelect;

  /// List of options to select from
  final List<Map<String, dynamic>> list;

  /// `label` key in a Map to show as an option. Defaults to 'label'
  final String label;

  /// `id` key in a Map to identify an item. Defaults to 'id'
  final String id;

  /// `onChange` callback, called everytime when
  /// an item is added or removed with the new
  /// list as argument
  ///
  /// {@tool snippet}
  /// ```dart
  /// onChange: (List newList) {
  ///   setState(() {
  ///     selectedList = newList;
  ///   });
  /// }
  /// ```
  /// {@end-tool}
  final ValueChanged<List<Map<String, dynamic>>> onChanged;

  /// Number of items to show as text,
  /// beyond that it will show `n` selected
  final int numberOfItemsLabelToShow;

  /// Initially selected list
  final List<Map<String, dynamic>> initiallySelected;

  /// Dropdown size
  final bool isLarge;

  /// If the list is a simple list
  /// or a list of map
  final bool isSimpleList;

  /// Width of the input widget. If this
  /// is null the widget will try to take
  /// full width of the parent.
  ///
  /// When rendering in a Row it needs to have
  /// a strict parent or a fixed width as it grows
  /// horizontally
  final double? width;

  /// Text to show when selected list is empty
  final String whenEmpty;

  /// Includes a select all button when `true`
  final bool includeSelectAll;

  /// Includes a search option when `true`
  final bool includeSearch;

  /// `TextStyle?` for the text on anchor element.
  final TextStyle textStyle;

  /// `Duration?` for debounce in search option.
  /// Defaults to 300 milliseconds.
  final Duration duration;

  /// Checkbox fill color in list tile.
  final Color? checkboxFillColor;

  /// Splash color on the list tile when the list is clicked.
  final Color? splashColor;

  /// TextStyle for the text on list tile.
  final TextStyle? listTextStyle;

  /// Padding for the input element.
  final EdgeInsets? padding;

  final IconData? dropdownButtonIcon;
  final Color iconsColor;
  final Color selectedItemColor;
  final Color unSelectedItemColor;
  final bool hasAvatar;
  final bool itemhaveIcons;
  final List<IconData>? itemsIconList;
  final bool oneMinimumSelected;

  @override
  State<PRDropdownPopup> createState() => _PRDropdownPopupState();
}

class _PRDropdownPopupState extends State<PRDropdownPopup> {
  late List<Map<String, dynamic>> selected = [...widget.initiallySelected];
  late final Decoration boxDecoration;
  List<Map<String, dynamic>> filteredOptions = [];

  late final TextEditingController filterController;
  Timer? debounce;

  bool isSelected(dynamic data) {
    if (widget.isSimpleList) {
      return selected.contains(data);
    } else {
      for (final obj in selected) {
        if (obj[widget.id] == data) {
          return true;
        }
      }
      return false;
    }
  }

  void handleOnChange({
    required bool newValue,
    required Map<String, dynamic> data,
  }) {
    if (newValue) {
      setState(() {
        selected.add(data);
      });
    } else {
      if (widget.isSimpleList) {
        setState(() {
          selected.remove(data);
        });
      } else {
        final itemIndex = selected.indexWhere(
          (obj) => obj[widget.id] == data[widget.id],
        );
        if (itemIndex == -1) {
          return;
        } else {
          setState(() {
            selected.removeAt(itemIndex);
          });
        }
      }
    }

    widget.onChanged(selected);
  }

  int getIndex(dynamic data) {
    return widget.list.indexWhere((obj) => obj[widget.id] == data[widget.id]);
  }

  Widget buildTile(Map<String, dynamic> data) {
    if (widget.isSimpleList) {
      return Column(
        children: [
          _CustomTile(
            selectedList: selected,
            alwaysSelected: widget.oneMinimumSelected,
            iconsColor: widget.iconsColor,
            itemsIconList: widget.itemsIconList,
            index: getIndex(data),
            itemhaveIcons: widget.itemhaveIcons,
            hasAvatar: widget.hasAvatar,
            selectedItemColor: widget.selectedItemColor,
            unSelectedItemColor: widget.unSelectedItemColor,
            multiSelect: widget.multiSelect,
            unSelectAll: () {
              selected.clear();
            },
            value: isSelected(data),
            onChanged: (bool newValue) {
              handleOnChange(newValue: newValue, data: data);
            },
            title: '$data',
            checkboxFillColor: widget.checkboxFillColor,
            splashColor: widget.splashColor,
            textStyle: widget.listTextStyle,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          _CustomTile(
            selectedList: selected,
            alwaysSelected: widget.oneMinimumSelected,
            iconsColor: widget.iconsColor,
            itemsIconList: widget.itemsIconList,
            index: getIndex(data),
            itemhaveIcons: widget.itemhaveIcons,
            hasAvatar: widget.hasAvatar,
            unSelectedItemColor: widget.unSelectedItemColor,
            selectedItemColor: widget.selectedItemColor,
            multiSelect: widget.multiSelect,
            unSelectAll: () {
              selected.clear();
            },
            value: isSelected(data[widget.id]),
            onChanged: (bool newValue) {
              handleOnChange(newValue: newValue, data: data);
            },
            title: '${data[widget.label]}',
            checkboxFillColor: widget.checkboxFillColor,
            splashColor: widget.splashColor,
            textStyle: widget.listTextStyle,
          ),
          SizedBox(
            height: 5.ph,
          ),
        ],
      );
    }
  }

  void onSearchTextChanged(String searchText) {
    if (debounce?.isActive ?? false) debounce?.cancel();

    debounce = Timer(widget.duration, () {
      if (searchText.isEmpty) {
        setState(() {
          filteredOptions = widget.list;
        });
      } else {
        searchText = searchText.toLowerCase();
        if (widget.isSimpleList) {
          final newList = widget.list.where((text) {
            return '$text'.toLowerCase().contains(searchText);
          }).toList();
          setState(() {
            filteredOptions = newList;
          });
        } else {
          final newList = widget.list.where((objData) {
            return '${objData[widget.label]}'
                .toLowerCase()
                .contains(searchText);
          }).toList();
          setState(() {
            filteredOptions = newList;
          });
        }
      }
    });
  }

  Widget buildSearchOption() {
    return TextField(
      controller: filterController,
      onChanged: onSearchTextChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: const InputDecoration(
        isDense: true,
        border: OutlineInputBorder(),
        hintText: 'filter...',
        constraints: BoxConstraints(
          minHeight: searchOptionHeight,
          maxHeight: searchOptionHeight,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
      ),
    );
  }

  Widget buildSelectAllButton() {
    return InkWell(
      onTap: () {
        if (selected.length == widget.list.length) {
          selected.clear();
        } else {
          selected.clear();
          selected = [...widget.list];
        }
        widget.onChanged(selected);
        setState(() {});
      },
      child: Container(
        height: selectAllButtonHeight,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.zero,
          border: Border(
            bottom: BorderSide(color: Color(0xffd9d9d9)),
          ),
        ),
        child: const Text('Select all'),
      ),
    );
  }

  double getWidth(BoxConstraints boxConstraints) {
    if (widget.width != null &&
        widget.width != double.infinity &&
        widget.width != double.maxFinite) {
      return widget.width!;
    }
    if (boxConstraints.maxWidth == double.infinity ||
        boxConstraints.maxWidth == double.maxFinite) {
      debugPrint(
        "Invalid width given, MultiSelectDropdown's width will fallback to 250.",
      );
      return 250;
    }
    return boxConstraints.maxWidth;
  }

  double getModalHeight() {
    var height = filteredOptions.length > 4
        ? widget.isLarge
            ? filteredOptions.length > 6
                ? 7 * tileHeight
                : filteredOptions.length * tileHeight
            : 5 * tileHeight
        : filteredOptions.length * tileHeight;

    if (widget.includeSelectAll) {
      height += selectAllButtonHeight;
    }

    if (widget.includeSearch) {
      height += searchOptionHeight;
    }

    return height;
  }

  IconData? getSelectedIcon() {
    if (selected.isNotEmpty) {
      return widget.itemsIconList?[getIndex(selected[0])] ??
          widget.dropdownButtonIcon;
    }
    return widget.dropdownButtonIcon;
  }

  String buildText() {
    if (selected.isEmpty) {
      return widget.whenEmpty;
    }

    // if (widget.numberOfItemsLabelToShow < selected.length) {
    //   return '${selected.length} selected';
    // }

    if (widget.isSimpleList) {
      final itemsToShow = selected.length;
      var finalString = '';
      for (var i = 0; i < itemsToShow; i++) {
        finalString = '$finalString ${selected[i]}, ';
      }
      return finalString.substring(0, finalString.length - 2);
    } else {
      final itemsToShow = selected.length;
      var finalString = '';
      for (var i = 0; i < itemsToShow; i++) {
        finalString = '$finalString ${selected[i][widget.label]}, ';
      }
      return finalString.substring(0, finalString.length - 2);
    }
  }

  @override
  void initState() {
    super.initState();
    filterController = TextEditingController();
    filteredOptions = [...widget.list];
  }

  @override
  void dispose() {
    filterController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textToShow = buildText();
    final selectedIcon = getSelectedIcon();
    final modalHeight = getModalHeight();

    return LayoutBuilder(
      builder: (ctx, boxConstraints) {
        final modalWidth = getWidth(boxConstraints);

        return ConstrainedBox(
          constraints: BoxConstraints.expand(
            height: tileHeight.ph,
            width: modalWidth.pw,
          ),
          child: MenuAnchor(
            crossAxisUnconstrained: false,
            style: MenuStyle(
              fixedSize: MaterialStateProperty.resolveWith((states) {
                return Size(modalWidth, modalHeight.ph);
              }),
              padding: MaterialStateProperty.resolveWith((states) {
                return EdgeInsets.zero;
              }),
            ),
            builder: (context, controller, _) {
              return InkWell(
                onTap: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                child: Container(
                  padding: widget.padding ??
                      const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: controller.isOpen
                        ? BorderRadius.only(
                            topRight: Radius.circular(10.sw),
                            topLeft: Radius.circular(10.sw),
                          )
                        : BorderRadius.all(Radius.circular(10.sw)),
                    border: Border.all(
                      color: const Color(0xFFD9D9D9),
                    ),
                    color: Colors.white,
                  ),
                  width: modalWidth,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            if (widget.dropdownButtonIcon != null &&
                                selectedIcon != null)
                              Row(
                                children: [
                                  Icon(
                                    selectedIcon,
                                    color: const Color(0xff707070),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              )
                            else
                              Container(),
                            Text(
                              textToShow,
                              style: widget.textStyle,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        controller.isOpen
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down_sharp,
                        color: const Color(0xff707070),
                      ),
                    ],
                  ),
                ),
              );
            },
            menuChildren: [
              if (widget.includeSearch) buildSearchOption(),
              if (widget.includeSelectAll) buildSelectAllButton(),
              ...filteredOptions.map(buildTile),
            ],
          ),
        );
      },
    );
  }
}

// Simple list tiles in the modal
class _CustomTile extends StatelessWidget {
  const _CustomTile({
    required this.title,
    required this.selectedItemColor,
    required this.unSelectedItemColor,
    required this.value,
    required this.onChanged,
    required this.unSelectAll,
    required this.multiSelect,
    required this.index,
    this.itemsIconList = const [],
    this.hasAvatar = false,
    this.itemhaveIcons = false,
    this.alwaysSelected = false,
    this.checkboxFillColor,
    this.splashColor,
    this.iconsColor = Colors.black,
    this.textStyle,
    this.selectedList = const [],
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  final VoidCallback unSelectAll;
  final Color? checkboxFillColor;
  final Color? splashColor;
  final TextStyle? textStyle;
  final bool multiSelect;
  final Color selectedItemColor;
  final Color unSelectedItemColor;
  final Color iconsColor;
  final bool hasAvatar;
  final bool itemhaveIcons;
  final bool alwaysSelected;
  final int index;
  final List<IconData>? itemsIconList;
  final List<dynamic> selectedList;

  void handleOnChange() {
    if (value) {
      if (!(alwaysSelected && selectedList.length == 1)) {
        onChanged(false);
        if (!multiSelect) unSelectAll();
      }
    } else {
      if (!multiSelect) unSelectAll();
      onChanged(true);
    }
  }

  bool tieneIcono() {
    if (index != -1 && itemsIconList != null) {
      if (index < itemsIconList!.length) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // splashColor: splashColor ?? themeData.primaryColor,
      onTap: handleOnChange,
      child: Container(
        decoration: BoxDecoration(
          color: value ? selectedItemColor : Colors.white,
          border: const Border(
            left: BorderSide(
              color: Color(0xFFD9D9D9),
            ),
            right: BorderSide(
              color: Color(0xFFD9D9D9),
            ),
          ),
        ),
        height: tileHeight.ph,
        child: Row(
          children: [
            const SizedBox(width: 9),
            if (hasAvatar)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                width: 30.pw,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffD9D9D9),
                ),
              )
            else
              itemhaveIcons && tieneIcono()
                  ? Icon(
                      itemsIconList![index],
                      color: iconsColor,
                      size: 20.pw,
                    )
                  : Container(),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                title,
                style: textStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
