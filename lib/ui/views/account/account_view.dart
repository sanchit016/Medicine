import 'package:vigorus/file_exporter.dart';
part 'account_view_model.dart';
part 'account_view_components.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.nonReactive(
      viewModelBuilder: () => AccountViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  height: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 30,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 35,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Take Care!",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        model.fullName,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ]),
                      ),
                      16.hGap,
                      Divider(
                        color: context.colorScheme.appGrey.withOpacity(0.5),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Settings"),
                            SizedBox(
                              height: 8,
                            ),
                            SettingCard(
                              title: 'Notifications',
                              icon: Icons.alarm,
                              subTitle: 'Check your Medicine Notification',
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            SettingCard(
                              title: 'Sound',
                              icon: Icons.volume_down,
                              subTitle: 'Ring, Silent, Vibrate',
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            SettingCard(
                              title: 'Manage your Account',
                              icon: Icons.account_circle,
                              subTitle: 'Password, Email ID, Phone Number',
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            SettingCard(
                              title: 'Notifications',
                              icon: Icons.alarm,
                              subTitle: 'Check your Medicine Notification',
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            SettingCard(
                              title: 'Notifications',
                              icon: Icons.alarm,
                              subTitle: 'Check your Medicine Notification',
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Devices"),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: context.colorScheme.appBlue
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: const Column(
                                children: [
                                  SettingCard(
                                    title: 'Connect',
                                    icon:
                                        Icons.connect_without_contact_outlined,
                                    subTitle: "Bluetooth, Wifi",
                                  ),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  SettingCard(
                                    backgroundColor: Colors.white,
                                    title: 'Sound Option',
                                    icon: Icons.volume_down,
                                    subTitle: "Ring, Silent, Vibrate",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Caretakers: 03"),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: context.colorScheme.appBlue
                                    .withOpacity(0.2),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ProfileCard(
                                    name: 'Sanchit',
                                  ),
                                  ProfileCard(
                                    name: 'Sanchit',
                                  ),
                                  ProfileCard(
                                    name: 'Sanchit',
                                  ),
                                  ProfileCard(
                                    backgroundCOlor: Colors.white,
                                    icon: Icon(Icons.add),
                                    name: 'Add',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Doctor"),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: context.colorScheme.appBlue
                                    .withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundColor:
                                        context.colorScheme.appBlue,
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  8.hGap,
                                  const Text(
                                    'Add Your Doctor',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  8.hGap,
                                  RichText(
                                    text: const TextSpan(
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                      children: <TextSpan>[
                                        TextSpan(text: "Or use "),
                                        TextSpan(
                                          text: "Invite Link",
                                          style: TextStyle(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Privacy Policy",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            50.hGap,
                            const Text(
                              "Terms of Use",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            50.hGap,
                            const Text(
                              "Rate Us",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            50.hGap,
                            const Text(
                              "Share",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Button(
                          color: context.colorScheme.appBlue,
                          text: "Log Out",
                          textColor: Colors.white,
                          onPressed: () => TopLevelFunctions.logoutUser(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
