import 'dart:convert';

import 'package:fitness/common/Shared%20pref%20helper/user_cache_helper.dart';
import 'package:fitness/common/colo_extension.dart';
import 'package:fitness/common_widget/custtom_app_title.dart';
import 'package:fitness/features/auth/presintation/views%20blocs/Auth%20bloc/auth_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common_widget/round_textfield.dart';
import '../../../../../home/presintation/views_blocs/Exersices data/exercies_data_bloc.dart';
import 'custom_unit_wedgit.dart';
import 'data_time_show_debuge.dart';
import '../../../../../../common_widget/drop_down_list.dart';
import '../../../../../../common/localization/applocalizations.dart';
import 'dayScadularGridView.dart';

class UserInformationForm extends StatefulWidget {
  UserInformationForm({
    super.key,
    required this.media,
    required this.completeKey,
    required this.textControllers,
    required this.onTap, required this.isUpdating,
  });

  final Size media;
  final GlobalKey<FormState> completeKey;
  final List<TextEditingController> textControllers;
  final void Function(List<bool>) onTap;
  final bool isUpdating;

  @override
  State<UserInformationForm> createState() => _UserInformationFormState();
}

class _UserInformationFormState extends State<UserInformationForm> {
  @override
  void initState() {
    super.initState();

   if(widget.isUpdating){
   widget.textControllers[0].text = user().user!.gender??"";              // Gender
   widget.textControllers[1].text = user().user!.age?.toString()??"";        // Date of Birth
   widget.textControllers[2].text = user().user!.width?.toString()??"";                // Weight
   widget.textControllers[3].text = user().user!.height?.toString()??"";               // Height
   widget.textControllers[4].text = user().user!.illness?.toString()??"";              // Illness
   widget.textControllers[5].text = user().user!.address?.toString()??"";      // Location
   }
    if(user().user!.days != null){
      String jsonString =user().user!.days??'';
      Map<String, dynamic> dayMap = jsonDecode(jsonString);
      dayCheckd = dayes.map((day) => dayMap[day] == true).toList();
    }else{
      dayCheckd = dayes.map((day) =>  false).toList();
    }
  }

  List<bool> dayCheckd = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
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
  Widget build(BuildContext context) {
    List<String> dayesName = [
      AppLocalazations.of(context)!.translate("Profile")["sunday"],
      AppLocalazations.of(context)!.translate("Profile")["tuesday"],
      AppLocalazations.of(context)!.translate("Profile")["monday"],
      AppLocalazations.of(context)!.translate("Profile")["wednesday"],
      AppLocalazations.of(context)!.translate("Profile")["thrusday"],
      AppLocalazations.of(context)!.translate("Profile")["friday"],
      AppLocalazations.of(context)!.translate("Profile")["saturday"]
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Form(
        key: widget.completeKey,
        child: Column(
          children: [
            CustomTextField(
              validator: (data) {
                if (data!.isEmpty) {
                  return AppLocalazations.of(context)!
                      .translate("OnCompletePage")['gender'];
                }
                return null;
              },
              controller: widget.textControllers[0],
              hitText: "Choose Gender",
              icon: Icons.male_outlined,
              rigtIcon: DropDownList(
                item: const ["Male", "Female"],
                icon: Icon(Icons.arrow_downward),
                onChanged: (String? value) {
                  widget.textControllers[0].text = value??'Female';
                  BlocProvider.of<ExerciesDataBloc>(context).add(ExerciesDataEvent(value!));

                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              validator: (data) {
                if (data!.isEmpty) {
                  return AppLocalazations.of(context)!
                      .translate("OnCompletePage")['age'];
                }
                return null;
              },
              controller: widget.textControllers[1],
              hitText: "Date of Birth",
              icon: Icons.date_range,
              onchanged: (p0) =>   widget.textControllers[1].text = p0,
          //    rigtIcon: timeDateShowDebage(context, widget.textControllers[1]),
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              validator: (data) {
                if (data!.isEmpty) {
                  return AppLocalazations.of(context)!
                      .translate("OnCompletePage")['illnesses'];
                }
                return null;
              },
              controller: widget.textControllers[4],
              hitText: AppLocalazations.of(context)!
                  .translate("OnCompletePage")['illnesses'],
              icon: Icons.accessibility,
              onchanged: (p0) =>   widget.textControllers[4].text = p0,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onchanged: (p0) {
                 widget.textControllers[5].text = p0;
                BlocProvider.of<AuthBloc>(context).add(SearchLocation(p0));
              },
              controller: widget.textControllers[5],
              hitText: "Location : city Country",
              icon: Icons.date_range,
              rigtIcon: BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is SearchingLocationLoading) {
                    return SizedBox(
                        width: 20,
                        child: CircularProgressIndicator(
                          color: TColor.primaryColor1,
                        ));
                  }
                  if (state is SearchingLocationSuccess) {
                    return Icon(
                      Icons.check,
                      color: Colors.green,
                    );
                  }
                  if (state is SearchingLocationFailed) {
                    return Icon(
                      Icons.not_interested,
                      color: Colors.redAccent,
                    );
                  }
                  return SizedBox();
                },
                listener: (context, state) {},
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    validator: (data) {
                      if (data!.isEmpty) {
                        return AppLocalazations.of(context)!
                            .translate("OnCompletePage")['width'];
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: widget.textControllers[2],
                    hitText: AppLocalazations.of(context)!
                        .translate("OnCompletePage")['width'],
                    icon: Icons.monitor_weight_outlined,
                    onchanged: (p0) =>   widget.textControllers[2].text = p0,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const CustomUnitWedgit(
                  text: "KG",
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    validator: (data) {
                      if (data!.isEmpty) {
                        return AppLocalazations.of(context)!
                            .translate("OnCompletePage")['height'];
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: widget.textControllers[3],
                    hitText: AppLocalazations.of(context)!
                        .translate("OnCompletePage")['height'],
                    icon: Icons.unfold_more_outlined,
                    onchanged: (p0) =>   widget.textControllers[3].text = p0,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const CustomUnitWedgit(
                  text: 'CM',
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CusttomAppTitle(title: AppLocalazations.of(context)!
                .translate("OnCompletePage")['Choose The Dayes You Want To Practice In']),
            SizedBox(height: 15,),
            dayScadualeGridView( onTap1: (index) {
                dayCheckd[index] == false
                    ? dayCheckd[index] = true
                    : dayCheckd[index] = false;
                setState(() {});
                print(dayCheckd);
                return widget.onTap(dayCheckd);
            }, dayCheckd: dayCheckd, dayName: dayesName)
          ],
        ),
      ),
    );
  }

}

