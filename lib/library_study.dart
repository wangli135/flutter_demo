import 'dart:async';

Stream<int> countStream(int to) async*{
  for(int i=1;i<=to;i++){
    yield i;
  }
}

Future<int> sunStream(Stream<int> stream) async{

  var sum=0;
  await for(var value in stream){
    sum+=value;
  }
  return sum;

}

void main() async{
  var stream =countStream(10);
  var sum=await sunStream(stream);
  print(sum);
}


