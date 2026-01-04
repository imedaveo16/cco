const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();
const db = admin.firestore();

// 1. COMMAND VALIDATION
exports.validateCommand = functions.firestore
    .document('operations/{opId}/decision_log/{logId}')
    .onCreate(async (snap, context) => {
      const command = snap.data();
      const userId = command.actor;
      
      const userDoc = await db.collection('users').doc(userId).get();
      const userRole = userDoc.data().role;

      // Logic: Check if role allows this command type
      // If invalid, flag it and alert Security
      if (!canExecute(userRole, command.action)) {
          return snap.ref.update({ status: 'REJECTED', reason: 'Unifying Command Authority Violation' });
      }
      return snap.ref.update({ status: 'VALIDATED' });
    });

// 2. OFFICIAL ARCHIVING
exports.archiveOperation = functions.firestore
    .document('operations/{opId}')
    .onUpdate(async (change, context) => {
      const newData = change.after.data();
      if (newData.status === 'CLOSED' && change.before.data().status !== 'CLOSED') {
          // Trigger PDF Report Generation (Placeholder)
          console.log(`Archiving Operation ${context.params.opId}`);
          // Lock the document
          await db.collection('operations').doc(context.params.opId).update({ archived: true, closedAt: admin.firestore.FieldValue.serverTimestamp() });
      }
    });

// 3. ANOMALY DETECTOR
exports.anomalyDetector = functions.firestore
    .document('units/{unitId}/telemetry/{pointId}')
    .onCreate(async (snap, context) => {
        const telemetry = snap.data();
        // Check for teleportation (Speed > 200km/h implied)
        // Check for incongruent status vs location
        // If detected -> Create Alert
    });

function canExecute(role, action) {
    // Simplified Logic
    if (role === 'NATIONAL_COMMANDER') return true;
    if (role === 'WILAYA_COMMANDER' && action !== 'NUCLEAR_OPTION') return true;
    return false;
}
