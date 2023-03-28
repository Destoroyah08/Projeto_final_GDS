import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:googlemaps/map.page.dart';


class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController _controlUser = TextEditingController();
  TextEditingController _controlPass = TextEditingController();
  bool _iconPass = true;
  bool _check = false;

  void _changeIconPass() {
    setState(() {
      _iconPass = !_iconPass;  
    });
  }

  List<User> usersList = []; //Cria a lista de usuários vazia
  
  @override
  void initState() {
    User u1 = User(nome: "Guilherme", email: "guilherme@gmail.com", senha: "1234");
    usersList.add(u1);
    User u2 = User(nome: "Rubens", email: "rubens@gmail.com", senha: "1234");
    usersList.add(u2);
    User u3 = User(nome: "Eduardo", email: "eduardo@gmail.com", senha: "1234");
    usersList.add(u3);
  }

  void _checkLogin(){
    User newLogin = User(email: _controlUser.text, senha: _controlPass.text);
    print("Dados do login: $newLogin");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context)=>MapPage() 
      )
    );
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/image/LogoGDS.jpeg'),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, top: 30),
                child: TextField(
                  controller: _controlUser,
                  style: TextStyle(
                    fontSize: 20
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Nome de usuário",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, top: 30),
                child: TextField(
                  controller: _controlPass,
                  style: TextStyle(
                    fontSize: 20
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Senha",
                    suffixIcon: IconButton(
                      onPressed: _changeIconPass,
                      icon:
                      (_iconPass) ? Icon(Icons.password) : Icon(Icons.remove_red_eye)
                    )
                  ),
                  obscureText: _iconPass,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 60, left: 60, top: 30),
                child: CheckboxListTile(
                  title: Text("Mantenha-me conectado"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _check,
                  onChanged: (p){
                    setState(() {
                      _check = !_check;  
                    });
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.only(right: 100, left: 100, top: 20, bottom: 20))
                  ),
                  onPressed: _checkLogin,
                  child: Text(
                      "Login",
                      style: TextStyle(fontSize: 26),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class User {
  String? nome;
  String? email;
  String? senha;

  User({this.email, this.nome, this.senha});

  @override
  String toString() {
    return "Nome: $nome\nEmail: $email\nSenha: $senha";
  }

  bool isLogged(String email, String senha){
    return email == this.email && senha == this.senha;
  }

}