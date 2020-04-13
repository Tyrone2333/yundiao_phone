import 'package:flutter/material.dart';
import 'package:yundiao_phone/widgets/custom_stepper2.dart';

class StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StepperPage'),
        ),
        body: _buildCustomStepper2());
  }

  Widget _buildCustomStepper2() {
    return CustomStepper2(
      currentStep: 1,
      type: CustomStepperType2.horizontal,
      steps: ['提交任务', '本金返款',  '任务完结']
          .map(
            (s) => CustomStep2(
                title: Text(s), content: Container(), isActive: true),
          )
          .toList(),
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        return Container();
      },
    );
  }

  Widget _buildStepper() {
    return Stepper(
      currentStep: 2,
      type: StepperType.horizontal,
      steps: ['提交任务', '本金返款', '任务完结']
          .map(
            (s) => Step(title: Text(s), content: Container(), isActive: true),
          )
          .toList(),
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        return Container();
      },
    );
  }
}
