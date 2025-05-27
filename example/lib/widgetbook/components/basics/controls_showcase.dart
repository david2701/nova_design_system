import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final controlsStories = WidgetbookComponent(
  name: 'Controls',
  useCases: [
    WidgetbookUseCase(
      name: 'Slider Showcase',
      builder: (context) => const NovaSliderShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Switch Showcase',
      builder: (context) => const NovaSwitchShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Progress Indicator Showcase',
      builder: (context) => const NovaProgressIndicatorShowcase(),
    ),
  ],
);

// Slider Showcase
class NovaSliderShowcase extends StatefulWidget {
  const NovaSliderShowcase({super.key});

  @override
  State<NovaSliderShowcase> createState() => _NovaSliderShowcaseState();
}

class _NovaSliderShowcaseState extends State<NovaSliderShowcase> {
  double _basicValue = 0.5;
  double _steppedValue = 0.5;
  final double _disabledValue = 0.3;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Slider', 'Interactive slider controls for value selection'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Sliders', [
            _ControlDemo('Basic Slider', Column(
              children: [
                NovaSlider(
                  value: _basicValue,
                  onChanged: (value) => setState(() => _basicValue = value),
                ),
                const SizedBox(height: 8),
                Text('Value: ${(_basicValue * 100).round()}%'),
              ],
            )),
            _ControlDemo('With Label', NovaSlider(
              value: _basicValue,
              label: 'Volume',
              showValue: true,
              onChanged: (value) => setState(() => _basicValue = value),
            )),
          ]),
          
          _buildVariantSection('Slider Variants', [
            _ControlDemo('Primary', NovaSlider(
              value: 0.6,
              variant: NovaSliderVariant.primary,
              onChanged: (value) {},
            )),
            _ControlDemo('Success', NovaSlider(
              value: 0.8,
              variant: NovaSliderVariant.success,
              onChanged: (value) {},
            )),
            _ControlDemo('Warning', NovaSlider(
              value: 0.5,
              variant: NovaSliderVariant.warning,
              onChanged: (value) {},
            )),
            _ControlDemo('Danger', NovaSlider(
              value: 0.3,
              variant: NovaSliderVariant.danger,
              onChanged: (value) {},
            )),
          ]),
          
          _buildVariantSection('Slider Sizes', [
            _ControlDemo('Small', NovaSlider(
              value: 0.7,
              size: NovaSliderSize.small,
              onChanged: (value) {},
            )),
            _ControlDemo('Medium', NovaSlider(
              value: 0.7,
              size: NovaSliderSize.medium,
              onChanged: (value) {},
            )),
            _ControlDemo('Large', NovaSlider(
              value: 0.7,
              size: NovaSliderSize.large,
              onChanged: (value) {},
            )),
          ]),
          
          _buildVariantSection('Slider Features', [
            _ControlDemo('With Steps', Column(
              children: [
                NovaSlider(
                  value: _steppedValue,
                  divisions: 10,
                  onChanged: (value) => setState(() => _steppedValue = value),
                ),
                const SizedBox(height: 8),
                Text('Step: ${(_steppedValue * 10).round()}'),
              ],
            )),
            _ControlDemo('Disabled', NovaSlider(
              value: _disabledValue,
              isDisabled: true,
              onChanged: (value) {},
            )),
          ]),
        ],
      ),
    );
  }
}

// Switch Showcase
class NovaSwitchShowcase extends StatefulWidget {
  const NovaSwitchShowcase({super.key});

  @override
  State<NovaSwitchShowcase> createState() => _NovaSwitchShowcaseState();
}

