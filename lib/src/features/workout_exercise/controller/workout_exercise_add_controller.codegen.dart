import 'package:ez_fit_app/src/features/exercise/exercise_list.dart';
import 'package:ez_fit_app/src/features/workout/controller/workout_form_controller.codegen.dart';
import 'package:ez_fit_app/src/features/workout_exercise/model/workout_exercise_model.codegen.dart';
import 'package:ez_fit_app/src/shared/ez_dialog/ez_dialog.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_exercise_add_controller.codegen.g.dart';

@riverpod
class WorkoutExerciseAddController extends _$WorkoutExerciseAddController {
  @override
  void build() {
    // No state to initialize here
  }

  /// Displays a dialog to add an exercise to a workout step.
  void showAddExerciseDialog({
    required String workoutId,
    required String stepId,
  }) {
    EzDialog.show<void>(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExerciseList(
            onCellTap: (details, exercises) {
              if (details.rowColumnIndex.rowIndex > 0) {
                final rowIndex = details.rowColumnIndex.rowIndex - 1;
                if (rowIndex < exercises.length) {
                  final exercise = exercises[rowIndex];
                  final uid = Faker().guid.guid();
                  // TODO: REMOVE TESTY DEBUG LOG BEFORE COMMIT
                  print('TESTY: uid: $uid');
                  ref
                      .read(
                    workoutFormControllerProvider(
                      workoutId: workoutId,
                    ).notifier,
                  )
                      .addExercise(
                    WorkoutExerciseModel.newWorkoutExercise(
                      id: uid,
                      stepId: stepId,
                      exerciseId: exercise.id,
                    ),
                  );
                  EzDialog.dismiss<void>();
                }
              }
            },
          ),
        );
      },
    );
  }
}
