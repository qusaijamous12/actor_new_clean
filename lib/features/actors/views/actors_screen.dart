import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../core/constant/app_color.dart';
import '../../../core/constant/app_padding.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/widgets/custom_text.dart';
import '../../../core/widgets/main_app_bar.dart';
import '../cubit/actor_cubit.dart';
import '../cubit/actor_state.dart';
import 'widgets/actor_card.dart';

class ActorsScreen extends StatelessWidget {
  const ActorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ActorCubit>()..getActors(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: const MainAppBar(title: 'Actors Screen'),
          body: BlocBuilder<ActorCubit, ActorState>(
            builder: (context, state) {
              return switch (state) {
                LoadingGetActors() => const Center(
                  child: CircularProgressIndicator(color: AppColor.kPrimary),
                ),
                SuccessGetActors(actors: final actors) => SmartRefresher(
                  controller: context.read<ActorCubit>().refreshController,
                  child: GridView.builder(
                    padding: const EdgeInsetsDirectional.all(
                      AppPadding.kPadding,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppPadding.kPadding / 2,
                          crossAxisSpacing: AppPadding.kPadding / 2,
                          childAspectRatio: 0.65,
                        ),
                    itemBuilder: (context, index) =>
                        ActorCard(model: actors[index]),
                    itemCount: actors.length,
                  ),
                ),
                FailureGetActors(message: final msg) => Center(
                  child: CustomText(title: 'Error: $msg'),
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }
}
