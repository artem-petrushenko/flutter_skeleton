import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavigationBar extends StatefulWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavigationBar> createState() => _ScaffoldWithNavigationBarState();
}

class _ScaffoldWithNavigationBarState extends State<ScaffoldWithNavigationBar> {
  late final ValueNotifier<int> _index;

  @override
  void initState() {
    super.initState();
    _index = ValueNotifier(widget.navigationShell.currentIndex);
  }

  @override
  void didUpdateWidget(covariant ScaffoldWithNavigationBar oldWidget) {
    if (widget.navigationShell.currentIndex != _index.value) {
      _index.value = widget.navigationShell.currentIndex;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _index.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _index,
        builder: (BuildContext context, int value, Widget? child) {
          return NavigationBar(
            selectedIndex: value,
            onDestinationSelected: _onDestinationSelected,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
              )
            ],
          );
        },
      ),
    );
  }

  void _onDestinationSelected(int index) {
    if (index == _index.value) return;
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    _index.value = index;
  }
}
