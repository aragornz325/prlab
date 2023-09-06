import 'dart:math';

import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template alcanza_dropdown}
/// Dropdown widget used in the app.
/// {@endtemplate}
class AlcanzaDropdown<T> extends StatefulWidget {
  /// {@macro alcanza_dropdown}
  const AlcanzaDropdown({
    required this.isValid,
    required this.items,
    required this.hintText,
    required this.valueText,
    required this.onChanged,
    this.value,
    this.padding,
    this.hintStyle,
    this.maxItemsCount = 9999,
    this.enabled = true,
    this.additionalOption,
    this.icon,
    this.preffixIcon,
    this.height,
    this.boxShadow,
    // this.hasSearchField = kIsWeb ? false : true,
    this.hasSearchField = false,
    this.physics,
    this.showIcon = true,
    this.valueColor,
    this.itemHeight,
    this.onExpand,
    this.itemPadding,
    this.hideHeight,
    this.notExpandedHeight,
    this.width,
    this.margin,
    super.key,
  });

  /// Height of the dropdown box. If null, it will be 64 pixels.
  final double? hideHeight;

  /// Whether the dropdown is valid or not.
  final bool isValid;

  /// The current value of the dropdown.
  final T? value;

  /// The items to show in the dropdown.
  final List<AlcanzaDropdownOption> items;

  /// The hint text to show in the dropdown.
  final String hintText;

  /// The style of the hint text.
  final TextStyle? hintStyle;

  /// The text to show when the dropdown has a value.
  final String valueText;

  /// El maximo de lineas que puede tener el texto del dropdown.
  final int maxItemsCount;

  /// The method to call when the dropdown changes.
  final void Function(T value) onChanged;

  /// The icon in the left side of the dropdown.
  final Widget? icon;

  /// The icon in the right side of the dropdown.
  final Widget? preffixIcon;

  /// Add an option extra to the dropdown.
  final AlcanzaDropdownOption? additionalOption;

  /// The height of the dropdown.
  final double? height;

  /// The height of the dropdown.
  final double? itemHeight;

  /// BoxShadow of the dropdown.
  final List<BoxShadow>? boxShadow;

  /// Set if the dropdown is valid or not.
  final bool? enabled;

  /// Wether or not has searchField.
  final bool hasSearchField;

  /// Physics of the dropdown.
  final ScrollPhysics? physics;

  /// Show the icon of the dropdown.
  final bool showIcon;

  /// The color of the value text.
  final Color? valueColor;

  /// The method to call when the dropdown is expanded.
  final void Function(bool value)? onExpand;

  /// The padding of the item dropdown.
  final EdgeInsets? itemPadding;

  /// The height of the dropdown when it is not expanded.
  final double? notExpandedHeight;

  /// The padding of the dropdown.
  final EdgeInsets? padding;

  /// The margin of the dropdown.
  final EdgeInsets? margin;

  /// The width of the dropdown.
  final double? width;

  @override
  State<AlcanzaDropdown<T>> createState() => _AlcanzaDropdownState<T>();
}

class _AlcanzaDropdownState<T> extends State<AlcanzaDropdown<T>> {
  bool _isExpanded = false;

  final _controller = TextEditingController();

  List<AlcanzaDropdownOption> items = [];

