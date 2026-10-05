import ballerina/http;
import ballerina/io;
type Payment record {| int orderId; string status; decimal amount; |};
Payment[] payments = [];
service / on new http:Listener(8081) {
    resource function post payments(@http:Payload Payment p) returns Payment|error {
        p.status = "PAID"; payments.push(p);
        io:println("EVENT: payments.confirmed -> order " + p.orderId.toString());
        return p;
    }
    resource function get payments() returns Payment[] { return payments; }
}