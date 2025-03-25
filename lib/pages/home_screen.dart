import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voy/mock/mock_services.dart';
import 'package:voy/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  final MockServices mockServices = MockServices();
  bool _isLoading = true;
  bool _hasError = false;
  bool _findPoolSelected = true;
  late UserModel _user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async{
    try {
      UserModel user = await mockServices.getUsers();
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
      print("Error fetching users: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF191919),
      body: _isLoading
      ? Center(child: CircularProgressIndicator())
          : _hasError
          ? Center(child: Text("Couldn't get data", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
          : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40,),

              Text(
                "hello, " + (_user.fullName ?? "Guest"),
                style: TextStyle(
                    color: Color(0XFFE2E0F4),
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 30,),

              Text(
                "Select Service",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 15,),

              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _findPoolSelected = true;
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            bottomLeft: Radius.circular(14),
                          ),
                          color: _findPoolSelected ? Color(0XFF7E60BF) : Color(0XFFE2E0F4),
                          border: Border.all(
                            color: Color(0XFF7E60BF), // Border color
                            width: 1.5,          // Border thickness
                          ),
                        ),
                        height: 50,
                        child: Center(
                            child: Text(
                              "Find Pool",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: _findPoolSelected ? Colors.white : Colors.black
                              ),
                            ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() {
                        _findPoolSelected = false;
                      }),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: _findPoolSelected ? Color(0XFFE2E0F4) : Color(0XFF7E60BF),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(14),
                            bottomRight: Radius.circular(14),
                          ),
                          border: Border.all(
                            color: Color(0XFF7E60BF), // Border color
                            width: 1.5,          // Border thickness
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Offer Pool",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: _findPoolSelected ? Colors.black : Colors.white
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20,),

              Container(
                padding: EdgeInsets.all(20),
                height: 180,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0XFF6D6D6D),
                    width: 1.5
                  ),
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Column(
                  children: [
                    Expanded(child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color(0XFF454545),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          Icon(Icons.search,color: Colors.white,),
                          const SizedBox(width: 5,),
                          Text(
                            "Where are you going?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                    )
                    ),
                    SizedBox(height: 20,),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                    ),
                                  ),
                                  Text(
                                    "Delhi, India",
                                    style: TextStyle(
                                        color: Colors.white,
                                      fontSize: 16
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),

                          Row(
                            children: [
                              Icon(
                                Icons.work,
                                color: Colors.white,
                                size: 25,
                              ),
                              SizedBox(width: 5,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Work",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18
                                    ),
                                  ),
                                  Text(
                                    "Add shortcut",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),

              const SizedBox(height: 20,),

              Divider(
                color: Color(0xff242424), // Line color
                thickness: 2,       // Line thickness
                indent: 0,         // Left spacing
                endIndent: 0,      // Right spacing
              ),

              const SizedBox(height: 20,),

              Text(
                "Your Contribution",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 20,),

              Container(
                height: 145,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFF7E60BF),
                      Color(0XFF3B2D59)
                    ],
                  ),
                  borderRadius: BorderRadius.circular(14)
                ),
                child: Row(
                  children: [
                    Container(
                      height: 89,
                      width: 89,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(89),
                        color: Colors.white
                      ),
                      child: SvgPicture.asset(
                        "lib/assets/eco.svg"
                      ),
                    ),

                  ],
                ),
              )



            ],
          ),
        ),
      )
      );


  }
}
