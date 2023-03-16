//
//  PerfectHTTP.swift
//  PerfectProject
//
//  Created by Jeff on 2023/3/15.
//

import Foundation
import PerfectHTTP
import PerfectHTTPServer

func receiveHandler(request: HTTPRequest, response: HTTPResponse) {
    if let body = request.postBodyString {
        print("Received: \(body)")
        response.setBody(string: "Received: \(body)")
    } else {
        response.status = .badRequest
        response.setBody(string: "Invalid request")
    }
    response.completed()
}


func handler(request: HTTPRequest, response: HTTPResponse) {
    response.setHeader(.contentType, value: "application/json")
    response.setBody(string: "{\"message\": \"Hello, World!\"}")
    response.completed()
}
 
func jsonHandler(request: HTTPRequest, response: HTTPResponse) {
    let json: [String: Any] = [
        "userId": 1,
        "id": 2,
        "title": "quis ut nam facilis et officia qui",
        "completed": false
    ]
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        let jsonString = String(data: jsonData, encoding: .utf8)!
        response.setBody(string: jsonString)
    } catch {
        response.status = .internalServerError
        response.setBody(string: "Error creating JSON")
    }
    response.completed()
}
let routes:Routes =
   Routes([ Route(method: .get, uri: "/hello", handler: handler),  Route(method: .post, uri: "/receive", handler: receiveHandler)
            ,Route(method: .get, uri: "/json2", handler: jsonHandler)
          ])

