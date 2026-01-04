import 'package:flutter/material.dart';
import 'package:dgpc_cco/theme/sovereign_theme.dart';

class OperationalMap extends StatelessWidget {
  const OperationalMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Deep space black for map background
      child: Stack(
        children: [
          // Map Layer Placeholder (simulating dark mode vector map)
          Opacity(
            opacity: 0.3,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 20,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: SovereignTheme.sovereignBlue.withOpacity(0.1)),
                  ),
                );
              },
            ),
          ),
          
          // Center Placeholder Text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.map, size: 64, color: SovereignTheme.sovereignBlue.withOpacity(0.5)),
                const SizedBox(height: 16),
                const Text(
                  'OPERATIONAL MAP (VECTOR)',
                  style: TextStyle(
                    color: SovereignTheme.sovereignBlue,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'LIVE UNIT TRACKING ACTIVE',
                  style: TextStyle(
                    color: SovereignTheme.successGreen.withOpacity(0.7),
                    fontSize: 10,
                    letterSpacing: 1.5
                  ),
                ),
              ],
            ),
          ),

          // Map Controls Overlay
          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              children: [
                _buildMapControl(Icons.layers),
                const SizedBox(height: 8),
                _buildMapControl(Icons.add),
                _buildMapControl(Icons.remove),
                const SizedBox(height: 8),
                _buildMapControl(Icons.my_location, color: SovereignTheme.operationalRed),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapControl(IconData icon, {Color color = Colors.white}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: SovereignTheme.panelBackground,
        border: Border.all(color: Colors.white12),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }
}
