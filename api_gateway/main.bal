import ballerina/http;

final http:Client orderClient = check new("http://localhost:8080");
final http:Client paymentClient = check new("http://localhost:8081");
final http:Client restaurantClient = check new("http://localhost:8082");
final http:Client deliveryClient = check new("http://localhost:8083");
final http:Client notifyClient = check new("http://localhost:8084");
final http:Client adminClient = check new("http://localhost:8087");

service / on new http:Listener(8085) {
    resource function get health() returns json {
        return {status: "UP", services: 7, message: "Food Delivery Platform Running"};
    }
    resource function post orders(@http:Payload json d) returns json|error { return check orderClient->/orders.post(d); }
    resource function get orders() returns json|error { return check orderClient->/orders.get(); }
    resource function post payments(@http:Payload json d) returns json|error { return check paymentClient->/payments.post(d); }
    resource function post restaurantConfirm(@http:Payload json d) returns json|error { return check restaurantClient->/restaurant/confirm.post(d); }
    resource function post deliveries(@http:Payload json d) returns json|error { return check deliveryClient->/deliveries.post(d); }
    resource function post notify(@http:Payload json d) returns json|error { return check notifyClient->/notify.post(d); }
    resource function get admin/restaurants() returns json|error { return check adminClient->/restaurants.get(); }
    resource function get admin/stats() returns json|error { return check adminClient->/stats.get(); }
}
