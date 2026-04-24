import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconPickerWidget extends StatefulWidget {
  final Function(IconData) onIconSelected;
  final IconData selectedIcon;

  const IconPickerWidget({
    super.key,
    required this.onIconSelected,
    required this.selectedIcon,
  });

  @override
  State<IconPickerWidget> createState() => _IconPickerWidgetState();
}

class _IconPickerWidgetState extends State<IconPickerWidget> {
  final List<IconData> icons = [
    FontAwesomeIcons.globe,
    FontAwesomeIcons.chrome,
    FontAwesomeIcons.google,
    FontAwesomeIcons.microsoft,
    FontAwesomeIcons.firefox,
    FontAwesomeIcons.edge,
    FontAwesomeIcons.brave,
    FontAwesomeIcons.facebook,
    FontAwesomeIcons.xTwitter,
    FontAwesomeIcons.instagram,
    FontAwesomeIcons.youtube,
    FontAwesomeIcons.tiktok,
    FontAwesomeIcons.snapchat,
    FontAwesomeIcons.apple,
    FontAwesomeIcons.linkedin,
    FontAwesomeIcons.github,
    FontAwesomeIcons.spotify,
    FontAwesomeIcons.whatsapp,
    FontAwesomeIcons.telegram,
    FontAwesomeIcons.discord,
    FontAwesomeIcons.steam,
    FontAwesomeIcons.duolingo,
    FontAwesomeIcons.playstation,
    FontAwesomeIcons.notion,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Choose Icon",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEDE6D8),
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 180,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: icons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final icon = icons[index];
              final isSelected = icon == widget.selectedIcon;

              return GestureDetector(
                onTap: () {
                  widget.onIconSelected(icon);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFEDE6D8)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFEDE6D8)),
                  ),
                  child: Center(
                    child: FaIcon(
                      icon,
                      color: isSelected
                          ? const Color(0xFF000619)
                          : const Color(0xFFEDE6D8),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
