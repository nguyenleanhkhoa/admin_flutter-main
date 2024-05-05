// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, depend_on_referenced_packages, non_constant_identifier_names, deprecated_member_use, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minia_web_project/view/Authentication/pages/confirm_mail.dart';
import 'package:minia_web_project/view/Authentication/pages/email_verify.dart';
import 'package:minia_web_project/view/Authentication/pages/lock_screen.dart';
import 'package:minia_web_project/view/Authentication/pages/log_out.dart';
import 'package:minia_web_project/view/Authentication/pages/login.dart';
import 'package:minia_web_project/view/Authentication/pages/reset_pass.dart';
import 'package:minia_web_project/view/Authentication/pages/sign_up.dart';
import 'package:minia_web_project/view/Authentication/pages/two_step_verify.dart';
import 'package:minia_web_project/view/Pages/coming_soon.dart';
import 'package:minia_web_project/view/Pages/errors/error404.dart';
import 'package:minia_web_project/view/Pages/errors/error500.dart';
import 'package:minia_web_project/view/Pages/maintenance.dart';
import '../../comman/colors.dart';
import '../../controller/dashboard_controller.dart';
import '../../controller/sidebar_controller.dart';

class SideBarPage extends StatefulWidget {
  const SideBarPage({super.key});

  @override
  State<SideBarPage> createState() => _SideBarPageState();
}

class _SideBarPageState extends State<SideBarPage> {
  RxBool isExpanded = true.obs;
  RxBool hide = true.obs;

