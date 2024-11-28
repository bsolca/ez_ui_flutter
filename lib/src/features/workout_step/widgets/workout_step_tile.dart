import 'package:ez_fit_app/src/features/workout_exercise/workout_exercise_list.dart';
import 'package:ez_fit_app/src/features/workout_step/controllers/workout_steps_controller.codegen.dart';
import 'package:ez_fit_app/src/features/workout_step/model/workout_step_model.codegen.dart';
import 'package:ez_fit_app/src/shared/ez_expansion_tile/ez_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutStepTile extends ConsumerWidget {
  const WorkoutStepTile({
    super.key,
    required this.workoutStep,
    required this.workoutId,
  });

  final WorkoutStepModel workoutStep;
  final String workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    final tileBgColor = isLight
        ? Theme.of(context).colorScheme.surfaceContainerHighest
        : Theme.of(context).colorScheme.surfaceContainerHigh;
    final bgChildrenColor = isLight
        ? Theme.of(context).colorScheme.surfaceContainerHigh
        : Theme.of(context).colorScheme.surfaceContainerHighest;

    // TODO: REMOVE TESTY DEBUG LOG BEFORE COMMIT
    print('TESTY: In WorkoutStepTile');

    return EzExpansionTile(
      title: Text('${workoutStep.name} (WkId: $workoutId)'),
      subtitle: Text(workoutStep.description ?? ''),
      tileBgColor: tileBgColor,
      bgChildrenColor: bgChildrenColor,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add icon button
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              ref
                  .read(
                    workoutStepsControllerProvider(workoutId).notifier,
                  )
                  .createNewExercise(
                    stepId: workoutStep.id,
                  );
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Add edit functionality, e.g., open a dialog to edit the step
              ref
                  .read(
                    workoutStepsControllerProvider(workoutId).notifier,
                  )
                  .editStep(
                    workoutStep.copyWith(
                      name: 'Updated Name',
                    ), // Example update
                  );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              ref
                  .read(
                    workoutStepsControllerProvider(workoutId).notifier,
                  )
                  .removeStep(workoutStep.id);
            },
          ),
        ],
      ),
      children: [
        WorkoutExerciseList(
          key: Key(workoutStep.id),
          workoutId: workoutId,
          stepId: workoutStep.id,
        ),
      ],
    );
  }
}
