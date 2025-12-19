enum TimeFrame {
  daily,
  weekly,
  monthly;

  static TimeFrame fromIndex(int index) {
    switch (index) {
      case 0:
        return TimeFrame.daily;
      case 1:
        return TimeFrame.weekly;
      case 2:
        return TimeFrame.monthly;
      default:
        return TimeFrame.daily;
    }
  }
}

extension TimeFrameExt on TimeFrame {
  String get title {
    switch (this) {
      case TimeFrame.daily:
        return 'Daily';
      case TimeFrame.weekly:
        return 'Weekly';
      case TimeFrame.monthly:
        return 'Monthly';
    }
  }
}
