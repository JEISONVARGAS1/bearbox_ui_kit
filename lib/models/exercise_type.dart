enum ExerciseType {
  legs,           // Piernas
  arms,           // Brazos
  fullBody,       // Cuerpo completo
  abdomen,        // Abdomen
  cardio,         // Cardio
  flexibility,    // Flexibilidad
  strength,       // Fuerza
  balance,        // Equilibrio
  general,        // General
}

extension ExerciseTypeExtension on ExerciseType {
  String get displayName {
    switch (this) {
      case ExerciseType.legs:
        return 'Piernas';
      case ExerciseType.arms:
        return 'Brazos';
      case ExerciseType.fullBody:
        return 'Cuerpo Completo';
      case ExerciseType.abdomen:
        return 'Abdomen';
      case ExerciseType.cardio:
        return 'Cardio';
      case ExerciseType.flexibility:
        return 'Flexibilidad';
      case ExerciseType.strength:
        return 'Fuerza';
      case ExerciseType.balance:
        return 'Equilibrio';
      case ExerciseType.general:
        return 'General';
    }
  }

  String get description {
    switch (this) {
      case ExerciseType.legs:
        return 'Ejercicios enfocados en fortalecer las piernas';
      case ExerciseType.arms:
        return 'Ejercicios para tonificar brazos y hombros';
      case ExerciseType.fullBody:
        return 'Rutinas que trabajan todo el cuerpo';
      case ExerciseType.abdomen:
        return 'Ejercicios para fortalecer el core';
      case ExerciseType.cardio:
        return 'Ejercicios cardiovasculares';
      case ExerciseType.flexibility:
        return 'Ejercicios de estiramiento y flexibilidad';
      case ExerciseType.strength:
        return 'Entrenamiento de fuerza y resistencia';
      case ExerciseType.balance:
        return 'Ejercicios de equilibrio y estabilidad';
      case ExerciseType.general:
        return 'Ejercicios generales de fitness';
    }
  }
}
