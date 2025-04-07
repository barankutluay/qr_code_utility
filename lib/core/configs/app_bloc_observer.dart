import 'package:bloc/bloc.dart';
import 'package:myproject/core/utils/logger_util.dart';
import 'package:myproject/data/cubits/text_form_field/text_form_field_cubit.dart';

final class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    if (change.nextState is! TextFormFieldState) {
      LoggerUtil.debug('${bloc.runtimeType} $change');
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    LoggerUtil.error('${bloc.runtimeType} $error', error, stackTrace);
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    LoggerUtil.info('Created: ${bloc.runtimeType}');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    LoggerUtil.info('Closed: ${bloc.runtimeType}');
  }
}
