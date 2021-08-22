import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MostAffectedPanel extends StatelessWidget {
  final List? countryData;

  const MostAffectedPanel({
    Key? key,
    this.countryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: countryData!.length,
        itemBuilder: (context, index) {
          final countryInfo = countryData![index];

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child:Row(
              children:[
               CachedNetworkImage(
                 imageUrl: countryInfo['countryInfo']['flag'],
                 fit: BoxFit.cover,
                 height: 30,
               ),
                SizedBox(width: 10,),
                Text(countryInfo['country'],style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(width: 10,),
                Text('Deaths ${countryInfo['deaths']}',style: TextStyle(
                  color: Colors.red,fontWeight: FontWeight.bold
                ),)
              ]
            )
          );
        },
      ),
    );
  }
}
