import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final durationsStories = WidgetbookComponent(
  name: 'Durations',
  useCases: [
    WidgetbookUseCase(
      name: 'Animation Durations',
      builder: (context) => const DurationsShowcase(),
    ),
  ],
);

class DurationsShowcase extends StatelessWidget {
  const DurationsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Animation Durations',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nova Design System duration tokens for consistent animations',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Code Example
          _buildCodeExample(),
          const SizedBox(height: 32),

          // Duration items
          _buildDurationItem('none', NovaDurations.none, 'No animation'),
          _buildDurationItem('instant', NovaDurations.instant, 'Instantaneous'),
          _buildDurationItem('xs', NovaDurations.xs, 'Extra small duration'),
          _buildDurationItem('sm', NovaDurations.sm, 'Small duration'),
          _buildDurationItem('md', NovaDurations.md, 'Medium duration'),
          _buildDurationItem('lg', NovaDurations.lg, 'Large duration'),
          _buildDurationItem('xl', NovaDurations.xl, 'Extra large duration'),
          _buildDurationItem('xxl', NovaDurations.xxl, 'Extra extra large'),
          _buildDurationItem('xxxl', NovaDurations.xxxl, 'Triple extra large'),
          _buildDurationItem('xxxxl', NovaDurations.xxxxl, 'Quadruple extra large'),
          _buildDurationItem('xxxxxl', NovaDurations.xxxxxl, 'Quintuple extra large'),
          _buildDurationItem('slow', NovaDurations.slow, 'Slow animation'),
          _buildDurationItem('verySlow', NovaDurations.verySlow, 'Very slow animation'),
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
              const Icon(Icons.timer, color: Colors.blue),
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
                      text: '''AnimationController(
  duration: NovaDurations.md,
  vsync: this,
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
              '''AnimationController(
  duration: NovaDurations.md,
  vsync: this,
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

  Widget _buildDurationItem(String name, Duration duration, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
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
                  '${duration.inMilliseconds}ms',
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
                      text: 'NovaDurations.$name',
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
          
          // Animation demo
          _AnimatedDurationDemo(duration: duration, name: name),
        ],
      ),
    );
  }
}

class _AnimatedDurationDemo extends StatefulWidget {
  final Duration duration;
  final String name;

  const _AnimatedDurationDemo({
    required this.duration,
    required this.name,
  });

  @override
  State<_AnimatedDurationDemo> createState() => _AnimatedDurationDemoState();
}

class _AnimatedDurationDemoState extends State<_AnimatedDurationDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    
    // Para duraciones de 0ms, usamos una duración mínima para mostrar el efecto
    final animationDuration = widget.duration.inMilliseconds == 0 
        ? const Duration(milliseconds: 100) 
        : widget.duration;
    
    _controller = AnimationController(
      duration: animationDuration,
      vsync: this,
    );
    
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.4,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.purple,
    ).animate(_controller);

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(_controller);

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // Animation area
          Expanded(
            flex: 2,
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value * 3.14159,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: _colorAnimation.value,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: (_colorAnimation.value ?? Colors.blue).withValues(alpha: 0.3),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Info panel
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${widget.duration.inMilliseconds}ms',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Use Case',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    _getUseCase(widget.name),
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getUseCase(String name) {
    switch (name) {
      case 'none':
      case 'instant':
        return 'Immediate feedback';
      case 'xs':
        return 'Micro interactions';
      case 'sm':
        return 'Button hover states';
      case 'md':
        return 'Modal transitions';
      case 'lg':
        return 'Page transitions';
      case 'xl':
        return 'Complex animations';
      case 'xxl':
        return 'Loading states';
      case 'xxxl':
        return 'Onboarding flows';
      case 'xxxxl':
        return 'Hero animations';
      case 'xxxxxl':
        return 'Splash screens';
      case 'slow':
        return 'Attention grabbing';
      case 'verySlow':
        return 'Dramatic effects';
      default:
        return 'General purpose';
    }
  }
} 