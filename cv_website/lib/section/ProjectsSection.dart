import 'package:flutter/material.dart';
import 'Section.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: '📁 Projects',
      child: Column(
        children: const [
          ListTile(
            leading: Icon(Icons.code),
            title: Text('FastSPICE-Compatible Power Simulator'),
            subtitle:
                Text('Krylov solver + netlist parser with waveform reporting'),
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Image Processor in Verilog'),
            subtitle: Text(
                'Designed YCbCr converter and sharpness filter with SPI interface'),
          ),
        ],
      ),
    );
  }
}
