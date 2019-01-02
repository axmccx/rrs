class Project {
  final String id;
  final int priority;
  final timeQuantum;

  Project({
    this.id,
    this.priority,
    this.timeQuantum,
  });

  @override
  String toString() {
    return 'Project{'
    'id: $id, '
    'priority: $priority, '
    'timeQuantum: $timeQuantum'
    '}';
  }
}