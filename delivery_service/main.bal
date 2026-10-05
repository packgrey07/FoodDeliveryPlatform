import ballerina/http;
import ballerina/io;
type Delivery record {| int orderId; string riderId; string status; |};
Delivery[] deliveries = [];
service / on new http:Listener(8083) {
    resource function post deliveries(@http:Payload Delivery d) returns Delivery|error {
        d.status = "ASSIGNED"; deliveries.push(d);
        io:println("EVENT: delivery.assigned -> order " + d.orderId.toString() + " rider " + d.riderId);
        return d;
    }
    resource function get deliveries() returns Delivery[] { return deliveries; }
    resource function put deliveries/[int orderId]/status(@http:Payload record {| string status; |} s) returns Delivery|http:NotFound {
        foreach int i in 0..<deliveries.length() { if deliveries[i].orderId == orderId { deliveries[i].status = s.status; return deliveries[i]; } } return <http:NotFound>{};
    }
}