import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:securex/account-card.dart';
import 'package:securex/add-account.dart';
import 'package:securex/edit-account.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var hiveBox = Hive.box('accounts');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SecureX',
          style: TextStyle(
            color: Color(0xFFFAF6EF),
            fontFamily: 'Machille',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF01132B),
        // backgroundColor: Color(0xFF1D503A),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddAccountScreen()),
          );
        },
        backgroundColor: Color(0xFF01132B),
        child: const Icon(Icons.add, size: 35, color: Color(0xFFEDE6D8)),
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: Color(0xFFFAF6EF),
        child: ValueListenableBuilder(
          valueListenable: hiveBox.listenable(),
          builder: (context, box, _) {
            if (box.isEmpty) {
              return const Center(
                child: Text(
                  "No accounts added yet!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                    fontFamily: 'Jakobenz',
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                final account = box.getAt(index);
                return AccountCard(
                  site: account['site'] ?? 'Unknown Site',
                  email: account['email'] ?? 'Unknown Email',
                  password: account['password'] ?? 'Unknown Password',
                  icon: IconData(
                    account['icon'] ?? 0x1F511,
                    fontFamily: account['fontFamily'],
                    fontPackage: account['fontPackage'],
                  ),
                  onEdit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditAccountScreen(
                          account: account,
                          key: ValueKey(index),
                        ),
                      ),
                    );
                  },
                  onDelete: () => AwesomeDialog(
                    context: context,
                    dialogType: DialogType.warning,
                    animType: AnimType.scale,
                    title: 'Delete Account',
                    desc: 'Are you sure you want to delete this account?',
                    btnCancelOnPress: () {},
                    btnCancelText: 'No',
                    btnOkText: 'Yes',
                    btnOkOnPress: () {
                      box.deleteAt(index);
                    },
                  ).show(),
                );
              },
            );
          },
        ),
        // ListView(
        //   children: [
        //     AccountCard(
        //       site: hiveBox.get('site', defaultValue: 'Example Site'),
        //       email: hiveBox.get('email', defaultValue: 'johndoe@gmail.com'),
        //       password: hiveBox.get('password', defaultValue: 'secret123'),
        //       icon: IconData(hiveBox.get('icon', defaultValue: 0x1F511)),
        //       onDelete: () => print('Delete clicked'),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
