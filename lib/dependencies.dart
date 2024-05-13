
import '/services/todo_data_service.dart';
import '/services/todo_data_service_mock.dart';
import 'package:get_it/get_it.dart';

GetIt service = GetIt.instance;

void init() {
//  service.registerLazySingleton(() => TodoDataServiceMock());
  service.registerLazySingleton<TodoDataService>(() => TodoDataServiceMock());  
}