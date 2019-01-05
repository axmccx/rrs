class Project {
  final String id;
  int priority;
  int timeQuantum;

  Project(
    this.id,
    this.priority,
    this.timeQuantum,
  );

  void doWork(int time) {
    if (time < this.timeQuantum) {
      this.timeQuantum -= time;
    } else {
      int multiple = (time / this.timeQuantum).floor();
      for (int i=0; i<multiple; i++) {
        this.priority++;
      }
      int remainder = time % this.timeQuantum;
      if (remainder == 0) {
        this.timeQuantum = 120; // make 120 a modifiable value
      } else {
        this.timeQuantum = remainder;
      }
    }
  }

  @override
  String toString() {
    return 'Project{'
    'id: $id, '
    'priority: $priority, '
    'timeQuantum: $timeQuantum'
    '}';
  }
}