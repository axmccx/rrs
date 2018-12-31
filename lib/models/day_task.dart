class DayTask {
  final String id;
  final time;
  final int priority;

  DayTask({
    this.id,
    this.time,
    this.priority,
  });

  @override
  String toString() {
    return 'DayTask{'
    'id: $id, '
    'time: $time, '
    'priority: $priority' 
    '}';
  }
}