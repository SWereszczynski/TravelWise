//
//  CampsDataSource.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift

protocol CampsDataSource {

    func fetchTrips() -> Observable<[Camp]>
}

struct CampsService: CampsDataSource {

    let networking: NetworkingProtocol
    
    func fetchTrips() -> Observable<[Camp]> {
        let resource = Resource<ArrayResponse<Camp>>(get: Endpoint.camps)
        return networking.response(from: resource).map { $0.items }
    }
}
