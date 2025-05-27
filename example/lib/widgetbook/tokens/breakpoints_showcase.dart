import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final breakpointsStories = WidgetbookComponent(
  name: 'Breakpoints',
  useCases: [
    WidgetbookUseCase(
      name: 'Breakpoint Values',
      builder: (context) => const BreakpointsShowcase(),
    ),
  ],
);

class BreakpointsShowcase extends StatelessWidget {
  const BreakpointsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Responsive Breakpoints',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nova Design System breakpoint tokens for responsive design',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Code Example
          _buildCodeExample(),
          const SizedBox(height: 32),

          // Current screen info
          _buildCurrentScreenInfo(context),
          const SizedBox(height: 32),

          // Breakpoint items
          _buildBreakpointItem('xs', NovaBreakpoints.xs, 'Extra small screens'),
          _buildBreakpointItem('sm', NovaBreakpoints.sm, 'Small screens'),
          _buildBreakpointItem('md', NovaBreakpoints.md, 'Medium screens'),
          _buildBreakpointItem('lg', NovaBreakpoints.lg, 'Large screens'),
          _buildBreakpointItem('xl', NovaBreakpoints.xl, 'Extra large screens'),
          _buildBreakpointItem('xxl', NovaBreakpoints.xxl, 'Extra extra large screens'),
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
              const Icon(Icons.devices, color: Colors.blue),
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
                      text: '''LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth >= NovaBreakpoints.lg) {
      return DesktopLayout();
    } else if (constraints.maxWidth >= NovaBreakpoints.md) {
      return TabletLayout();
    } else {
      return MobileLayout();
    }
  },
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
              '''LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth >= NovaBreakpoints.lg) {
      return DesktopLayout();
    } else if (constraints.maxWidth >= NovaBreakpoints.md) {
      return TabletLayout();
    } else {
      return MobileLayout();
    }
  },
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

  Widget _buildCurrentScreenInfo(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    String currentBreakpoint = _getCurrentBreakpoint(screenWidth);
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.blue.shade700),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Screen',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Width: ${screenWidth.toStringAsFixed(0)}px • Breakpoint: $currentBreakpoint',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentBreakpoint(double width) {
    if (width >= NovaBreakpoints.xxl) return 'xxl';
    if (width >= NovaBreakpoints.xl) return 'xl';
    if (width >= NovaBreakpoints.lg) return 'lg';
    if (width >= NovaBreakpoints.md) return 'md';
    if (width >= NovaBreakpoints.sm) return 'sm';
    return 'xs';
  }

  Widget _buildBreakpointItem(String name, double size, String description) {
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
                  color: Colors.cyan.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
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
                  '${size.toStringAsFixed(0)}px+',
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
                      text: 'NovaBreakpoints.$name',
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
              // Breakpoint visualization
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
                      // Background ruler
                      Positioned(
                        left: 16,
                        right: 16,
                        bottom: 20,
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      // Breakpoint indicator
                      Positioned(
                        left: 16 + (size / 2000 * 200).clamp(0, 200),
                        bottom: 12,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.cyan.shade400,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                      // Device icon
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _getDeviceIcon(name),
                              color: Colors.cyan.shade600,
                              size: 32,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              name.toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan.shade700,
                              ),
                            ),
                            Text(
                              '${size.toStringAsFixed(0)}px+',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.cyan.shade600,
                              ),
                            ),
                          ],
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

  IconData _getDeviceIcon(String name) {
    switch (name) {
      case 'xs':
        return Icons.phone_android;
      case 'sm':
        return Icons.phone_iphone;
      case 'md':
        return Icons.tablet_mac;
      case 'lg':
        return Icons.laptop_mac;
      case 'xl':
        return Icons.desktop_mac;
      case 'xxl':
        return Icons.tv;
      default:
        return Icons.devices;
    }
  }

  List<String> _getUseCases(String name) {
    switch (name) {
      case 'xs':
        return ['Small phones', 'Portrait mode', 'Compact layouts'];
      case 'sm':
        return ['Large phones', 'Small tablets', 'Mobile-first design'];
      case 'md':
        return ['Tablets', 'Small laptops', 'Responsive grids'];
      case 'lg':
        return ['Laptops', 'Desktop screens', 'Multi-column layouts'];
      case 'xl':
        return ['Large desktops', 'Wide screens', 'Complex layouts'];
      case 'xxl':
        return ['Ultra-wide screens', 'Large displays', 'Dashboard layouts'];
      default:
        return ['General breakpoints'];
    }
  }
} 