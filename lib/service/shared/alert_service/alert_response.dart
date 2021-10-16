class AlertResponse {
  final String ?title;
  final bool ?status;

  AlertResponse({
    this.title,
    this.status,
  });
}

class AlertDatePickerResponse {
  final String ?startDate;
  final String ?endDate;
  final bool ?status;

  AlertDatePickerResponse({
    this.startDate,
    this.endDate,
    this.status,
  });
}
