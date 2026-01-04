import 'package:flutter/material.dart';
import 'package:dgpc_cco/theme/sovereign_theme.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class OfficialHeader extends StatefulWidget {
  const OfficialHeader({super.key});

  @override
  State<OfficialHeader> createState() => _OfficialHeaderState();
}

class _OfficialHeaderState extends State<OfficialHeader> {
  late Timer _timer;
  String _timeString = "";

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: SovereignTheme.operationalDark,
        border: Border(bottom: BorderSide(color: SovereignTheme.sovereignBlue, width: 2)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          // Logo Area
          const Icon(Icons.shield, color: SovereignTheme.sovereignBlue, size: 28),
          const SizedBox(width: 12),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('DGPC MISSION COMMAND', 
                style: TextStyle(
                  fontWeight: FontWeight.w900, 
                  letterSpacing: 1.2,
                  fontSize: 16,
                  color: Colors.white
                )
              ),
              Text('DIRECTORATE GENERAL OF CIVIL PROTECTION', 
                style: TextStyle(
                  fontSize: 10, 
                  color: SovereignTheme.textSecondary,
                  letterSpacing: 2
                )
              ),
            ],
          ),
          
          const Spacer(),
          
          // Status Indicators
          _buildStatusBadge('DEFCON 5', SovereignTheme.successGreen),
          const SizedBox(width: 16),
          _buildStatusBadge('NETWORK: SECURE', SovereignTheme.sovereignBlue),
          const SizedBox(width: 16),
          _buildStatusBadge('AUTH: COMMANDER', SovereignTheme.operationalRed),
          
          const SizedBox(width: 32),
          
          // Clock
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: SovereignTheme.panelBackground,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white24),
            ),
            child: Text(
              'UTC $_timeString',
              style: const TextStyle(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                color: SovereignTheme.alertOrange
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        border: Border.all(color: color.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(text, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
