abstract class HomeState {}

class InitialState extends HomeState {}

class UploadImage extends HomeState {}
class GetCategoryId extends HomeState {}

class GetCategoryLoading extends HomeState {}

class GetCategorySucsess extends HomeState {}

class GetCategoryError extends HomeState {}

class GetNewOffersLoading extends HomeState {}

class GetNewOffersSucsess extends HomeState {}

class GetNewOffersError extends HomeState {}

class GetPrivacyLoading extends HomeState {}

class GetPrivacySucsess extends HomeState {}

class GetPrivacyError extends HomeState {}

class FetchDataLoading extends HomeState {}

class FetchDataSucsess extends HomeState {}

class FetchDataError extends HomeState {}


class GetDetailsLoading extends HomeState {}

class GetDetailsSucsess extends HomeState {}

class GetDetailsError extends HomeState {}

class UpdateLoading extends HomeState {}

class UpdateSucsess extends HomeState {
  int? id;
  UpdateSucsess(this.id);
}

class UpdateError extends HomeState {}

class GetLocationLoading extends HomeState {}

class GetLocationSucsess extends HomeState {}

class GetLocationError extends HomeState {}

class GetVentoryLoading extends HomeState {}

class GetVentorySucsess extends HomeState {}

class GetVentoryError extends HomeState {}

class GetEmployeesLoading extends HomeState {}

class GetEmployeesSucsess extends HomeState {}

class GetEmployeesError extends HomeState {}

class GetEmployeeId extends HomeState {}
class Reduce extends HomeState {}
class DownloadLoading extends HomeState {}
class DownloadSucsses extends HomeState {}

class ChangePasswordShowenSucsses extends HomeState {}
