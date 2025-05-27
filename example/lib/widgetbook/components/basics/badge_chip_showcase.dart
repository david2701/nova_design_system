import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final badgeChipStories = WidgetbookComponent(
  name: 'Badge & Chip',
  useCases: [
    WidgetbookUseCase(
      name: 'Badge Showcase',
      builder: (context) => const NovaBadgeShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Chip Showcase',
      builder: (context) => const NovaChipShowcase(),
    ),
  ],
);

// Badge Showcase
class NovaBadgeShowcase extends StatelessWidget {
  const NovaBadgeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Badge', 'Small status indicators and notification counters'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Badges', [
            _ComponentDemo('Count Badge', const NovaBadge(
              count: 3,
              variant: NovaBadgeVariant.primary,
            )),
            _ComponentDemo('Label Badge', const NovaBadge(
              label: 'New',
              variant: NovaBadgeVariant.success,
            )),
            _ComponentDemo('Dot Badge', const NovaBadge(
              variant: NovaBadgeVariant.danger,
              dot: true,
            )),
          ]),
          
          _buildVariantSection('Badge Variants', [
            _ComponentDemo('Primary', const NovaBadge(
              label: 'Primary',
              variant: NovaBadgeVariant.primary,
            )),
            _ComponentDemo('Secondary', const NovaBadge(
              label: 'Secondary',
              variant: NovaBadgeVariant.secondary,
            )),
            _ComponentDemo('Success', const NovaBadge(
              label: 'Success',
              variant: NovaBadgeVariant.success,
            )),
            _ComponentDemo('Warning', const NovaBadge(
              label: 'Warning',
              variant: NovaBadgeVariant.warning,
            )),
            _ComponentDemo('Danger', const NovaBadge(
              label: 'Danger',
              variant: NovaBadgeVariant.danger,
            )),
            _ComponentDemo('Neutral', const NovaBadge(
              label: 'Neutral',
              variant: NovaBadgeVariant.neutral,
            )),
          ]),
          
          _buildVariantSection('Badge Sizes', [
            _ComponentDemo('Small', const NovaBadge(
              label: 'Small',
              size: NovaBadgeSize.small,
            )),
            _ComponentDemo('Medium', const NovaBadge(
              label: 'Medium',
              size: NovaBadgeSize.medium,
            )),
          ]),
          
          _buildVariantSection('Count Badges', [
            _ComponentDemo('Count 5', const NovaBadge(
              count: 5,
              variant: NovaBadgeVariant.primary,
            )),
            _ComponentDemo('Count 99', const NovaBadge(
              count: 99,
              variant: NovaBadgeVariant.danger,
            )),
            _ComponentDemo('Max Count', const NovaBadge(
              count: 150,
              maxCount: 99,
              variant: NovaBadgeVariant.warning,
            )),
          ]),
          
          _buildVariantSection('Badge with Icons', [
            _ComponentDemo('With Icon', const Stack(
              children: [
                Icon(Icons.notifications, size: 32, color: Colors.grey),
                Positioned(
                  right: 0,
                  top: 0,
                  child: NovaBadge(
                    count: 5,
                    variant: NovaBadgeVariant.danger,
                  ),
                ),
              ],
            )),
            _ComponentDemo('Dot on Avatar', const Stack(
              children: [
                NovaAvatar(
                  size: NovaAvatarSize.large,
                  initials: 'JD',
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: NovaBadge(
                    variant: NovaBadgeVariant.success,
                    dot: true,
                  ),
                ),
              ],
            )),
          ]),
        ],
      ),
    );
  }
}

