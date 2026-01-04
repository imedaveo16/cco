import 'package:firebase_core/firebase_core.dart';
import 'package:dgpc_cco/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase with the provided options
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CCOApp());
}

class CCOApp extends StatelessWidget {
  const CCOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DGPC Mission Control',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0E14), // Operational Dark
        primaryColor: const Color(0xFF003366), // Sovereign Blue
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF003366),
          secondary: Color(0xFFB71C1C), // Operational Red
          surface: Color(0xFF161B22), // Panel Background
        ),
        textTheme: GoogleFonts.jetbrainsMonoTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Bar
          Container(
            height: 48,
            color: const Color(0xFF05070A),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Row(
              children: [
                Icon(Icons.shield, color: Color(0xFF003366)),
                SizedBox(width: 8),
                Text('DGPC MISSION COMMAND', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                Spacer(),
                Text('DEFCON: 5', style: TextStyle(color: Colors.green)),
                SizedBox(width: 16),
                Text('UTC 12:00:00'),
              ],
            ),
          ),
          // Main Workspace
          Expanded(
            child: Row(
              children: [
                // Left Panel: Incidents
                Container(width: 300, color: const Color(0xFF161B22), child: const Center(child: Text("INCIDENT FEED"))),
                // Center: Map
                Expanded(child: Container(color: Colors.black, child: const Center(child: Text("OPERATIONAL MAP (VECTOR)")))),
                // Right Panel: Units
                Container(width: 300, color: const Color(0xFF161B22), child: const Center(child: Text("UNIT STATUS"))),
              ],
            ),
          ),
          // Bottom Ribbon: Comms
          Container(
            height: 32,
            color: const Color(0xFF05070A),
            child: const Center(child: Text("SECURE LINE: ACTIVE • LOGGING ENABLED")),
          )
        ],
      ),
    );
  }
}