  // RxInt iSIndex = 0.obs;
  SideBarController controller = Get.put(SideBarController());
  final DashboardController dashcontroller = Get.put(DashboardController());
  final GlobalKey<_SideBarPageState> button1Key = GlobalKey();
  final GlobalKey<_SideBarPageState> button2Key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // iSIndex.value = controller.index.value;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.mainbackground,
      appBar: width < 983 ? smallAppBar(width) : null,
      drawer: smallDrawer(),
      body: Row(
        children: [
          isExpanded.isFalse && width > 983
              ? sideBarIcon(controller)
              : width > 983
                  ? sideBar(controller)
                  : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                width > 983 ? Appbar(width) : Container(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20.0, top: 18, bottom: 20),
                          child: Container(
                            color: AppColor.mainbackground,
                            child: Obx(
                              () => controller.page[controller.index.value],
                            ),
                          ),
                        ),
                        Divider(color: AppColor.boxborder, height: 1),
                        bottomText()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Drawer smallDrawer() {
    return Drawer(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 900,
              width: 250,
              child: Container(
                // color: Color.fromARGB(255, 224, 209, 249),
                color: AppColor.backgorundDrawer,
                child: Obx(
                  () => ListView(
                    physics: ScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/minia_logo.svg",
                              fit: BoxFit.contain,
                              height: 25,
                              width: 25,
                            ),
                            Container(width: 10),
                            Text(
                              "Minia",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.menu)),
                          ],
                        ),
                      ),
                      Container(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(height: 10),
                      CommanListTile(
                        minWidth: 40,
                        text: "Dashboard",
                        icon: "assets/svg/dashboard/home_non.svg",
                        color: controller.index.value == 0
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 0;
                          Get.back();
                        },
                        selected: controller.index.value == 0,
                      ),
                      ExpansionListCustom(
                        title: "Apps",
                        icon: "assets/svg/dashboard/grid_box.svg",
                        color: controller.index.value == 1
                            ? AppColor.selecteColor
                            : null,
                        children: [
                          Menu(
                            text: 'Calender',
                            color: controller.index.value == 1
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 1;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: 'Chat',
                            color: controller.index.value == 2
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 2;
                              Get.back();
                            },
                          ),
                          ExpansionListCustom(
                            title: "Email",
                            icon: "",
                            color: controller.index.value == 3
                                ? AppColor.selecteColor
                                : null,
                            children: [
                              SubMenu(
                                subtext: "Inbox",
                                color: controller.index.value == 3
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 3;
                                  Get.back();
                                },
                              ),
                              SubMenu(
                                subtext: "Read Email",
                                color: controller.index.value == 4
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 4;
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                          ExpansionListCustom(
                            title: "Invoices",
                            color: controller.index.value == 5
                                ? AppColor.selecteColor
                                : null,
                            children: [
                              SubMenu(
                                subtext: "Invoice List",
                                color: controller.index.value == 5
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 5;
                                  Get.back();
                                },
                              ),
                              SubMenu(
                                subtext: "Invoice Detail",
                                color: controller.index.value == 6
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 6;
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                          ExpansionListCustom(
                            title: "Contacts",
                            color: controller.index.value == 7
                                ? AppColor.selecteColor
                                : null,
                            children: [
                              SubMenu(
                                subtext: "User Grid",
                                color: controller.index.value == 7
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 7;
                                  Get.back();
                                },
                              ),
                              SubMenu(
                                subtext: "User List",
                                color: controller.index.value == 8
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 8;
                                  Get.back();
                                },
                              ),
                              SubMenu(
                                subtext: "Profile",
                                color: controller.index.value == 9
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 9;
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                          ExpansionListCustom(
                            title: "Blog",

                            // icon: "assets/svg/dashboard/grid_box.svg",
                            color: controller.index.value == 10
                                ? AppColor.selecteColor
                                : null,
                            children: [
                              SubMenu(
                                subtext: "Blog Grid",
                                color: controller.index.value == 10
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 10;
                                  Get.back();
                                },
                              ),
                              SubMenu(
                                subtext: "Blog List",
                                color: controller.index.value == 11
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 11;
                                  Get.back();
                                },
                              ),
                              SubMenu(
                                subtext: "Blog Details",
                                color: controller.index.value == 12
                                    ? AppColor.selecteColor
                                    : null,
                                onTap: () {
                                  controller.index.value = 12;
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Authentication

                      ExpansionListCustom(
                        title: "Authentication",
                        icon: "assets/svg/dashboard/auth_icon.svg",
                        color: AppColor.selecteColor,
                        children: [
                          Menu(
                            text: "Login",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(Login());
                            },
                          ),
                          Menu(
                            text: "Register",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(Signup());
                            },
                          ),
                          Menu(
                            text: "Recover Password",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(ResetPassword());
                            },
                          ),
                          Menu(
                            text: "Lock Screen",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(LockScreen());
                            },
                          ),
                          Menu(
                            text: "Log Out",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(Logout());
                            },
                          ),
                          Menu(
                            text: "Confirm Mail",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(ConfirmMail());
                            },
                          ),
                          Menu(
                            text: "Email Verification",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(EmailVerify());
                            },
                          ),
                          Menu(
                            text: "Two Step Verification",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(TwoStepVerify());
                            },
                          ),
                        ],
                      ),

                      // Pages

                      ExpansionListCustom(
                        title: "Pages",
                        icon: "assets/svg/dashboard/file_icon.svg",
                        color: AppColor.selecteColor,
                        children: [
                          Menu(
                            text: "Starter Page",
                            color: controller.index.value == 13
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 13;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "Maintenance",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(Maintenance());
                            },
                          ),
                          Menu(
                            text: "Coming Soon",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(ComingSoon());
                            },
                          ),
                          Menu(
                            text: "Timeline",
                            color: controller.index.value == 14
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 14;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "FAQs",
                            color: controller.index.value == 15
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 15;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "Pricing",
                            color: controller.index.value == 16
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 16;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "Error 404",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(Error404());
                            },
                          ),
                          Menu(
                            text: "Error 500",
                            color: controller.index.value == 50
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              Get.to(Error500());
                            },
                          ),
                        ],
                      ),
                      Container(height: 25),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Elements",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(height: 10),

                      // Form

                      ExpansionListCustom(
                        title: "Forms",
                        icon: "assets/svg/dashboard/form_icon.svg",
                        color: controller.index.value == 3
                            ? AppColor.selecteColor
                            : null,
                        children: [
                          Menu(
                            text: "Basic Elements",
                            color: controller.index.value == 17
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 17;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "Validation",
                            color: controller.index.value == 18
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 18;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "Advanced Plugins",
                            color: controller.index.value == 19
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 19;
                              Get.back();
                            },
                          ),
                          // Menu(
                          //   text: "Editors",
                          //   color: controller.index.value == 20
                          //       ? AppColor.selecteColor
                          //       : null,
                          //   onTap: () {
                          //     controller.index.value = 20;
                          //     Get.back();
                          //   },
                          // ),
                          Menu(
                            text: "File Upload",
                            color: controller.index.value == 20
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 20;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "Wizard",
                            color: controller.index.value == 21
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 21;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "Mask",
                            color: controller.index.value == 22
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 22;
                              Get.back();
                            },
                          ),
                        ],
                      ),

                      // Tables
                      ExpansionListCustom(
                        title: "Tables",
                        icon: "assets/svg/dashboard/table_icon.svg",
                        color: controller.index.value == 3
                            ? AppColor.selecteColor
                            : null,
                        children: [
                          Menu(
                            text: "Bootstrap Basic",
                            color: controller.index.value == 23
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 23;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "DataTables",
                            color: controller.index.value == 24
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 24;
                              Get.back();
                            },
                          ),
                          Menu(
                            text: "Editable",
                            color: controller.index.value == 25
                                ? AppColor.selecteColor
                                : null,
                            onTap: () {
                              controller.index.value = 25;
                              Get.back();
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Container(
                          height: 276,
                          decoration: BoxDecoration(
                            color: AppColor.selecteColor.withOpacity(.10),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Container(height: 20),
                              Image.asset(
                                "assets/image/gift.png",
                                fit: BoxFit.cover,
                              ),
                              Container(height: 22),
                              Text(
                                "Unlimited Access",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.selecteColor,
                                    fontWeight: FontWeight.w600),
                              ),
                              Container(height: 7),
                              Text(
                                """Upgrade your plan from a 
            Free trial, to select 
            ‘Business Plan’.""",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: AppColor.dark,
                                    fontWeight: FontWeight.w400),
                              ),
                              Container(height: 23),
                              Container(
                                height: 38,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: AppColor.selecteColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                  child: Text(
                                    "Upgrade Now",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColor.mainbackground,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar smallAppBar(double width) {
    return AppBar(
        elevation: 1,
        backgroundColor: AppColor.mainbackground,
        toolbarHeight: 72,
        leadingWidth: width > 400
            ? 80
            : width > 280
                ? 0
                : 0,
        leading: Container(
          color: AppColor.selecteColor.withOpacity(.10),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              "assets/svg/minia_logo.svg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Container(
          width: double.infinity,
          child: Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  hoverColor: AppColor.mainbackground,
                  highlightColor: AppColor.mainbackground,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    color: AppColor.black,
                  ),
                ),
              ),
              Spacer(),
              width > 600 ? Localzations() : Container(),
              Container(width: 20),
              width > 984 ? GridButtonAppbar() : Container(),
              _offsetPopup(width), // for notifications
              Container(width: 10),
              _offsetProfile(width),
            ],
          ),
        ));
  }

  String dropDownValue2 = "one";
  String dropDownValue = "one";

  Row Appbar(double width) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: AppColor.boxborder))),
            height: 72,
            // width: 400,
            child: Row(
              children: [
                Container(width: 15),
                isExpanded.isFalse && width > 983
                    ? InkWell(
                        onTap: () {
                          expandOrShrinkDrawer();
                        },
                        child: Icon(Icons.menu),
                      )
                    : Container(),
                Container(width: 15),
                if (width > 650)
                  Container(
                    height: 40,
                    width: 223,
                    child: TextFormField(
                        decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      hintText: "search...",
                      hintStyle: TextStyle(fontSize: 14, color: AppColor.black),
                      fillColor: AppColor.textfiledcolor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(
                            right: 6,
                            top: 4,
                            bottom: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.searchbackground,
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child:
                              SvgPicture.asset("assets/svg/topbar_search.svg"),
                        ),
                      ),
                    )),
                  ),
                Spacer(),
                Localzations(), // for language change
                Container(width: 10),
                GridButtonAppbar(),
                _offsetPopup(width), // for notifications
                Container(width: 10),
                _offsetProfile(width),
                Container(width: width > 1200 ? 35 : 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget GridButtonAppbar() => PopupMenuButton<int>(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: 325,
          minWidth: 300,
          maxWidth: 330,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            padding: EdgeInsets.only(left: 30, top: 25, bottom: 20, right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gridbutton(
                  image: "assets/image/appbar/github.png",
                  text: "GitHub",
                ),
                Gridbutton(
                  image: "assets/image/appbar/bitbucket.png",
                  text: "BitBucket",
                ),
                Gridbutton(
                  image: "assets/image/appbar/dribbble.png",
                  text: "Dribbble",
                ),
              ],
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.only(left: 25, top: 16, bottom: 25, right: 30),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gridbutton(
                  image: "assets/image/appbar/dropbox.png",
                  text: "DropBox",
                ),
                Gridbutton(
                  image: "assets/image/appbar/mail_chimp.png",
                  text: "Mail Chimp",
                ),
                Gridbutton(
                  image: "assets/image/appbar/slack.png",
                  text: "   Slack   ",
                ),
              ],
            ),
          ),
        ],
        icon: Icon(Icons.grid_view_outlined, color: AppColor.black),
        offset: Offset(0, 56),
      );

  Widget _offsetProfile(width) => PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: 128,
          minWidth: 160,
          maxWidth: 165,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: () {
              controller.index.value = 9;
            },
            height: 35,
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Icon(Icons.face, size: 15),
                Container(width: 5),
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 13.5,
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          PopupMenuItem(
            value: 'lock',
            height: 35,
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Icon(Icons.lock, size: 15),
                Container(width: 5),
                Text(
                  "Lock Screen",
                  style: TextStyle(
                    fontSize: 13.5,
                    color: AppColor.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          PopupMenuItem(
            value: 'logout',
            height: 38,
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 4.0),
                  child: Divider(color: AppColor.borders, thickness: 1.0),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 23.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 15),
                      Container(width: 5),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 13.5,
                          color: AppColor.black,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
        onSelected: (value) {
          switch (value) {
            case 'lock':
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LockScreen()));
              break;
            case 'logout':
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Logout()));
              break;
          }
        },
        offset: Offset(0, 72),
        child: width > 1200
            ? Container(
                width: 148,
                height: 72,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.boxborder),
                    color: AppColor.selecteColor.withOpacity(.06)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/image/profile.png",
                        fit: BoxFit.cover,
                        height: 35,
                        width: 35,
                      ),
                      Container(width: 6),
                      Expanded(
                        child: Text(
                          "Shawn Lapid",
                          style: TextStyle(
                              fontSize: 13.5,
                              color: AppColor.black,
                              fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(width: 10),
                      Icon(Icons.keyboard_arrow_down_rounded, size: 15)
                    ],
                  ),
                ),
              )
            : Container(
                width: 70,
                height: 72,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.boxborder),
                    color: AppColor.selecteColor.withOpacity(.06)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        "assets/image/profile.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
      );

  Widget _offsetPopup(width) => PopupMenuButton<int>(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minHeight: 50,
          maxHeight: 330,
          minWidth: 250,
          maxWidth: 310,

          // minHeight: 50,
          // maxHeight: 330,
          // minWidth: 250,
          // maxWidth: 310,
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF313533)),
                    ),
                    Spacer(),
                    Text(
                      "Unread",
                      style: TextStyle(
                          fontSize: 11.2,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF2C302E)),
                    )
                  ],
                ),
                Container(height: 30),
                Notifcations(
                  networkImage: "assets/image/avatar2.png",
                  name: "James Lemire",
                  message: "It will seem like simplified English,",
                  time: "1 hour ago",
                ),
              ],
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.only(
                left: 16.0,
                right: width > 325 ? 16.0 : 0,
                top: 10.0,
                bottom: 16),
            child: Column(
              children: [
                NotifcationsIcon(
                  icon: Icons.shopping_cart_outlined,
                  name: "Your order is placed",
                  message: "If serveral language coalesce the grammar",
                  time: "3 min ago",
                  backgroundColor: AppColor.selecteColor,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.only(
                left: 16.0,
                right: width > 325 ? 16.0 : 0,
                top: 10.0,
                bottom: 16),
            child: Column(
              children: [
                NotifcationsIcon(
                  icon: Icons.check_circle_outline_outlined,
                  name: "Your item is shipped",
                  message: "If serveral language coalesce the grammar",
                  time: "3 min ago",
                  backgroundColor: AppColor.darkGreen,
                ),
              ],
            ),
          ),
          PopupMenuItem(
            padding: EdgeInsets.only(
                left: 16.0,
                right: width > 325 ? 16.0 : 0,
                top: 10.0,
                bottom: 16),
            child: Notifcations(
              networkImage: "assets/image/avatar4.png",
              name: "Salena Layfield",
              message: "As a skeptical Cambridge friend of mine occidental",
              time: "1 hour ago",
            ),
          ),
        ],
        icon: NamedIcon(text: "5", iconData: Icons.notifications_none_rounded),
        offset: Offset(0, 56),
      );

  Container Localzations() {
    return Container(
      width: 85,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Container(),
          // underline: Container(),
          value: dropDownValue2,

          items: [
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('en', 'US'));
              },
              value: "one",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/us.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 10),
                  Text(
                    "English",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('es', 'ES'));
              },
              value: "two",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/spain.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 10),
                  Text(
                    "Spanish",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('de', 'CH'));
              },
              value: "three",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/germany.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 10),
                  Text(
                    "German",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('it', 'CH'));
              },
              value: "four",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/italy.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 18),
                  Text(
                    "Italian",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
            DropdownMenuItem<String>(
              onTap: () {
                Get.updateLocale(Locale('ru', 'RU'));
              },
              value: "five",
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/flags/russia.jpg",
                    fit: BoxFit.cover,
                    height: 18,
                    width: 25,
                  ),
                  Container(width: 10),
                  Text(
                    "Russian",
                    style: TextStyle(fontSize: 13, color: AppColor.black),
                  ),
                ],
              ),
            ),
          ],
          onChanged: (val) {
            setState(() {
              dropDownValue2 = val!;
            });
          },
        ),
      ),
    );
  }

  Container sideBar(SideBarController controller) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      // width: 250,
      width: 250,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.backgorundDrawer,
            border: Border(
              right: BorderSide(color: AppColor.boxborder),
            )),
        // color: Color.fromARGB(255, 224, 209, 249),
        child: Obx(
          () => ListView(
            physics: ScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/minia_logo.svg",
                      fit: BoxFit.contain,
                      height: 25,
                      width: 25,
                    ),
                    Container(width: 10),
                    Text(
                      "Minia",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          expandOrShrinkDrawer();
                        },
                        child: Icon(Icons.menu)),
                  ],
                ),
              ),
              Container(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Container(height: 10),
              CommanListTile(
                minWidth: 40,
                text: "Dashboard",
                icon: "assets/svg/dashboard/home_non.svg",
                color:
                    controller.index.value == 0 ? AppColor.selecteColor : null,
                onTap: () => controller.index.value = 0,
                selected: controller.index.value == 0,
              ),
              ExpansionListCustom(
                title: "Apps",
                icon: "assets/svg/dashboard/grid_box.svg",
                color:
                    controller.index.value == 1 ? AppColor.selecteColor : null,
                children: [
                  Menu(
                    text: 'Calender',
                    color: controller.index.value == 1
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 1;
                      width < 983 ? expandOrShrinkDrawer() : null;
                    },
                  ),
                  Menu(
                    text: 'Chat',
                    color: controller.index.value == 2
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 2;
                      width < 983 ? expandOrShrinkDrawer() : null;
                    },
                  ),
                  ExpansionListCustom(
                    title: "Email",
                    color: controller.index.value == 3
                        ? AppColor.selecteColor
                        : null,
                    children: [
                      SubMenu(
                        subtext: "Inbox",
                        color: controller.index.value == 3
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 3;
                        },
                      ),
                      SubMenu(
                        subtext: "Read Email",
                        color: controller.index.value == 4
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 4;
                        },
                      ),
                    ],
                  ),
                  ExpansionListCustom(
                    title: "Invoices",
                    color: controller.index.value == 5
                        ? AppColor.selecteColor
                        : null,
                    children: [
                      SubMenu(
                        subtext: "Invoice List",
                        color: controller.index.value == 5
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 5;
                        },
                      ),
                      SubMenu(
                        subtext: "Invoice Detail",
                        color: controller.index.value == 6
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 6;
                        },
                      ),
                    ],
                  ),
                  ExpansionListCustom(
                    title: "Contacts",
                    color: controller.index.value == 7
                        ? AppColor.selecteColor
                        : null,
                    children: [
                      SubMenu(
                        subtext: "User Grid",
                        color: controller.index.value == 7
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 7;
                        },
                      ),
                      SubMenu(
                        subtext: "User List",
                        color: controller.index.value == 8
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 8;
                        },
                      ),
                      SubMenu(
                        subtext: "Profile",
                        color: controller.index.value == 9
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 9;
                        },
                      ),
                    ],
                  ),
                  ExpansionListCustom(
                    title: "Blog",

                    // icon: "assets/svg/dashboard/grid_box.svg",
                    color: controller.index.value == 10
                        ? AppColor.selecteColor
                        : null,
                    children: [
                      SubMenu(
                        subtext: "Blog Grid",
                        color: controller.index.value == 10
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 10;
                        },
                      ),
                      SubMenu(
                        subtext: "Blog List",
                        color: controller.index.value == 11
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 11;
                        },
                      ),
                      SubMenu(
                        subtext: "Blog Details",
                        color: controller.index.value == 12
                            ? AppColor.selecteColor
                            : null,
                        onTap: () {
                          controller.index.value = 12;
                        },
                      ),
                    ],
                  ),
                ],
              ),

              // Authentication

              ExpansionListCustom(
                title: "Authentication",
                icon: "assets/svg/dashboard/auth_icon.svg",
                color: AppColor.selecteColor,
                children: [
                  Menu(
                    text: "Login",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(Login());
                    },
                  ),
                  Menu(
                    text: "Register",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(Signup());
                    },
                  ),
                  Menu(
                    text: "Recover Password",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(ResetPassword());
                    },
                  ),
                  Menu(
                    text: "Lock Screen",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(LockScreen());
                    },
                  ),
                  Menu(
                    text: "Log Out",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(Logout());
                    },
                  ),
                  Menu(
                    text: "Confirm Mail",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(ConfirmMail());
                    },
                  ),
                  Menu(
                    text: "Email Verification",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(EmailVerify());
                    },
                  ),
                  Menu(
                    text: "Two Step Verification",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(TwoStepVerify());
                    },
                  ),
                ],
              ),

              // Pages

              ExpansionListCustom(
                title: "Pages",
                icon: "assets/svg/dashboard/file_icon.svg",
                color: AppColor.selecteColor,
                children: [
                  Menu(
                    text: "Starter Page",
                    color: controller.index.value == 13
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 13;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "Maintenance",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(Maintenance());
                    },
                  ),
                  Menu(
                    text: "Coming Soon",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(ComingSoon());
                    },
                  ),
                  Menu(
                    text: "Timeline",
                    color: controller.index.value == 14
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 14;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "FAQs",
                    color: controller.index.value == 15
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 15;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "Pricing",
                    color: controller.index.value == 16
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 16;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "Error 404",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(Error404());
                    },
                  ),
                  Menu(
                    text: "Error 500",
                    color: controller.index.value == 50
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      Get.to(Error500());
                    },
                  ),
                ],
              ),
              Container(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Elements",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
              Container(height: 10),

              // Form

              ExpansionListCustom(
                title: "Forms",
                icon: "assets/svg/dashboard/form_icon.svg",
                color:
                    controller.index.value == 3 ? AppColor.selecteColor : null,
                children: [
                  Menu(
                    text: "Basic Elements",
                    color: controller.index.value == 17
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 17;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "Validation",
                    color: controller.index.value == 18
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 18;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "Advanced Plugins",
                    color: controller.index.value == 19
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 19;
                      Get.back();
                    },
                  ),
                  // Menu(
                  //   text: "Editors",
                  //   color: controller.index.value == 20
                  //       ? AppColor.selecteColor
                  //       : null,
                  //   onTap: () {
                  //     controller.index.value = 20;
                  //     Get.back();
                  //   },
                  // ),
                  Menu(
                    text: "File Upload",
                    color: controller.index.value == 20
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 20;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "Wizard",
                    color: controller.index.value == 21
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 21;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "Mask",
                    color: controller.index.value == 22
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 22;
                      Get.back();
                    },
                  ),
                ],
              ),

              // Tables
              ExpansionListCustom(
                title: "Tables",
                icon: "assets/svg/dashboard/table_icon.svg",
                color:
                    controller.index.value == 3 ? AppColor.selecteColor : null,
                children: [
                  Menu(
                    text: "Bootstrap Basic",
                    color: controller.index.value == 23
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 23;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "DataTables",
                    color: controller.index.value == 24
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 24;
                      Get.back();
                    },
                  ),
                  Menu(
                    text: "Editable",
                    color: controller.index.value == 25
                        ? AppColor.selecteColor
                        : null,
                    onTap: () {
                      controller.index.value = 25;
                      Get.back();
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  height: 276,
                  decoration: BoxDecoration(
                    color: AppColor.selecteColor.withOpacity(.10),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Container(height: 20),
                      Image.asset("assets/image/gift.png", fit: BoxFit.cover),
                      Container(height: 22),
                      Text(
                        "Unlimited Access",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColor.selecteColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(height: 7),
                      Text(
                        """Upgrade your plan from a
Free trial, to select
‘Business Plan’.""",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColor.dark,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(height: 23),
                      Container(
                        height: 38,
                        width: 110,
                        decoration: BoxDecoration(
                          color: AppColor.selecteColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            "Upgrade Now",
                            style: TextStyle(
                                fontSize: 14,
                                color: AppColor.mainbackground,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container sideBarIcon(SideBarController controller) {
    return Container(
      // width: 250,
      width: 70,
      child: Container(
        // color: Color(0xFFFBFAFF),
        decoration: BoxDecoration(
            color: AppColor.backgorundDrawer,
            border: Border(right: BorderSide(color: AppColor.boxborder))),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListView(
              children: [
                Container(height: 20),
                SvgPicture.asset(
                  "assets/svg/minia_logo.svg",
                  fit: BoxFit.contain,
                  height: 25,
                  width: 25,
                ),
                Container(height: 30),
                ListTile(
                  // title: Text("home"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/home_non.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Apps"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/grid_box.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Auth"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/auth_icon.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Pages"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/file_icon.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Forms"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .60,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/form_icon.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
                Container(height: 5),
                ListTile(
                  // title: Text("Tables"),
                  leading: Container(
                    decoration: BoxDecoration(
                        // color: AppColor.darkGreen,
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.darkblack.withOpacity(.10),
                            blurRadius: 3,
                            spreadRadius: .1,
                            offset: Offset.zero,
                          )
                        ]),
                    child: SvgPicture.asset(
                      "assets/svg/dashboard/table_icon.svg",
                      fit: BoxFit.contain,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      expandOrShrinkDrawer();
                    });
                    controller.index.value = 0;
                  },
                  selected: controller.index.value == 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded.value = !isExpanded.value;
    });
  }
}

class NamedIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback? onTap;
  final int notificationCount;

  const NamedIcon({
    Key? key,
    this.onTap,
    required this.text,
    required this.iconData,
    this.notificationCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 15,
              width: 18,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColor.notired,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  '$notificationCount',
                  style: TextStyle(
                    color: AppColor.mainbackground,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData, color: AppColor.black),
            ],
          ),
        ],
      ),
    );
  }
}

class Gridbutton extends StatelessWidget {
  final String image;
  final String text;

  const Gridbutton({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          fit: BoxFit.contain,
          width: 28,
          height: 24,
        ),
        Container(height: 8),
        Text(
          text,
          style: TextStyle(
              fontSize: 13,
              color: AppColor.lightgrey,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class NotifcationsIcon extends StatelessWidget {
  final dynamic icon;
  final String name;
  final String message;
  final String time;

  final Color backgroundColor;

  const NotifcationsIcon({
    super.key,
    required this.icon,
    required this.name,
    required this.message,
    required this.time,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          maxRadius: 15,
          backgroundColor: backgroundColor,
          child: Icon(icon, size: 15, color: AppColor.mainbackground),
        ),
        Container(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF313533)),
            ),
            Container(height: 5),
            Container(
              width: width < 325 ? 190 : 230,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      message,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2C302E)),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.watch_later_outlined, size: 15),
                Container(width: 4),
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF2C302E)),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Notifcations extends StatelessWidget {
  final dynamic networkImage;
  final String name;
  final String message;
  final String time;
  const Notifcations({
    super.key,
    required this.networkImage,
    required this.name,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          height: 30,
          width: 30,
          child: Image.asset(networkImage, fit: BoxFit.cover),
        ), // CircleAvatar(
        //   maxRadius: 15,
        //   backgroundImage: NetworkImage(networkImage),
        // ),
        Container(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF313533)),
            ),
            Container(height: 5),
            Container(
              width: width < 325 ? 190 : 230,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      message,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C302E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.watch_later_outlined, size: 15),
                Container(width: 4),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C302E),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class Menu extends StatelessWidget {
  final String text;
  final dynamic color;
  final VoidCallback onTap;
  const Menu({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        // color: Colors.green,
        child: Row(
          children: [
            Container(width: 53),
            Expanded(
              child: Text(
                text.tr,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubMenu extends StatelessWidget {
  final String subtext;
  final dynamic color;
  final VoidCallback onTap;
  const SubMenu({
    super.key,
    required this.subtext,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 35,
        // color: Colors.green,
        child: Row(
          children: [
            Container(width: 72),
            Expanded(
              child: Text(
                subtext.tr,
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                    color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class bottomText extends StatelessWidget {
  const bottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
        color: AppColor.mainbackground,
        height: 60,
        child: Row(
          children: [
            Container(width: 18),
            Expanded(
              flex: 6,
              child: Text(
                "2023 © Minia.",
                style: TextStyle(
                    overflow: TextOverflow.clip,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.lightdark),
              ),
            ),
            Spacer(),
            width > 570
                ? Expanded(
                    flex: 0,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Design & Develop by ",
                        style: TextStyle(
                            overflow: TextOverflow.clip,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColor.lightdark),
                      ),
                    ),
                  )
                : Container(),
            width > 570
                ? Expanded(
                    flex: 0,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Themesbrand',
                              style: TextStyle(
                                  overflow: TextOverflow.clip,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.selecteColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(),
            Container(width: 19),
          ],
        ));
  }
}

class CommanListTile extends StatelessWidget {
  final String text;
  final String? icon;
  final VoidCallback onTap;
  final dynamic selected;
  final dynamic color;
  final double minWidth;

  const CommanListTile({
    super.key,
    required this.text,
    this.icon,
    required this.onTap,
    this.selected,
    required this.color,
    required this.minWidth,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      selectedColor: AppColor.selecteColor,
      title: Text(
        text.tr,
        style: TextStyle(
            overflow: TextOverflow.clip,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5),
      ),
      contentPadding: EdgeInsets.zero,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SvgPicture.asset(
          icon!,
          fit: BoxFit.cover,
          height: 17,
          width: 22,
          color: color,
        ),
      ),
      onTap: onTap,
      selected: selected,
    );
  }
}

class ExpansionListTile extends StatelessWidget {
  final String text;
  final double? minWidth;
  final VoidCallback onTap;
  final dynamic selected;
  final dynamic color;

  ExpansionListTile(
      {super.key,
      required this.text,
      required this.onTap,
      this.selected,
      this.color,
      this.minWidth});

  final SideBarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: minWidth,
      selectedColor: AppColor.selecteColor,
      title: Row(
        children: [
          Container(width: 36),
          Expanded(
            child: Text(
              text.tr,
              style: TextStyle(
                  overflow: TextOverflow.clip,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5),
            ),
          )
        ],
      ),
      onTap: onTap,
      selected: selected,
    );
  }
}

class ExpansionListCustom extends StatefulWidget {
  final String title;
  final String? icon;
  final dynamic selected;
  final dynamic color;
  final dynamic children;
  const ExpansionListCustom({
    super.key,
    required this.title,
    this.selected,
    this.color,
    this.children,
    this.icon,
  });

  @override
  State<ExpansionListCustom> createState() => _ExpansionListCustomState();
}

class _ExpansionListCustomState extends State<ExpansionListCustom> {
  SideBarController controller = Get.find();

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      dense: true,
      //  data:
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (bool isExpanded) {
            setState(() {
              _isExpanded = isExpanded;
            });
          },
          trailing: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SvgPicture.asset(
                    "assets/svg/dashboard/down_arrow.svg",
                    height: 8,
                    width: 8,
                    fit: BoxFit.cover,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColor.notselecteColor,
                    size: 12,
                  ),
                ),
          // collapsedIconColor: AppColor.black,
          textColor: AppColor.searchbackground,
          iconColor: AppColor.searchbackground,
          tilePadding: EdgeInsets.zero,
          title: Text(
            widget.title.tr,
            style: TextStyle(
              overflow: TextOverflow.clip,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
          children: widget.children,
          leading: widget.icon != null && widget.icon!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 0.0),
                  child: SvgPicture.asset(
                    widget.icon!,
                    fit: BoxFit.cover,
                    height: 17,
                    width: 22,
                    color: _isExpanded ? AppColor.searchbackground : null,
                  ),
                )
              : Container(width: 0.0),
        ),
      ),
    );
  }
}
