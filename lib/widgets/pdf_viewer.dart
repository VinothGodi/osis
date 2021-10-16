import 'package:flutter/material.dart';
import 'package:osis/core/res/colors.dart';
import 'package:osis/core/res/styles.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDdfViewer extends StatefulWidget {
  String ?url;
  String ?name;

  PDdfViewer(this.url, this.name);

  @override
  _PDdfViewer createState() => _PDdfViewer();
}

class _PDdfViewer extends State<PDdfViewer> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryBlue,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: AppColor.white,)),

        title:  Text('${widget.name}',textScaleFactor: 1,style:AppTextStyle.mediumWhiteBold),

      ),
      body: SfPdfViewer.network(
        '${widget.url}',
        key: _pdfViewerKey,
      ),
    );
  }
}