import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final miscStories = WidgetbookComponent(
  name: 'Miscellaneous',
  useCases: [
    WidgetbookUseCase(
      name: 'Tooltip Showcase',
      builder: (context) => const NovaTooltipShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Divider Showcase',
      builder: (context) => const NovaDividerShowcase(),
    ),
  ],
);

// Tooltip Showcase
class NovaTooltipShowcase extends StatelessWidget {
  const NovaTooltipShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Tooltip', 'Contextual information displayed on hover or focus'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Tooltips', [
            _ComponentDemo('Simple Tooltip', NovaTooltip(
              message: 'This is a simple tooltip',
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Hover me', style: TextStyle(color: Colors.white)),
              ),
            )),
            _ComponentDemo('Icon with Tooltip', NovaTooltip(
              message: 'Settings',
              child: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {},
              ),
            )),
          ]),
          
          _buildVariantSection('Tooltip Variants', [
            _ComponentDemo('Primary', NovaTooltip(
              message: 'Primary tooltip',
              variant: NovaTooltipVariant.primary,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Primary', style: TextStyle(color: Colors.white)),
              ),
            )),
            _ComponentDemo('Secondary', NovaTooltip(
              message: 'Secondary tooltip',
              variant: NovaTooltipVariant.secondary,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Secondary', style: TextStyle(color: Colors.white)),
              ),
            )),
            _ComponentDemo('Neutral', NovaTooltip(
              message: 'Neutral tooltip',
              variant: NovaTooltipVariant.neutral,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Neutral', style: TextStyle(color: Colors.white)),
              ),
            )),
          ]),
          
          _buildVariantSection('Tooltip Positions', [
            _ComponentDemo('Top', NovaTooltip(
              message: 'Tooltip on top',
              position: NovaTooltipPosition.top,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Top', style: TextStyle(color: Colors.white)),
              ),
            )),
            _ComponentDemo('Bottom', NovaTooltip(
              message: 'Tooltip on bottom',
              position: NovaTooltipPosition.bottom,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('Bottom', style: TextStyle(color: Colors.white)),
              ),
            )),
          ]),
          
          _buildVariantSection('Tooltip Features', [
            _ComponentDemo('With Arrow', NovaTooltip(
              message: 'Tooltip with arrow',
              showArrow: true,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('With Arrow', style: TextStyle(color: Colors.white)),
              ),
            )),
            _ComponentDemo('Without Arrow', NovaTooltip(
              message: 'Tooltip without arrow',
              showArrow: false,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text('No Arrow', style: TextStyle(color: Colors.white)),
              ),
            )),
          ]),
        ],
      ),
    );
  }
}

// Divider Showcase
class NovaDividerShowcase extends StatelessWidget {
  const NovaDividerShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Divider', 'Visual separators for content organization'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Dividers', [
            _ComponentDemo('Horizontal', Column(
              children: [
                const Text('Content above'),
                const SizedBox(height: 8),
                NovaDivider(),
                const SizedBox(height: 8),
                const Text('Content below'),
              ],
            )),
            _ComponentDemo('Vertical', Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Left'),
                const SizedBox(width: 8),
                SizedBox(
                  height: 40,
                  child: NovaDivider(
                    orientation: NovaDividerOrientation.vertical,
                  ),
                ),
                const SizedBox(width: 8),
                const Text('Right'),
              ],
            )),
          ]),
          
          _buildVariantSection('Divider Variants', [
            _ComponentDemo('Primary', Column(
              children: [
                const Text('Primary divider'),
                const SizedBox(height: 8),
                NovaDivider(variant: NovaDividerVariant.primary),
                const SizedBox(height: 8),
                const Text('Content below'),
              ],
            )),
            _ComponentDemo('Secondary', Column(
              children: [
                const Text('Secondary divider'),
                const SizedBox(height: 8),
                NovaDivider(variant: NovaDividerVariant.secondary),
                const SizedBox(height: 8),
                const Text('Content below'),
              ],
            )),
            _ComponentDemo('Neutral', Column(
              children: [
                const Text('Neutral divider'),
                const SizedBox(height: 8),
                NovaDivider(variant: NovaDividerVariant.neutral),
                const SizedBox(height: 8),
                const Text('Content below'),
              ],
            )),
          ]),
          
          _buildVariantSection('Divider Sizes', [
            _ComponentDemo('Small', Column(
              children: [
                const Text('Small divider'),
                const SizedBox(height: 8),
                NovaDivider(size: NovaDividerSize.small),
                const SizedBox(height: 8),
                const Text('Content below'),
              ],
            )),
            _ComponentDemo('Medium', Column(
              children: [
                const Text('Medium divider'),
                const SizedBox(height: 8),
                NovaDivider(size: NovaDividerSize.medium),
                const SizedBox(height: 8),
                const Text('Content below'),
              ],
            )),
            _ComponentDemo('Large', Column(
              children: [
                const Text('Large divider'),
                const SizedBox(height: 8),
                NovaDivider(size: NovaDividerSize.large),
                const SizedBox(height: 8),
                const Text('Content below'),
              ],
            )),
          ]),
          
          _buildVariantSection('Divider with Text', [
            _ComponentDemo('With Label', Column(
              children: [
                const Text('Section 1'),
                const SizedBox(height: 8),
                NovaDivider(
                  text: 'OR',
                ),
                const SizedBox(height: 8),
                const Text('Section 2'),
              ],
            )),
            _ComponentDemo('Custom Text', Column(
              children: [
                const Text('Before'),
                const SizedBox(height: 8),
                NovaDivider(
                  text: 'CONTINUE',
                  variant: NovaDividerVariant.primary,
                ),
                const SizedBox(height: 8),
                const Text('After'),
              ],
            )),
          ]),
          
          _buildVariantSection('Orientation Examples', [
            _ComponentDemo('Horizontal List', Column(
              children: [
                const Text('Item 1'),
                NovaDivider(),
                const Text('Item 2'),
                NovaDivider(),
                const Text('Item 3'),
              ],
            )),
            _ComponentDemo('Vertical List', Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('A'),
                SizedBox(
                  height: 30,
                  child: NovaDivider(
                    orientation: NovaDividerOrientation.vertical,
                  ),
                ),
                const Text('B'),
                SizedBox(
                  height: 30,
                  child: NovaDivider(
                    orientation: NovaDividerOrientation.vertical,
                  ),
                ),
                const Text('C'),
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
          color: Colors.black.withOpacity(0.05),
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