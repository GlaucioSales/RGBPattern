import 'package:mockito/mockito.dart';
import 'package:rgb_pattern/validation/protocols/protocols.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:rgb_pattern/presentation/protocols/protocols.dart';

class ValidationComposit implements Validation{
  final List<FieldValidation> validations;

  ValidationComposit({@required this.validations});

  String validate({@required String field, @required String value}) {
    return null;
  }
}

class FieldValidationMock extends Mock implements FieldValidation {}

void main(){
  ValidationComposit sut;
  FieldValidationMock validation;
  FieldValidationMock validation1;

  setUp(() {
    validation = FieldValidationMock();
    validation1 = FieldValidationMock();

    sut = ValidationComposit(validations: [validation, validation1]);
  });

  test('Should retunr null if all validations returns null or empty', () {
    when(validation.field).thenReturn(null);
    when(validation.field).thenReturn('');

    when(validation1.field).thenReturn(null);
    when(validation1.field).thenReturn('');

    final error = sut.validate(field:'any_field', value:'any_value');

    expect(error, null);
  });
}