import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nova_design_system/nova_design_system.dart';

final overlayStories = WidgetbookComponent(
  name: 'Overlay',
  useCases: [
    WidgetbookUseCase(
      name: 'Snackbar Showcase',
      builder: (context) => const NovaSnackbarShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Bottom Sheet Showcase',
      builder: (context) => const NovaBottomSheetShowcase(),
    ),
    WidgetbookUseCase(
      name: 'Alert Dialog Showcase',
      builder: (context) => const NovaAlertDialogShowcase(),
    ),
  ],
);

// Snackbar Showcase
class NovaSnackbarShowcase extends StatelessWidget {
  const NovaSnackbarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader('Nova Snackbar', 'Temporary messages and notifications'),
            const SizedBox(height: 32),
            
            _buildVariantSection('Basic Snackbars', [
              _OverlayDemo('Simple Message', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'This is a simple snackbar message',
                ),
                text: 'Show Simple',
              )),
              _OverlayDemo('With Title', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  title: 'Success',
                  message: 'Your action was completed successfully',
                  variant: NovaSnackbarVariant.success,
                ),
                text: 'Show With Title',
              )),
              _OverlayDemo('With Icon', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Message with custom icon',
                  icon: const Icon(Icons.info, color: Colors.white),
                  variant: NovaSnackbarVariant.info,
                ),
                text: 'Show With Icon',
              )),
            ]),
            
            _buildVariantSection('Snackbar Variants', [
              _OverlayDemo('Primary', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Primary snackbar message',
                  variant: NovaSnackbarVariant.primary,
                ),
                text: 'Primary',
              )),
              _OverlayDemo('Secondary', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Secondary snackbar message',
                  variant: NovaSnackbarVariant.secondary,
                ),
                text: 'Secondary',
              )),
              _OverlayDemo('Success', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Success! Operation completed',
                  variant: NovaSnackbarVariant.success,
                  icon: const Icon(Icons.check_circle, color: Colors.white),
                ),
                text: 'Success',
              )),
              _OverlayDemo('Warning', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Warning: Please check your input',
                  variant: NovaSnackbarVariant.warning,
                  icon: const Icon(Icons.warning, color: Colors.white),
                ),
                text: 'Warning',
              )),
              _OverlayDemo('Error', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Error: Something went wrong',
                  variant: NovaSnackbarVariant.error,
                  icon: const Icon(Icons.error, color: Colors.white),
                ),
                text: 'Error',
              )),
              _OverlayDemo('Info', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Info: Here is some information',
                  variant: NovaSnackbarVariant.info,
                  icon: const Icon(Icons.info, color: Colors.white),
                ),
                text: 'Info',
              )),
            ]),
            
            _buildVariantSection('Snackbar Sizes', [
              _OverlayDemo('Small', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Small snackbar',
                  size: NovaSnackbarSize.small,
                ),
                text: 'Small',
              )),
              _OverlayDemo('Medium', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Medium snackbar',
                  size: NovaSnackbarSize.medium,
                ),
                text: 'Medium',
              )),
              _OverlayDemo('Large', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Large snackbar',
                  size: NovaSnackbarSize.large,
                ),
                text: 'Large',
              )),
            ]),
            
            _buildVariantSection('Snackbar Features', [
              _OverlayDemo('With Action', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Message deleted',
                  action: TextButton(
                    onPressed: () => debugPrint('Undo pressed'),
                    child: const Text('UNDO', style: TextStyle(color: Colors.white)),
                  ),
                  variant: NovaSnackbarVariant.error,
                ),
                text: 'With Action',
              )),
              _OverlayDemo('No Close Icon', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'Snackbar without close icon',
                  showCloseIcon: false,
                  duration: const Duration(seconds: 2),
                ),
                text: 'No Close Icon',
              )),
              _OverlayDemo('Long Duration', NovaElevatedButton(
                onPressed: () => NovaSnackbar.show(
                  context: context,
                  message: 'This snackbar will stay for 8 seconds',
                  duration: const Duration(seconds: 8),
                  variant: NovaSnackbarVariant.info,
                ),
                text: 'Long Duration',
              )),
            ]),
          ],
        ),
      ),
    );
  }
}

