import 'package:flutter/material.dart';
import 'package:pro_multimedia_app/src/config/styles/app_colors.dart';
import 'half_circle_with_arrow.dart';

class RecommendedHeader extends StatelessWidget {
  final bool isAppBarExpanded;
  final bool isLandscape;

  const RecommendedHeader(
      {required this.isAppBarExpanded, required this.isLandscape, super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _HeaderDelegate(
        isLandscape: isLandscape,
        isAppBarExpanded: isAppBarExpanded,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(isLandscape ? 8 : 16),
                  child: Flex(
                    direction: isLandscape ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: isLandscape
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: 30, left: isLandscape ? 8 : 0),
                        child: const Text(
                          'Polecane',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.purpleAccent.withOpacity(0.5),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Płatne'),
                          ),
                          const SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Bezpłatne'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -30,
                  right: 30,
                  child:
                      HalfCircleWithArrow(isAppBarExpanded: isAppBarExpanded),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final bool isAppBarExpanded;
  final bool isLandscape;

  _HeaderDelegate(
      {required this.child,
      required this.isAppBarExpanded,
      required this.isLandscape});

  @override
  double get minExtent => isLandscape ? 60 : 122;

  @override
  double get maxExtent => isLandscape ? 60 : 122;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.background,
      child: child,
    );
  }

  @override
  @override
  bool shouldRebuild(covariant _HeaderDelegate oldDelegate) {
    return oldDelegate.isAppBarExpanded != isAppBarExpanded ||
        oldDelegate.isLandscape != isLandscape;
  }
}
