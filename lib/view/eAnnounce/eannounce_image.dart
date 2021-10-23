import 'package:flutter/material.dart';
import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/styles.dart';
import 'package:osis/model/eannounce_imge_model.dart';
import 'package:osis/widgets/base_view.dart';
import 'package:osis/widgets/network_image_view.dart';

import 'eAnnounce_view_model.dart';

class EAnnounceImagePage extends StatefulWidget{
String id;

EAnnounceImagePage(this.id);

  @override
  _EAnnounceImagePageState createState() => _EAnnounceImagePageState();
}

class _EAnnounceImagePageState extends State<EAnnounceImagePage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return BaseView<EAnnounceViewModel>(
        onModelReady: (viewModel) async {
          await viewModel.getEAnnounceImage(widget.id);



        },
        builder: (context, model, child) =>Scaffold(
          backgroundColor: AppColor.backgroundAll,
          appBar: AppBar(
            backgroundColor: AppColor.primaryBlue,
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),
            title: new Text("eAnnouncements",textScaleFactor: 1,style: AppTextStyle.mediumWhiteBold.copyWith(fontSize: 18)),

          ),
          body: model.state == ViewState.Busy?Center(child: CircularProgressIndicator()):SingleChildScrollView(
              child: model.eAnnounceImageModel?.error!=null?Center(child:
              new Text("No Data",textScaleFactor: 1,),):

              Container(
                height: double.maxFinite,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: model.eAnnounceImageModel?.data?.length,

                    itemBuilder: (BuildContext context,int index){

                      return imageWidget(model.eAnnounceImageModel?.data?[index], context);

                    }),
              )
          ),

        ));
  }
  imageWidget(EAnnounceImage? data, BuildContext context){

    return GestureDetector(
      onTap: (){
        if(data!.aImage!.isEmpty){
          return;
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NetworkImageView(data.aImage.toString())),
        );
      },
      child: Container(
          margin: EdgeInsets.only(top: 16,left: 15,right: 10,bottom: 10),

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

            Image.network(data!.aImage.toString(),height: MediaQuery.of(context).size.width,),






            ],
          )
      ),
    );

  }
}