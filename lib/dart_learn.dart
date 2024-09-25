
int calculate() {
  return 6 * 7;
}

/*
 * 变量&炒作操作符号
 * 
 * 特别的：
 *  0、? 允许空
 *  1、??= 为空才赋值
 *  2、exp1 ?? exp2 exp1不为空返回exp1，否则返回exp2
 *  3、?. 如果不为空访问成员，否则返回空
 *  4、.. 和 ?.. 级联访问
 */
void varLearn(){
  //变量申明  
  var name = "string";
  print(name);
  String nameVar = "name";
  print(nameVar);

  //空安全
  //非空变量声明：
  String temp;
  //String? tempA;，直接使用编译会报错
  //和java final不同，temp还是一个变量
  // print(temp);
  temp = 'test';
  print(temp);
  //空变量声明：通过? 允许为空
  String? tempA;
  print(tempA);
  tempA = 'allowNull';
  print(tempA);

  //延迟初始化
  //非空变量是dart检测前后代码来判断是否赋值，但有时可能确定，比如赋值在另一个类里
  //这个时候可以使用late 延迟初始化
  late String lateName = "a";
  print(lateName);
  // 使用late 之后变量被调用的时候才会被初始化
  late int a = calculate();
  print(a);
  

  //常量
  //final 任意类型可以使用，被修饰对象无法更改，但是对象里的字段可以修改
  final finalA = "ss";
  print(finalA);
  final TestObject testObject = TestObject("test");
  print(testObject.a);
  testObject.a = "test";
  print(testObject.a);
  //const 编译时常量  被修饰对象里的字段都不能改变
  const al = 234;
  print(al);

  var to = TestObject("value");
  print(to.a);
  //类型强转
  Object ao1 = TestObject("value");
  print(ao1.hashCode);
  //类型判断
  print(ao1 is TestObject);//true
  print(ao1 is String); //false
  print((ao1 as TestObject).a);//value
  
  //赋值操作
  //如果为空赋值，否则不赋值
  int?aDefa;
  aDefa??=1;
  print(aDefa);//1
  aDefa??=2;
  print(aDefa);//1

  //条件表达式
  var cvalue = aDefa == 1? "a":"b";
  print(cvalue);//a
  int? nullVaa;
  int vaa = 1;
  print(nullVaa??vaa);//1
  nullVaa = 2;
  print(nullVaa??vaa);//2

  //有条件的成员变量访问
  TestObject? nullTestObject;
  assert(nullTestObject?.a == null);


  //级联操作 .. 允许对一个对象连续操作
  TestObject tempCascade = TestObject("value")
  ..a = "aa";
  print(tempCascade.a);// aa

  var dget = get()
    ..a = "dd";
  print(dget.a);//dd

  //开头使用?.. 代表dget?.a 后续都使用有条件成员变量访问 
  dget = get()
    ?..a = "dd";
  print(dget.a);//dd
  


  
  

}

TestObject get(){
  return TestObject("defalut");
}

class TestObject{
  String? a;

  String? b;

  TestObject(String value){
    a = value;
  }
}

void main(){
  print('hello');
  varLearn();
}
