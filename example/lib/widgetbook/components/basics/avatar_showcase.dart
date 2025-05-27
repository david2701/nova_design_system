import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final avatarStories = WidgetbookComponent(
  name: 'Avatar',
  useCases: [
    WidgetbookUseCase(
      name: 'Avatar Showcase',
      builder: (context) => const NovaAvatarShowcase(),
    ),
  ],
);

class NovaAvatarShowcase extends StatelessWidget {
  const NovaAvatarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Avatar', 'User profile picture component with multiple variants'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Sizes', [
            _AvatarDemo('Small', const NovaAvatar(
              size: NovaAvatarSize.small,
              initials: 'SM',
            )),
            _AvatarDemo('Medium', const NovaAvatar(
              size: NovaAvatarSize.medium,
              initials: 'MD',
            )),
            _AvatarDemo('Large', const NovaAvatar(
              size: NovaAvatarSize.large,
              initials: 'LG',
            )),
          ]),
          
          _buildVariantSection('With Images', [
            _AvatarDemo('Network Image', const NovaAvatar(
              size: NovaAvatarSize.large,
              image: NetworkImage('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face'),
            )),
            _AvatarDemo('Asset Image', const NovaAvatar(
              size: NovaAvatarSize.large,
              image: AssetImage('assets/images/avatar.png'),
            )),
          ]),
          
          _buildVariantSection('With Initials', [
            _AvatarDemo('Two Letters', const NovaAvatar(
              size: NovaAvatarSize.large,
              initials: 'JD',
            )),
            _AvatarDemo('One Letter', const NovaAvatar(
              size: NovaAvatarSize.large,
              initials: 'A',
            )),
            _AvatarDemo('Three Letters', const NovaAvatar(
              size: NovaAvatarSize.large,
              initials: 'ABC',
            )),
          ]),
          
          _buildVariantSection('With Icons', [
            _AvatarDemo('Person Icon', const NovaAvatar(
              size: NovaAvatarSize.large,
              icon: Icons.person,
            )),
            _AvatarDemo('Group Icon', const NovaAvatar(
              size: NovaAvatarSize.large,
              icon: Icons.group,
            )),
            _AvatarDemo('Business Icon', const NovaAvatar(
              size: NovaAvatarSize.large,
              icon: Icons.business,
            )),
          ]),
          
          _buildVariantSection('Variants', [
            _AvatarDemo('Primary', const NovaAvatar(
              size: NovaAvatarSize.large,
              variant: NovaAvatarVariant.primary,
              initials: 'P',
            )),
            _AvatarDemo('Secondary', const NovaAvatar(
              size: NovaAvatarSize.large,
              variant: NovaAvatarVariant.secondary,
              initials: 'S',
            )),
            _AvatarDemo('Success', const NovaAvatar(
              size: NovaAvatarSize.large,
              variant: NovaAvatarVariant.success,
              initials: 'S',
            )),
            _AvatarDemo('Warning', const NovaAvatar(
              size: NovaAvatarSize.large,
              variant: NovaAvatarVariant.warning,
              initials: 'W',
            )),
            _AvatarDemo('Danger', const NovaAvatar(
              size: NovaAvatarSize.large,
              variant: NovaAvatarVariant.danger,
              initials: 'D',
            )),
            _AvatarDemo('Neutral', const NovaAvatar(
              size: NovaAvatarSize.large,
              variant: NovaAvatarVariant.neutral,
              initials: 'N',
            )),
          ]),
          
          _buildVariantSection('Interactive', [
            _AvatarDemo('Clickable', NovaAvatar(
              size: NovaAvatarSize.large,
              initials: 'CT',
              onTap: () => print('Avatar tapped'),
            )),
            _AvatarDemo('Disabled', const NovaAvatar(
              size: NovaAvatarSize.large,
              initials: 'DS',
              isDisabled: true,
            )),
          ]),
          
          _buildVariantSection('Group Avatars', [
            _AvatarDemo('Avatar Group', Row(
              children: [
                const NovaAvatar(
                  size: NovaAvatarSize.medium,
                  image: NetworkImage('https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face'),
                ),
                Transform.translate(
                  offset: const Offset(-8, 0),
                  child: const NovaAvatar(
                    size: NovaAvatarSize.medium,
                    image: NetworkImage('https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face'),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(-16, 0),
                  child: const NovaAvatar(
                    size: NovaAvatarSize.medium,
                    variant: NovaAvatarVariant.neutral,
                    initials: '+2',
                  ),
                ),
              ],
            )),
          ]),
        ],
      ),
    );
  }

  Widget _buildHeader(String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildVariantSection(String title, List<_AvatarDemo> demos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: demos.map((demo) => _buildDemoCard(demo)).toList(),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildDemoCard(_AvatarDemo demo) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 150,
        maxWidth: 200,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          demo.widget,
          const SizedBox(height: 12),
          Text(
            demo.label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _AvatarDemo {
  final String label;
  final Widget widget;

  _AvatarDemo(this.label, this.widget);
} 