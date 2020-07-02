import 'package:flutter/material.dart';

//----------------------------------------------------------------------------------------------------------------------//
//This class is responsible for the login fields and how they are handled
//---------------------------------------------------------------------------------------------------------------------//

class LoginFields extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginFieldsState();

}

class _LoginFieldsState  extends State<LoginFields>{
  bool _obscureText = true;
  String _username, _password;

  //Toggles the password show Status
  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Material(
        shadowColor: Colors.black54,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15)
            ),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.transparent,
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white,),
                    fillColor: Colors.transparent,
                    hoverColor: Colors.white70,
                    hintText: "Wat is je gebruikersnaam voor MyInsightOut?",
                    hintStyle: TextStyle(color: Colors.black87),
                    labelText: "Gebruikersnaam",
                    labelStyle: TextStyle(color: Colors.white70)


                  ),
                  onSaved: (String value) {
                    //do what with input
                  },
                  validator: (String value) {
                    return !value.contains('@') ? 'Er ontbreekt een @' : null;
                  },

                ),
              ),


              SizedBox(
                  height: 15.0
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key, color: Colors.white,),

                  fillColor: Colors.transparent,
                  hoverColor: Colors.white70,
                  hintText: "Geef hier je wachtwoord",
                  labelText: "Wachtwoord",
                  labelStyle: TextStyle(color: Colors.white70),
                  hintStyle: TextStyle(color: Colors.black87),



                ),
                onSaved: (val) => val.length < 6 ? 'Wachtwoord te klein, minimaal 6 tekens' : null,
                validator: (val) => _password = val,
                obscureText: _obscureText,

              ),
              FlatButton(
                  onPressed: _toggle,
                  padding: EdgeInsets.only(left: 7.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                          _obscureText ? Icons.remove_red_eye : Icons.panorama_fish_eye,
                        color: Colors.white70,
                      ),
                      Text(
                          _obscureText? "Show" : "Hide",
                        style: TextStyle(color: Colors.white70),
                      )
                    ],
                  ))

            ],
          ) ,
  )

    )





    ;
  }
}