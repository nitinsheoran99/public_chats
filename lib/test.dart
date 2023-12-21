void main() {
  StringList();
}

StringList(){
  int count=0;
  String str='Hello everyone come on time not be late';
  for (int i = 0; i < str.length; i++){
    String c= str[i];
    if(!(c=='a'|| c== 'e'|| c=='i'|| c=='o'|| c=='u' ||c== " ")){
      count++;
    }
  }
  print(count);
}

void sumOfSquareNo(){
  int sum=0;
  List<int> noList = [1, 2, 3,6];
  for (int i = 0; i < noList.length; i++){
    int c= noList[i];
    if(c%2!=0){
      int a= sum+c;
      sum=a;
    }
  }
  print(sum);
}

void noOfSquare(){

  List<int> noList = [1, 2, 3,6];
  for (int i = 0; i < noList.length; i++){
    int c= noList[i];
    int d= c*c;
    print(d);

  }
}

void numberCount() {
   int count = 0;
  List<int> noList = [1, 2, 3,6];

  for (int i = 0; i < noList.length; i++) {
    count++;
  }

  print("Number of elements in the list: $count");
}