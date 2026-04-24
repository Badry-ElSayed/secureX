import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';
import 'package:securex/account-form-field.dart';
import 'package:securex/icon-picker.dart';

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  final TextEditingController siteController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var hiveBox = Hive.box('accounts');
  IconData selectedIcon = FontAwesomeIcons.globe;

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EF),
      appBar: AppBar(
        title: const Text(
          "Add Account",
          style: TextStyle(
            color: Color(0xFFFAF6EF),
            fontFamily: 'Machille',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF01132B),
        foregroundColor: const Color(0xFFFAF6EF),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Card(
            color: const Color(0xFF01132B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Big Icon
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: const Color(0xFFEDE6D8),
                    child: FaIcon(
                      selectedIcon,
                      color: const Color(0xFF000619),
                      size: 48,
                    ),
                  ),

                  const SizedBox(height: 15),
                  const SizedBox(height: 20),

                  // Website
                  AccountFormField(
                    controller: siteController,
                    label: "Website / App",
                    icon: Icons.language,
                  ),

                  const SizedBox(height: 15),

                  // Username / Email
                  AccountFormField(
                    controller: emailController,
                    label: "Username / Email",
                    icon: Icons.person,
                  ),

                  const SizedBox(height: 15),

                  // Password
                  TextFormField(
                    controller: passwordController,
                    obscureText: isPasswordHidden,
                    style: const TextStyle(color: Color(0xFFEDE6D8)),
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Color(0xFFEDE6D8)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xFFEDE6D8),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordHidden
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color(0xFFEDE6D8),
                        ),
                        onPressed: () {
                          setState(() {
                            isPasswordHidden = !isPasswordHidden;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFFEDE6D8)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFFEDE6D8),
                          width: 2,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  IconPickerWidget(
                    selectedIcon: selectedIcon,
                    onIconSelected: (icon) {
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                  ),
                  const SizedBox(height: 25),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEDE6D8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        String site = siteController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        int iconCode = selectedIcon.codePoint;

                        if (site.isEmpty || email.isEmpty || password.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill in all fields."),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        hiveBox.add({
                          'site': site,
                          'email': email,
                          'password': password,
                          'icon': iconCode,
                          'fontFamily': selectedIcon.fontFamily,
                          'fontPackage': selectedIcon.fontPackage,
                        });
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Machille',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF01132B),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
