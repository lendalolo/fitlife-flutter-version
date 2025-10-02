

class GoalItem{
  final String title;
  final String image;
  final String subTitle;
  GoalItem(this.title, this.image, this.subTitle);
}

List<GoalItem> goalArr = [
  GoalItem("Improve Shape", "assets/img/goal_1.png", "I have a low amount of body fat\nand need / want to build more\nmuscle"),
  GoalItem("Lean & Tone","assets/img/goal_2.png", "I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way"),
  GoalItem( "Lose a Fat","assets/img/goal_3.png","I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass")
];