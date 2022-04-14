import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class FloatingSearchBarWidget extends StatelessWidget {
  const FloatingSearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final floatingSearchController = FloatingSearchBarController();
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      automaticallyImplyBackButton: false,
      isScrollControlled: true,
      automaticallyImplyDrawerHamburger: false,
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      clearQueryOnClose: true,
      controller: floatingSearchController,
      width: MediaQuery.of(context).size.width / 2,
      height: 60,
      debounceDelay: const Duration(milliseconds: 500),
      onFocusChanged: (focus) {
        print("focus changed");
      },
      onQueryChanged: (query) {
        print("query changed");
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              print("search button icon pressed");
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      body: Container(
        height: 100,
        width: 100,
      ),
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: SingleChildScrollView(),
            ),
          ),
        );
      },
    );
  }
}
