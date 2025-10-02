import 'dart:convert';

import 'package:fitness/features/auth/presintation/views/widgets/complete%20imformation/user_information_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../../common/localization/applocalizations.dart';
import '../../../../../../common_widget/Custom_app_button.dart';
import '../../../../data/models/register_model.dart';
import '../../../views blocs/Auth bloc/auth_bloc.dart';
import '../title.dart';
class CompleateProfileSuccessWedgit extends StatefulWidget {
  CompleateProfileSuccessWedgit({
    super.key,
    required this.media,
    required this.completeKey,
    required this.textControllers, required this.isUpdating, this.registerModel
  });

  final Size media;
  final GlobalKey<FormState> completeKey;
  final List<TextEditingController> textControllers;
  final bool isUpdating;
 final RegisterModel? registerModel;

  @override
  State<CompleateProfileSuccessWedgit> createState() => _CompleateProfileSuccessWedgitState();
}

class _CompleateProfileSuccessWedgitState extends State<CompleateProfileSuccessWedgit> {
  List<bool> dayCheckd=[];
  List<String> dayes = [
    "sunday",
    "tuesday",
    "monday",
    "wednesday",
    "thrusday",
    "friday",
    "saturday"
  ];
  @override
  void initState() {
    if(user().user!.days != null){
      String jsonString =user().user!.days??'';
      Map<String, dynamic> dayMap = jsonDecode(jsonString);
      dayCheckd = dayes.map((day) => dayMap[day] == true).toList();
    }else{
      dayCheckd = dayes.map((day) =>  false).toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Image.asset(
            "assets/img/complete_profile.png",
            width: widget.media.width,
            fit: BoxFit.fitWidth,
          ),
          SizedBox(
            height: widget.media.width * 0.05,
          ),
           CustomTitle(title:widget.isUpdating?AppLocalazations.of(context)!
               .translate("OnCompletePage")["Let’s Change your profile"] : AppLocalazations.of(context)!
              .translate("OnCompletePage")["Let’s complete your profile"] ,
            subTitle:AppLocalazations.of(context)!
                .translate("OnCompletePage")["It will help us to know more about you!"]
             ,),
          SizedBox(
            height: widget.media.width * 0.05,
          ),
          UserInformationForm(media: widget.media,
            completeKey: widget.completeKey, textControllers: widget.textControllers,
            onTap: (dayChecked) {
            dayCheckd.clear();
            dayCheckd.addAll(dayChecked) ;
            setState(() {});
          }, isUpdating: widget.isUpdating?true: false,),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if((state is SearchingLocationSuccess && getHolidayDayesNuM(dayCheckd)>=4)||(widget.isUpdating==true && getHolidayDayesNuM(dayCheckd)>=4))
              {
                return CusttomAppButton(
                    title: AppLocalazations.of(context)!
                        .translate("OnCompletePage")["Submit"],
                    onPressed: () {
                      if (widget.completeKey.currentState!.validate()) {
                       if(widget.isUpdating==true){
                         BlocProvider.of<AuthBloc>(context).add(UpadteUserInformation(
                             int.parse(widget.textControllers[2].text ) ,
                             int.parse(widget.textControllers[3].text) ,
                             widget.textControllers[5].text ,
                             widget.textControllers[0].text ,
                             state is! SearchingLocationSuccess?widget.registerModel?.user!.lat!.toString()??"": state.locationModel[0].lat.toString(),
                             state is! SearchingLocationSuccess?widget.registerModel?.user!.lon!.toString()??"":  state.locationModel[0].lon.toString(),
                             widget.textControllers[4].text ,
                             int.parse(widget.textControllers[1].text ),
                             //  widget.isUpdating != true &&dayCheckd.isNotEmpty?
                             '{"sunday":${dayCheckd[0]},"tuesday":${dayCheckd[1]},"monday":${dayCheckd[2]},"wednesday":${dayCheckd[3]},"thrusday":${dayCheckd[4]},"friday":${dayCheckd[5]},"saturday":${dayCheckd[6]}}'
                           //  :widget.registerModel!.user!.days!
                         ));
                       }
                        else {
                         BlocProvider.of<AuthBloc>(context).add(AddUserInformation(
                             int.parse(widget.textControllers[2].text ) ,
                             int.parse(widget.textControllers[3].text) ,
                             widget.textControllers[5].text ,
                             widget.textControllers[0].text ,
                             state is! SearchingLocationSuccess?widget.registerModel?.user!.lat!.toString()??"": state.locationModel[0].lat.toString(),
                             state is! SearchingLocationSuccess?widget.registerModel?.user!.lon!.toString()??"":  state.locationModel[0].lon.toString(),
                             widget.textControllers[4].text ,
                             int.parse(widget.textControllers[1].text ),
                             //  widget.isUpdating != true &&dayCheckd.isNotEmpty?
                             '{"sunday":${dayCheckd[0]},"tuesday":${dayCheckd[1]},"monday":${dayCheckd[2]},"wednesday":${dayCheckd[3]},"thrusday":${dayCheckd[4]},"friday":${dayCheckd[5]},"saturday":${dayCheckd[6]}}'
                           //  :widget.registerModel!.user!.days!
                         ));
                       }

                      }

                      // }
                      // if (widget.completeKey.currentState!.validate()) {
                      //   BlocProvider.of<AuthBloc>(context).add(AddUserInformation(int.parse(
                      //      '9' ) ,
                      //       int.parse('9') , 'll' ,
                      //       'kokokoko',state is! SearchingLocationSuccess?widget.lat!: state.locationModel[0].lat.toString(),
                      //       state is! SearchingLocationSuccess?widget.lon!:  state.locationModel[0].lon.toString(), 'pp' ,
                      //       int.parse('9' ),
                      //       '{"sunday":${dayCheckd[0]},"tuesday":${dayCheckd[1]},"monday":${dayCheckd[2]},"wednesday":${dayCheckd[3]},"thrusday":${dayCheckd[4]},"friday":${dayCheckd[5]},"saturday":${dayCheckd[6]}}'));
                      //
                      // }
                    });
              }
              return  CusttomUnabelAppButton(
                  title: AppLocalazations.of(context)!
                      .translate("OnCompletePage")["Submit"],
                  onPressed: () {
                    print(dayCheckd);
                  });

            },
          ),
        ],
      ),
    );
  }
}

