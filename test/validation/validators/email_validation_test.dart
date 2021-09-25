import 'package:faker/faker.dart';
import 'package:rgb_pattern/validation/protocols/protocols.dart';
import 'package:test/test.dart';

class EmailValidation implements FieldValidation{

  final String field;

  EmailValidation(this.field);

  String validate(String value) {
    return null;
  }
}

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
}