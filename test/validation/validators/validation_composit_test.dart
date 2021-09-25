import 'package:mockito/mockito.dart';
import 'package:rgb_pattern/validation/protocols/protocols.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import 'package:rgb_pattern/presentation/protocols/protocols.dart';

class ValidationComposit implements Validation{
  final List<FieldValidation> validations;

  ValidationComposit({@required this.validations});

  String validate({@required String field, @required String value}) {
    String error;
    for (final validation in validations) {
      error = validation.validate(value);
      if(error?.isNotEmpty == true) return error;
    }
    return error;
  }

}

class FieldValidationMock extends Mock implements FieldValidation {}

void main(){
  ValidationComposit sut;
  FieldValidationMock validation;
  FieldValidationMock validation1;
  FieldValidationMock validation2;

  void mockValidation(String error){
    when(validation.validate(any)).thenReturn(error);
  }
  
  void mockValidation1(String error){
    when(validation1.validate(any)).thenReturn(error);
  }

  void mockValidation2(String error){
    when(validation2.validate(any)).thenReturn(error);
  }

  setUp(() {
    validation = FieldValidationMock();
    when(validation.field).thenReturn('any_field');
    mockValidation(null);

    validation1 = FieldValidationMock();
    when(validation1.field).thenReturn('any_field');
    mockValidation1(null);
    
    validation2 = FieldValidationMock();
    when(validation2.field).thenReturn('other_field');
    mockValidation2(null);

    sut = ValidationComposit(validations: [validation, validation1]);
  });

  test('Should return null if all validations returns null or empty', () {
    mockValidation('');

    final error = sut.validate(field:'any_field', value:'any_value');

    expect(error, null);
  });

  test('Should return the first error', () {
    mockValidation('error');
    mockValidation1('error1');
    mockValidation2('error2');

    final error = sut.validate(field:'any_field', value:'any_value');

    expect(error, 'error');
  });
}