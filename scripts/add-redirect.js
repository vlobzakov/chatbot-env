//@auth
//@req(nodeId, wsPort, redirPort)

var envName = '${env.envName}';

var resp = jelastic.env.control.AddEndpoint(envName, session, nodeId, wsPort, "TCP", "Node-RED WS");
if (resp.result != 0) return resp;

var endPointPort = resp.object.publicPort;
var redirect = "require(\"http\").createServer(function (req, res) { res.writeHead(301, {\"Location\": \"http://\" + req.headers.host + \":" + endPointPort + "\" + req.url}); res.end(); }).listen(" + redirPort + ", \"0.0.0.0\");"

path = "/usr/src/node-red/node_modules/node-red/red.js";
resp = jelastic.env.file.ReplaceInBody(envName, session, path, "var http = ", redirect + "\nvar http = ", 1, null, null, true, nodeId);
return resp;
