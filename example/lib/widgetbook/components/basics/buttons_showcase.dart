import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final buttonsStories = WidgetbookComponent(
  name: 'Buttons',
  useCases: [
    WidgetbookUseCase(
      name: 'Nova Button',
      builder: (context) => const NovaButtonShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Elevated Button',
      builder: (context) => const NovaElevatedButtonShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Outlined Button',
      builder: (context) => const NovaOutlinedButtonShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Text Button',
      builder: (context) => const NovaTextButtonShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Icon Button',
      builder: (context) => const NovaIconButtonShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Floating Action Button',
      builder: (context) => const NovaFabShowcase(),
    ),
  ],
);

// Nova Button Showcase
class NovaButtonShowcase extends StatelessWidget {
  const NovaButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Button', 'Primary button component with multiple variants'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Primary Buttons', [
            _ButtonDemo('Default', NovaButton(onPressed: () {}, child: const Text('Primary Button'))),
            _ButtonDemo('Disabled', const NovaButton(onPressed: null, child: Text('Disabled Button'))),
            _ButtonDemo('Loading', NovaButton(onPressed: () {}, isLoading: true, child: const Text('Loading...'))),
          ]),
          
          _buildVariantSection('Button Variants', [
            _ButtonDemo('Primary', NovaButton(onPressed: () {}, variant: NovaButtonVariant.primary, child: const Text('Primary'))),
            _ButtonDemo('Secondary', NovaButton(onPressed: () {}, variant: NovaButtonVariant.secondary, child: const Text('Secondary'))),
            _ButtonDemo('Outline', NovaButton(onPressed: () {}, variant: NovaButtonVariant.outline, child: const Text('Outline'))),
            _ButtonDemo('Ghost', NovaButton(onPressed: () {}, variant: NovaButtonVariant.ghost, child: const Text('Ghost'))),
          ]),
          
          _buildVariantSection('Sizes', [
            _ButtonDemo('Small', NovaButton(onPressed: () {}, size: NovaButtonSize.small, child: const Text('Small'))),
            _ButtonDemo('Medium', NovaButton(onPressed: () {}, size: NovaButtonSize.medium, child: const Text('Medium'))),
            _ButtonDemo('Large', NovaButton(onPressed: () {}, size: NovaButtonSize.large, child: const Text('Large'))),
          ]),
          
          _buildVariantSection('With Icons', [
            _ButtonDemo('Left Icon', NovaButton(
              onPressed: () {}, 
              leftIcon: const Icon(Icons.add, size: 16),
              child: const Text('Add Item')
            )),
            _ButtonDemo('Right Icon', NovaButton(
              onPressed: () {}, 
              rightIcon: const Icon(Icons.arrow_forward, size: 16),
              child: const Text('Continue')
            )),
            _ButtonDemo('Both Icons', NovaButton(
              onPressed: () {}, 
              leftIcon: const Icon(Icons.favorite, size: 16),
              rightIcon: const Icon(Icons.share, size: 16),
              child: const Text('Like & Share')
            )),
          ]),
          
          _buildVariantSection('Full Width', [
            _ButtonDemo('Full Width', NovaButton(
              onPressed: () {}, 
              fullWidth: true,
              child: const Text('Full Width Button')
            )),
          ]),
        ],
      ),
    );
  }
}

// Elevated Button Showcase
class NovaElevatedButtonShowcase extends StatelessWidget {
  const NovaElevatedButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Elevated Button', 'Material Design elevated button with shadow'),
          const SizedBox(height: 32),
          
          _buildVariantSection('States', [
            _ButtonDemo('Default', NovaElevatedButton(onPressed: () {}, text: 'Elevated Button')),
            _ButtonDemo('Disabled', const NovaElevatedButton(onPressed: null, text: 'Disabled')),
            _ButtonDemo('Loading', NovaElevatedButton(onPressed: () {}, isLoading: true, text: 'Loading...')),
          ]),
          
