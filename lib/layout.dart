import 'package:scids/constants/colors.dart';
import 'package:scids/data/bar_items.dart';
import 'package:scids/widgets/bottom_bar_container.dart';
import 'package:flutter/material.dart';

class ProjectLayout extends StatefulWidget {
  const ProjectLayout({Key? key}) : super(key: key);

  @override
  _ProjectLayoutState createState() => _ProjectLayoutState();
}

class _ProjectLayoutState extends State<ProjectLayout>
    with TickerProviderStateMixin {
  int _activeTab = 0;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  _buildAnimatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      _activeTab = index;
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      bottomNavigationBar: _buildBottomBar(),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return IndexedStack(
      index: _activeTab,
      children: List.generate(
        bottomNavBarItems.length,
        (index) => _buildAnimatedPage(bottomNavBarItems[index]["view"]),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 1),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 2,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            bottomNavBarItems.length,
            (index) => BottomBarContainer(
              bottomNavBarItems[index]["icon"],
              isActive: _activeTab == index,
              activeColor: primaryColor,
              onTap: () {
                onPageChanged(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
