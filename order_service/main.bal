import ballerina/http;
import ballerina/io;
type Order record {| int id; string customerId; string restaurantId; string status; string[] items; |};
type OrderRequest record {| string customerId; string restaurantId; string[] items; |};
Order[] orders = [];
int nextOrderId = 1;
service / on new http:Listener(8080) {
    resource function get orders() returns Order[] { return orders; }
    resource function post orders(@http:Payload OrderRequest req) returns Order|error {
        Order newOrder = {id: nextOrderId, customerId: req.customerId, restaurantId: req.restaurantId, status: "CREATED", items: req.items};
        orders.push(newOrder); nextOrderId += 1;
        io:println("EVENT: orders.created -> " + newOrder.toJsonString());
        check io:fileWriteJson("./orders.json", orders.toJson());
        return newOrder;
    }
    resource function get orders/[int id]() returns Order|http:NotFound {
        foreach var o in orders { if o.id == id { return o; } } return <http:NotFound>{};
    }
    resource function put orders/[int id]/status(@http:Payload record {| string status; |} s) returns Order|http:NotFound {
        foreach int i in 0..<orders.length() { if orders[i].id == id { orders[i].status = s.status; return orders[i]; } } return <http:NotFound>{};
    }
}