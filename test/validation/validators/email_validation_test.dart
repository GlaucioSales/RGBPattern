import 'package:faker/faker.dart';

import 'package:rgb_pattern/validation/validators/validators.dart';

import 'package:test/test.dart';



void main(){
  EmailValidation sut;

  setUp((){
    sut = EmailValidation('any_value');
  });

  test('Should return null if email is empty', () {
    final error = sut.validate('');
    
    expect(error, null);
  });

  test('Should return null if email is null', () {
    final error = sut.validate(null);
    
    expect(error, null);
  });

  test('Should return null if email is valid', () {
    final error = sut.validate(faker.internet.email());
    
    expect(error, null);
  });

  test('Should return error if email is invalid', () {
    final error = sut.validate(faker.person.name());
    
    expect(error, 'Enter a valid email address.');
  });
}