int getHolidayDayesNuM (List list){
int num = list.where((element) => element == true ).length;
return num;
}



// if(widget.isUpdating) {
//                         BlocProvider.of<AuthBloc>(context).add(UpadteUserInformation(
//                             22 ,
//                             22 ,
//                            " widget.textControllers[5].text" ,
//                             "widget.textControllers[0].text" ,
//                             "88","99",
//                             "widget.textControllers[4].text ",
//                            99,
//                             //  widget.isUpdating != true &&dayCheckd.isNotEmpty?
//                             '{"sunday":${false},"tuesday":${false},"monday":${false},"wednesday":${false},"thrusday":${true},"friday":${true},"saturday":${dayCheckd[6]}}'
//                           //  :widget.registerModel!.user!.days!
//                         )
//
//                         );
//                         // BlocProvider.of<AuthBloc>(context).add(UpadteUserInformation(
//                         //     int.parse(widget.textControllers[2].text ) ,
//                         //     int.parse(widget.textControllers[3].text) ,
//                         //     widget.textControllers[5].text ,
//                         //     widget.textControllers[0].text ,
//                         //     state is! SearchingLocationSuccess?widget.registerModel?.user!.lat!.toString()??"": state.locationModel[0].lat.toString(),
//                         //     state is! SearchingLocationSuccess?widget.registerModel?.user!.lon!.toString()??"":  state.locationModel[0].lon.toString(),
//                         //     widget.textControllers[4].text ,
//                         //     int.parse(widget.textControllers[1].text ),
//                         //   //  widget.isUpdating != true &&dayCheckd.isNotEmpty?
//                         //     '{"sunday":${dayCheckd[0]},"tuesday":${dayCheckd[1]},"monday":${dayCheckd[2]},"wednesday":${dayCheckd[3]},"thrusday":${dayCheckd[4]},"friday":${dayCheckd[5]},"saturday":${dayCheckd[6]}}'
//                         //       //  :widget.registerModel!.user!.days!
//                         // )
//                         //
//                         // );
//                       }
//                       else{