import 'package:flutter/material.dart';

class DiabeticRiskCalculatorCard extends StatefulWidget {
  final IconData icon;
  final int riskValue;

  const DiabeticRiskCalculatorCard({
    Key? key,
    required this.icon,
    required this.riskValue,
  }) : super(key: key);

  @override
  _DiabeticRiskCalculatorCardState createState() =>
      _DiabeticRiskCalculatorCardState();
}

class _DiabeticRiskCalculatorCardState extends State<DiabeticRiskCalculatorCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Sesuaikan durasi animasi
    );

    _animation =
        Tween<double>(begin: 0.0, end: widget.riskValue.toDouble()).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = Colors.white;

    if (widget.riskValue > 90) {
      textColor = Colors.red;
    } else if (widget.riskValue >= 60) {
      textColor = Colors.green;
    } else if (widget.riskValue < 60) {
      textColor = Colors.blue;
    }

    return Material(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: FadeTransition(
        opacity: _controller,
        child: ScaleTransition(
          scale: _controller,
          child: Container(
            margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 32, 32, 31),
                  Color.fromARGB(255, 53, 53, 53)
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 48,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Your Diabetic Risk',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Text(
                        _animation.value.toInt().toString(),
                        style: TextStyle(
                          color: textColor,
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'This is a description about the risk value.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Your action here
                    },
                    child: Text(
                      'Get Started',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.blue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
