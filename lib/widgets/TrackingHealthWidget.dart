import 'package:flutter/material.dart';

class TrackingHealthWidget extends StatefulWidget {
  final String title;
  final String unit;
  final Function(String, String) onValueChanged; // Updated callback

  TrackingHealthWidget({
    required this.title,
    required this.unit,
    required this.onValueChanged,
  });

  @override
  _TrackingHealthWidgetState createState() => _TrackingHealthWidgetState();
}

class _TrackingHealthWidgetState extends State<TrackingHealthWidget> {
  String selectedType = 'Fasting'; // Default value
  late String enteredValue;

  // Map of icons for each health parameter
  final Map<String, IconData> parameterIcons = {
    'Blood Sugar': Icons.favorite,
    'HbA1c': Icons.timeline,
    'Ketone': Icons.thermostat,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Icon(
                parameterIcons[widget.title]!,
                color: Colors.blue,
                size: 24,
              ),
            ],
          ),
          SizedBox(height: 12),
          _buildInputField('Enter ${widget.title} (${widget.unit})'),
          if (widget.title == 'Blood Sugar') ...[
            SizedBox(height: 12),
            _buildTypeDropdown(),
          ],
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildInputField(String labelText) {
    return TextFormField(
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        setState(() {
          enteredValue = value;
        });
      },
    );
  }

  Widget _buildTypeDropdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Blood Sugar Type:',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        SizedBox(width: 8),
        DropdownButton<String>(
          value: selectedType,
          items: ['Fasting', 'Random'].map((String type) {
            return DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value != null) {
              setState(() {
                selectedType = value;
              });
              widget.onValueChanged(enteredValue, selectedType);
            }
          },
        ),
      ],
    );
  }
}
