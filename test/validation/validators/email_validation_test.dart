import 'package:faker/faker.dart';
import 'package:rgb_pattern/validation/protocols/protocols.dart';
import 'package:test/test.dart';

class EmailValidation implements FieldValidation{

  final String field;

  EmailValidation(this.field);

  String validate(String value) {
     Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern);
    
    if ( value?.isNotEmpty != true || regex.hasMatch(value))
      return null;
    else
      return 'Enter a valid email address.';
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

  test('Should return error if email is invalid', () {
    final error = sut.validate(faker.person.name());
    
    expect(error, 'Enter a valid email address.');
  });
}