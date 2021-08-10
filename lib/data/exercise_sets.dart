import 'package:calculadora_imc/model/exercise_set.dart';
import 'package:flutter/material.dart';
import 'exercise.dart';

final exerciseSets = [
  ExerciseSet(
    name: 'Brazos - Triceps',
    exercises: exercises1,
    imageUrl: 'assets/gym/brazos.png',
    exerciseType: ExerciseType.hard,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises2,
    imageUrl: 'assets/gym/crunch.png',
    exerciseType: ExerciseType.hard,
    color: Colors.green.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Upper Body',
    exercises: exercises3,
    imageUrl: 'assets/gym/pushup.png',
    exerciseType: ExerciseType.hard,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Pierna - Gluteo',
    exercises: exercises4,
    imageUrl: 'assets/gym/yoga.png',
    exerciseType: ExerciseType.hard,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Brazos - Triceps',
    exercises: exercises5,
    imageUrl: 'assets/gym/brazos.png',
    exerciseType: ExerciseType.mid,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises2,
    imageUrl: 'assets/gym/crunch.png',
    exerciseType: ExerciseType.mid,
    color: Colors.green.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Upper Body',
    exercises: exercises7,
    imageUrl: 'assets/gym/pushup.png',
    exerciseType: ExerciseType.mid,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Pierna - Gluteo',
    exercises: exercises8,
    imageUrl: 'assets/gym/yoga.png',
    exerciseType: ExerciseType.mid,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Brazos - Triceps',
    exercises: exercises9,
    imageUrl: 'assets/gym/brazos.png',
    exerciseType: ExerciseType.low,
    color: Colors.blue.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Abs',
    exercises: exercises10,
    imageUrl: 'assets/gym/crunch.png',
    exerciseType: ExerciseType.low,
    color: Colors.green.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Upper Body',
    exercises: exercises11,
    imageUrl: 'assets/gym/pushup.png',
    exerciseType: ExerciseType.low,
    color: Colors.orange.shade100.withOpacity(0.6),
  ),
  ExerciseSet(
    name: 'Pierna - Gluteo',
    exercises: exercises12,
    imageUrl: 'assets/gym/yoga.png',
    exerciseType: ExerciseType.low,
    color: Colors.purple.shade100.withOpacity(0.6),
  ),
];
