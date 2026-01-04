import 'package:flutter/material.dart';
import 'package:dgpc_cco/theme/sovereign_theme.dart';

class IncidentFeed extends StatelessWidget {
  const IncidentFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: const BoxDecoration(
        color: SovereignTheme.panelBackground,
        border: Border(right: BorderSide(color: Colors.white10)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFF0F1218),
              border: Border(bottom: BorderSide(color: SovereignTheme.sovereignBlue, width: 2)),
            ),
            child: const Row(
              children: [
                Icon(Icons.warning_amber, color: SovereignTheme.operationalRed, size: 18),
                SizedBox(width: 8),
                Text('ACTIVE INCIDENTS', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
                Spacer(),
                Text('12 ACTIVE', style: TextStyle(fontSize: 10, color: Colors.white54)),
              ],
            ),
          ),
          
          // List
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildIncidentItem(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIncidentItem(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2128),
        border: Border.all(color: Colors.white10),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: SovereignTheme.operationalRed,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Text('P1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              ),
              const SizedBox(width: 8),
              const Text('FOREST FIRE - KABYLIE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              const Spacer(),
              const Text('12m', style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
          const SizedBox(height: 8),
          const Text('Sector 4B • High wind velocity reported.', style: TextStyle(fontSize: 11, color: SovereignTheme.textSecondary)),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.location_on, size: 12, color: Colors.grey),
              const SizedBox(width: 4),
              const Text('36.75, 4.05', style: TextStyle(fontSize: 10, color: Colors.grey, fontFamily: 'monospace')),
              const Spacer(),
              Text('UNITS: 3', style: TextStyle(fontSize: 10, color: SovereignTheme.sovereignBlue)),
            ],
          ),
        ],
      ),
    );
  }
}
