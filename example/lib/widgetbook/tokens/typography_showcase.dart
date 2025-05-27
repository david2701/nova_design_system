import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final typographyStories = WidgetbookComponent(
  name: 'Typography',
  useCases: [
    WidgetbookUseCase(
      name: 'Text Styles',
      builder: (context) => const TypographyShowcase(),
    ),
  ],
);

class TypographyShowcase extends StatelessWidget {
  const TypographyShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Typography',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nova Design System typography tokens with usage examples',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Code Example
          _buildCodeExample(),
          const SizedBox(height: 32),

          // Display Styles
          _buildTypographySection('Display Styles', [
            _TypographyItem('displayLarge', NovaTypography.displayLarge, 'Large display text'),
            _TypographyItem('displayMedium', NovaTypography.displayMedium, 'Medium display text'),
            _TypographyItem('displaySmall', NovaTypography.displaySmall, 'Small display text'),
          ]),

          // Headline Styles
          _buildTypographySection('Headline Styles', [
            _TypographyItem('headlineLarge', NovaTypography.headlineLarge, 'Large headlines'),
            _TypographyItem('headlineMedium', NovaTypography.headlineMedium, 'Medium headlines'),
            _TypographyItem('headlineSmall', NovaTypography.headlineSmall, 'Small headlines'),
          ]),

          // Title Styles
          _buildTypographySection('Title Styles', [
            _TypographyItem('titleLarge', NovaTypography.titleLarge, 'Large titles'),
            _TypographyItem('titleMedium', NovaTypography.titleMedium, 'Medium titles'),
            _TypographyItem('titleSmall', NovaTypography.titleSmall, 'Small titles'),
          ]),

          // Body Styles
          _buildTypographySection('Body Styles', [
            _TypographyItem('bodyLarge', NovaTypography.bodyLarge, 'Large body text'),
            _TypographyItem('bodyMedium', NovaTypography.bodyMedium, 'Medium body text'),
            _TypographyItem('bodySmall', NovaTypography.bodySmall, 'Small body text'),
          ]),

          // Label Styles
          _buildTypographySection('Label Styles', [
            _TypographyItem('labelLarge', NovaTypography.labelLarge, 'Large labels'),
            _TypographyItem('labelMedium', NovaTypography.labelMedium, 'Medium labels'),
            _TypographyItem('labelSmall', NovaTypography.labelSmall, 'Small labels'),
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
              const Icon(Icons.text_fields, color: Colors.blue),
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
                      text: '''Text(
  'Hello World',
  style: NovaTypography.headlineLarge,
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
              '''Text(
  'Hello World',
  style: NovaTypography.headlineLarge,
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

  Widget _buildTypographySection(String title, List<_TypographyItem> items) {
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
        ...items.map((item) => _buildTypographyCard(item)),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildTypographyCard(_TypographyItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with token name and copy button
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                item.description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.copy, size: 16),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                      text: 'NovaTypography.${item.name}',
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Token copied to clipboard!')),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Text example
          Text(
            'The quick brown fox jumps over the lazy dog',
            style: item.style.copyWith(color: Colors.black87),
          ),
          const SizedBox(height: 16),
          
          // Style properties
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                _buildStyleProperty('Size', '${item.style.fontSize?.toStringAsFixed(0) ?? 'inherit'}px'),
                const SizedBox(width: 24),
                _buildStyleProperty('Weight', _getFontWeightName(item.style.fontWeight)),
                const SizedBox(width: 24),
                _buildStyleProperty('Height', item.style.height?.toStringAsFixed(2) ?? 'inherit'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStyleProperty(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }

  String _getFontWeightName(FontWeight? weight) {
    if (weight == null) return 'inherit';
    switch (weight.index) {
      case 0: return '100';
      case 1: return '200';
      case 2: return '300';
      case 3: return '400';
      case 4: return '500';
      case 5: return '600';
      case 6: return '700';
      case 7: return '800';
      case 8: return '900';
      default: return '400';
    }
  }
}

class _TypographyItem {
  final String name;
  final TextStyle style;
  final String description;

  _TypographyItem(this.name, this.style, this.description);
} 