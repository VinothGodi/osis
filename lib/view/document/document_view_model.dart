import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/code_conduct_model.dart';
import 'package:osis/model/employee_handbook_model.dart';
import 'package:osis/model/ket_doc_model.dart';
import 'package:osis/model/ket_model.dart';
import 'package:osis/model/sop_model.dart';

class DocumentViewModel extends BaseViewModel {
  SopModel ?sopModel;
  CodeConductModel ?codeConductModel;
  KetModel ?ketModel;

  KetDocApi ?ketDocApi;

  EmployeeHandbookModel ?employeeHandbookModel;

  init() async {

    setState(ViewState.Busy);

    sopModel = await api.getSopApi();


    setState(ViewState.Idle);
  }

  codeConductInit() async{

    setState(ViewState.Busy);

    codeConductModel = await api.getCodeConductApi();

    setState(ViewState.Idle);
  }


  employeeHandBookApi() async{

    setState(ViewState.Busy);

    employeeHandbookModel = await api.getEmployeeHandbookApi();

    setState(ViewState.Idle);
  }


  documentKetInit() async{

    setState(ViewState.Busy);
    ketModel = await api.getKetApi();
    notifyListeners();

    setState(ViewState.Idle);

  }

  getKetDoc(String ?ketId) async{
    ketDocApi =  await api.getKetDocApi(ketId);
  }
}