  @override
  void initState() {
    super.initState();

    if (!widget.hasSearchField) return;

    _controller.addListener(() {
      setState(() {
        filterSearchResults(_controller.text);
      });
    });
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      items = widget.items;
    } else {
      items = widget.items.where(
        (element) {
          return element.title.toUpperCase().contains(
                query.toUpperCase(),
              );
        },
      ).toList();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    items = _controller.text.isEmpty ? widget.items : items;

    final listLength = min(
      (widget.itemHeight ?? 38.5.ph) * widget.items.length +
          (widget.additionalOption != null ? 128.ph : 64.ph) +
          (widget.hasSearchField ? 84.ph : 0),
      (widget.itemHeight ?? 38.5.ph) *
              (widget.maxItemsCount > 6 ? 6 : widget.maxItemsCount) +
          (widget.additionalOption != null ? 128.ph : 64.ph) +
          (widget.hasSearchField ? 84.ph : 0),
    );

    final heigth = widget.notExpandedHeight ??
        (
            // kIsWeb ?
            //  74.ph :
            50.ph);

    return Container(
      width: widget.width,
      padding: widget.padding,
      margin: widget.margin,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                curve: Curves.easeInOut,
                height: _isExpanded ? widget.height ?? listLength : heigth,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.pw),
                  boxShadow: widget.boxShadow ??
                      [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 1.ph),
                          blurRadius: 4.sw,
                        ),
                      ],
                ),
                child: Scrollbar(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          physics: widget.physics,
                          children: [
                            SizedBox(height: widget.hideHeight ?? heigth),
                            if (widget.hasSearchField)
                              Padding(
                                padding: EdgeInsets.all(11.pw)
                                    .copyWith(bottom: 5.ph),
                                child: Icon(Icons.abc),
                              ),
                            ...items.map((option) {
                              return _AlcanzaDropdownOptionWidget<T>(
                                padding: widget.itemPadding,
                                color: option.color,
                                enabled: option.enabled,
                                title: option.title,
                                value: option.value as T,
                                textStyle: option.textStyle,
                                checkBoxCallback: option.checkBoxCallback,
                                checkBoxValue: option.checkBoxValue,
                                preffixIcon: option.preffixIcon,
                                itemHeight: option.itemHeight,
                                traillingIcon: option.traillingIcon,
                                callback: () {
                                  widget.onChanged.call(option.value as T);
                                  option.callback?.call();
                                  setState(() => _isExpanded = false);
                                },
                              );
                            }),
                            SizedBox(height: 10.ph),
                          ],
                        ),
                      ),
                      if (widget.additionalOption != null) ...[
                        Divider(color: colores.onSecondary),
                        _AlcanzaDropdownOptionWidget(
                          title: widget.additionalOption!.title,
                          value: widget.additionalOption!.value as T,
                          traillingIcon: widget.additionalOption!.traillingIcon,
                          checkBoxCallback:
                              widget.additionalOption!.checkBoxCallback,
                          checkBoxValue: widget.additionalOption!.checkBoxValue,
                          icon: widget.additionalOption!.icon,
                          itemHeight: widget.additionalOption!.itemHeight,
                          preffixIcon: widget.additionalOption!.preffixIcon,
                          callback: () {
                            widget.additionalOption!.callback?.call();
                            setState(() => _isExpanded = false);
                          },
                        ),
                        SizedBox(height: 6.ph),
                      ],
                    ],
                  ),
                ),
              ),
              if (!widget.isValid)
                Padding(
                  padding: EdgeInsets.only(top: 6.ph, left: 10.pw),
                  child: Text(
                    'debes completar este campo',
                    style: TextStyle(
                      color: colores.error,
                      fontSize: 12.pf,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            ],
          ),
          InkWell(
            onTap: () {
              if (widget.enabled == false) return;
              setState(() => _isExpanded = !_isExpanded);
              widget.onExpand?.call(_isExpanded);
            },
            child: Column(
              children: [
                Container(
                  height: heigth,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.pw),
                    border: widget.isValid
                        ? null
                        : Border.all(
                            color: colores.error,
                            width: 1.pw,
                          ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        offset: Offset(0, 2.ph),
                        blurRadius: 4.sw,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // if (widget.icon != null) ...[
                      //   SizedBox(
                      //     width: 73.pw,
                      //     child: widget.icon,
                      //   ),
                      //   VerticalDivider(
                      //     color: colores.onPrimary,
                      //     width: 1.pw,
                      //     thickness: 1.pw,
                      //     endIndent: 13.pw,
                      //     indent: 13.pw,
                      //   ),
                      // ],
                      SizedBox(width: widget.icon != null ? 5.pw : 1.pw),
                      if (widget.icon != null) widget.icon!,
                      SizedBox(width: widget.icon != null ? 5.pw : 1.pw),
                      Expanded(
                        flex: 20,
                        child: Text(
                          widget.value != null
                              ? widget.valueText
                              : widget.hintText,
                          style: widget.hintStyle ??
                              TextStyle(
                                color: widget.value != null
                                    ? widget.valueColor ?? colores.primary
                                    : const Color(0xff4F4F4F).withOpacity(0.2),
                                fontSize: 16.pf,
                                fontWeight: widget.value != null
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                      const Spacer(),
                      if (widget.showIcon)
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 150),
                          turns: _isExpanded ? 0.5 : 0,
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 16.pf,
                            color: (widget.enabled ?? false)
                                ? colores.secondary
                                : const Color(0xff4F4F4F).withOpacity(0.2),
                          ),
                        ),
                      SizedBox(width: 13.pw),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// {@template alcanza_dropdown_option}
/// This class is used to display the options of the dropdown.
/// {@endtemplate}
class AlcanzaDropdownOption<T> {
  /// {@macro alcanza_dropdown_option}
  const AlcanzaDropdownOption({
    required this.title,
    required this.value,
    this.enabled = true,
    this.callback,
    this.checkBoxValue,
    this.checkBoxCallback,
    this.preffixIcon,
    this.icon,
    this.itemHeight,
    this.color = Colors.transparent,
    this.traillingIcon,
    this.textStyle,
  });

  /// The color of the option.
  final Color color;

  /// If the option is enabled.
  final bool enabled;

  /// The title of the option.
  final String title;

  /// The value of the option.
  final T value;

  /// The callback to execute when the option is tapped.
  final void Function()? callback;

  /// Value of the checkbox.
  final bool? checkBoxValue;

  /// The method to call when the option is tapped.
  final void Function(bool?)? checkBoxCallback;

  /// Icon in the option.
  final Widget? icon;

  /// preffixIcon in the option.
  final Widget? preffixIcon;

  /// The heigth of the option.
  final double? itemHeight;

  /// The icon on the rigth side of the option.
  final IconData? traillingIcon;

  /// Text style of the option.
  final TextStyle? textStyle;
}

class _AlcanzaDropdownOptionWidget<T> extends StatelessWidget {
  const _AlcanzaDropdownOptionWidget({
    required this.title,
    required this.value,
    required this.traillingIcon,
    this.color = Colors.green,
    this.callback,
    this.checkBoxCallback,
    this.checkBoxValue,
    this.icon,
    this.preffixIcon,
    this.itemHeight,
    this.enabled = true,
    this.padding,
    this.textStyle,
  });

  /// The text style of the option.
  final TextStyle? textStyle;

  /// The padding of the option.
  final EdgeInsets? padding;

  /// The color of the option.
  final Color color;

  /// If the option is enabled.
  final bool enabled;

  /// The title of the option.
  final String title;

  /// The value of the option.
  final T value;

  /// The callback to execute when the option is tapped.
  final void Function()? callback;

  /// Value of the checkbox.
  final bool? checkBoxValue;

  /// Icon in the option.
  final Widget? icon;

  /// PreffixIcon in the option.
  final Widget? preffixIcon;

  /// The heigth of the option.
  final double? itemHeight;

  /// The method to call when the option is tapped.
  final void Function(bool?)? checkBoxCallback;

  /// The icon on the rigth side of the option.
  final IconData? traillingIcon;

  @override
  Widget build(BuildContext context) {
    final colores = context.colores;

    return Container(
      margin: EdgeInsets.only(top: 6.ph),
      height: itemHeight ?? 30.ph,
      child: MaterialButton(
        onPressed: enabled ? callback : () {},
        // splashColor: const Color(0xffEB4090).withOpacity(0.2),
        // minWidth: double.infinity,
        highlightColor: colores.primaryOpacidadVeinte,
        padding: preffixIcon != null ? null : EdgeInsets.only(left: 23.pw),
        child: Container(
          // width: double.infinity,
          color: color,
          // padding: padding,
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (preffixIcon != null) preffixIcon!,
              Expanded(
                flex: 20,
                child: Row(
                  children: [
                    SizedBox(
                      width: 5.pw,
                    ),
                    Text(
                      title,
                      style: textStyle ??
                          TextStyle(
                            fontSize: 16.pf,
                            color: colores.onPrimary,
                            fontWeight: FontWeight.w400,
                          ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (traillingIcon != null)
                Icon(
                  traillingIcon,
                  color: colores.primary,
                  size: 20.pf,
                ),
              if (checkBoxValue != null)
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.amber,
                  ),
                  child: Checkbox(
                    value: checkBoxValue,
                    onChanged: checkBoxCallback,
                    activeColor: colores.primary,
                  ),
                ),
              if (icon != null) icon!,
            ],
          ),
        ),
      ),
    );
  }
}

/// {@template alcanza_purpose_dropdown_icon}
/// This class is used to display the icon of the purpose in a dropdown.
/// {@endtemplate}
class AlcanzaPurposeDropdownIcon extends StatelessWidget {
  /// {@macro alcanza_purpose_dropdown_icon}
  const AlcanzaPurposeDropdownIcon({
    required this.size,
    required this.iconPath,
    required this.iconLabel,
    this.imagePath,
    this.labelWidth,
    this.imageScale,
    this.iconWidth,
    super.key,
  });

  /// General size of the icon and text.
  final double size;

  /// Path to the icon.
  final String iconPath;

  /// Label of the icon.
  final String iconLabel;

  /// Image of the icon.
  final String? imagePath;

  /// Width of the label. If null, it takes the [size] value.
  final double? labelWidth;

  /// Size of the image. If null, it will be 1.
  final double? imageScale;

  /// Width of the icon.
  final double? iconWidth;

  @override
  Widget build(BuildContext context) {
    final isEmergency = iconLabel == 'emergency';
    final isHome = iconLabel == 'tu home';
    final isVacations = iconLabel == 'vacaciones';
    final colores = context.colores;
    return SizedBox(
      height: size,
      width: iconWidth,
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: isEmergency || isHome || isVacations
                  ? EdgeInsets.only(
                      bottom: 8.ph,
                    )
                  : EdgeInsets.zero,
              child: imagePath != null && (imagePath?.isNotEmpty ?? false)
                  ? SizedBox(
                      width: 49.pw,
                      height: 49.ph,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.pw),
                        child: Image.network(
                          imagePath!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Image.asset(
                      'icons/casa.png',
                      width: isEmergency ? size * 0.75 : size,
                      height: isEmergency || isVacations
                          ? size * 0.75
                          : size * 0.83,
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size * 0.9,
              padding: EdgeInsets.only(
                bottom: isEmergency || isVacations ? size * 0.03 : size * 0.06,
              ),
              child: Text(
                iconLabel,
                style: TextStyle(
                  color: colores.primary,
                  fontFamily: 'RobotoCondensed',
                  fontSize: size * 0.135,
                  fontWeight: FontWeight.w700,
                  height:
                      isEmergency || isVacations ? size * 0.018 : size * 0.0095,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
