//
//  NetworkMonitor.swift
//  DeliveryFood
//
//  Created by Дмитрий Садырев on 16.10.2022.
//

import Foundation
import Network

final class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    
    public private(set) var isConnected = false
    
    private init() {
        self.monitor = NWPathMonitor()
    }
    
    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .unsatisfied
        }
    }
    
    public func stopMonitoring() {
        monitor.cancel()
    }
}
