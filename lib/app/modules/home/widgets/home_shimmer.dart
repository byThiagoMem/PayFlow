import 'package:flutter/material.dart';
import 'package:pay_flow_flutter/app/shared/theme/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.colors.white,
      highlightColor: AppTheme.colors.brandGradient,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return ListTile(
                title: Container(height: 15, color: AppTheme.colors.white),
                subtitle: Container(height: 10, color: AppTheme.colors.white),
                trailing: Container(height: 20, width: 70, color: AppTheme.colors.white),
              );
            },
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          );
        },
      ),
    );
  }
}
