import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:phone_app/components/icon_text_button.dart';
import 'package:phone_app/components/profile_menu.dart';
import 'package:phone_app/components/user_image.dart';
import 'package:phone_app/pages/friends.dart';
import 'package:phone_app/pages/settings.dart';
import '../components/main_app_background.dart';
import '../utilities/constants.dart';
import 'editProfile.dart';
import 'package:provider/provider.dart';
import '../provider/data_provider.dart';

class EditProfileActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDataProvider>(context);
    final userDetails = userProvider.userDetails;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLoginRegisterBtnColour.withOpacity(0.9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const EditProfile(title: 'Edit Profile'),
                ),
              );
            },
            child: Text(
              "Edit",
              style: kSubSubTitleOfPage,
            ),
          )
        ],
      ),
      body: Scaffold(
        body: SingleChildScrollView(
          child: CustomGradientContainerSoft(
            child: Stack(
              children: [
                Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        Image.network(
                          userDetails != null && userDetails.imagePath != null
                              ? '${dotenv.env['API_URL_BASE']}${userDetails.imagePath}'
                              : 'lib/assets/img/default.jpeg', // Provide a default image path if userDetails or imagePath is null
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          //TODO: pass the current user name
                          userDetails!.username,
                          style: kSubSubTitleOfPage,
                        ),
                        const SizedBox(height: 20),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(110, 45, 81, 0.1),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconTextButton(
                                icon: "lib/assets/img/network.png",
                                title: "My Network",
                                subTitle: "603",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyFriendScreen(title: ''),
                                    ),
                                  );
                                },
                              ),
                              IconTextButton(
                                icon: "lib/assets/img/review.png",
                                title: "My Reviews",
                                subTitle: "953",
                                onPressed: () {},
                              ),
                              IconTextButton(
                                icon: "lib/assets/img/my_level.png",
                                title: "My Level",
                                subTitle: "Sliver",
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 1),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              MenuRow(
                                icon: "lib/assets/img/find_friends.png",
                                title: "Find Friends",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MyFriendScreen(title: ''),
                                    ),
                                  );
                                },
                              ),
                              _buildDivider(),
                              MenuRow(
                                icon: "lib/assets/img/settings.png",
                                title: "More Settings",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Setting(title: "Settings"),
                                    ),
                                  );
                                },
                              ),
                              _buildDivider(),
                              MenuRow(
                                icon: "lib/assets/img/sign_out.png",
                                title: "Sign Out",
                                onPressed: () {},
                              ),
                              _buildDivider(),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 15,
      thickness: 1,
      color: kLoginRegisterBtnColour,
    );
  }
}

/*
userImage: userDetails?.imagePath != null
                              ? FileImage(File(userDetails!.imagePath))
                                  as ImageProvider<Object>
                              : AssetImage('lib/assets/img/default.jpeg')
                                  as ImageProvider<Object>,

*/