          _buildVariantSection('Variants', [
            _ButtonDemo('Primary', NovaElevatedButton(onPressed: () {}, text: 'Primary', variant: NovaElevatedButtonVariant.primary)),
            _ButtonDemo('Secondary', NovaElevatedButton(onPressed: () {}, text: 'Secondary', variant: NovaElevatedButtonVariant.secondary)),
            _ButtonDemo('Success', NovaElevatedButton(onPressed: () {}, text: 'Success', variant: NovaElevatedButtonVariant.success)),
            _ButtonDemo('Danger', NovaElevatedButton(onPressed: () {}, text: 'Danger', variant: NovaElevatedButtonVariant.danger)),
          ]),
          
          _buildVariantSection('Sizes', [
            _ButtonDemo('Small', NovaElevatedButton(onPressed: () {}, size: NovaButtonSize.small, text: 'Small')),
            _ButtonDemo('Medium', NovaElevatedButton(onPressed: () {}, size: NovaButtonSize.medium, text: 'Medium')),
            _ButtonDemo('Large', NovaElevatedButton(onPressed: () {}, size: NovaButtonSize.large, text: 'Large')),
          ]),
          
          _buildVariantSection('With Icons', [
            _ButtonDemo('Left Icon', NovaElevatedButton(
              onPressed: () {}, 
              text: 'Download',
              leftIcon: const Icon(Icons.download, size: 16),
            )),
            _ButtonDemo('Right Icon', NovaElevatedButton(
              onPressed: () {}, 
              text: 'Next',
              rightIcon: const Icon(Icons.arrow_forward, size: 16),
            )),
          ]),
        ],
      ),
    );
  }
}

// Outlined Button Showcase
class NovaOutlinedButtonShowcase extends StatelessWidget {
  const NovaOutlinedButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Outlined Button', 'Button with border and transparent background'),
          const SizedBox(height: 32),
          
          _buildVariantSection('States', [
            _ButtonDemo('Default', NovaOutlinedButton(onPressed: () {}, text: 'Outlined Button')),
            _ButtonDemo('Disabled', const NovaOutlinedButton(onPressed: null, text: 'Disabled')),
            _ButtonDemo('Loading', NovaOutlinedButton(onPressed: () {}, isLoading: true, text: 'Loading...')),
          ]),
          
          _buildVariantSection('Sizes', [
            _ButtonDemo('Small', NovaOutlinedButton(onPressed: () {}, size: NovaButtonSize.small, text: 'Small')),
            _ButtonDemo('Medium', NovaOutlinedButton(onPressed: () {}, size: NovaButtonSize.medium, text: 'Medium')),
            _ButtonDemo('Large', NovaOutlinedButton(onPressed: () {}, size: NovaButtonSize.large, text: 'Large')),
          ]),
        ],
      ),
    );
  }
}

// Text Button Showcase
class NovaTextButtonShowcase extends StatelessWidget {
  const NovaTextButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Text Button', 'Minimal button with text only'),
          const SizedBox(height: 32),
          
          _buildVariantSection('States', [
            _ButtonDemo('Default', NovaTextButton(onPressed: () {}, text: 'Text Button')),
            _ButtonDemo('Disabled', const NovaTextButton(onPressed: null, text: 'Disabled')),
            _ButtonDemo('Loading', NovaTextButton(onPressed: () {}, isLoading: true, text: 'Loading...')),
          ]),
          
          _buildVariantSection('Sizes', [
            _ButtonDemo('Small', NovaTextButton(onPressed: () {}, size: NovaButtonSize.small, text: 'Small')),
            _ButtonDemo('Medium', NovaTextButton(onPressed: () {}, size: NovaButtonSize.medium, text: 'Medium')),
            _ButtonDemo('Large', NovaTextButton(onPressed: () {}, size: NovaButtonSize.large, text: 'Large')),
          ]),
        ],
      ),
    );
  }
}

