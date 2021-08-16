//
//  MoyaServiceHelper.swift
//  COVID19
//
//  Created by Mohamed Shemy on Thu 12 Aug 2021.
//  Copyright © 2021 Mohamed Shemy. All rights reserved.
//

import Moya

class MoyaService<T: TargetType>
{
    // MARK:- Properties
    
    private var provider: MoyaProvider<T>
    
    // MARK:- Init
    
    init(type: ServiceType)
    {
        let networkActivityClosure: NetworkActivityPlugin.NetworkActivityClosure = Self.networkActivityAction
        let networkActivityPlugin = NetworkActivityPlugin(networkActivityClosure: networkActivityClosure)
        
        let plugins: [PluginType] = [networkActivityPlugin]
        let serviceType = type == .live ? MoyaProvider<T>.neverStub : MoyaProvider<T>.immediatelyStub
        
        self.provider = MoyaProvider<T>(stubClosure: serviceType, plugins: plugins)
    }
    
    // MARK:- Methods
    
    func request<C: Codable>(targetCase: T, completion: @escaping (Result<C, Error>) -> Void)
    {
        provider.request(targetCase)
        { [weak self] result in
            
            switch result
            {
                case let .success(value):
                    self?.decode(response: value, completion: completion)
                    
                case let .failure(error):
                    completion(.failure(error))
            }
        }
    }
    
    private func decode<C: Codable>(response value: Response, completion: @escaping (Result<C, Error>) -> Void)
    {
        do
        {
            let decoder = JSONDecoder()
            let response = try decoder.decode(C.self, from: value.data)
            completion(.success(response))
        }
        catch(let error)
        {
            completion(.failure(error))
        }
    }
    
    //MARK:-
    
    private static func networkActivityAction(_ activity: NetworkActivityChangeType, _ target: TargetType)
    {
        switch activity
        {
            case .began: ActivityIndicator.startLoading()
            case .ended: ActivityIndicator.stopLoading()
        }
    }
}
