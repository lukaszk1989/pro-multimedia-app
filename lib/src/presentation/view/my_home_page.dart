import 'package:flutter/material.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/custom_grid_view.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/custom_silver_app_bar.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/recommended_header.dart';
import 'package:pro_multimedia_app/src/presentation/widgets/rotatable_arrow_icon.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isAppBarExpanded = true;
  bool _showFAB = false;
  late ScrollController _scrollController;
  double appBarHeight = 60;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    double scrollThreshold = context.size!.height / 2 - appBarHeight;
    if (_scrollController.offset > scrollThreshold && !_showFAB) {
      setState(() {
        _showFAB = true;
      });
    } else if (_scrollController.offset <= scrollThreshold && _showFAB) {
      setState(() {
        _showFAB = false;
      });
    }
  }

  void _scrollToTop() {
    double scrollThreshold = context.size!.height / 2 - appBarHeight;
    _scrollController.animateTo(
      scrollThreshold,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return SafeArea(
      left: isLandscape,
      right: isLandscape,
      top: false,
      bottom: false,
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomSilverAppBar(
              isLandscape: isLandscape,
              appBarHeight: appBarHeight,
              onExpandChange: (value) {
                setState(() {
                  _isAppBarExpanded = value;
                });
              },
            ),
            RecommendedHeader(
              isAppBarExpanded: _isAppBarExpanded,
                isLandscape:isLandscape,
            ),
            const CustomGridView(),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
        floatingActionButton: _showFAB
            ? FloatingActionButton(
                onPressed: () => _scrollToTop(),
                backgroundColor: Colors.greenAccent,
                shape: const CircleBorder(),
                child: const RotatableArrowIcon(
                  angle: 270,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
