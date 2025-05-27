import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final curvesStories = WidgetbookComponent(
  name: 'Curves',
  useCases: [
    WidgetbookUseCase(
      name: 'Animation Curves',
      builder: (context) => const CurvesShowcase(),
    ),
  ],
);

class CurvesShowcase extends StatelessWidget {
  const CurvesShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Animation Curves',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nova Design System curve tokens for smooth and natural animations',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),

          // Code Example
          _buildCodeExample(),
          const SizedBox(height: 32),

          // Curve items
          _buildCurveItem('linear', NovaCurves.linear, 'Linear progression'),
          _buildCurveItem('standard', NovaCurves.standard, 'Standard Material curve'),
          _buildCurveItem('standardAccelerate', NovaCurves.standardAccelerate, 'Accelerating curve'),
          _buildCurveItem('standardDecelerate', NovaCurves.standardDecelerate, 'Decelerating curve'),
          _buildCurveItem('emphasized', NovaCurves.emphasized, 'Emphasized motion'),
          _buildCurveItem('bounce', NovaCurves.bounce, 'Bouncy animation'),
          _buildCurveItem('elastic', NovaCurves.elastic, 'Elastic motion'),
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
              const Icon(Icons.timeline, color: Colors.blue),
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
                      text: '''AnimatedContainer(
  duration: Duration(milliseconds: 300),
  curve: NovaCurves.standard,
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
              '''AnimatedContainer(
  duration: Duration(milliseconds: 300),
  curve: NovaCurves.standard,
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

  Widget _buildCurveItem(String name, Curve curve, String description) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
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
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.copy, size: 16),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(
                      text: 'NovaCurves.$name',
                    ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Token copied to clipboard!')),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          
          // Visual demonstration
          Row(
            children: [
              // Animation preview
              Expanded(
                flex: 2,
                child: _AnimatedCurveDemo(curve: curve, name: name),
              ),
              
              const SizedBox(width: 20),
              
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
      case 'linear':
        return ['Loading bars', 'Progress indicators', 'Simple transitions'];
      case 'standard':
        return ['Page transitions', 'Modal animations', 'General UI'];
      case 'standardAccelerate':
        return ['Exit animations', 'Dismissing elements', 'Slide out'];
      case 'standardDecelerate':
        return ['Enter animations', 'Appearing elements', 'Slide in'];
      case 'emphasized':
        return ['Important transitions', 'Hero animations', 'Focus states'];
      case 'bounce':
        return ['Playful interactions', 'Success states', 'Button feedback'];
      case 'elastic':
        return ['Spring animations', 'Drawer openings', 'Flexible UI'];
      default:
        return ['General animations'];
    }
  }
}

class _AnimatedCurveDemo extends StatefulWidget {
  final Curve curve;
  final String name;

  const _AnimatedCurveDemo({
    required this.curve,
    required this.name,
  });

  @override
  State<_AnimatedCurveDemo> createState() => _AnimatedCurveDemoState();
}

class _AnimatedCurveDemoState extends State<_AnimatedCurveDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
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
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          // Background track
          Positioned(
            left: 20,
            right: 20,
            top: 59,
            child: Container(
              height: 2,
              color: Colors.grey.shade300,
            ),
          ),
          // Animated circle
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              // Use a fixed travel distance to avoid overflow
              const maxTravel = 160.0; // Fixed safe distance
              
              return Positioned(
                left: 20 + (_animation.value * maxTravel),
                top: 50,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade400,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // Curve name
          Positioned(
            left: 20,
            bottom: 16,
            child: Text(
              widget.name,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.purple.shade700,
              ),
            ),
          ),
          // Play/pause button
          Positioned(
            right: 16,
            bottom: 12,
            child: GestureDetector(
              onTap: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.repeat(reverse: true);
                }
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _controller.isAnimating ? Icons.pause : Icons.play_arrow,
                  size: 16,
                  color: Colors.purple.shade700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 