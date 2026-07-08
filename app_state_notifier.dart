import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../models/models.dart';
import 'app_state.dart';

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) => AppStateNotifier());

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier() : super(const AppState(companies: [Company(id: 'demo-company', name: 'Demo Company')], customers: [Customer(id: 'demo-customer', name: 'Demo Customer')], projects: [Project(id: 'demo-project', name: 'Demo Project', number: 'P1001')]));
  final _uuid = const Uuid();
  void addCompany(String name) => state = state.copyWith(companies: [...state.companies, Company(id: _uuid.v4(), name: name)]);
  void addCustomer(String name) => state = state.copyWith(customers: [...state.customers, Customer(id: _uuid.v4(), name: name)]);
  void addProject(String name) => state = state.copyWith(projects: [...state.projects, Project(id: _uuid.v4(), name: name)]);
  void addReport({required double hours, String? comment, double kilometers = 0, double parking = 0, double toll = 0, double material = 0}) => state = state.copyWith(reports: [...state.reports, TimeReport(id: _uuid.v4(), date: DateTime.now(), hours: hours, comment: comment, kilometers: kilometers, parking: parking, toll: toll, material: material)]);
  void addMileage({required String from, required String to, required double kilometers, double rate = 0}) => state = state.copyWith(mileage: [...state.mileage, MileageLog(id: _uuid.v4(), from: from, to: to, kilometers: kilometers, ratePerKm: rate)]);
}