// Icon Button Showcase
class NovaIconButtonShowcase extends StatelessWidget {
  const NovaIconButtonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Icon Button', 'Button with icon only'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Variants', [
            _ButtonDemo('Primary', NovaIconButton(onPressed: () {}, icon: const Icon(Icons.favorite))),
            _ButtonDemo('Secondary', NovaIconButton(onPressed: () {}, icon: const Icon(Icons.share), variant: NovaIconButtonVariant.secondary)),
            _ButtonDemo('Ghost', NovaIconButton(onPressed: () {}, icon: const Icon(Icons.more_vert), variant: NovaIconButtonVariant.ghost)),
          ]),
          
          _buildVariantSection('Sizes', [
            _ButtonDemo('Small', NovaIconButton(onPressed: () {}, icon: const Icon(Icons.add), size: NovaIconButtonSize.small)),
            _ButtonDemo('Medium', NovaIconButton(onPressed: () {}, icon: const Icon(Icons.add), size: NovaIconButtonSize.medium)),
            _ButtonDemo('Large', NovaIconButton(onPressed: () {}, icon: const Icon(Icons.add), size: NovaIconButtonSize.large)),
          ]),
          
          _buildVariantSection('States', [
            _ButtonDemo('Default', NovaIconButton(onPressed: () {}, icon: const Icon(Icons.settings))),
            _ButtonDemo('Disabled', const NovaIconButton(onPressed: null, icon: Icon(Icons.settings))),
            _ButtonDemo('Loading', NovaIconButton(onPressed: () {}, icon: const Icon(Icons.settings), isLoading: true)),
          ]),
          
          _buildVariantSection('With Tooltip', [
            _ButtonDemo('With Tooltip', NovaIconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.help),
              tooltip: 'Help & Support'
            )),
          ]),
        ],
      ),
    );
  }
}

// FAB Showcase
class NovaFabShowcase extends StatelessWidget {
  const NovaFabShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Floating Action Button', 'Floating action button for primary actions'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Variants', [
            _ButtonDemo('Primary', NovaFab(onPressed: () {}, icon: const Icon(Icons.add))),
            _ButtonDemo('Secondary', NovaFab(onPressed: () {}, icon: const Icon(Icons.edit), variant: NovaFabVariant.secondary)),
            _ButtonDemo('Accent', NovaFab(onPressed: () {}, icon: const Icon(Icons.star), variant: NovaFabVariant.accent)),
          ]),
          
          _buildVariantSection('Sizes', [
            _ButtonDemo('Small', NovaFab(onPressed: () {}, icon: const Icon(Icons.add), size: NovaFabSize.small)),
            _ButtonDemo('Medium', NovaFab(onPressed: () {}, icon: const Icon(Icons.add), size: NovaFabSize.medium)),
            _ButtonDemo('Large', NovaFab(onPressed: () {}, icon: const Icon(Icons.add), size: NovaFabSize.large)),
          ]),
          
          _buildVariantSection('States', [
            _ButtonDemo('Default', NovaFab(onPressed: () {}, icon: const Icon(Icons.add))),
            _ButtonDemo('Disabled', const NovaFab(onPressed: null, icon: Icon(Icons.add))),
            _ButtonDemo('Loading', NovaFab(onPressed: () {}, isLoading: true, icon: const Icon(Icons.add))),
          ]),
          
          _buildVariantSection('With Tooltip', [
            _ButtonDemo('With Tooltip', NovaFab(
              onPressed: () {}, 
              icon: const Icon(Icons.add),
              tooltip: 'Create new item'
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

Widget _buildVariantSection(String title, List<_ButtonDemo> demos) {
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

Widget _buildDemoCard(_ButtonDemo demo) {
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

class _ButtonDemo {
  final String label;
  final Widget widget;

  _ButtonDemo(this.label, this.widget);
} 