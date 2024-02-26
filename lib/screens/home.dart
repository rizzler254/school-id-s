import 'package:carousel_slider/carousel_slider.dart';
import 'package:scids/constants/colors.dart';
import 'package:scids/data/semesters.dart';
import 'package:scids/data/semester_courses.dart';
import 'package:scids/data/profile.dart';
import 'package:scids/data/further_Reading_materials.dart';
import 'package:scids/widgets/all_semesters_container.dart';
import 'package:scids/widgets/semester_courses_container.dart';
import 'package:scids/widgets/notification_container.dart';
import 'package:scids/widgets/further_reading_container.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: tertiaryColor,
            pinned: true,
            snap: true,
            floating: true,
            title: _buildAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildProjectBody(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome back!",
                style: TextStyle(
                  color: labelColor,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                profile["name"]!,
                style: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        buildIconNotificationContainer(),
      ],
    );
  }

  _buildProjectBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSemesters(),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Semester Courses",
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          _buildSemesterCourses(),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Further Readings",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14, color: blackColor),
                ),
              ],
            ),
          ),
          _buildFurtherReadings(),
        ],
      ),
    );
  }

  _buildSemesters() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          semesters.length,
          (int index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: AllSemestersContainer(
              selectedColor: Colors.white,
              data: semesters[index],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }

  _buildSemesterCourses() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
        viewportFraction: .75,
      ),
      items: List.generate(
        courses.length,
        (index) => SemesterCoursesContainer(
          data: courses[index],
        ),
      ),
    );
  }

  _buildFurtherReadings() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          furtherReadings.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: FurtherReadingContainer(
              data: furtherReadings[index],
            ),
          ),
        ),
      ),
    );
  }
}
