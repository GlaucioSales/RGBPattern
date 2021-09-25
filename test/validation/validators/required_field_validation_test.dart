import 'package:rgb_pattern/validation/validators/validators.dart';
import 'package:test/test.dart';

void main(){
  RequiredFieldValidation sut;

  setUp(() {
    sut = RequiredFieldValidation('any_field');
  });

  test('Should return null if field is not empty', () {
    final error = sut.validate("any_value");

    expect(error, null);

  });

  test('Should return error if field is empty', () {
    final error = sut.validate("");

    expect(error, 'Required field.');
  });

    test('Should return error if field is null', () {
    final error = sut.validate(null);

    expect(error, 'Required field.');
  });
}