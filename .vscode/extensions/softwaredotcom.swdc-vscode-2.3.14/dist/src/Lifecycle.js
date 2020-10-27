"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const TrackerManager_1 = require("./managers/TrackerManager");
const Util_1 = require("./Util");
function uninstall() {
    const tracker = TrackerManager_1.TrackerManager.getInstance();
    tracker
        .trackEditorAction("editor", "uninstall")
        .then(() => {
        Util_1.setItem("uninstalled", true);
        process.exit(0);
    })
        .catch((e) => {
        Util_1.setItem("uninstalled", false);
        process.exit(0);
    });
}
uninstall();
//# sourceMappingURL=Lifecycle.js.map