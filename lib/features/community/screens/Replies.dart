import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar.dart';
import 'package:pawrentingreborn/common/widgets/appBar/appBar2.dart';
import 'package:pawrentingreborn/features/community/widget/ThreadCard.dart';
import 'package:pawrentingreborn/utils/constants/colors.dart';
import 'package:pawrentingreborn/utils/constants/images_strings.dart';
import 'package:pawrentingreborn/utils/constants/texts.dart';

class Community extends StatelessWidget {
  const Community({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(onMain: true, onPetDetails: false),
      floatingActionButton: FloatingActionButton(onPressed: (){}, backgroundColor: Color(0xff4749AE),
      child: 
      Text('+ Add', style: TextStyle(fontFamily: 'Alata', fontSize: 15, color: Colors.white,),),),
      backgroundColor: TColors.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Container(
                height: 2000,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container( 
                      width: 500,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Color(0xFFF8F6FD),
                        borderRadius:BorderRadius.all(
                          Radius.circular(15)
                        )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            SizedBox(width: 10,),
                            Text('Search "how to play with cat"', 
                            style: TextStyle(
                              fontFamily: 'alata',
                              fontSize: 16
                              
                            )),
                            
                            
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                        children: [
                          Container(
                            width: 161.81,
                            height: 26.35,
                           decoration: BoxDecoration(
                              color: Color(0XFF766CAA),
                              borderRadius: BorderRadius.all(
                              Radius.circular(40)
                            )
                           ),
                            alignment: Alignment.center,
                            child: Text('Article', style: TextStyle(
                              fontFamily: 'alata', fontSize: 16, color: Colors.white
                            ),),
                           
                          ),
          
                          Container(
                            width:161.81,
                            height: 26.35,
                           decoration: BoxDecoration(
                              color: Color(0XFF21165A),
                              borderRadius: BorderRadius.all(
                              Radius.circular(40)
                            )
                           ),
                            alignment: Alignment.center,
                            child: Text('Thread', style: TextStyle(
                              fontFamily: 'alata', fontSize: 16, color: Colors.white
                            ),),
                           
                          ),
                          
                        ],
                      ),
                      SizedBox(height: 10,),         
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,   
                        children: [
                          Container(
                            width: 50,
                            height: 25,
                            
                            decoration: BoxDecoration(
                              color: TColors.filter.withOpacity(0.3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10)
                              )
                              
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.tune_rounded, color: Color(0xff535050),),
                          ),

                          Container(
                            width: 89,
                            height: 25,
                           
                            decoration: BoxDecoration(
                              color: Color(0xff21165A),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10)
                              )
                            ),
                            alignment: Alignment.center,
                            child: Text('All', style: TextStyle(
                              fontFamily: 'albertsans',
                              fontSize: 16,
                              color: Colors.white
                            ),),
                          ),

                           Container(
                            width: 89,
                            height: 25,
                            
                            decoration: BoxDecoration(
                              color: TColors.filter.withOpacity(0.3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10)
                              )
                            ),
                            alignment: Alignment.center,
                            child: Text('Post', style: TextStyle(
                              fontFamily: 'albertsans',
                              fontSize: 16,
                              color: Color(0xff535050)
                            ),),
                          ),

                          Container(
                            width: 89,
                            height: 25,
                            
                            decoration: BoxDecoration(
                              color: TColors.filter.withOpacity(0.3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10)
                              )
                            ),
                            alignment: Alignment.center,
                            child: Text('Replies', style: TextStyle(
                              fontFamily: 'albertsans',
                              fontSize: 16,
                              color: Color(0xff535050)
                            ),),
                          ),
                        ],

                        
                      ),
                        SizedBox(height: 10,),
                        Thread(),
                        SizedBox(height: 10,),
                        Thread(),
                        SizedBox(height: 10,),
                        Thread(),
                        SizedBox(height: 10,),
                        Thread()
                              
                              
                            ],         
                            ),
                            
 
                        ),
                      
                  ],
                ),
              )
          ),
        );
  }
}

