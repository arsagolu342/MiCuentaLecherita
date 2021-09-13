import 'package:quick_actions/quick_actions.dart';

class ShortcutItems {
  static final items = <ShortcutItem>[
    actionCreate,
    actionTask,
  ];

  static final actionCreate = const ShortcutItem(
    type: 'action_create',
    localizedTitle: 'Pagos Pendientes',
    
  );

  static final actionTask = const ShortcutItem(
    type: 'action_task',
    localizedTitle: 'Configuraciones',
 
  );
}