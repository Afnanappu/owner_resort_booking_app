class MyRegex{
  static bool nameValidation(String? value){
    if(value  == null)return false;
    return !RegExp(r"^[a-zA-Z]+([ '-][a-zA-Z]+)*$").hasMatch(value);
  }
  static bool emailValidation(String? value){
    if(value  == null)return false;
    return !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value);
  }
  static bool emptySpaceValidation(String? value){
    if(value  == null)return false;
    return !RegExp(r'^\s*$').hasMatch(value);
  }
}