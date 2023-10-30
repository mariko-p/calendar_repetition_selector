import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:rrule/rrule.dart';


@immutable
class RruleL10nSv extends RruleL10n {
  const RruleL10nSv._();

  static Future<RruleL10nSv> create() async {
    await initializeDateFormatting('sv');
    return RruleL10nSv._();
  }

  @override
  String get locale => 'sv_SE';

  @override
  String frequencyInterval(Frequency frequency, int interval) {
    String plurals({required String one, required String singular}) {
      switch (interval) {
        case 1:
          return one;
        case 2:
          return 'Varannan $singular';
        default:
          return 'Varje $interval ${singular}s';
      }
    }

    return {
      Frequency.secondly: plurals(one: 'varje sekund', singular: 'sekund'),
      Frequency.minutely: plurals(one: 'varje minut', singular: 'minut'),
      Frequency.hourly: plurals(one: 'varje timme', singular: 'timme'),
      Frequency.daily: plurals(one: 'varje dag', singular: 'dag'),
      Frequency.weekly: plurals(one: 'varje vecka', singular: 'vecka'),
      Frequency.monthly: plurals(one: 'varje månad', singular: 'månad'),
      Frequency.yearly: plurals(one: 'varje år', singular: 'år'),
    }[frequency]!;
  }

  @override
  String until(DateTime until) =>
      ', until ${formatWithIntl(() => DateFormat.yMMMMEEEEd().add_jms().format(until))}';

  @override
  String count(int count) {
    switch (count) {
      case 1:
        return ', en gång';
      case 2:
        return ', två gånger';
      default:
        return ', $count gånger';
    }
  }

  @override
  String onInstances(String instances) => 'den $instances gången';

  @override
  String inMonths(String months, {InOnVariant variant = InOnVariant.simple}) =>
      '${_inVariant(variant)} $months';

  @override
  String inWeeks(String weeks, {InOnVariant variant = InOnVariant.simple}) =>
      '${_inVariant(variant)} den $weeks veckan på året';

  String _inVariant(InOnVariant variant) {
    switch (variant) {
      case InOnVariant.simple:
        return 'i';
      case InOnVariant.also:
        return 'som också är i';
      case InOnVariant.instanceOf:
        return 'på';
    }
  }

  @override
  String onDaysOfWeek(
    String days, {
    bool indicateFrequency = false,
    DaysOfWeekFrequency? frequency = DaysOfWeekFrequency.monthly,
    InOnVariant variant = InOnVariant.simple,
  }) {
    assert(variant != InOnVariant.also);

    final frequencyString =
        frequency == DaysOfWeekFrequency.monthly ? 'månad' : 'år';
    final suffix = indicateFrequency ? ' på den $frequencyString' : '';
    return '${_onVariant(variant)} $days$suffix';
  }

  @override
  String get weekdaysString => 'veckodagar';
  @override
  String get everyXDaysOfWeekPrefix => 'varje ';
  @override
  String nthDaysOfWeek(Iterable<int> occurrences, String daysOfWeek) {
    if (occurrences.isEmpty) return daysOfWeek;

    final ordinals = list(
      occurrences.map(ordinal).toList(),
      ListCombination.conjunctiveShort,
    );
    return 'den $ordinals $daysOfWeek';
  }

  @override
  String onDaysOfMonth(
    String days, {
    DaysOfVariant daysOfVariant = DaysOfVariant.dayAndFrequency,
    InOnVariant variant = InOnVariant.simple,
  }) {
    final suffix = {
      DaysOfVariant.simple: '',
      DaysOfVariant.day: ' dag',
      DaysOfVariant.dayAndFrequency: ' dagen av månaden',
    }[daysOfVariant];
    return '${_onVariant(variant)} den $days$suffix';
  }

  @override
  String onDaysOfYear(
    String days, {
    InOnVariant variant = InOnVariant.simple,
  }) =>
      '${_onVariant(variant)} den $days dagen på året';

  String _onVariant(InOnVariant variant) {
    switch (variant) {
      case InOnVariant.simple:
        return 'på';
      case InOnVariant.also:
        return 'som också är';
      case InOnVariant.instanceOf:
        return 'av';
    }
  }

  @override
  String list(List<String> items, ListCombination combination) {
    String two;
    String end;
    switch (combination) {
      case ListCombination.conjunctiveShort:
        two = ' & ';
        end = ' & ';
        break;
      case ListCombination.conjunctiveLong:
        two = ' och ';
        end = ', och ';
        break;
      case ListCombination.disjunctive:
        two = ' eller ';
        end = ', eller ';
        break;
    }
    return RruleL10n.defaultList(items, two: two, end: end);
  }

  @override
  String ordinal(int number) {
    assert(number != 0);
    if (number == -1) return 'sista';

    final n = number.abs();
    String string;
    if (n % 10 == 1 && n % 100 != 11) {
      string = '${n}:a';
    } else if (n % 10 == 2 && n % 100 != 12) {
      string = '${n}:a';
    } else if (n % 10 == 3 && n % 100 != 13) {
      string = '${n}:e';
    } else {
      string = '${n}:e';
    }

    return number < 0 ? '$string-to-last' : string;
  }
}
