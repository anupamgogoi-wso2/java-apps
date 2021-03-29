// import mock_api.records;
import ballerina/http;
import mock_api.records;
import ballerina/io;

records:Employee[] arrEmployee = [];
int count = 0;

service / on new http:Listener(9090) {

    resource function get employee(http:Caller caller) {
        http:Response response = new;

        json|error employees = arrEmployee.cloneWithType(json);
        if (employees is json) {
            io:println(employees);
            response.setJsonPayload(employees);
        } else {
            json e = {status: "Error occurred while getting employee."};
            response.setJsonPayload(e);
            response.statusCode = 400;
        }
        var r = caller->respond(response);
    }

    resource function post employee(http:Caller caller, http:Request request) {
        http:Response response = new;
        json|error payload = request.getJsonPayload();
        if (payload is json) {
            records:Employee|error e = payload.cloneWithType(records:Employee);
            if (e is records:Employee) {
                e.id = count+1;
                arrEmployee[count] = e;
                json data = {
                    status: "Employee added.",
                    id: e?.id
                };
                response.setJsonPayload(data);
                response.statusCode = 201;
                count = count + 1;
            } else {

                json data = {status: "Error occurred while adding employee."};
                response.setJsonPayload(data);
                response.statusCode = 401;
            }

        }
        var r = caller->respond(response);
    }
}