class _NovaSwitchShowcaseState extends State<NovaSwitchShowcase> {
  bool _basicSwitch = true;
  bool _successSwitch = true;
  bool _warningSwitch = false;
  bool _dangerSwitch = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Switch', 'Toggle switches for binary choices'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Switches', [
            _ControlDemo('Basic Switch', Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NovaSwitch(
                  value: _basicSwitch,
                  onChanged: (value) => setState(() => _basicSwitch = value),
                ),
                const SizedBox(width: 8),
                Text(_basicSwitch ? 'ON' : 'OFF'),
              ],
            )),
            _ControlDemo('With Label', NovaSwitch(
              value: _basicSwitch,
              label: 'Notifications',
              onChanged: (value) => setState(() => _basicSwitch = value),
            )),
          ]),
          
          _buildVariantSection('Switch Variants', [
            _ControlDemo('Primary', Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NovaSwitch(
                  value: _basicSwitch,
                  variant: NovaSwitchVariant.primary,
                  onChanged: (value) => setState(() => _basicSwitch = value),
                ),
                const SizedBox(width: 8),
                Text(_basicSwitch ? 'ON' : 'OFF'),
              ],
            )),
            _ControlDemo('Success', Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NovaSwitch(
                  value: _successSwitch,
                  variant: NovaSwitchVariant.success,
                  onChanged: (value) => setState(() => _successSwitch = value),
                ),
                const SizedBox(width: 8),
                Text(_successSwitch ? 'ON' : 'OFF'),
              ],
            )),
            _ControlDemo('Warning', Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NovaSwitch(
                  value: _warningSwitch,
                  variant: NovaSwitchVariant.warning,
                  onChanged: (value) => setState(() => _warningSwitch = value),
                ),
                const SizedBox(width: 8),
                Text(_warningSwitch ? 'ON' : 'OFF'),
              ],
            )),
            _ControlDemo('Danger', Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                NovaSwitch(
                  value: _dangerSwitch,
                  variant: NovaSwitchVariant.danger,
                  onChanged: (value) => setState(() => _dangerSwitch = value),
                ),
                const SizedBox(width: 8),
                Text(_dangerSwitch ? 'ON' : 'OFF'),
              ],
            )),
          ]),
          
          _buildVariantSection('Switch Sizes', [
            _ControlDemo('Small', NovaSwitch(
              value: true,
              size: NovaSwitchSize.small,
              onChanged: (value) {},
            )),
            _ControlDemo('Medium', NovaSwitch(
              value: true,
              size: NovaSwitchSize.medium,
              onChanged: (value) {},
            )),
            _ControlDemo('Large', NovaSwitch(
              value: true,
              size: NovaSwitchSize.large,
              onChanged: (value) {},
            )),
          ]),
          
          _buildVariantSection('Switch States', [
            _ControlDemo('Enabled ON', NovaSwitch(
              value: true,
              onChanged: (value) {},
            )),
            _ControlDemo('Enabled OFF', NovaSwitch(
              value: false,
              onChanged: (value) {},
            )),
            _ControlDemo('Disabled ON', NovaSwitch(
              value: true,
              isDisabled: true,
              onChanged: (value) {},
            )),
            _ControlDemo('Disabled OFF', NovaSwitch(
              value: false,
              isDisabled: true,
              onChanged: (value) {},
            )),
          ]),
        ],
      ),
    );
  }
}

// Progress Indicator Showcase
class NovaProgressIndicatorShowcase extends StatefulWidget {
  const NovaProgressIndicatorShowcase({super.key});

  @override
  State<NovaProgressIndicatorShowcase> createState() => _NovaProgressIndicatorShowcaseState();
}

class _NovaProgressIndicatorShowcaseState extends State<NovaProgressIndicatorShowcase>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  double _progressValue = 0.7;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Progress Indicator', 'Visual indicators for loading and progress states'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Progress', [
            _ControlDemo('Determinate', Column(
              children: [
                NovaProgressIndicator(
                  value: _progressValue,
                ),
                const SizedBox(height: 8),
                Text('${(_progressValue * 100).round()}%'),
              ],
            )),
            _ControlDemo('Indeterminate', const NovaProgressIndicator()),
            _ControlDemo('With Label', NovaProgressIndicator(
              value: _progressValue,
              label: 'Loading...',
              showValue: true,
            )),
          ]),
          
          _buildVariantSection('Progress Variants', [
            _ControlDemo('Primary', const NovaProgressIndicator(
              value: 0.6,
              variant: NovaProgressIndicatorVariant.primary,
            )),
            _ControlDemo('Success', const NovaProgressIndicator(
              value: 0.8,
              variant: NovaProgressIndicatorVariant.success,
            )),
            _ControlDemo('Warning', const NovaProgressIndicator(
              value: 0.5,
              variant: NovaProgressIndicatorVariant.warning,
            )),
            _ControlDemo('Danger', const NovaProgressIndicator(
              value: 0.3,
              variant: NovaProgressIndicatorVariant.danger,
            )),
          ]),
          
          _buildVariantSection('Progress Sizes', [
            _ControlDemo('Small', const NovaProgressIndicator(
              value: 0.7,
              size: NovaProgressIndicatorSize.small,
            )),
            _ControlDemo('Medium', const NovaProgressIndicator(
              value: 0.7,
              size: NovaProgressIndicatorSize.medium,
            )),
            _ControlDemo('Large', const NovaProgressIndicator(
              value: 0.7,
              size: NovaProgressIndicatorSize.large,
            )),
          ]),
          
          _buildVariantSection('Interactive Progress', [
            _ControlDemo('Adjustable', Column(
              children: [
                Slider(
                  value: _progressValue,
                  onChanged: (value) => setState(() => _progressValue = value),
                ),
                const SizedBox(height: 8),
                NovaProgressIndicator(
                  value: _progressValue,
                ),
                const SizedBox(height: 8),
                Text('Progress: ${(_progressValue * 100).round()}%'),
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

Widget _buildVariantSection(String title, List<_ControlDemo> demos) {
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

Widget _buildDemoCard(_ControlDemo demo) {
  return Container(
    constraints: const BoxConstraints(
      minWidth: 250,
      maxWidth: 350,
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

class _ControlDemo {
  final String label;
  final Widget widget;

  _ControlDemo(this.label, this.widget);
} 