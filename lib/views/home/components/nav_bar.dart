import 'dart:math';

import 'package:first_app/constants/languages.dart';
import 'package:first_app/models/nav_bar.dart';
import 'package:first_app/views/home/constants/constants.dart';
import 'package:flutter/material.dart';

//-------------------------------- Main Class --------------------------------

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late ThemeData _theme;

  String currentLangugae = languages[0];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100,
          width: double.maxFinite,
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: _theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 10),

              // Main Nav bar on Left Side...
              const MainTopNavBar(),

              const Spacer(),

              // Right Action Buttons...
              const Flexible(
                flex: 4,
                child: NavActionButtons(),
              ),

              const SizedBox(width: 20),

              // Sign in Button...
              const SignInButtonWidget(),

              const SizedBox(width: 15),

              const LanguageSelector(),
            ],
          ),
        ),
      ],
    );
  }
}

class SignInButtonWidget extends StatefulWidget {
  const SignInButtonWidget({super.key});

  @override
  State<SignInButtonWidget> createState() => _SignInButtonWidgetState();
}

class _SignInButtonWidgetState extends State<SignInButtonWidget> {
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black87,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.lock_person_outlined,
              size: 16,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              "Sign In",
              style: _theme.textTheme.labelMedium?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({
    super.key,
  });

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return FractionallySizedBox(
              heightFactor: .8,
              widthFactor: .8,
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: _theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GridView.extent(
                  maxCrossAxisExtent: 100,
                  children: List.generate(
                    languages.length,
                    (index) => Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        languages[index],
                        style: _theme.textTheme.labelLarge,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 14,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.add,
            size: 18,
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 8),
          Text(
            "Select Language",
            style: _theme.textTheme.labelMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

class NavActionButtons extends StatefulWidget {
  const NavActionButtons({
    super.key,
  });

  @override
  State<NavActionButtons> createState() => _NavActionButtonsState();
}

class _NavActionButtonsState extends State<NavActionButtons> {
  late final GlobalKey companyKey = GlobalKey(), partnerKey = GlobalKey();

  late Size size;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 50), () {
      final RenderBox box1 =
          companyKey.currentContext?.findRenderObject() as RenderBox;

      navActionItems[2].position = box1.localToGlobal(Offset.zero);

      final RenderBox box2 =
          partnerKey.currentContext?.findRenderObject() as RenderBox;

      navActionItems[3].position = box2.localToGlobal(Offset.zero);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    size = MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 50), () {
      final RenderBox box1 =
          companyKey.currentContext?.findRenderObject() as RenderBox;

      navActionItems[2].position = box1.localToGlobal(Offset.zero);

      final RenderBox box2 =
          partnerKey.currentContext?.findRenderObject() as RenderBox;

      navActionItems[3].position = box2.localToGlobal(Offset.zero);
    });
    return Wrap(
      children: <Widget>[
        BuildActionLabelWidget(
          navActionItem: navActionItems[0],
        ),
        BuildActionLabelWidget(
          navActionItem: navActionItems[1],
        ),
        BuildActionLabelWidget(
          key: companyKey,
          navActionItem: navActionItems[2],
        ),
        BuildActionLabelWidget(
          key: partnerKey,
          navActionItem: navActionItems[3],
        ),
      ],
    );
  }
}

class BuildActionLabelWidget extends StatefulWidget {
  const BuildActionLabelWidget({
    super.key,
    required this.navActionItem,
  });

  final NavActionItem navActionItem;

  @override
  State<BuildActionLabelWidget> createState() => _BuildActionLabelWidgetState();
}

class _BuildActionLabelWidgetState extends State<BuildActionLabelWidget> {
  late NavActionItem item;
  late ThemeData _theme;

  final Color defaultColor = Colors.grey.shade600, hoverColor = Colors.black;

  // To show the Drop Downs...
  bool showDropDown = false;

  // To have control over the Pointer that it is hovering over the text...
  bool isHovering = false;

  @override
  void initState() {
    super.initState();

    item = widget.navActionItem;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          for (var element in navActionItems) {
            element.isHovered.value = false;
          }
          item.isHovered.value = true;

          setState(() {
            isHovering = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovering = false;
          });
        },
        child: GestureDetector(
          onTap: () {
            item.onTap;

            item.isHovered.value = !item.isHovered.value;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.icon,
                  size: 16,
                  color: isHovering ? hoverColor : defaultColor,
                ),
                const SizedBox(width: 4),
                Text(
                  item.title,
                  style: _theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isHovering ? hoverColor : defaultColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*



*/

class MainTopNavBar extends StatefulWidget {
  const MainTopNavBar({
    super.key,
  });

  @override
  State<MainTopNavBar> createState() => _MainTopNavBarState();
}

class _MainTopNavBarState extends State<MainTopNavBar> {
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        navBarItems.length,
        (index) {
          final NavBarItem item = navBarItems[index];
          double angle = -pi / 2;
          Color backgroundColor = Colors.transparent;
          return StatefulBuilder(builder: (context, update) {
            return Container(
              height: double.maxFinite,
              padding: const EdgeInsets.symmetric(
                vertical: 6,
                horizontal: 8,
              ),
              color: backgroundColor,
              alignment: Alignment.center,
              child: MouseRegion(
                onEnter: (_) {
                  backgroundColor = Colors.yellow.shade100;
                  update(() {});
                },
                onExit: (_) {
                  backgroundColor = Colors.transparent;
                  update(() {});
                },
                cursor: SystemMouseCursors.click,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.title,
                      style: _theme.textTheme.labelSmall?.copyWith(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.main,
                          style: _theme.textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Transform.rotate(
                          alignment: Alignment.center,
                          angle: angle,
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
