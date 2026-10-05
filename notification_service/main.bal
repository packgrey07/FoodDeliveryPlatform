import ballerina/http;
import ballerina/io;

service / on new http:Listener(8084) {
    resource function get status() returns string {
        return "Notification Service Running";
    }

    resource function post notify(@http:Payload json payload) returns json {
        io:println("NOTIFY EVENT");
        return {sent: true};
    }
}