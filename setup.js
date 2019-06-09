'use strict';

function readCurrentOS() {
    var os;
    try {
        if (WScript) {
            os = 'Windows';
        }
    } catch (error) {
        os = 'macOS';
    }
    return os;
}

var currentOS = readCurrentOS();

switch (currentOS) {
    case 'Windows':
        var shell = WScript.CreateObject('WScript.Shell');
        var script = WScript.ScriptFullName.replace('setup.js', '/tools/windows/runSetup.cmd');
        WScript.Run('start' + script);
        break;
    case 'macOS':
        var SystemEvents = Application('System Events');
        var app = Application.currentApplication();
        app.includeStandardAdditions = true;
        var path = app.pathTo(this);
        var directory = SystemEvents.files[path.toString()].container().posixPath();
        directory;
        var command = 'sh ' + directory + '/tools/macOS/start.applescript';
        app.doShellScript(command);
        break;
    case 'linux':
        break;
    default:
        throw new Error('Unknown OS');
}
