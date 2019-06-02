global class SlackMessageMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        // Create a fake response.
        // Set response values, and
        // return response.
        // 
        HTTPResponse res = new HTTPResponse();
        res.setStatusCode(200);
        return res;
    }
}