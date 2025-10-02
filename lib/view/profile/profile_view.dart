
import 'dart:convert';
import 'package:fitness/common/Shared%20pref%20helper/user_cache_helper.dart';
import 'package:fitness/common/common%20blocs/languge%20blocs/languge_bloc.dart';
import 'package:fitness/common/common%20blocs/theme%20bloc/theme_bloc.dart';
import 'package:fitness/common/errors/show_error_dialoge_messeage.dart';
import 'package:fitness/common/utls/app_theme.dart';
import 'package:fitness/common/utls/name_class.dart';
import 'package:fitness/common_widget/Custom_app_button.dart';
import 'package:fitness/common_widget/custtom_next_button.dart';
import 'package:fitness/view/profile/wedgits/image_foe_profile_wedgit.dart';
import 'package:fitness/view/profile/wedgits/sttings_wedgit.dart';
import 'package:fitness/view/profile/wedgits/user_information_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../common/colo_extension.dart';
import '../../common/localization/applocalizations.dart';
import '../../common/styles.dart';
import '../../common_widget/Loading_page.dart';
import '../../common_widget/bottom_snackbar_message.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/setting_row.dart';
import '../../features/auth/presintation/views blocs/Auth bloc/auth_bloc.dart';
import '../../features/auth/presintation/views/widgets/complete imformation/dayCusttomWedgit.dart';
import '../../features/food/presintation/veiwes/wedgits/app_bar_for_app_bar_property.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  bool positive = false;
  bool positiveL = false;



  List accountArr = [
    {"image": "assets/img/p_personal.png", "name": "Personal Data", "tag": "1"},
    {"image": "assets/img/p_achi.png", "name": "Achievement", "tag": "2"},
    {
      "image": "assets/img/p_activity.png",
      "name": "Activity History",
      "tag": "3"
    },
    {
      "image": "assets/img/p_workout.png",
      "name": "Workout Progress",
      "tag": "4"
    }
  ];
  List otherArr = [
    {"image": "assets/img/p_contact.png", "name": "Contact Us", "tag": "5"},
    {"image": "assets/img/p_privacy.png", "name": "Privacy Policy", "tag": "6"},
    {"image": "assets/img/p_setting.png", "name": "Setting", "tag": "7"},
  ];
  @override
  void initState() {
    super.initState();

    // Check the current language from LangugeBloc
    final currentLocale = context.read<LangugeBloc>().state.locale;
    final currentThem = context.read<ThemeBloc>().state.theme;
    if (currentLocale == const Locale("en")) {
      positiveL = true;
    }
    if (currentThem == appThemeData[AppTheme.dark]!) {
      positive = true;
    }
  }
  @override
  Widget build(BuildContext context) {
    List<String> dayes = [
      "sunday",
      "tuesday",
      "monday",
      "wednesday",
      "thrusday",
      "friday",
      "saturday"
    ];
    List<String> dayesName = [
      AppLocalazations.of(context)!.translate("Profile")["sunday"],
      AppLocalazations.of(context)!.translate("Profile")["tuesday"],
      AppLocalazations.of(context)!.translate("Profile")["monday"],
      AppLocalazations.of(context)!.translate("Profile")["wednesday"],
      AppLocalazations.of(context)!.translate("Profile")["thrusday"],
      AppLocalazations.of(context)!.translate("Profile")["friday"],
      AppLocalazations.of(context)!.translate("Profile")["saturday"]
    ];
    List<bool> dayCheckd;

if(user().user!.days != null){
  String jsonString =user().user!.days??'';
  Map<String, dynamic> dayMap = jsonDecode(jsonString);
   dayCheckd = dayes.map((day) => dayMap[day] == true).toList();
}else{
   dayCheckd = dayes.map((day) =>  false).toList();
}

    return Scaffold(
      appBar: CusttomAppBarForAppBarProberty(context: context,
          title: AppLocalazations.of(context)!.translate("Profile")["Profilea"] ),
      body:
      Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is LogOutSuccess)
    {
      GoRouter.of(context).goNamed(Names.SelectView);
    }
    else if(state is LogOutFailed )
    {
      return  bottomSnackbarMassage(  context: context, message:state.error,);
    }
  },
  builder: (context, state) {
    if(state is LogOutLoading)
    {
      return const LoadingPage();
    }
    if(state is LogOutSuccess)
    {
      return const SizedBox();
    }
    return Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/img/u2.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user().user!.name!,
                          style: TextStyle(
                            color: TColor.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          user().user!.email!,
                          style: TextStyle(
                            color: TColor.gray,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 70,
                    height: 25,
                    child: RoundButton(
                      title:AppLocalazations.of(context)!.translate("Profile")["Edit"] ,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      onPressed: () async {
                        await  GoRouter.of(context).pushNamed(Names.CompletInformationPage,extra:[true,user()]);
                        setState(() {

                        });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const ActivityTrackerView(),
                        //   ),
                        // );
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              UserInformationWedgit(),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 200,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,childAspectRatio: 2),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {

                        },
                        child: DayCusttomWedgit(
                          text: dayesName[index], check: dayCheckd[index] ,
                        ));
                  },
                  itemCount: 7,
                ),
              ),
              // Container(
              //   padding:
              //   const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              //   decoration: BoxDecoration(
              //       color: TColor.white,
              //       borderRadius: BorderRadius.circular(15),
              //       boxShadow: const [
              //         BoxShadow(color: Colors.black12, blurRadius: 2)
              //       ]),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Account",
              //         style: TextStyle(
              //           color: TColor.black,
              //           fontSize: 16,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //       const SizedBox(
              //         height: 8,
              //       ),
              //       ListView.builder(
              //         physics: const NeverScrollableScrollPhysics(),
              //         shrinkWrap: true,
              //         itemCount: accountArr.length,
              //         itemBuilder: (context, index) {
              //           var iObj = accountArr[index] as Map? ?? {};
              //           return SettingRow(
              //             icon: iObj["image"].toString(),
              //             title: iObj["name"].toString(),
              //             onPressed: () {},
              //           );
              //         },
              //       )
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 25,
              ),
              SttingsWedgit(positive: positiveL, title: AppLocalazations.of(context)!.translate("Profile")["Language"], subTitle: AppLocalazations.of(context)!.translate("Profile")["English"], imageName: Icons.language_outlined,onChanged: (b) {
                positiveL?
                BlocProvider.of<LangugeBloc>(context).add(setLangugeEvent('ar')):
                BlocProvider.of<LangugeBloc>(context).add(setLangugeEvent('en'));
                setState(() => positiveL  = b);
              },),
              const SizedBox(
                height: 20,
              ),
              // SttingsWedgit(positive: positive, title: AppLocalazations.of(context)!.translate("Profile")["Theme"], subTitle:AppLocalazations.of(context)!.translate("Profile")["Light or dark"] , imageName: Icons.lightbulb_outlined,onChanged:
              //     (b) {
              //   positive?
              //   BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(AppTheme.light)):
              //   BlocProvider.of<ThemeBloc>(context).add(ThemeChanged(AppTheme.dark));
              //   setState(() => positive = b);
              // },), const SizedBox(
              //   height: 20,
              // ),
              Container(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                    color: TColor.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 2)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalazations.of(context)!
                          .translate("Profile")["log out"],
                      style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 40,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.person, size: 20,color: TColor.primaryColor1,),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                AppLocalazations.of(context)!
                                    .translate("Profile")["log out"],
                                style: Styles.kFontSize12.copyWith(color: TColor.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundButton(
                                  height: 20,
                                  minWidth: 100,
                                  title: AppLocalazations.of(context)!
                                      .translate("Profile")["log out"],
                                  fontSize: 10,
                                  elevation: 0.05,
                                  fontWeight: FontWeight.w400,
                                  onPressed: () {
                                    showLogOutDialogMesseage(context1: context,
                  state:AppLocalazations.of(context)!
                      .translate("Profile")["do you want to log out?"] , ontaptry: () {
                  BlocProvider.of<AuthBloc>(context).add(LogOut());
                  GoRouter.of(context).pop();
                  }, ontapcancel: () {
                  GoRouter.of(context).pop();
                  },);
                                  })
                            )
                          ]),
                    ),

                  ],
                ),
              ),
//
              const SizedBox(
                height: 25,
              ),
            ],
          );
  },
),
        ),
      )
    );
  }
}

//Container(
//         child: IconButton(onPressed: () {
//           GoRouter.of(context).pushNamed(Names.CompletInformationPage,extra: false);
//         }, icon: Icon(Icons.add)),
//       )