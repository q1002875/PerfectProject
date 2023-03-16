//
//  main.swift
//  PerfectProject
//
//  Created by Jeff on 2023/3/15.
//
//https://github.com/PerfectlySoft/Perfect

import Foundation

import PerfectHTTPServer

let server = HTTPServer()
server.serverPort = 8080
//server.serverAddress = "127.0.0.0"
server.addRoutes(routes)
try server.start()
