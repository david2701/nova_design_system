import 'package:flutter/material.dart';
import '../../tokens/colors.dart';
import '../../tokens/typography.dart';

/// An avatar component for the Nova design system
class NovaAvatar extends StatelessWidget {
  /// Creates a Nova avatar
  const NovaAvatar({
    super.key,
    this.image,
    this.initials,
    this.icon,
    this.variant = NovaAvatarVariant.primary,
    this.size = NovaAvatarSize.medium,
    this.isDisabled = false,
    this.onTap,
  });

  /// The image to display in the avatar
  final ImageProvider? image;

  /// The initials to display in the avatar
  final String? initials;

  /// The icon to display in the avatar
  final IconData? icon;

  /// The visual style variant of the avatar
  final NovaAvatarVariant variant;

  /// The size of the avatar
  final NovaAvatarSize size;

  /// Whether the avatar is disabled
  final bool isDisabled;

  /// Called when the avatar is tapped
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final avatar = Container(
      width: _getSize(),
      height: _getSize(),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        shape: BoxShape.circle,
        image: image != null
            ? DecorationImage(
                image: image!,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: _buildContent(),
    );

    if (onTap != null && !isDisabled) {
      return GestureDetector(
        onTap: onTap,
        child: avatar,
      );
    }

    return avatar;
  }

  Widget _buildContent() {
    if (image != null) return const SizedBox.shrink();

    if (initials != null) {
      return Center(
        child: Text(
          initials!,
          style: _getTextStyle(),
        ),
      );
    }

    if (icon != null) {
      return Center(
        child: Icon(
          icon,
          size: _getIconSize(),
          color: _getIconColor(),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  Color _getBackgroundColor() {
    if (isDisabled) return NovaColors.neutral200;

    switch (variant) {
      case NovaAvatarVariant.primary:
        return NovaColors.primary;
      case NovaAvatarVariant.secondary:
        return NovaColors.secondary;
      case NovaAvatarVariant.success:
        return NovaColors.success;
      case NovaAvatarVariant.warning:
        return NovaColors.warning;
      case NovaAvatarVariant.danger:
        return NovaColors.error;
      case NovaAvatarVariant.neutral:
        return NovaColors.neutral700;
    }
  }

  TextStyle _getTextStyle() {
    final baseStyle = size == NovaAvatarSize.small
        ? NovaTypography.labelSmall
        : size == NovaAvatarSize.medium
            ? NovaTypography.labelMedium
            : NovaTypography.labelLarge;

    return baseStyle.copyWith(
      color: NovaColors.textInverse,
    );
  }

  Color _getIconColor() {
    return NovaColors.textInverse;
  }

  double _getSize() {
    switch (size) {
      case NovaAvatarSize.small:
        return 24;
      case NovaAvatarSize.medium:
        return 32;
      case NovaAvatarSize.large:
        return 40;
    }
  }

  double _getIconSize() {
    switch (size) {
      case NovaAvatarSize.small:
        return 12;
      case NovaAvatarSize.medium:
        return 16;
      case NovaAvatarSize.large:
        return 20;
    }
  }
}

/// Visual style variants for the Nova avatar
enum NovaAvatarVariant {
  /// Primary avatar style
  primary,

  /// Secondary avatar style
  secondary,

  /// Success avatar style
  success,

  /// Warning avatar style
  warning,

  /// Danger avatar style
  danger,

  /// Neutral avatar style
  neutral,
}

/// Size variants for the Nova avatar
enum NovaAvatarSize {
  /// Small avatar size
  small,

  /// Medium avatar size
  medium,

  /// Large avatar size
  large,
} 