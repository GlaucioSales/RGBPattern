import 'package:meta/meta.dart';

import '../../presentation/protocols/protocols.dart';
import '../protocols/protocols.dart';

class ValidationComposite implements Validation{
  final List<FieldValidation> validations;

  ValidationComposite({@required this.validations});

  String validate({@required String field, @required String value}) {
    print(validations.length);
    String error;
    for (final validation in validations.where((element) => element.field == field )) {
      error = validation.validate(value);
      if(error?.isNotEmpty == true) return error;
    }
    return error;
  }

}