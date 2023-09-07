import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:full_responsive/full_responsive.dart';
import 'package:prlab_flutter/extensiones/extensiones.dart';
import 'package:prlab_flutter/l10n/l10n.dart';
import 'package:prlab_flutter/theming/base.dart';

/// {@template Calendario}
/// Calendario general que va a ser usado en la app con el theme de pr lab.
/// Este Calendario es para filtrar por algo o solamente es para seleccionar
/// una fecha en especifica.
/// Tiene dos parámetros,al ejecutarse cuando el usuario hace click una nueva
/// fecha.
///
/// `onValueChanged`, una función de devolución de llamada que se llama
/// cuando cambian las fechas
/// seleccionadas, y `singleDatePickerValueWithDefaultValue`, una lista de
/// objetos `DateTime` que
/// representan las fechas seleccionadas con un valor por defecto.
/// {@endtemplate}
class Calendario extends StatefulWidget {
  /// {@macro Calendario}
  const Calendario({
    required this.onValueChanged,
    required this.singleDatePickerValueWithDefaultValue,
    super.key,
  });

  /// seleccionar una fecha
  final void Function(List<DateTime?>)? onValueChanged;

  /// el valor del
  final List<DateTime?> singleDatePickerValueWithDefaultValue;

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return _buildDefaultSingleDatePickerWithValue();
  }

  Widget _buildDefaultSingleDatePickerWithValue() {
    final colores = context.colores;

    final l10n = context.l10n;

    // Configuracion del calendario
    final config = CalendarDatePicker2Config(
      selectedYearTextStyle: TextStyle(
        color: colores.onBackground,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      centerAlignModePicker: true,
      calendarType: CalendarDatePicker2Type.single,
      dayBorderRadius: BorderRadius.circular(5),
      lastMonthIcon: Icon(
        Icons.arrow_left_rounded,
        color: colores.primary,
      ),
      nextMonthIcon: Icon(
        Icons.arrow_right_rounded,
        color: colores.primary,
      ),
      yearBorderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
      yearBuilder: ({
        decoration,
        isCurrentYear,
        isDisabled,
        isSelected,
        textStyle,
        year = 10,
      }) {
        return Center(
          child: Container(
            height: 30.ph,
            width: 50.pw,
            decoration: decoration,
            child: Center(
              child: Text(
                year.toString(),
                style: textStyle,
              ),
            ),
          ),
        );
      },
      dayBuilder: ({
        required date,
        decoration,
        isDisabled,
        isSelected,
        isToday,
        textStyle,
      }) {
        if (isSelected!) {
          return Center(
            child: Container(
              width: 30,
              height: 30,
              decoration: decoration,
              child: Center(
                child: Text(
                  date.day.toString(),
                  style: TextStyle(
                    color: colores.surfaceTint,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }
        return Center(
          child: Container(
            width: 30,
            height: 30,
            decoration: decoration,
            child: Center(
              child: Text(
                date.day.toString(),
                style: TextStyle(
                  // TODO(anyone): cambiar en el theme
                  color: colores.letrasDelCalendario,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        );
      },
      customModePickerIcon: Container(
        color: Colors.transparent,
        height: 0,
        width: 0,
      ),
      calendarViewMode: DatePickerMode.day,
      selectedDayHighlightColor: colores.primary,
      weekdayLabels: [
        l10n.commonCalendarSUN,
        l10n.commonCalendarMON,
        l10n.commonCalendarTUE,
        l10n.commonCalendarWED,
        l10n.commonCalendarTHU,
        l10n.commonCalendarFRI,
        l10n.commonCalendarSAT,
      ],
      weekdayLabelTextStyle: TextStyle(
        color: colores.secondary,
        fontWeight: FontWeight.bold,
      ),
      firstDayOfWeek: 0,
      controlsHeight: 50,
      controlsTextStyle: TextStyle(
        color: colores.primary,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      dayTextStyle: TextStyle(
        color: colores.tertiary,
        fontWeight: FontWeight.bold,
      ),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
    );

    // Build del calendario
    return CalendarDatePicker2(
      config: config,
      value: widget.singleDatePickerValueWithDefaultValue,
      onValueChanged: widget.onValueChanged,
    );
  }
}
