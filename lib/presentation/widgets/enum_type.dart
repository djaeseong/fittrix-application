enum WorkoutType {
  lunge,
  squat,
  pushup,
  legRaise,
}

String workoutTypeEnumToString(WorkoutType type) {
  switch (type) {
    case WorkoutType.lunge:
      return 'Lunge';
    case WorkoutType.squat:
      return 'Squat';
    case WorkoutType.pushup:
      return 'Pushup';
    case WorkoutType.legRaise:
      return 'LegRaise';
    default:
      return 'Lunge';
  }
}

WorkoutType workoutTypeStringToEnum(String type) {
  switch (type) {
    case 'Lunge':
      return WorkoutType.lunge;
    case 'Squat':
      return WorkoutType.squat;
    case 'Pushup':
      return WorkoutType.pushup;
    case 'LegRaise':
      return WorkoutType.legRaise;
    default:
      return WorkoutType.lunge;
  }
}
