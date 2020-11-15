import 'package:flutter/material.dart';
import 'package:hospital/services/news.dart';
import 'package:hospital/shared/doctor.dart';
import 'package:hospital/shared/facility.dart';
import 'package:hospital/shared/const.dart';

class Search extends SearchDelegate {

  List<News> search;
  Search(this.search);

  List<Doctor> doctors = doctorList;
  List<Facility> facilityList = facilities;

  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          },
        )
      ];
      //throw UnimplementedError();
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);

        },
      );

    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {

      final suggestion = query.isEmpty ? this.search 
      : this.search.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();
      final suggestion2 = query.isEmpty ? doctors 
      : doctors.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
      final suggestion3 = query.isEmpty ? facilityList 
      : facilityList.where((element) => element.title.toLowerCase().contains(query.toLowerCase())).toList();


      return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: suggestion.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(suggestion[index].title),
                  subtitle: Text(suggestion[index].content,overflow: TextOverflow.ellipsis,)
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: suggestion2.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(suggestion2[index].name),
                  subtitle: Text(suggestion2[index].specials,overflow: TextOverflow.ellipsis,)
                );
              },
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: suggestion3.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(suggestion3[index].title),
                  subtitle: Text(suggestion3[index].description,overflow: TextOverflow.ellipsis,)
                );
              },
            )
          ],
        ),
      );
  }

}