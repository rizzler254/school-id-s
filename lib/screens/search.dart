import 'package:scids/constants/colors.dart';
import 'package:scids/constants/images.dart';
import 'package:scids/data/jobs.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    pageController = PageController(
      initialPage: currentIndex,
      keepPage: true,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 40, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                    border: Border.all(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                  ),
                  child: Image.asset(welcomeImage, width: 70, height: 70),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good Morning ",
                      style: TextStyle(
                        color: textColor.withOpacity(0.5),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Kobicypher!",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Container(
                //   height: 50,
                //   width: 50,
                //   decoration: BoxDecoration(
                //     shape: BoxShape.circle,
                //     color: Colors.grey.shade200,
                //     border: Border.all(
                //       color: Colors.grey.shade400,
                //       width: 1,
                //     ),
                //   ),
                //   child: const Icon(
                //     Icons.notifications,
                //     color: primaryColor,
                //     size: 30,
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 10),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: buildSearchField(),
            ),
            Container(
              height: 120,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: PageView.builder(
                controller: pageController,
                itemCount: jobs.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return JobsContainer(
                    isSelected: index == currentIndex,
                    jobs: jobs[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Popular Jobs",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: primaryColor.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: popularJobs.length,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                popularJobs[index]["name"],
                                style: const TextStyle(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                popularJobs[index]["department"],
                                style: TextStyle(
                                  color: textColor.withOpacity(0.5),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 50,
                          height: 50,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: primaryColor.withOpacity(0.5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.read_more_rounded,
                              color: Colors.white,
                              size: 30,
                              weight: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildSearchField() {
  return TextFormField(
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: "Search Campus Jobs",
      contentPadding: const EdgeInsets.only(left: 0),
      hintStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: Icon(
        Icons.search,
        size: 30,
        color: blackColor.withOpacity(0.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

class JobsContainer extends StatelessWidget {
  final bool isSelected;
  final jobs;

  const JobsContainer({
    Key? key,
    required this.isSelected,
    required this.jobs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.grey.shade200,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: isSelected ? primaryColor : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              jobs["name"],
              style: TextStyle(
                color: isSelected ? Colors.white : textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              jobs["company"],
              style: TextStyle(
                color: isSelected
                    ? Colors.white.withOpacity(0.5)
                    : textColor.withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on,
                  color: isSelected
                      ? Colors.white.withOpacity(0.5)
                      : textColor.withOpacity(0.5),
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  jobs["location"],
                  style: TextStyle(
                    color: isSelected
                        ? Colors.white.withOpacity(0.5)
                        : textColor.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
