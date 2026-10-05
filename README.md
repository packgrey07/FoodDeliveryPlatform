# Food Delivery Platform - Ballerina Microservices

A distributed, scalable food delivery system built with Ballerina showcasing microservices architecture and API Gateway pattern.

## Architecture
7 independent microservices communicating via REST through a central API Gateway. Each service owns its own logic and can be deployed independently.

- **Order Service (8080)** - Creates and manages orders
- **Payment Service (8081)** - Processes payments
- **Restaurant Service (8082)** - Handles restaurant acceptance/rejection
- **Delivery Service (8083)** - Assigns riders and tracks delivery
- **Notification Service (8084)** - Sends real-time updates to customers
- **API Gateway (8085)** - Single entry point, routes requests to services
- **Admin Service (8087)** - Platform stats and monitoring

## Order Lifecycle
1. Customer places order -> Order Service
2. Payment validation -> Payment Service
3. Restaurant confirms -> Restaurant Service
4. Rider assigned -> Delivery Service
5. Customer notified -> Notification Service

## How to Run

**You need 7 terminals open at once:**

Terminal 1: cd order_service\order_service; bal run main.bal
Terminal 2: cd payment_service\payment_service; bal run main.bal
Terminal 3: cd restaurant_service\restaurant_service; bal run main.bal
Terminal 4: cd delivery_service\delivery_service; bal run main.bal
Terminal 5: cd notification_service; bal run main.bal
Terminal 6: cd admin_service\admin_service; bal run main.bal
Terminal 7: cd api_gateway; bal run main.bal

**Test in 8th terminal:**

Invoke-RestMethod http://localhost:8085/health

## Tech Stack
Ballerina, REST API, JSON, Microservices, API Gateway Pattern

## Team
Add members as collaborators in GitHub Settings > Collaborators
