import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';

import 'package:rgb_pattern/domain/entities/entities.dart';
import 'package:rgb_pattern/domain/errors/errors.dart';
import 'package:rgb_pattern/domain/use_cases/use_cases.dart';
import 'package:rgb_pattern/presentation/presenter/presenter.dart';
import 'package:rgb_pattern/presentation/protocols/protocols.dart';

import 'package:test/test.dart';

class MockValidation extends Mock implements Validation {}
class MockAuthentication extends Mock implements Authentication {}

void main() {
  Validation validation;
  Authentication authentication;
  StreamLoginPresenter sut;
  String email;
  String password;

  PostExpectation mockValidationCall(String field) => when(validation.validate(
      field: field ?? anyNamed('field'), value: anyNamed('value')));

  void mockValidation({String field, String value}) {
    mockValidationCall(field).thenReturn(value);
  }

  PostExpectation mockAuthenticationCall() => when(authentication.auth(any));

  void mockAuthentication() {
    mockAuthenticationCall().thenAnswer((_) async => AccountEntity(faker.guid.guid()));
  }

  void mockAuthenticationError(DomainError error) {
    mockAuthenticationCall().thenThrow(error);
  }

  setUp(() {
    validation = MockValidation();
    authentication = MockAuthentication();
    sut = StreamLoginPresenter(validation: validation, authentication: authentication);
    email = faker.internet.disposableEmail();
    password = faker.internet.password();
    mockValidation();
    mockAuthentication();
  });

  test('Should call validation with correct email', () {
    sut.validateEmail(email);

    verify(validation.validate(field: 'email', value: email)).called(1);
  });

  test('Should emit email error if validation fails', () {
    mockValidation(value: 'error');

    sut.emailErrorStream.listen(expectAsync1((error)=> expect(error, 'error')));
    sut.isFormValidStream.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validateEmail(email);
    sut.validateEmail(email);
  });

  test('Should emit null if validation succeed', () {
    sut.emailErrorStream.listen(expectAsync1((error)=> expect(error, null)));
    sut.isFormValidStream.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validateEmail(email);
  });

  test('Should call validation with correct password', () {

    sut.validatePassword(password);

    verify(validation.validate(field: 'password', value: password)).called(1);
  });

  test('Should emit password error if validation fails', () {
    mockValidation(value: 'error');

    sut.passwordErrorStream.listen(expectAsync1((error)=> expect(error, 'error')));
    sut.isFormValidStream.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validatePassword(password);
  });

  test('Should emit password null if validation succeed', () {
    sut.passwordErrorStream.listen(expectAsync1((error)=> expect(error, null)));
    sut.isFormValidStream.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });

  test('Should block in button case a error in display', () {
    mockValidation(field: 'email', value: 'error');

    sut.emailErrorStream.listen(expectAsync1((error)=> expect(error, 'error')));
    sut.passwordErrorStream.listen(expectAsync1((error)=> expect(error, null)));
    sut.isFormValidStream.listen(expectAsync1((isValid)=> expect(isValid, false)));

    sut.validateEmail(email);
    sut.validatePassword(password);
  });

  test('Should emits form valid event if form is valid', () async {
    sut.emailErrorStream.listen(expectAsync1((error)=> expect(error, null)));
    sut.passwordErrorStream.listen(expectAsync1((error)=> expect(error, null)));
    expectLater(sut.isFormValidStream, emitsInOrder([false, true]));

    sut.validateEmail(email);
    await Future.delayed(Duration.zero);
    sut.validatePassword(password);
  });

  test('Should calls Authentication with corrects values', () async {
    sut.validateEmail(email);
    sut.validatePassword(password);

    await sut.auth();

    verify(authentication.auth(AuthenticationParams(email: email, secret: password))).called(1);
  });

  test('Should emit correct events on Authentication success', () async {
    sut.validateEmail(email);
    sut.validatePassword(password);

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

    await sut.auth();
  });

  test('Should emit corrects events if InvalidCredentialError', () async {
    mockAuthenticationError(DomainError.invalidCredentials);
    sut.validateEmail(email);
    sut.validatePassword(password);

    expectLater(sut.isLoadingStream, emits(false));
    sut.mainErrorStream.listen(expectAsync1((error) =>
        expect(error,  'Credentials invalid.')));

    await sut.auth();
  });

  test('Should emit corrects events if UnexpectedError', () async {
    mockAuthenticationError(DomainError.unexpected);
    sut.validateEmail(email);
    sut.validatePassword(password);

    expectLater(sut.isLoadingStream, emits(false));
    sut.mainErrorStream.listen(expectAsync1((error) =>  
        expect(error,  'There is a erro, try again later.')));

    await sut.auth();
  });

  test('Should not emit event after disposed', () async {
    expect(sut.emailErrorStream, neverEmits(null));
    
    sut.dispose();

    sut.validateEmail(email);
  });
}
