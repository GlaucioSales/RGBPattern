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
  FieldValidationMock validation2;

  void mockValidation(String error){
    when(validation.field).thenReturn('any_field');
    when(validation.validate(any)).thenReturn(error);

    when(validation.field).thenReturn('any_field');
    when(validation.validate(any)).thenReturn(error);

    when(validation.field).thenReturn('other_field');
    when(validation.validate(any)).thenReturn(error);
  }

  setUp(() {
    validation = FieldValidationMock();
    validation1 = FieldValidationMock();
    validation2 = FieldValidationMock();

    sut = ValidationComposit(validations: [validation, validation1]);
  });

  test('Should retunr null if all validations returns null or empty', () {
    mockValidation('');
    mockValidation(null);

    final error = sut.validate(field:'any_field', value:'any_value');

    expect(error, null);
  });
}