import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(StudentApp());
}

class StudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(
        primaryColor: Color(0xFF5C4DB1),
        scaffoldBackgroundColor: Color(0xFF5C4DB1),
        fontFamily: 'Roboto',
      ),
      home: CalendarScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(),
            _buildNoticeBoard(),
            _buildHomeworkSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yogita Shaje',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Class VII B',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildNoticeBoard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            'Notice Board',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              _buildNoticeCard('School is going for vacation next month', Color(0xFF8DE1D5)),
              _buildNoticeCard('Summer Book Fair at School Campus in June', Color(0xFF7EBCFA)),
              _buildNoticeCard('School reopens after summer vacation next month', Color(0xFFFDC18C)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNoticeCard(String text, Color color) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }

  Widget _buildHomeworkSection() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 24),
        padding: EdgeInsets.only(top: 32, left: 24, right: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Homework',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildHomeworkItem('Learn Chapter 5 with one Essay', 'English', 'Today', false),
                  _buildHomeworkItem('Exercise Trigonometry 1st topic', 'Maths', 'Today', true),
                  _buildHomeworkItem('Hindi writing 3 pages', 'Hindi', 'Yesterday', false),
                  _buildHomeworkItem('Test for History first session', 'Social Science', 'Yesterday', false),
                  _buildHomeworkItem('Learn Atoms Physics', 'Science', '15 March 2020', true),
                  _buildHomeworkItem('English writing 3 pages', 'English', '14 March 2020', false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeworkItem(String title, String subject, String date, bool isCompleted) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: isCompleted ? Colors.green : Colors.grey.shade300, width: 2),
            ),
            child: isCompleted
                ? Icon(Icons.check, size: 16, color: Colors.green)
                : null,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('$subject / $date', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: EdgeInsets.all(24),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                children: [
                  _buildMenuItem('Dashboard', Icons.dashboard),
                  _buildMenuItem('Homework', Icons.assignment),
                  _buildMenuItem('Attendance', Icons.check_circle_outline),
                  _buildMenuItem('Fee Details', Icons.account_balance_wallet),
                  _buildMenuItem('Examination', Icons.assignment_turned_in),
                  _buildMenuItem('Report Cards', Icons.insert_drive_file),
                  _buildMenuItem('Calendar', Icons.calendar_today),
                  _buildMenuItem('Notice Board', Icons.announcement),
                  _buildMenuItem('Multimedia', Icons.video_library),
                  _buildMenuItem('Academic Year', Icons.school),
                  _buildMenuItem('Profile', Icons.person),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yogita Shaje',
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Class VII B',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () =>{},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(String title, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Color(0xFF5C4DB1), size: 24),
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        backgroundColor: Color(0xFF5C4DB1),
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildCalendarHeader(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Column(
                children: [
                  _buildCalendarGrid(),
                  _buildEventsList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0xFF5C4DB1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('March 2020', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1,
      ),
      itemCount: 31,
      itemBuilder: (context, index) {
        return Center(
          child: Text(
            '${index + 1}',
            style: TextStyle(
              color: index == 7 ? Colors.red : Colors.black,
              fontWeight: index == 7 ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        );
      },
    );
  }

  Widget _buildEventsList() {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildEventItem('01', 'National Day', 'Holiday', Color(0xFFFD7B8C)),
          _buildEventItem('10', 'Summer Holiday Event', 'Event', Color(0xFF7EBCFA)),
          _buildEventItem('22', 'School Function', 'Event', Color(0xFFFDC18C)),
          _buildEventItem('26', 'Dean Meeting', 'Event', Color(0xFF8DE1D5)),
          _buildEventItem('30', 'Carnival in the City', 'Holiday', Color(0xFFFD7B8C)),
        ],
      ),
    );
  }

  Widget _buildEventItem(String date, String title, String type, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                date,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 4),
              Text(type, style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}

class MultimediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multimedia'),
        backgroundColor: Color(0xFF5C4DB1),
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildCategoryTabs(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  _buildMultimediaItem('PDF', 'Social Science Syllabus', 'Syllabus for 2020 batch\n12 pages / 360 KB'),
                  _buildMultimediaItem('Video', 'Chapter-wise MCQs & Answers', 'Live Stream Capture'),
                  _buildMultimediaItem('ZIP', 'Improvement in Food Resources', 'Syllabus for 2020 batch\n15 MB'),
                  _buildMultimediaItem('PDF', 'Exemplar Solutions Class 10', 'Syllabus for 2020 batch\n12 pages / 360 KB'),
                  _buildMultimediaItem('ZIP', 'Preparation Tips', 'Syllabus for 2020 batch\n15 MB'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      color: Color(0xFF5C4DB1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildCategoryTab('All', isSelected: true),
          _buildCategoryTab('Video'),
          _buildCategoryTab('Images'),
          _buildCategoryTab('Documents'),
          _buildCategoryTab('Links'),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(String title, {bool isSelected = false}) {
    return Text(
      title,
      style: TextStyle(
        color: isSelected ? Colors.white : Colors.white70,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget _buildMultimediaItem(String type, String title, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFFFF0F5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(type, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink)),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 4),
                Text(description, style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}