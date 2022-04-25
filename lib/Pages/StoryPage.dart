import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:balanc_ed_2/Constants/Fonts&Themes.dart';
import 'package:balanc_ed_2/Models/NewsModel.dart';
import 'package:story/story.dart';

class StoryPage extends StatefulWidget {
  final int idx;
  final NewsClass news;
  StoryPage({Key? key,required this.idx,required  this.news}) : super(key: key);
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: courseColor[widget.idx],
        body: StoryPageView(
            onPageLimitReached: (){
              Navigator.pop(context);
            },
            itemBuilder: (context,pageIndex,storyIndex){
              return Container(
                color: courseColor[widget.idx],
                child: Padding(
                  padding: EdgeInsets.only(top: height*0.07,left: width*0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Financial Shots",style: paraText.copyWith(fontWeight: FontWeight.w700,fontSize: 15),),
                      SizedBox(height:0.2*height,),
                      Padding(
                        padding: EdgeInsets.only(left:5.0,right: 12),
                        child: Text(widget.news.news,style: paraText.copyWith(fontWeight: FontWeight.w700,fontSize: 28),textAlign: TextAlign.start,),
                      ),
                      SizedBox(height:0.02*height,),
                      Divider(
                          color: Colors.white,
                          indent: 1,
                          endIndent: 200
                      ),
                      SizedBox(height:0.02*height,),
                      Text("Source : CNN",style: paraText.copyWith(fontWeight: FontWeight.w500,fontSize: 15),),
                      SizedBox(height:0.15*height,),
                      Row(children: [
                        Column(
                          children: [
                            Icon(Icons.bookmark,size: 30,color: Colors.white,),
                            Text("Save",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 15),)
                          ],
                        ),
                        SizedBox(width:0.05*width,),
                        Column(
                            children:[
                              Icon(FontAwesomeIcons.telegramPlane,size: 30,color: Colors.white,),
                              Text("Share",style: paraText.copyWith(fontWeight: FontWeight.w600,fontSize: 15),)
                            ]
                        )
                      ],)
                    ],
                  ),
                ),
              );
            }, storyLength: (pageIndex){
          return 1;
        }, pageLength: 1));
  }
}