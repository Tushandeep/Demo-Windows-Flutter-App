import 'package:first_app/models/nav_bar.dart';
import 'package:first_app/views/home/components/nav_bar.dart';
import 'package:first_app/views/home/constants/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ThemeData _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _theme = Theme.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Column(
            children: <Widget>[
              // AppBar... (Make it Responsive)
              NavBarWidget(),
            ],
          ),

          // Drop Down for the Company NavActionButton...
          ListenableBuilder(
            listenable: navActionItems[2].isHovered,
            builder: (context, _) {
              if (navActionItems[2].isHovered.value) {
                return buildSubActionMenu(navActionItems[2]);
              } else {
                return const Center();
              }
            },
          ),

          // Drop Down for the Partner NavActionButton...
          ListenableBuilder(
            listenable: navActionItems[3].isHovered,
            builder: (context, _) {
              if (navActionItems[3].isHovered.value) {
                return buildSubActionMenu(navActionItems[3]);
              } else {
                return const Center();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildSubActionMenu(NavActionItem item) {
    return Positioned(
      left: item.position.dx + 10,
      top: item.position.dy + 40,
      child: MouseRegion(
        onHover: (_) {
          item.isHovered.value = true;
        },
        onExit: (_) {
          item.isHovered.value = false;
        },
        child: Container(
          width: 160,
          decoration: BoxDecoration(
            color: _theme.scaffoldBackgroundColor,
            border: Border.all(color: Colors.black, width: .1),
            // borderRadius: BorderRadius.circular(6),
          ),
          child: ClipRRect(
            // borderRadius: BorderRadius.circular(6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                item.subNavActionItem!.length,
                (index) {
                  final SubNavActionItem subItem =
                      item.subNavActionItem![index];
                  bool isHovered = false;

                  return StatefulBuilder(
                    builder: (context, update) {
                      return InkWell(
                        onHover: (value) {
                          update(() {
                            isHovered = !isHovered;
                          });
                        },
                        onTap: () {},
                        hoverColor: Colors.grey.shade100,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Icon(
                                subItem.icon,
                                size: 16,
                                color: (isHovered)
                                    ? _theme.colorScheme.primary
                                    : Colors.grey.shade500,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  subItem.title,
                                  style: _theme.textTheme.labelMedium?.copyWith(
                                    color: (isHovered)
                                        ? _theme.colorScheme.primary
                                        : Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
