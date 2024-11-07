import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:pro_multimedia_app/src/config/styles/app_assets.dart';
import 'custom_app_bar_icon.dart';

class CustomSilverAppBar extends StatefulWidget {
  final ValueChanged<bool> onExpandChange;
  final double appBarHeight;
  final bool isLandscape;

  const CustomSilverAppBar(
      {required this.onExpandChange, required this.appBarHeight, super.key, required this.isLandscape});

  @override
  State<CustomSilverAppBar> createState() => _CustomSilverAppBarState();
}

class _CustomSilverAppBarState extends State<CustomSilverAppBar> {
  late VideoPlayerController _controller;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(AppAssets.video)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateExpandedState(double maxHeight, double expandedHeight) {
    final isCurrentlyExpanded = maxHeight >= expandedHeight * 0.7;
    if (_isExpanded != isCurrentlyExpanded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isExpanded = isCurrentlyExpanded;
          widget.onExpandChange(isCurrentlyExpanded);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double expandedHeight = MediaQuery.of(context).size.height / 2;


    return SliverAppBar(
      expandedHeight: expandedHeight,
      collapsedHeight: widget.appBarHeight,
      pinned: true,
      stretch: true,
      centerTitle: true,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          _updateExpandedState(constraints.maxHeight, expandedHeight);
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: FlexibleSpaceBar(
              key: ValueKey<bool>(_isExpanded),
              title: _isExpanded
                  ? Image.asset(
                      AppAssets.logoSlaskieWhite,
                      height: 40,
                    )
                  : Image.asset(
                      AppAssets.logoSlaskieBlue,
                      height: 30,
                    ),
              titlePadding:
                  const EdgeInsetsDirectional.only(start: 0, bottom: 16),
              centerTitle: true,
              background: widget.isLandscape
                  ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
            ),
          );
        },
      ),
      leading: CustomAppBarIcon(
        icon: Icons.menu,
        isExpanded: _isExpanded,
      ),
      actions: [
        CustomAppBarIcon(
          icon: Icons.favorite_border,
          isExpanded: _isExpanded,
        ),
        const SizedBox(
          width: 15,
        ),
        CustomAppBarIcon(
          icon: Icons.search,
          isExpanded: _isExpanded,
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
