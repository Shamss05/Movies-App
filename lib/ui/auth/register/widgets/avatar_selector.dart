import 'package:flutter/material.dart';
import 'package:movie_app/l10n/app_localizations.dart';

class AvatarSelector extends StatefulWidget {
  final List<String> avatarAssets;
  final int initialIndex;
  final ValueChanged<int>? onAvatarSelected;

  const AvatarSelector({
    super.key,
    this.avatarAssets = const [
      'assets/avatar_1.png',
      'assets/avatar_2.png',
      'assets/avatar_3.png',
      'assets/avatar_4.png',
      'assets/avatar_5.png',
      'assets/avatar_6.png',
      'assets/avatar_7.png',
      'assets/avatar_8.png',
      'assets/avatar_9.png',
    ],
    this.initialIndex = 1,
    this.onAvatarSelected,
  });

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  late final PageController _pageController;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _pageController = PageController(
      initialPage: _selectedIndex,
      viewportFraction: 0.36,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onAvatarSelected?.call(index);
  }

  void _animateToIndex(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 118,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.avatarAssets.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final isSelected = index == _selectedIndex;
              final size = isSelected ? 110.0 : 72.0;
              return Center(
                child: GestureDetector(
                  onTap: () => _animateToIndex(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    width: size,
                    height: size,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: ClipOval(
                      child: Image.asset(
                        widget.avatarAssets[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Text(l10n.avatar, style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),),
      ],
    );
  }
}
