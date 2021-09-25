import 'package:rgb_pattern/validation/protocols/protocols.dart';

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