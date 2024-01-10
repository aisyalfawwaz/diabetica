// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gsform/gs_form/model/data_model/radio_data_model.dart';
import 'package:gsform/gs_form/model/data_model/spinner_data_model.dart';
import 'package:gsform/gs_form/widget/field.dart';
import 'package:gsform/gs_form/widget/form.dart';
import 'package:gsform/gs_form/widget/section.dart';

// ignore: must_be_immutable
class UserDataForm extends StatelessWidget {
  UserDataForm({Key? key}) : super(key: key);

  late GSForm form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: form = GSForm.multiSection(context, sections: [
                  GSSection(sectionTitle: 'User information', fields: [
                    GSField.text(
                      tag: 'name',
                      title: 'Nama',
                      minLine: 1,
                      maxLine: 1,
                    ),
                    GSField.radioGroup(
                      hint: 'Radio Group',
                      tag: 'radio',
                      showScrollBar: true,
                      scrollBarColor: Colors.red,
                      scrollDirection: Axis.horizontal,
                      height: 50,
                      scrollable: true,
                      required: true,
                      weight: 12,
                      title: 'Jenis Kelamin',
                      searchable: false,
                      searchHint: 'Search...',
                      searchIcon: const Icon(Icons.search),
                      searchBoxDecoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      items: [
                        RadioDataModel(title: 'Laki-laki', isSelected: false),
                        RadioDataModel(title: 'Perempuan', isSelected: false),
                      ],
                      callBack: (data) {},
                    ),
                    GSField.mobile(
                      tag: 'height',
                      title: 'Tinggi badan (Cm)',
                      maxLength: 11,
                      weight: 6,
                      required: false,
                      errorMessage: 'some error',
                    ),
                    GSField.mobile(
                      tag: 'height',
                      title: 'Berat badan (Kg)',
                      maxLength: 11,
                      weight: 6,
                      required: false,
                      errorMessage: 'some error',
                    ),
                    GSField.mobile(
                      tag: 'age',
                      title: 'Umur (Tahun)',
                    ),
                  ]),
                  GSSection(
                    sectionTitle: 'Medical Information',
                    fields: [
                      GSField.spinner(
                        tag: 'Smooking',
                        required: false,
                        weight: 6,
                        title: 'Smooking',
                        items: [
                          SpinnerDataModel(
                            name: 'Yes',
                            id: 1,
                          ),
                          SpinnerDataModel(
                            name: 'No',
                            id: 2,
                          ),
                        ],
                      ),
                      GSField.spinner(
                        tag: 'Family History',
                        required: false,
                        weight: 6,
                        title: 'Diabetic Family History',
                        items: [
                          SpinnerDataModel(
                            name: 'Yes',
                            id: 1,
                          ),
                          SpinnerDataModel(
                            name: 'No',
                            id: 2,
                          ),
                        ],
                      ),
                      GSField.spinner(
                        tag: 'Exercise',
                        required: false,
                        weight: 6,
                        title: 'Exercise',
                        items: [
                          SpinnerDataModel(
                            name: 'Yes',
                            id: 1,
                          ),
                          SpinnerDataModel(
                            name: 'No',
                            id: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        bool isValid = form.isValid();
                        Map<String, dynamic> map = form.onSubmit();
                        debugPrint(isValid.toString());
                        debugPrint(map.toString());
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue, // Warna teks putih
                      ),
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
