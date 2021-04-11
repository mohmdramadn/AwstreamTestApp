import 'package:awstreams_testapp/src/bloc/user_bloc.dart';
import 'package:awstreams_testapp/src/models/api_model.dart';
import 'package:flutter/material.dart';

class UserAccountScreen extends StatefulWidget {
  static final String pageId = 'user';

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  Widget build(BuildContext context) {
    userBloc.fetchUserData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          borderOnForeground: false,
          color: Color(0xff1026B6).withOpacity(0.3),
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage("images/bk8.jpeg"), fit: BoxFit.cover),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder(
                    stream: userBloc.userData,
                    builder:
                        (context, AsyncSnapshot<GetUserAccountModel> snapshot) {
                      if (snapshot.hasData) {
                        return _buildUserWidget(snapshot.data);
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _buildUserWidget(GetUserAccountModel data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            //child: Text(data.pictures.medium),
            radius: 70,
            backgroundImage: NetworkImage(data.pictures.large),
            backgroundColor: Colors.transparent,
          ),
        ),
        Text(
          data.username,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
            ),
            Text(
              data.city + ', ' + data.country,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          data.url,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Bio :',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Color(0xffC1C1C1).withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Container(
              height: 100,
              child: Center(
                child: Text(
                  data.biog,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
