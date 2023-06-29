import 'package:first_app/models/nav_bar.dart';
import 'package:flutter/material.dart';

final List<NavActionItem> navActionItems = <NavActionItem>[
  NavActionItem(
    title: "Gallery",
    icon: Icons.photo_outlined,
    isHovered: ValueNotifier(false),
    onTap: () {},
  ),
  NavActionItem(
    title: "Downloads",
    icon: Icons.download_outlined,
    isHovered: ValueNotifier(false),
    onTap: () {},
  ),
  NavActionItem(
    title: "Company",
    icon: Icons.school_outlined,
    isHovered: ValueNotifier(false),
    onTap: () {},
    subNavActionItem: <SubNavActionItem>[
      SubNavActionItem(
        title: "About Us",
        icon: Icons.people_outline_outlined,
        onPress: () {},
      ),
      SubNavActionItem(
        title: "Contact",
        icon: Icons.call_outlined,
        onPress: () {},
      ),
      SubNavActionItem(
        title: "Technical Support",
        icon: Icons.headphones_outlined,
        onPress: () {},
      ),
      SubNavActionItem(
        title: "Sales Support",
        icon: Icons.handshake_outlined,
        onPress: () {},
      ),
    ],
  ),
  NavActionItem(
    title: "Partner",
    icon: Icons.people_outlined,
    isHovered: ValueNotifier(false),
    onTap: () {},
    subNavActionItem: <SubNavActionItem>[
      SubNavActionItem(
        title: "Partner Program",
        icon: Icons.people_outline_outlined,
        onPress: () {},
      ),
      SubNavActionItem(
        title: "Partner Locator",
        icon: Icons.people_outline_outlined,
        onPress: () {},
      ),
      SubNavActionItem(
        title: "Partner Application",
        icon: Icons.people_outline_outlined,
        onPress: () {},
      ),
      SubNavActionItem(
        title: "Partner Login",
        icon: Icons.people_outline_outlined,
        onPress: () {},
      ),
    ],
  ),
];

final List<NavBarItem> navBarItems = <NavBarItem>[
  const NavBarItem(
    title: "Network",
    main: "Switched",
  ),
  const NavBarItem(
    title: "All",
    main: "Wireless",
  ),
  const NavBarItem(
    title: "All",
    main: "Routers",
  ),
  const NavBarItem(
    title: "Media",
    main: "Converters",
  ),
  const NavBarItem(
    title: "SFP",
    main: "Modules",
  ),
  const NavBarItem(
    title: "Networking",
    main: "Accessories",
  ),
];

String? currentLanguage;
