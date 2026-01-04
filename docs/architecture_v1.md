# DGPC Sovereign Mission-Control Specification v1.0

> [!IMPORTANT]
> **CLASSIFICATION**: SOVEREIGN / MISSION-CRITICAL / STATE SECRET
> **AUTHORITY**: Directorate General of Civil Protection (DGPC)
> **VERSION**: 1.0 (EXECUTION READY)

## 1. System DNA & Philosophy
This is a **State-Grade Command Operating System**. It prioritizes **Hierarchy, Accountability, and Resilience** over convenience.

- **Authority**: Explicit Chain of Command enforcement. No ambiguity.
- **Availability**: "Fail-Safe" architecture. Active-Active replication.
- **Auditability**: Every pixel change is logged. Legal-grade non-repudiation.

---

## 2. Command Governance Layer
*Addressing Gap 1: Command Chain*

The system strictly enforces the DGPC hierarchy code.

### 2.1 Chain of Command Model
1.  **National Commander (General Directorate)**: Total override authority. Can seize control of any operational theatre.
2.  **Wilaya Commander (Director)**: Full authority within their geographic jurisdiction.
3.  **Duty Officer (Chief of Planning)**: Operational executor. Authorized to deploy assets.
4.  **Field Commander**: On-site tactical authority.

### 2.2 Control Protocols
- **Command Transfer**:
    - *Manual*: Duty Officer requests handover -> Senior Commander accepts.
    - *Automatic*: If Duty Center goes offline > 300s, control reverts to National Center (visual alert: "COMMAND FAILOVER").
- **Escalation Thresholds**:
    - **Level 1 (Routine)**: Local management.
    - **Level 2 (Active)**: Wilaya HQ notified.
    - **Level 3 (Crisis)**: National HQ receives "Hot Operations" control. Dashboard turns RED.
- **Authority Delegation**: A Commander can strictly delegate specific permissions (e.g., "Authorize Drone Deployment") to a subordinate for a fixed time window.

---

## 3. Hierarchical Visibility & Jurisdiction
*Addressing Gap 2: Jurisdiction Logic*

### 3.1 Visibility Matrix
| Role | Local View | Cross-Wilaya | National | Redaction Rules |
| :--- | :--- | :--- | :--- | :--- |
| **Operator** | Assigned Sector Only | None | None | Identity Redacted |
| **Supervisor** | Full Wilaya | Adjacent (Read-Only) | None | Full Data |
| **Wilaya Cmdr** | Full Wilaya | Adjacent (Read-Only) | None | Full Data |
| **National Cmdr** | All Wilayas | All Wilayas | Aggregated | Full Data |

### 3.2 Jurisdiction Enforcements
- **Geofenced Operations**: A Wilaya unit cannot be commanded by another Wilaya unless officially "Attached" to a Cross-Border Task Force.
- **Shadow Mode**: National Commanders can enter any Wilaya's Operation Room in "Stealth Mode" to observe without triggering alerts or disrupting local command.

---

## 4. Operational & Legal Archiving
*Addressing Gap 3: Official Reporting*

### 4.1 The "Black Box" Recorder
- **Event Ledger**: Every radio transmission, map click, and status change is written to a Write-Once-Read-Many (WORM) compliant storage bucket.
- **Snapshotting**: The system captures the full "State of the World" (Map + Units + Weather) every 60 seconds during active Ops.

### 4.2 Official Reporting Engine
- **Auto-Generation**: Post-mission, the system compiles a PDF dossier:
    - **Cover Page**: DGPC Official Seal, Mission ID, Time.
    - **Timeline**: Authenticated log of key decisions.
    - **Map Trace**: Visual path of all assets.
    - **Signatures**: Cryptographic signatures of the Duty Officer and Field Commander.
- **Legal Retention**: Archives are locked for 10 years (or per regulation) with ministerial access codes.

---

## 5. Training, Simulation & Wargaming
*Addressing Gap 4: Training & Simulation*

### 5.1 The "Sim-Layer"
- **Parallel Universe**: A complete clone of the production environment running on simulated data.
- **Input Simulation**:
    - *Virtual Citizens*: AI agents generating call traffic.
    - *Virtual Weather*: Simulated floods/fires based on physics engines.
- **Scenario Replay**: Commanders can load a historical incident (e.g., "2024 Forest Fires") and "Re-Play" it to test different strategies.

### 5.2 Drill Mode
- **Flag**: `SYSTEM_MODE = DRILL`.
- **Visuals**: Distinct "TRAINING - NOT REAL" watermarks across all screens.
- **Isolation**: No signals sent to real field units.

---

## 6. Threat Model & Insider Risk
*Addressing Gap 5: Security*

### 6.1 Zero-Trust & Identity
- **Hardware MFA**: YubiKey or similar required for Command authorization.
- **Session Geofencing**: Login only permitted from authorized IP ranges (HQ Intranet) or designated VPNs.

### 6.2 Anomaly Detection
- **Telemetry Watchdog**: If a unit's GPS jumps > 100km in 1s -> "Spoofing Alert".
- **Logic Checks**: A fire truck cannot report "Extinguishing" if GPS says it's at the station. System flags "False Report".
- **Panic Button**: Physical or Software "Lockdown" button instantly revokes all non-HQ access in case of compromise.

---

## 7. Technical Implementation Guide (Firebase Core)

### 7.1 Data Structure (Firestore)
```json
operations/
  {operation_id}/
    metadata: { status: "ACTIVE", commander: "UID_123" }
    chain_of_command: { current_authority: "WILAYA_16", delegation: null }
    live_units: { ... }
    decision_log: [ { timestamp: 12345, action: "DEPLOY_AIR", actor: "UID_123", signature: "SHA256..." } ]
```

### 7.2 Cloud Functions (Governance)
- `validateCommand()`: Checks actor's rank vs. Incident Level.
- `archiveOperation()`: Triggers PDF generation and moves data to Coldline Storage.
- `anomalyDetector()`: Runs heuristics on incoming telemetry.

### 7.3 Next Steps (Execution)
1.  **Initialize Repo**: `dgpc-c2-platform` (Private).
2.  **Define Security Rules**: Implement the Command Hierarchy in Firestore Security Rules.
3.  **Build "Command Console"**: The core React/Flutter Web layout with "Sovereign" Theme.
