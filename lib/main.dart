import 'package:flutter/material.dart';
import 'dice.dart';
import 'counter.dart';
import 'layout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController dice = TextEditingController();
  TextEditingController pw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('박미리내'), accountEmail: Text('mrn6341@naver.com')
              ,decoration: BoxDecoration(
              color: Colors.red[200],
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.0), bottomLeft: Radius.circular(40.0)),
            ),),
            ListTile(
              leading: Icon(Icons.add, color: Colors.grey[850],),
              title: Text('숫자놀이'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Counter()));
              },
            ),
            ListTile(
              leading: Icon(Icons.add, color: Colors.grey[850],),
              title: Text('예시'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ExApp()));
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 50)),
                  const Center(
                    child: Image(
                      image: AssetImage('assets/chef.gif'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle:
                              TextStyle(color: Colors.teal, fontSize: 15.0))),
                      child: Container(
                        padding: const EdgeInsets.all((40.0)),
                        child: Column(
                          children: [
                            TextField(
                              controller: dice,
                              decoration: const InputDecoration(
                                  labelText: 'Enter "dice"'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: pw,
                              decoration: const InputDecoration(
                                  labelText: 'Enter Password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (dice.text == 'dice' && pw.text == '1234') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Dice()));
                                  } else
                                  if (dice.text == 'dice' && pw.text != '1234') {
                                    showSnackBar2(context);
                                  } else
                                  if (dice.text != 'dice' && pw.text == '1234') {
                                    showSnackBar3(context);
                                  } else {
                                    showSnackBar(context);
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.orangeAccent)),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 35.0,
                                  ),),),
                          ],
                        ),
                    ),),),
                ],
              )
              ,
            ),
          );
        },

      ),

    );
  }
}

  void showSnackBar(BuildContext context){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content:
          Text('로그인 정보를 확인하세요.',
            textAlign: TextAlign.center,),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.blue,
        ),
      );
  }

  void showSnackBar2(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
      Text('비밀번호가 일치하지 않습니다.',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void showSnackBar3(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:
      Text('아이디가 일치하지 않습니다..',
        textAlign: TextAlign.center,),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }


