import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final opacitiesStories = WidgetbookComponent(
  name: 'Opacities',
  useCases: [
    WidgetbookUseCase(
      name: 'Opacity Levels',
      builder: (context) => const OpacitiesShowcase(),
    ),
  ],
);

class OpacitiesShowcase extends StatelessWidget {
  const OpacitiesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Opacity Levels',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nova Design System opacity tokens for transparency and layering',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Code Example
          _buildCodeExample(),
          const SizedBox(height: 32),

          // Opacity items
          _buildOpacityItem('none', NovaOpacities.none, 'Completely transparent'),
          _buildOpacityItem('xs', NovaOpacities.xs, 'Extra small opacity'),
          _buildOpacityItem('sm', NovaOpacities.sm, 'Small opacity'),
          _buildOpacityItem('md', NovaOpacities.md, 'Medium opacity'),
          _buildOpacityItem('lg', NovaOpacities.lg, 'Large opacity'),
          _buildOpacityItem('xl', NovaOpacities.xl, 'Extra large opacity'),
          _buildOpacityItem('xxl', NovaOpacities.xxl, 'Extra extra large opacity'),
          _buildOpacityItem('full', NovaOpacities.full, 'Completely opaque'),
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
              const Icon(Icons.opacity, color: Colors.blue),
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
  color: Colors.blue.withValues(alpha: NovaOpacities.md),
  child: YourWidget(),
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
  color: Colors.blue.withValues(alpha: NovaOpacities.md),
  child: YourWidget(),
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

  Widget _buildOpacityItem(String name, double opacity, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '${(opacity * 100).toStringAsFixed(0)}%',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.copy, size: 16),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                      text: 'NovaOpacities.$name',
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
          
          // Visual demonstration
          Row(
            children: [
              // Opacity preview
              Expanded(
                flex: 2,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Stack(
                    children: [
                      // Background pattern
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: CustomPaint(
                          size: Size.infinite,
                          painter: CheckerboardPainter(),
                        ),
                      ),
                      // Opacity overlay
                      Center(
                        child: Container(
                          width: 100,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.teal.withValues(alpha: opacity),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.teal.shade300),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.opacity,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  name.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '${(opacity * 100).toStringAsFixed(0)}%',
                                  style: const TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(width: 16),
              
              // Use cases
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Use Cases',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...(_getUseCases(name).map((useCase) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.circle,
                              size: 4,
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                useCase,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<String> _getUseCases(String name) {
    switch (name) {
      case 'none':
        return ['Hidden elements', 'Invisible overlays', 'Transparent backgrounds'];
      case 'xs':
        return ['Subtle overlays', 'Disabled states', 'Watermarks'];
      case 'sm':
        return ['Loading states', 'Inactive elements', 'Placeholder content'];
      case 'md':
        return ['Modal backgrounds', 'Hover states', 'Secondary content'];
      case 'lg':
        return ['Active overlays', 'Focus states', 'Highlighted content'];
      case 'xl':
        return ['Primary overlays', 'Selected states', 'Important content'];
      case 'xxl':
        return ['Strong overlays', 'Active states', 'Emphasized content'];
      case 'full':
        return ['Solid elements', 'Primary content', 'Opaque backgrounds'];
      default:
        return ['General opacity'];
    }
  }
}

class CheckerboardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    const squareSize = 10.0;
    
    for (double x = 0; x < size.width; x += squareSize) {
      for (double y = 0; y < size.height; y += squareSize) {
        final isEvenRow = (y / squareSize).floor() % 2 == 0;
        final isEvenCol = (x / squareSize).floor() % 2 == 0;
        
        if (isEvenRow == isEvenCol) {
          paint.color = Colors.grey.shade200;
        } else {
          paint.color = Colors.grey.shade100;
        }
        
        canvas.drawRect(
          Rect.fromLTWH(x, y, squareSize, squareSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
} 