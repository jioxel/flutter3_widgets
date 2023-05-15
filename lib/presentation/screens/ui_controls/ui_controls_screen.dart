import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'uicontrols_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI controls screen')),
      body: _UiControllView(),
    );
  }
}

class _UiControllView extends StatefulWidget {
  const _UiControllView({
    super.key,
  });

  @override
  State<_UiControllView> createState() => _UiControllViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControllViewState extends State<_UiControllView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: Text('Developer mode'),
            subtitle: Text('more controls'),
            value: isDeveloper,
            onChanged: (value) => setState(() {
                  isDeveloper = !isDeveloper;
                })),
        ExpansionTile(
          title: const Text('Transport vehicle'),
          subtitle: Text('${selectedTransportation}'),
          children: [
            RadioListTile(
              title: Text('By car'),
              subtitle: Text('Trabel by car'),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: Text('By Boat'),
              subtitle: Text('Trabel by boar'),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: Text('By Plane'),
              subtitle: Text('Trabel by plane'),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: Text('By Submarine'),
              subtitle: Text('Trabel by submarine'),
              value: Transportation.submarine,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() {
                selectedTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
            title: Text('Breackfast'),
            value: wantsBreakfast,
            onChanged: (value) => setState(() {
                  wantsBreakfast = !wantsBreakfast;
                })),
        CheckboxListTile(
            title: Text('Lunch'),
            value: wantsLunch,
            onChanged: (value) => setState(() {
                  wantsLunch = !wantsLunch;
                })),
        CheckboxListTile(
            title: Text('Dinner'),
            value: wantsDinner,
            onChanged: (value) => setState(() {
                  wantsDinner = !wantsDinner;
                })),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
