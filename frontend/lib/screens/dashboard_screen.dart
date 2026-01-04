import 'package:flutter/material.dart';
import 'package:dgpc_cco/theme/sovereign_theme.dart';
import 'package:dgpc_cco/widgets/official_header.dart';
import 'package:dgpc_cco/widgets/operational_map.dart';
import 'package:dgpc_cco/widgets/incident_feed.dart';
import 'package:dgpc_cco/widgets/unit_status_panel.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: SovereignTheme.operationalDark,
      body: Column(
        children: [
          // 1. Top Bar
          OfficialHeader(),
          
          // 2. Main Workspace
          Expanded(
            child: Row(
              children: [
                // Left Panel: Incidents
                IncidentFeed(),
                
                // Center: Map
                Expanded(child: OperationalMap()),
                
                // Right Panel: Units
                UnitStatusPanel(),
              ],
            ),
          ),
          
          // 3. Bottom Ribbon: Communications
          BottomRibbon(),
        ],
      ),
    );
  }
}

class BottomRibbon extends StatelessWidget {
  const BottomRibbon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: const BoxDecoration(
        color: Color(0xFF05070A),
        border: Border(top: BorderSide(color: Colors.white10)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(Icons.lock, size: 12, color: SovereignTheme.sovereignBlue),
          const SizedBox(width: 8),
          const Text('SECURE LINE: ENCRYPTED (AES-256)', style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: SovereignTheme.sovereignBlue)),
          const Spacer(),
          Text('SYSTEM LOGGING ENABLED: SESSION #88492', style: TextStyle(fontSize: 10, fontFamily: 'monospace', color: Colors.grey.withOpacity(0.5))),
        ],
      ),
    );
  }
}
