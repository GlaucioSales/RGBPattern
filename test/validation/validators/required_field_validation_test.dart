import 'package:test/test.dart';

abstract class FieldValidation {
  String get field;
  String validate(String value);
}

class RequiredFieldValidation implements FieldValidation {
  final String field;

  RequiredFieldValidation(this.field);

  String validate(String value) {
    return value?.isNotEmpty == true ? null : "Required field.";
  }

}

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