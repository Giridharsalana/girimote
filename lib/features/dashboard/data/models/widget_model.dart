
enum WidgetType {
  gauge,
  switchWidget,
  button,
  plot,
}

class DashboardWidgetModel {
  final String id;
  final WidgetType type;
  final String title;
  final int x;
  final int y;
  final int width;
  final int height;

  DashboardWidgetModel({
    required this.id,
    required this.type,
    required this.title,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  factory DashboardWidgetModel.fromJson(Map<String, dynamic> json) {
    return DashboardWidgetModel(
      id: json['id'],
      type: WidgetType.values.firstWhere((e) => e.toString() == 'WidgetType.' + json['type']),
      title: json['title'],
      x: json['x'],
      y: json['y'],
      width: json['width'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.toString(),
      'title': title,
      'x': x,
      'y': y,
      'width': width,
      'height': height,
    };
  }
}
