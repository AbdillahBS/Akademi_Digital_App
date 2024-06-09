import 'package:flutter/material.dart';
import 'package:imk_app/theme/apps_color.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    // Initialize text controllers with current user data
    _nameController.text = "Gen-Z"; // Replace with current user's name
    _emailController.text =
        "genzi@gmail.com"; // Replace with current user's email
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 5,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmesHfOSnvBEEzhjn15FNxLsjic987PGT_In19D5WARn3qJ_LuwRj9HparBWwr_hFaGg4&usqp=CAU'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primary),
                    ),
                    child: Text("Change Photo"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Enter your name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Email",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  String newName = _nameController.text;
                  String newEmail = _emailController.text;
                  print("New Name: $newName");
                  print("New Email: $newEmail");
                  // Navigate back to profile page
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                ),
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