// Bottom Sheet Showcase
class NovaBottomSheetShowcase extends StatelessWidget {
  const NovaBottomSheetShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Bottom Sheet', 'Modal sheets that slide up from the bottom'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Bottom Sheets', [
            _OverlayDemo('Simple Sheet', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('This is a simple bottom sheet content'),
                ),
              ),
              text: 'Show Simple',
            )),
            _OverlayDemo('With Title', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Bottom Sheet Title',
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('This bottom sheet has a title'),
                ),
              ),
              text: 'With Title',
            )),
            _OverlayDemo('With Actions', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Settings',
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () => debugPrint('Share pressed'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => debugPrint('Edit pressed'),
                  ),
                ],
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Bottom sheet with action buttons'),
                ),
              ),
              text: 'With Actions',
            )),
          ]),
          
          _buildVariantSection('Bottom Sheet Variants', [
            _OverlayDemo('Primary', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Primary Sheet',
                variant: NovaBottomSheetVariant.primary,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Primary variant bottom sheet', style: TextStyle(color: Colors.white)),
                ),
              ),
              text: 'Primary',
            )),
            _OverlayDemo('Secondary', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Secondary Sheet',
                variant: NovaBottomSheetVariant.secondary,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Secondary variant bottom sheet', style: TextStyle(color: Colors.white)),
                ),
              ),
              text: 'Secondary',
            )),
            _OverlayDemo('Surface', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Surface Sheet',
                variant: NovaBottomSheetVariant.surface,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Surface variant bottom sheet'),
                ),
              ),
              text: 'Surface',
            )),
          ]),
          
          _buildVariantSection('Bottom Sheet Sizes', [
            _OverlayDemo('Small', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Small Sheet',
                size: NovaBottomSheetSize.small,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Small bottom sheet (30% height)'),
                ),
              ),
              text: 'Small',
            )),
            _OverlayDemo('Medium', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Medium Sheet',
                size: NovaBottomSheetSize.medium,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Medium bottom sheet (60% height)'),
                ),
              ),
              text: 'Medium',
            )),
            _OverlayDemo('Large', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Large Sheet',
                size: NovaBottomSheetSize.large,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Large bottom sheet (80% height)'),
                ),
              ),
              text: 'Large',
            )),
            _OverlayDemo('Full', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Full Sheet',
                size: NovaBottomSheetSize.full,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Full height bottom sheet'),
                ),
              ),
              text: 'Full',
            )),
          ]),
          
          _buildVariantSection('Bottom Sheet Features', [
            _OverlayDemo('No Drag Handle', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'No Drag Handle',
                showDragHandle: false,
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Bottom sheet without drag handle'),
                ),
              ),
              text: 'No Drag Handle',
            )),
            _OverlayDemo('Not Dismissible', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Not Dismissible',
                isDismissible: false,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('This sheet cannot be dismissed by tapping outside'),
                ),
              ),
              text: 'Not Dismissible',
            )),
            _OverlayDemo('Scrollable Content', NovaElevatedButton(
              onPressed: () => NovaBottomSheet.show(
                context: context,
                title: 'Scrollable Content',
                child: Column(
                  children: List.generate(20, (index) => 
                    ListTile(
                      leading: Icon(Icons.star),
                      title: Text('Item ${index + 1}'),
                      subtitle: Text('This is item number ${index + 1}'),
                    ),
                  ),
                ),
              ),
              text: 'Scrollable',
            )),
          ]),
        ],
      ),
    );
  }
}

// Alert Dialog Showcase
class NovaAlertDialogShowcase extends StatelessWidget {
  const NovaAlertDialogShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader('Nova Alert Dialog', 'Modal dialogs for important messages and confirmations'),
          const SizedBox(height: 32),
          
          _buildVariantSection('Basic Dialogs', [
            _OverlayDemo('Simple Dialog', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => const NovaAlertDialog(
                  title: 'Simple Dialog',
                  content: Text('This is a simple alert dialog'),
                ),
              ),
              text: 'Show Simple',
            )),
            _OverlayDemo('With Actions', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Confirm Action',
                  content: const Text('Are you sure you want to proceed?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    NovaElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: 'Confirm',
                    ),
                  ],
                ),
              ),
              text: 'With Actions',
            )),
            _OverlayDemo('Long Content', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Terms and Conditions',
                  content: const SingleChildScrollView(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris. '
                      'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum. '
                      'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui '
                      'officia deserunt mollit anim id est laborum.',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Decline'),
                    ),
                    NovaElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: 'Accept',
                    ),
                  ],
                ),
              ),
              text: 'Long Content',
            )),
          ]),
          
          _buildVariantSection('Dialog Variants', [
            _OverlayDemo('Standard', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Standard Dialog',
                  content: const Text('This is a standard dialog'),
                  variant: NovaAlertDialogVariant.standard,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              text: 'Standard',
            )),
            _OverlayDemo('Info', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Information',
                  content: const Text('Here is some important information'),
                  variant: NovaAlertDialogVariant.info,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Got it'),
                    ),
                  ],
                ),
              ),
              text: 'Info',
            )),
            _OverlayDemo('Success', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Success!',
                  content: const Text('Your action was completed successfully'),
                  variant: NovaAlertDialogVariant.success,
                  actions: [
                    NovaElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: 'Great!',
                    ),
                  ],
                ),
              ),
              text: 'Success',
            )),
            _OverlayDemo('Warning', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Warning',
                  content: const Text('This action cannot be undone'),
                  variant: NovaAlertDialogVariant.warning,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    NovaElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: 'Continue',
                    ),
                  ],
                ),
              ),
              text: 'Warning',
            )),
            _OverlayDemo('Error', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Error',
                  content: const Text('Something went wrong. Please try again.'),
                  variant: NovaAlertDialogVariant.error,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancel'),
                    ),
                    NovaElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: 'Retry',
                    ),
                  ],
                ),
              ),
              text: 'Error',
            )),
          ]),
          
          _buildVariantSection('Dialog Sizes', [
            _OverlayDemo('Small', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Small Dialog',
                  content: const Text('This is a small dialog'),
                  size: NovaAlertDialogSize.small,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              text: 'Small',
            )),
            _OverlayDemo('Medium', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Medium Dialog',
                  content: const Text('This is a medium dialog'),
                  size: NovaAlertDialogSize.medium,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              text: 'Medium',
            )),
            _OverlayDemo('Large', NovaElevatedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (context) => NovaAlertDialog(
                  title: 'Large Dialog',
                  content: const Text('This is a large dialog with more spacing'),
                  size: NovaAlertDialogSize.large,
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              text: 'Large',
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

Widget _buildVariantSection(String title, List<_OverlayDemo> demos) {
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

Widget _buildDemoCard(_OverlayDemo demo) {
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

class _OverlayDemo {
  final String label;
  final Widget widget;

  _OverlayDemo(this.label, this.widget);
} 