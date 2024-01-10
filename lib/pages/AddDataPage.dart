// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// class AddDataPage extends StatefulWidget {
//   @override
//   _AddDataPageState createState() => _AddDataPageState();
// }

// class _AddDataPageState extends State<AddDataPage> {
//   final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
//   DateTime _selectedTime = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Data'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: FormBuilder(
//             key: _fbKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 FormBuilderTextField(
//                   name: 'glucoseLevel',
//                   decoration: InputDecoration(labelText: 'Glucose Level'),
//                   validator: FormBuilderValidators.compose([
//                     FormBuilderValidators.required(context),
//                     FormBuilderValidators.numeric(context),
//                   ]),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 20),
//                 FormBuilderDropdown(
//                   name: 'glucoseType',
//                   decoration: InputDecoration(labelText: 'Glucose Type'),
//                   items: ['Fasting', 'Random'].map((type) {
//                     return DropdownMenuItem(
//                       value: type,
//                       child: Text(type),
//                     );
//                   }).toList(),
//                 ),
//                 SizedBox(height: 20),
//                 FormBuilderTextField(
//                   name: 'hba1c',
//                   decoration: InputDecoration(labelText: 'HbA1c (optional)'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 20),
//                 FormBuilderTextField(
//                   name: 'ketoneLevel',
//                   decoration: InputDecoration(labelText: 'Ketone Level (optional)'),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('Time: ${_formatDateTime(_selectedTime)}'),
//                     ElevatedButton(
//                       onPressed: () {
//                         _showDateTimePicker(context);
//                       },
//                       child: Text('Select Time'),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_fbKey.currentState!.saveAndValidate()) {
//                       // Save the form data
//                       var formData = _fbKey.currentState!.value;
//                       print(formData);
//                       // You can perform actions with the form data here
//                     }
//                   },
//                   child: Text('Save'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showDateTimePicker(BuildContext context) {
//     DatePicker.showTimePicker(
//       context,
//       showTitleActions: true,
//       onConfirm: (time) {
//         setState(() {
//           _selectedTime = time;
//         });
//       },
//     );
//   }

//   String _formatDateTime(DateTime dateTime) {
//     return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
//   }
// }
