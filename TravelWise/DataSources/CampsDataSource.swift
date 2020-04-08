//
//  CampsDataSource.swift
//  TravelWise
//
//  Created by Szymon Wereszczynski on 08/04/2020.
//  Copyright © 2020 Szymon Wereszczynski. All rights reserved.
//

import RxSwift

protocol CampsDataSource {

    func fetchCamps() -> Observable<[Camp]>
}

struct CampsService: CampsDataSource {

    let networking: NetworkingProtocol
    
    func fetchCamps() -> Observable<[Camp]> {
        
        //Fake data
        return Observable
            .just(())
            .delay(.seconds(2), scheduler: MainScheduler.instance)
            .map(fakeCamps)

//        let resource = Resource<ArrayResponse<Camp>>(get: Endpoint.camps)
//        return networking.response(from: resource).map { $0.items }
    }
}

var fakeCamps: () -> [Camp] = { 
    return [Camp(id: "1", name: "First camp", address: "France"),
            Camp(id: "2", name: "Second camp", address: "Spain")]
}
