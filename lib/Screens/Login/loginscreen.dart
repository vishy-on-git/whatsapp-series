import 'package:flutter/material.dart';
import 'package:whatsapp_series/Screens/OTP/otpscreen.dart';
import 'package:whatsapp_series/Widgets/uihelper.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController controller = TextEditingController(text: 'value');
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String? selectcountry = "India";

  List<String> countries = [
    "India",
    "United States",
    "South Africa",
    "United Arab Emirates",
    "Pakistan",
    "Afghanistan",
    "China",
    "Malaysia",
    "Turkey",
    "Russia",
    "United Kingdoms",
    "Armenia",
    "Italy",
    "Germany",
    "Spain",
    "Romania",
    "Australia",
    "Mexico",
    "Jamaica",
    "Senegal",
    "Tunisia",
    "Egypt",
    "Saudi Arabia",
    "Lebanon",
    "Sri Lanka",
    "Bangladesh",
    "Myanmar",
    "Taiwan",
    "Japan",
    "Thailand",
    "Singapore",
    "Brazil",
    "Cuba",
    "Argentina",
    "Norway",
    "Iceland",
    "Canada",
    "Uzbekistan",
    "Monaco",
    "Vatican City",
    "Belarus",
    "Ukraine",
    "Nepal",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                UiHelper.CustomText(
                  text: "Enter your Phone number",
                  height: 14,
                  fontweight: FontWeight.bold,
                ),
                SizedBox(height: 30),
                UiHelper.CustomText(
                  text: "Whatsapp will need to verify your phone",
                  height: 14,
                  color: Color(0xFF5E5E5E),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UiHelper.CustomText(
                      text: "number. Carrier charges may apply.",
                      height: 14,
                      color: Color(0xFF5E5E5E),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Feature coming soon!")),
                    );
                  },
                  child: UiHelper.CustomText(
                    text: "What's my number?",
                    height: 14,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: DropdownButtonFormField(
                    items: countries.map((String country) {
                      return DropdownMenuItem(
                        child: Text(country.toString()),
                        value: country,
                      );
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        selectcountry = newvalue!;
                      });
                    },
                    initialValue: selectcountry,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF00A884)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF00A884)),
                      ),
                    ),
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 11,
                  children: [
                    Center(
                      child: SizedBox(
                        width: 45,
                        child: TextField(
                          controller: countryCodeController,
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                            hintText: "+91",
                            filled: true,
                            fillColor: Color(0xFF05AA82)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 200, child: TextField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        fillColor: Color(0xFF05AA82),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF05AA82))
                        )
                      ),
                      keyboardType: TextInputType.numberWithOptions(),
                    )),
                  ],
                ),
                SizedBox(width: 70,),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: UiHelper.CustomButton(
        callback: () {
          String phNumber="${countryCodeController.text}${phoneNumberController.text}";
          Navigator.push(context, MaterialPageRoute(builder: (context)=>OTPScreen(phNumber: phNumber,)));
        },
        buttonname: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
