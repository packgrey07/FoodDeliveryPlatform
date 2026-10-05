import ballerina/http;
import ballerina/io;
type Confirm record {| int orderId; string status; |};
service / on new http:Listener(8082) {
    resource function post restaurant/confirm(@http:Payload Confirm c) returns json {
        io:println("EVENT: Restaurant confirmed order " + c.orderId.toString() + " - " + c.status);
        return {orderId: c.orderId, restaurantStatus: c.status, message: "Restaurant " + c.status};
    }
    resource function get menu() returns json {
        return [{id: 1, name: "Pizza", price: 10.5}, {id: 2, name: "Burger", price: 5.5}];
    }
}