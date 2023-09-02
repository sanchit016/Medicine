part of 'account_view.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.title,
    required this.icon,
    required this.subTitle,
    this.backgroundColor,
  });
  final String title;
  final Color? backgroundColor;
  final String subTitle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 35,
          ),
          10.wGap,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 15.hWise,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 12.hWise,
                    color: Color.fromARGB(255, 163, 163, 163)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    this.icon,
    this.image,
    this.backgroundCOlor,
  });
  final String name;
  final Icon? icon;
  final AssetImage? image;
  final Color? backgroundCOlor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: backgroundCOlor,
          radius: 30,
          backgroundImage: image,
          child: Center(
            child: icon,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(name),
      ],
    );
  }
}
