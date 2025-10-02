import 'dart:convert';

import 'package:fitness/features/clubs/pages/gyms/widgets/gym_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:http/http.dart' as http;
import '../../../../common/Shared pref helper/user_cache_helper.dart';
import '../../../../common/colo_extension.dart';
import '../../../../common/servies_locator.dart';
import '../../generated/assets.dart';
import 'models/gym_model.dart';
import 'models/gyms_model.dart';

class GymsPage extends StatefulWidget {
  const GymsPage({super.key});

  static String get name => "GymsPage";
  static String get path => "/GymsPage";

  @override
  State<GymsPage> createState() => _GymsPageState();
}

class _GymsPageState extends State<GymsPage> {
  List<GymModel> gymList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchGyms();
  }

  Future<void> fetchGyms() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.43.243:8000/api/gym/index'),
        headers: {'Accept':'application/json','Content-Type':'application/json','Authorization':
      'Bearer${getIt.get<UserCacheHelper>().getUserCache('user').authorisation!.token.toString()??""}'}
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> result = jsonDecode(response.body);
        final List<dynamic> data = result['data'] ?? [];
        gymList = data.map((e) => GymModel.fromJson(e)).toList();
        print('Response body: ${response.body}');
        print('Data length: ${data.length}');
        setState(() {
          gymList = data.map((e) => GymModel.fromJson(e)).toList();
          isLoading = false;
        });
      } else {
        print('Failed to load gyms: ${response.statusCode}');
        setState(() => isLoading = false);
      }
    } catch (e) {
      print('Error fetching gyms: $e');
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: REdgeInsets.all(16),
      child: GridView.builder(
        itemCount: gymList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 9 / 11,
        ),
        itemBuilder: (context, index) {
          return GymItem(
            gymModel: gymList[index],
            color: TColor.primaryColor1.withOpacity(0.7),
          );
        },
      ),
    );
  }
}

