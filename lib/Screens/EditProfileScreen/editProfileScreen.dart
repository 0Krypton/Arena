//importing packages
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_border/dotted_border.dart';

//importing themes
import '../../Themes/color/colorThemes.dart';

//importing widgets
import '../../Widgets/CustomTextFieldWithValidation.dart';
import '../../Widgets/textFieldCounter.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({this.menuCallBack});

  final Function menuCallBack;

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with TickerProviderStateMixin {
  bool _showAddNewBottomSheet = false;
  double _addNewBottomSheetOpacity = 0.0;
  //controllers
  TextEditingController userNameController,
      fNameController,
      lNameController,
      bioController,
      clanNameController,
      clanUserNameController;

  AnimationController userNameScaleAnimController;
  AnimationController fNameScaleAnimController;
  AnimationController lNameScaleAnimController;
  AnimationController bioScaleAnimController;
  AnimationController clanNameScaleAnimController;
  AnimationController clanUserNameScaleAnimController;

  AnimationController userNameColorController;
  AnimationController fNameColorController;
  AnimationController lNameColorController;
  AnimationController bioColorController;

  AnimationController clanNameColorController;
  AnimationController clanUserNameColorController;

  // textfield properties
  int bioEnteredLenght = 150;
  int extraEnteredBio = 0;

  //focus nodes
  FocusNode userNameFocusNode,
      fNameFocusNode,
      lNameFocusNode,
      bioFocusNode,
      clanFocusNode,
      clanNameFocusNode,
      clanUserNameFocusNode;

  //animations
  Animation<double> bioScaleAnim;

  @override
  void initState() {
    super.initState();

    //initilizing controllers
    userNameController = TextEditingController(text: '');
    fNameController = TextEditingController(text: '');
    lNameController = TextEditingController(text: '');
    bioController = TextEditingController(text: '');
    clanNameController = TextEditingController(text: '');
    clanUserNameController = TextEditingController(text: '');

    userNameScaleAnimController = AnimationController(
        vsync: this, value: 0.0, duration: const Duration(milliseconds: 300));
    fNameScaleAnimController = AnimationController(
        vsync: this, value: 0.0, duration: const Duration(milliseconds: 300));
    lNameScaleAnimController = AnimationController(
        vsync: this, value: 0.0, duration: const Duration(milliseconds: 300));
    bioScaleAnimController = AnimationController(
        vsync: this, value: 0.0, duration: const Duration(milliseconds: 300));
    clanNameScaleAnimController = AnimationController(
        vsync: this, value: 0.0, duration: const Duration(milliseconds: 300));
    clanUserNameScaleAnimController = AnimationController(
        vsync: this, value: 0.0, duration: const Duration(milliseconds: 300));

    userNameScaleAnimController.addListener(() {});
    fNameScaleAnimController.addListener(() {});
    lNameScaleAnimController.addListener(() {});
    bioScaleAnimController.addListener(() {});
    clanNameScaleAnimController.addListener(() {});
    clanUserNameScaleAnimController.addListener(() {});

    userNameColorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    fNameColorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    lNameColorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    bioColorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    clanNameColorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    clanUserNameColorController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    //initilizing focusnodes
    userNameFocusNode = new FocusNode();
    fNameFocusNode = new FocusNode();
    lNameFocusNode = new FocusNode();
    bioFocusNode = new FocusNode();
    clanFocusNode = new FocusNode();
    clanNameFocusNode = new FocusNode();
    clanUserNameFocusNode = new FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    //disposing animationControllers
    bioScaleAnimController.dispose();
    userNameScaleAnimController.dispose();
    fNameScaleAnimController.dispose();
    lNameScaleAnimController.dispose();
    clanNameScaleAnimController.dispose();
    clanUserNameScaleAnimController.dispose();

    //disposing TextEditingControllers
    userNameController.dispose();
    fNameController.dispose();
    lNameController.dispose();
    bioController.dispose();
    clanNameController.dispose();
    clanUserNameController.dispose();

    userNameColorController.dispose();
    fNameColorController.dispose();
    lNameColorController.dispose();
    bioColorController.dispose();
    clanNameColorController.dispose();
    clanUserNameColorController.dispose();

    //disposing focusNodes
    userNameFocusNode.dispose();
    fNameFocusNode.dispose();
    lNameFocusNode.dispose();
    bioFocusNode.dispose();
    clanFocusNode.dispose();
    clanNameFocusNode.dispose();
    clanUserNameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final height = media.size.height;
    final width = media.size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(
                    height: height * .2,
                    width: width,
                    imageHeight: ((height * .3) * .8),
                  ),
                  SizedBox(
                    height: ((width * .4) / 2) + 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: _buildText(
                        text:
                            'Tap the background & profile\nimages to change them',
                        color: Colors.grey[700],
                        fontSize: 13,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildText(
                      text: 'User Info',
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildEditUserName(),
                  SizedBox(height: 10),
                  _buildEditPersonalInfo(),
                  SizedBox(height: 10),
                  _buildEditBio(),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildText(
                      text: 'Clan & Team',
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildClansAndTeams(
                        clanImgUrl: '',
                        clanName: 'NRG Esports',
                        clanUserName: '@nrgesports',
                        clanAddImgCallBack: () {
                          print('addClanImg');
                        },
                        delClanCallBack: () {
                          print('del clan');
                        }),
                  ),
                  SizedBox(height: 15),
                  _buildAddNewClanAndTeam(width: width),
                  SizedBox(height: 30),
                ],
              ),
            ),
            _buildMenuButton(callBack: widget.menuCallBack),
            _showAddNewBottomSheet
                ? _buildAddNewBottomSheet(
                    height: height,
                    width: width,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewBottomSheet({height, width}) {
    return AnimatedOpacity(
      opacity: _addNewBottomSheetOpacity,
      duration: const Duration(milliseconds: 300),
      child: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showAddNewBottomSheet = false;
                    _addNewBottomSheetOpacity = 0.0;
                  });
                },
                child: Container(
                  height: height,
                  width: width,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              _buildBottomSheetContainer(
                width: width,
                height: height * .6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheetContainer({width, height}) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            _buildClansAndTeams(
              clanImgUrl: '',
              clanUserName: '@id',
              clanName: 'name',
              isMockUp: true,
            ),
            SizedBox(height: 10),
            Stack(
              overflow: Overflow.visible,
              children: [
                TextFieldWithValidation(
                  hintText: 'UserName',
                  focusNode: clanUserNameFocusNode,
                  nextFocusNode: clanNameFocusNode,
                  controller: clanUserNameController,
                  colorAnimController: clanUserNameColorController,
                  onChanged: (v) {
                    if (clanUserNameController.text.trim().length > 0) {
                      clanUserNameScaleAnimController.forward();
                      if (bioController.text.trim().length >= 3) {
                        clanUserNameController.text.trim().padRight(1, v);
                      }
                      setState(() {});
                    } else {
                      setState(() {
                        clanUserNameScaleAnimController.reverse();
                      });
                    }
                  },
                  fillColor: profileScrTxtFieldFilledColor,
                  textColor: Colors.black,
                  errorColor: Colors.red[200],
                  errorTextColor: Colors.red[900],
                  limit: 3,
                ),
                Positioned(
                  bottom: -(20 / 2),
                  right: 15,
                  child: TextFieldCounter(
                    count: clanUserNameController.text.length,
                    isValid: clanUserNameController.text.length >= 3,
                    height: 20,
                    verticalPadding: 3,
                    bgColor: colorShade800,
                    bgErrorColor: Colors.red[700],
                    textColor: Colors.white,
                    errorTextColor: Colors.white,
                    scaleAnimationController: clanUserNameScaleAnimController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Stack(
              overflow: Overflow.visible,
              children: [
                TextFieldWithValidation(
                  hintText: 'Name',
                  focusNode: clanNameFocusNode,
                  nextFocusNode: clanNameFocusNode,
                  controller: clanNameController,
                  colorAnimController: clanNameColorController,
                  onChanged: (v) {
                    if (clanNameController.text.trim().length > 0) {
                      clanNameScaleAnimController.forward();
                      if (bioController.text.trim().length >= 3) {
                        clanNameController.text.trim().padRight(1, v);
                      }
                      setState(() {});
                    } else {
                      setState(() {
                        clanNameScaleAnimController.reverse();
                      });
                    }
                  },
                  fillColor: profileScrTxtFieldFilledColor,
                  textColor: Colors.black,
                  errorColor: Colors.red[200],
                  errorTextColor: Colors.red[900],
                  limit: 3,
                ),
                Positioned(
                  bottom: -(20 / 2),
                  right: 15,
                  child: TextFieldCounter(
                    count: clanNameController.text.length,
                    isValid: clanNameController.text.length >= 3,
                    height: 20,
                    verticalPadding: 3,
                    bgColor: colorShade800,
                    bgErrorColor: Colors.red[700],
                    textColor: Colors.white,
                    errorTextColor: Colors.white,
                    scaleAnimationController: clanNameScaleAnimController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            _buildAddClanImageBtn(width: width),
            SizedBox(height: 15),
            _buildAddNewClanBtn(width: width),
          ],
        ),
      ),
    );
  }

  Widget _buildAddNewClanBtn({width}) {
    return GestureDetector(
      onTap: () {
        clanUserNameFocusNode.unfocus();
        clanNameFocusNode.unfocus();
        setState(() {
          _showAddNewBottomSheet = false;
          _addNewBottomSheetOpacity = 0.0;
        });
      },
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: colorShade700,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: colorShade700,
              blurRadius: 15,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Submit',
            style: TextStyle(
              fontFamily: 'Reglo',
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddClanImageBtn({width}) {
    return DottedBorder(
      color: Colors.grey,
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      strokeWidth: 2.0,
      child: Container(
        width: width,
        height: 50,
        decoration: BoxDecoration(
          color: profileScrTxtFieldFilledColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Select Clan Image',
            style: TextStyle(
              fontFamily: 'Reglo',
              fontSize: 15,
              color: profileScrTxtFieldTxtColor.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddNewClanAndTeam({width}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _showAddNewBottomSheet = true;
            _addNewBottomSheetOpacity = 1.0;
          });
        },
        child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
            color: colorShade600.withOpacity(.5),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: shadowColor900.withOpacity(.5),
                blurRadius: 15,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'Add New',
              style: TextStyle(
                color: colorShade900,
                fontFamily: 'Lequire',
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClansAndTeams({
    String clanImgUrl = '',
    String clanUserName,
    String clanName,
    Function clanAddImgCallBack,
    Function delClanCallBack,
    bool isMockUp = false,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: isMockUp ? () {} : clanAddImgCallBack,
          child: clanImgUrl.length == 0
              ? Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: colorShade600,
                    shape: BoxShape.circle,
                  ),
                )
              : ClipRRect(
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      clanImgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: isMockUp
                    ? () {}
                    : () {
                        print('get clan profile page');
                      },
                child: _buildText(
                  text: clanUserName,
                  color: colorShade900,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              _buildText(
                text: clanName,
                color: Colors.black,
                fontSize: 12,
              ),
            ],
          ),
        ),
        isMockUp
            ? SizedBox()
            : GestureDetector(
                onTap: delClanCallBack,
                child: SvgPicture.asset(
                  'assets/delete_icon.svg',
                  color: Colors.red[800],
                ),
              ),
      ],
    );
  }

  Widget _buildEditBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          TextFieldWithValidation(
            controller: bioController,
            colorAnimController: bioColorController,
            focusNode: bioFocusNode,
            hintText: 'BIO',
            maxLenght: 150,
            minLines: 5,
            maxLines: 5,
            onChanged: (v) {
              if (bioController.text.trim().length > 0) {
                if (bioController.text.trim().length <= 150) {
                  setState(() {
                    bioScaleAnimController.forward();
                    bioController.text.padRight(1, v);
                    bioEnteredLenght = bioController.text.length;
                  });
                } else if (bioController.text.trim().length > 150) {
                  bioColorController.forward();
                  extraEnteredBio = bioController.text.trim().length - 150;
                  setState(() {});
                }
              } else {
                setState(() {});
                bioScaleAnimController.reverse();
              }
            },
            fillColor: profileScrTxtFieldFilledColor,
            textColor: Colors.black,
            errorColor: Colors.red[200],
            errorTextColor: Colors.red[900],
            limit: 0,
          ),
          Positioned(
            bottom: -(20 / 2),
            right: 15,
            child: TextFieldCounter(
              height: 20,
              verticalPadding: 3,
              count: bioController.text.length,
              isValid: bioController.text.length <= 150,
              bgColor: colorShade800,
              bgErrorColor: Colors.red[700],
              textColor: Colors.white,
              errorTextColor: Colors.white,
              scaleAnimationController: bioScaleAnimController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditPersonalInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                TextFieldWithValidation(
                  controller: fNameController,
                  colorAnimController: fNameColorController,
                  focusNode: fNameFocusNode,
                  nextFocusNode: lNameFocusNode,
                  hintText: 'FIRST NAME',
                  onChanged: (v) {
                    if (fNameController.text.trim().length > 0) {
                      fNameScaleAnimController.forward();
                      if (bioController.text.trim().length >= 3) {
                        fNameController.text.trim().padRight(1, v);
                      }
                      setState(() {});
                    } else {
                      setState(() {
                        fNameScaleAnimController.reverse();
                      });
                    }
                  },
                  fillColor: profileScrTxtFieldFilledColor,
                  textColor: Colors.black,
                  errorColor: Colors.red[200],
                  errorTextColor: Colors.red[900],
                  limit: 3,
                ),
                Positioned(
                  bottom: -(15 / 2),
                  right: 15,
                  child: TextFieldCounter(
                    count: fNameController.text.length,
                    isValid: fNameController.text.length >= 3,
                    height: 15,
                    verticalPadding: 2,
                    bgColor: colorShade800,
                    bgErrorColor: Colors.red[700],
                    textColor: Colors.white,
                    errorTextColor: Colors.white,
                    scaleAnimationController: fNameScaleAnimController,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Stack(
              overflow: Overflow.visible,
              children: [
                TextFieldWithValidation(
                  controller: lNameController,
                  colorAnimController: lNameColorController,
                  focusNode: lNameFocusNode,
                  nextFocusNode: bioFocusNode,
                  hintText: 'LAST NAME',
                  onChanged: (v) {
                    if (lNameController.text.trim().length > 0) {
                      lNameScaleAnimController.forward();
                      if (bioController.text.trim().length >= 4) {
                        lNameController.text.trim().padRight(1, v);
                      }
                      setState(() {});
                    } else {
                      setState(() {
                        lNameScaleAnimController.reverse();
                      });
                    }
                  },
                  fillColor: profileScrTxtFieldFilledColor,
                  textColor: Colors.black,
                  errorColor: Colors.red[200],
                  errorTextColor: Colors.red[900],
                  limit: 4,
                ),
                Positioned(
                  bottom: -(15 / 2),
                  right: 15,
                  child: TextFieldCounter(
                    count: lNameController.text.length,
                    isValid: lNameController.text.length >= 4,
                    height: 15,
                    verticalPadding: 2,
                    bgColor: colorShade800,
                    bgErrorColor: Colors.red[700],
                    textColor: Colors.white,
                    errorTextColor: Colors.white,
                    scaleAnimationController: lNameScaleAnimController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditUserName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          TextFieldWithValidation(
            controller: userNameController,
            colorAnimController: userNameColorController,
            focusNode: userNameFocusNode,
            nextFocusNode: fNameFocusNode,
            hintText: 'USER NAME',
            fillColor: profileScrTxtFieldFilledColor,
            textColor: Colors.black,
            errorColor: Colors.red[200],
            errorTextColor: Colors.red[900],
            limit: 4,
            onChanged: (v) {
              if (userNameController.text.trim().length > 0) {
                userNameScaleAnimController.forward();
                if (bioController.text.trim().length >= 4) {
                  userNameController.text.trim().padRight(1, v);
                }
                setState(() {});
              } else {
                setState(() {
                  userNameScaleAnimController.reverse();
                });
              }
            },
          ),
          Positioned(
            bottom: -(20 / 2),
            right: 15,
            child: TextFieldCounter(
              count: userNameController.text.length,
              isValid: userNameController.text.length >= 4,
              height: 20,
              verticalPadding: 3,
              bgColor: colorShade800,
              bgErrorColor: Colors.red[700],
              textColor: Colors.white,
              errorTextColor: Colors.white,
              scaleAnimationController: userNameScaleAnimController,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildText({String text, Color color, double fontSize}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: 'Reglo',
        fontSize: fontSize,
      ),
    );
  }

  Widget _buildHeader({height, width, imageHeight}) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          _buildBgImage(height: height, width: width),
          _buildProfileImage(
            height: imageHeight,
            width: width,
            positionFromTop: height,
          ),
        ],
      ),
    );
  }

  Widget _buildBgImage({height, width}) {
    return GestureDetector(
      onTap: () {
        print('ImageBg tapped');
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: profileBgDefGradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage({height, width, positionFromTop}) {
    return Positioned(
      top: positionFromTop - (height / 2),
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          print('Image tapped');
        },
        child: Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: profileProfileImgDefGradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: profileProfileImgShadowColor.withOpacity(0.5),
                blurRadius: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton({Function callBack}) {
    return Positioned(
      right: 15,
      top: 15,
      child: GestureDetector(
        onTap: () async {
          await Future.delayed(const Duration(milliseconds: 50), () {
            userNameFocusNode.unfocus();
            fNameFocusNode.unfocus();
            lNameFocusNode.unfocus();
            bioFocusNode.unfocus();
          });
          callBack();
        },
        child: Container(
          height: 30,
          width: 30,
          child: Icon(
            Icons.menu,
          ),
        ),
      ),
    );
  }
}
