import '../models/models.dart';

class AppState {
  const AppState({this.companies = const [], this.customers = const [], this.projects = const [], this.reports = const [], this.mileage = const []});
  final List<Company> companies; final List<Customer> customers; final List<Project> projects; final List<TimeReport> reports; final List<MileageLog> mileage;
  AppState copyWith({List<Company>? companies, List<Customer>? customers, List<Project>? projects, List<TimeReport>? reports, List<MileageLog>? mileage}) => AppState(companies: companies ?? this.companies, customers: customers ?? this.customers, projects: projects ?? this.projects, reports: reports ?? this.reports, mileage: mileage ?? this.mileage);
  double get totalHours => reports.fold(0, (s, e) => s + e.hours);
  double get totalCosts => reports.fold(0, (s, e) => s + e.costs);
  double get totalKm => reports.fold(0, (s, e) => s + e.kilometers) + mileage.fold(0, (s, e) => s + e.kilometers);
}
