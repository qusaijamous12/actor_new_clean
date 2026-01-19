import 'package:flutter/material.dart';
import '../../../../core/constant/barrel_files.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../data/actor_model.dart';

class ActorCard extends StatelessWidget {
  final ActorModel model;

  const ActorCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadiusGeometry.only(
                topRight: Radius.circular(AppPadding.kPadding),
                topLeft: Radius.circular(AppPadding.kPadding),
              ),
              child: Image.network(
                '${model.image}',
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: AppPadding.kPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(title: '${model.name}', fontColor: Colors.black),
                  Row(
                    spacing: AppPadding.kPadding / 2,
                    children: [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: model.status == 'Alive'
                            ? AppColor.kPrimary
                            : Colors.red,
                      ),
                      Expanded(
                        child: CustomText(
                          title: '${model.status} - ${model.species}',
                          fontColor: Colors.black,
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
