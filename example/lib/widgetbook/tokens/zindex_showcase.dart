import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final zIndexStories = WidgetbookComponent(
  name: 'Z-Index',
  useCases: [
    WidgetbookUseCase(
      name: 'Z-Index Levels',
      builder: (context) => const ZIndexShowcase(),
    ),
  ],
);

class ZIndexShowcase extends StatelessWidget {
  const ZIndexShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Z-Index Stacking',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nova Design System z-index tokens for element stacking order',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Code Example
          _buildCodeExample(),
          const SizedBox(height: 32),

          // Stacking Demo
          _buildStackingDemo(),
          const SizedBox(height: 32),

          // Z-Index Table
          _buildZIndexTable(),
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
              const Icon(Icons.layers, color: Colors.blue),
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
                      text: '''Positioned(
  child: Container(
    // Using CSS-like z-index concept
    // Higher values appear on top
    child: YourWidget(),
  ),
)

// In Flutter, use Stack with proper ordering:
Stack(
  children: [
    BaseWidget(),      // z-index: base (0)
    DropdownWidget(),  // z-index: xs (10)
    ModalWidget(),     // z-index: lg (1000)
    TooltipWidget(),   // z-index: xxl (9999)
  ],
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
              '''Stack(
  children: [
    BaseWidget(),      // z-index: base (0)
    DropdownWidget(),  // z-index: xs (10)
    ModalWidget(),     // z-index: lg (1000)
    TooltipWidget(),   // z-index: xxl (9999)
  ],
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

  Widget _buildStackingDemo() {
    return Container(
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
          Row(
            children: [
              Icon(Icons.view_in_ar, color: Colors.deepPurple.shade600),
              const SizedBox(width: 8),
              Text(
                'Stacking Demo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Z-Index controls the stacking order of elements. Higher values appear on top.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 24),
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Stack(
              children: [
                _buildZIndexCard('base', NovaZIndex.base, Colors.red, 50, 50),
                _buildZIndexCard('xs', NovaZIndex.xs, Colors.orange, 80, 80),
                _buildZIndexCard('sm', NovaZIndex.sm, Colors.yellow, 110, 110),
                _buildZIndexCard('md', NovaZIndex.md, Colors.green, 140, 140),
                _buildZIndexCard('lg', NovaZIndex.lg, Colors.blue, 170, 170),
                _buildZIndexCard('xl', NovaZIndex.xl, Colors.indigo, 200, 200),
                _buildZIndexCard('xxl', NovaZIndex.xxl, Colors.purple, 230, 230),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZIndexCard(String name, int zIndex, Color color, double left, double top) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              zIndex.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildZIndexTable() {
    final zIndexValues = [
      ('base', NovaZIndex.base, 'Default elements', 'Background content, base layer'),
      ('xs', NovaZIndex.xs, 'Dropdowns', 'Select menus, basic overlays'),
      ('sm', NovaZIndex.sm, 'Sticky headers', 'Fixed navigation, sticky elements'),
      ('md', NovaZIndex.md, 'Fixed elements', 'Floating buttons, sidebars'),
      ('lg', NovaZIndex.lg, 'Modals', 'Dialog boxes, modal overlays'),
      ('xl', NovaZIndex.xl, 'Popovers', 'Context menus, advanced overlays'),
      ('xxl', NovaZIndex.xxl, 'Tooltips', 'Tooltips, notifications'),
      ('max', NovaZIndex.max, 'Critical overlays', 'Emergency dialogs, system alerts'),
    ];

    return Container(
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
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.table_chart, color: Colors.grey.shade700),
                const SizedBox(width: 8),
                Text(
                  'Z-Index Reference Table',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border(
                top: BorderSide(color: Colors.grey.shade200),
                bottom: BorderSide(color: Colors.grey.shade200),
              ),
            ),
            child: const Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Token',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Value',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Use Case',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          ...zIndexValues.map((item) => _buildZIndexRow(item.$1, item.$2, item.$3, item.$4)),
        ],
      ),
    );
  }

  Widget _buildZIndexRow(String name, int value, String useCase, String description) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade700,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                        text: 'NovaZIndex.$name',
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Token copied to clipboard!')),
                      );
                    },
                    child: Icon(
                      Icons.copy,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              useCase,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ],
      ),
    );
  }
} 