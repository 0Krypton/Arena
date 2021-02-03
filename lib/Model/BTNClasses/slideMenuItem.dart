class SlideMenuItem {
  final String title;
  final String imageUrl;

  final int index;

  SlideMenuItem({
    this.title,
    this.imageUrl,
    this.index,
  });
}

final List<SlideMenuItem> slideMenuItems = [
  SlideMenuItem(
    title: 'Back To Profile',
    imageUrl: 'assets/back_button.svg',
    index: 0,
  ),
  SlideMenuItem(
    title: 'Edit Profile',
    imageUrl: 'assets/menuItems/editProfileSVG.svg',
    index: 1,
  ),
  SlideMenuItem(
    title: 'Activity',
    imageUrl: 'assets/menuItems/activitySVG.svg',
    index: 2,
  ),
  SlideMenuItem(
    title: 'Payment',
    imageUrl: 'assets/menuItems/paymentSVG.svg',
    index: 3,
  ),
  SlideMenuItem(
    title: 'Settings',
    imageUrl: 'assets/menuItems/settingsSVG.svg',
    index: 4,
  ),
  SlideMenuItem(
    title: 'Logout',
    imageUrl: 'assets/menuItems/logoutSVG.svg',
    index: 5,
  ),
];
