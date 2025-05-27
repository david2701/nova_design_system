import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final colorStories = WidgetbookComponent(
  name: 'Colors',
  useCases: [
    WidgetbookUseCase(
      name: 'Color Palette',
      builder: (context) => const ColorPaletteShowcase(),
    ),
  ],
);

class ColorPaletteShowcase extends StatelessWidget {
  const ColorPaletteShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Color Palette',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nova Design System color tokens with usage examples',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Code Example
          _buildCodeExample(),
          const SizedBox(height: 32),

          // Primary Colors
          _buildColorSection('Primary Colors', [
            _ColorItem('primary', NovaColors.primary, 'Main brand color'),
            _ColorItem('primaryLight', NovaColors.primaryLight, 'Light variant'),
            _ColorItem('primaryDark', NovaColors.primaryDark, 'Dark variant'),
          ]),

          // Secondary Colors
          _buildColorSection('Secondary Colors', [
            _ColorItem('secondary', NovaColors.secondary, 'Secondary brand color'),
            _ColorItem('secondaryLight', NovaColors.secondaryLight, 'Light variant'),
            _ColorItem('secondaryDark', NovaColors.secondaryDark, 'Dark variant'),
          ]),

          // Accent Colors
          _buildColorSection('Accent Colors', [
            _ColorItem('accent', NovaColors.accent, 'Accent color'),
            _ColorItem('accentLight', NovaColors.accentLight, 'Light variant'),
            _ColorItem('accentDark', NovaColors.accentDark, 'Dark variant'),
          ]),

          // Neutral Colors
          _buildColorSection('Neutral Colors', [
            _ColorItem('neutral50', NovaColors.neutral50, 'Lightest neutral'),
            _ColorItem('neutral100', NovaColors.neutral100, 'Very light neutral'),
            _ColorItem('neutral200', NovaColors.neutral200, 'Light neutral'),
            _ColorItem('neutral300', NovaColors.neutral300, 'Light-medium neutral'),
            _ColorItem('neutral400', NovaColors.neutral400, 'Medium neutral'),
            _ColorItem('neutral500', NovaColors.neutral500, 'Base neutral'),
            _ColorItem('neutral600', NovaColors.neutral600, 'Medium-dark neutral'),
            _ColorItem('neutral700', NovaColors.neutral700, 'Dark neutral'),
            _ColorItem('neutral800', NovaColors.neutral800, 'Very dark neutral'),
            _ColorItem('neutral900', NovaColors.neutral900, 'Darkest neutral'),
          ]),

          // Semantic Colors
          _buildColorSection('Semantic Colors', [
            _ColorItem('success', NovaColors.success, 'Success states'),
            _ColorItem('warning', NovaColors.warning, 'Warning states'),
            _ColorItem('error', NovaColors.error, 'Error states'),
            _ColorItem('info', NovaColors.info, 'Information states'),
          ]),

          // Surface Colors
          _buildColorSection('Surface Colors', [
            _ColorItem('background', NovaColors.background, 'Main background'),
            _ColorItem('backgroundDark', NovaColors.backgroundDark, 'Dark background'),
            _ColorItem('surface', NovaColors.surface, 'Surface color'),
            _ColorItem('surfaceDark', NovaColors.surfaceDark, 'Dark surface'),
          ]),

          // Text Colors
          _buildColorSection('Text Colors', [
            _ColorItem('textPrimary', NovaColors.textPrimary, 'Primary text'),
            _ColorItem('textSecondary', NovaColors.textSecondary, 'Secondary text'),
            _ColorItem('textTertiary', NovaColors.textTertiary, 'Tertiary text'),
            _ColorItem('textInverse', NovaColors.textInverse, 'Inverse text'),
          ]),

          // Border Colors
          _buildColorSection('Border Colors', [
            _ColorItem('border', NovaColors.border, 'Default border'),
          ]),
        ],
      ),
    );
  }

  Widget _buildCodeExample() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code, color: Colors.blue),
              const SizedBox(width: 8),
              const Text(
                'Usage Example',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.copy, size: 20),
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(
                      text: '''Container(
  color: NovaColors.primary,
  child: Text(
    'Hello World',
    style: TextStyle(color: NovaColors.textInverse),
  ),
)''',
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Code copied to clipboard!')),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              '''Container(
  color: NovaColors.primary,
  child: Text(
    'Hello World',
    style: TextStyle(color: NovaColors.textInverse),
  ),
)''',
              style: TextStyle(
                color: Colors.green,
                fontFamily: 'monospace',
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorSection(String title, List<_ColorItem> colors) {
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
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: colors.length,
          itemBuilder: (context, index) {
            final colorItem = colors[index];
            return _buildColorCard(colorItem);
          },
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildColorCard(_ColorItem colorItem) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
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
          // Color preview
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorItem.color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  _getColorHex(colorItem.color),
                  style: TextStyle(
                    color: colorItem.color.computeLuminance() > 0.5 
                        ? Colors.black87 
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ),
          ),
          // Color info
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    colorItem.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    colorItem.description,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getColorHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
  }
}

class _ColorItem {
  final String name;
  final Color color;
  final String description;

  _ColorItem(this.name, this.color, this.description);
} 