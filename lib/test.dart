void main() {

  List<int> aList = [2,3,4,5,6,7,8];
  List<int> bList = [22,33,44,55,66,77,88];
  addEvenIndexList(aList,bList);

}

void addEvenIndexList(List<int> aList, List<int> bList) {
  int size = (aList.length/2).toInt();
  List<int> cList = List.filled(size, 0);


  int k =0;
  for(int i=0;i<aList.length;i++){

    if(i%2==0){
      cList[k] = aList[i]+bList[i];
      k++;
    }

  }
  print(cList);
}