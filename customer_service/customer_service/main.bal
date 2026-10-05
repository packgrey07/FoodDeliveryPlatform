import ballerina/http;
service / on new http:Listener(8081) {
    resource function get customers() returns json { return [{id: "CUST101", name: "Sandra", address: "Windhoek"}]; }
    resource function post customers(@http:Payload json c) returns json { return c; }
}
