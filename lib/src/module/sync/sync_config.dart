typedef SyncState = int;


// All the status which is less than 1000 is processed locally.
const SyncState localCreated = 100;
const SyncState localUpdate = 200;
const SyncState localDelete = 900;


// All the status which is greater than 1000 is processed by server.
const SyncState serverSync = 2000;
const SyncState serverUpdate = 1200;
const SyncState serverDelete = 5000;