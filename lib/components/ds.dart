class Stack{
  static List<String> operators = [];

  static void push(String char){
    if (double.tryParse(char)!=null){ //numeric
      operators.add(char);
    }

  }

}