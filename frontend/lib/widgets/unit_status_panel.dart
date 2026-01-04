import 'package:flutter/material.dart';
import 'package:dgpc_cco/theme/sovereign_theme.dart';

class UnitStatusPanel extends StatelessWidget {
  const UnitStatusPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: const BoxDecoration(
        color: SovereignTheme.panelBackground,
        border: Border(left: BorderSide(color: Colors.white10)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF0F1218),
              border: Border(bottom: BorderSide(color: SovereignTheme.successGreen, width: 2)),
            ),
            child: const Row(
              children: [
                Icon(Icons.shield_moon, color: SovereignTheme.successGreen, size: 18),
                SizedBox(width: 8),
                Text('UNIT STATUS', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                Spacer(),
                Icon(Icons.filter_list, size: 16, color: Colors.white54),
              ],
            ),
          ),
          
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                _buildUnitTile('ALPHA-1', 'PATROL', SovereignTheme.successGreen),
                _buildUnitTile('BRAVO-6', 'ENGAGED', SovereignTheme.operationalRed),
                _buildUnitTile('MED-2', 'RETURNING', SovereignTheme.alertOrange),
                _buildUnitTile('AIR-1', 'STANDBY', SovereignTheme.successGreen),
                const Divider(height: 32),
                _buildUnitTile('CMD-Post', 'ONLINE', SovereignTheme.sovereignBlue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitTile(String callsign, String status, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.white.withOpacity(0.02),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Text(callsign, style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'monospace')),
          const Spacer(),
          Text(status, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
