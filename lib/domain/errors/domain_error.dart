enum DomainError {
  unexpected,
  invalidCredentials,
}

extension DomainErrorExtension on DomainError {
  String get description{
    switch(this) {
      case DomainError.invalidCredentials:
        return 'Credentials invalid.';

      case DomainError.unexpected:
        return 'There is a erro, try again later.';

      default:
        return '';
    }
  }
    

}