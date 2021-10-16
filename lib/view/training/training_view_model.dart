import 'package:osis/core/enums/viewstate.dart';
import 'package:osis/helper/base_view_model.dart';
import 'package:osis/model/training_development_model.dart';
import 'package:osis/model/wsq_model.dart';

class TrainingViewModel extends BaseViewModel{

  WSQModel ?wsqModel;

  TrainingDevelopmentModel ?trainingDevelopmentModel;

developmentInit() async{
  setState(ViewState.Busy);

  trainingDevelopmentModel = await api.getDevelopmentAPi();
  setState(ViewState.Idle);

}
  developmentWsq() async{

    setState(ViewState.Busy);

    wsqModel= await  api.getWsqApi();

    notifyListeners();
    setState(ViewState.Idle);
  }
}