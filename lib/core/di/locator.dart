import 'package:get_it/get_it.dart';
import 'package:real_estate/core/viewmodel/dashboard_store.dart';

final locator = GetIt.I;

void setupLocator() {
  /// Dashboard Store
  locator.registerSingleton<DashboardStore>(DashboardStore());
}