// Chip Showcase
class NovaChipShowcase extends StatelessWidget {
  const NovaChipShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Chip', 'Compact elements that represent inputs, attributes, or actions'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Chips', [
            _ComponentDemo('Simple Chip', const NovaChip(
              label: 'Simple Chip',
            )),
            _ComponentDemo('With Avatar', const NovaChip(
              label: 'John Doe',
              avatar: NovaAvatar(
                size: NovaAvatarSize.small,
                initials: 'JD',
              ),
            )),
            _ComponentDemo('Deletable', NovaChip(
              label: 'Deletable',
              onDeleted: () => debugPrint('Deleted'),
            )),
          ]),
          
          _buildVariantSection('Chip Variants', [
            _ComponentDemo('Primary', const NovaChip(
              label: 'Primary',
              variant: NovaChipVariant.primary,
            )),
            _ComponentDemo('Secondary', const NovaChip(
              label: 'Secondary',
              variant: NovaChipVariant.secondary,
            )),
            _ComponentDemo('Success', const NovaChip(
              label: 'Success',
              variant: NovaChipVariant.success,
            )),
            _ComponentDemo('Warning', const NovaChip(
              label: 'Warning',
              variant: NovaChipVariant.warning,
            )),
            _ComponentDemo('Danger', const NovaChip(
              label: 'Danger',
              variant: NovaChipVariant.danger,
            )),
            _ComponentDemo('Neutral', const NovaChip(
              label: 'Neutral',
              variant: NovaChipVariant.neutral,
            )),
          ]),
          
          _buildVariantSection('Chip Sizes', [
            _ComponentDemo('Small', const NovaChip(
              label: 'Small',
              size: NovaChipSize.small,
            )),
            _ComponentDemo('Medium', const NovaChip(
              label: 'Medium',
              size: NovaChipSize.medium,
            )),
          ]),
          
          _buildVariantSection('Interactive Chips', [
            _ComponentDemo('Selectable', NovaChip(
              label: 'Selectable',
              isSelected: true,
              onSelected: (selected) => debugPrint('Selected: $selected'),
            )),
            _ComponentDemo('Deletable', NovaChip(
              label: 'Deletable',
              onDeleted: () => debugPrint('Deleted'),
            )),
            _ComponentDemo('With Custom Delete', NovaChip(
              label: 'Custom Delete',
              onDeleted: () => debugPrint('Deleted'),
              deleteIcon: const Icon(Icons.remove_circle, size: 16),
            )),
          ]),
          
          _buildVariantSection('Chip States', [
            _ComponentDemo('Default', const NovaChip(
              label: 'Default',
            )),
            _ComponentDemo('Selected', const NovaChip(
              label: 'Selected',
              isSelected: true,
            )),
            _ComponentDemo('Disabled', const NovaChip(
              label: 'Disabled',
              isDisabled: true,
            )),
          ]),
          
          _buildVariantSection('Chip Groups', [
            _ComponentDemo('Filter Chips', const Wrap(
              spacing: 8,
              children: [
                NovaChip(label: 'All', isSelected: true),
                NovaChip(label: 'Active'),
                NovaChip(label: 'Completed'),
                NovaChip(label: 'Archived'),
              ],
            )),
            _ComponentDemo('Tag Chips', Wrap(
              spacing: 8,
              children: [
                NovaChip(
                  label: 'Flutter',
                  variant: NovaChipVariant.primary,
                  onDeleted: () {},
                ),
                NovaChip(
                  label: 'Dart',
                  variant: NovaChipVariant.secondary,
                  onDeleted: () {},
                ),
                NovaChip(
                  label: 'Mobile',
                  variant: NovaChipVariant.success,
                  onDeleted: () {},
                ),
              ],
            )),
          ]),
        ],
      ),
    );
  }
}

// Helper Widgets
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

Widget _buildVariantSection(String title, List<_ComponentDemo> demos) {
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

Widget _buildDemoCard(_ComponentDemo demo) {
  return Container(
    constraints: const BoxConstraints(
      minWidth: 200,
      maxWidth: 300,
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

class _ComponentDemo {
  final String label;
  final Widget widget;

  _ComponentDemo(this.label, this.widget);
} 