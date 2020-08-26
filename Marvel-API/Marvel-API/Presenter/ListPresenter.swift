//
//  ListPresenter.swift
//  Marvel-API
//
//  Created by Gabriel Ferreira on 20/08/20.
//  Copyright © 2020 Ribeiro Ferreira. All rights reserved.
//

import Foundation

class ListPresenter {
    typealias DataListCallBack = (_ dataList: [Codable]?, _ status: Bool, _ message: String) -> Void
    typealias ImageCallBack = (_ imageData: Data?, _ status: Bool, _ message: String) -> Void
    var service : ServiceProtocol!
    var type : DataType!
    
    var limit : Int = 20
    var offset : Int = 0
    var actualPage : Int = 0
    var pages : Int = 0
    var total : Int = 0
    
    init(type: DataType, service: ServiceProtocol) {
        self.service = service
        self.type = type
    }
    
    init(type: DataType) {
        self.service = Service()
        self.type = type
    }
    
    //change the actual page and reload the list
    func changePage(isNext: Bool, callBack: @escaping DataListCallBack) {
        //update actual page and offset
        self.actualPage += isNext ? 1 : -1
        self.offset = self.limit * self.actualPage
        
        //get data from cache or service
        self.getData(callBack: callBack)
    }
    
    //get list from cache or service
    func getData(callBack: @escaping DataListCallBack) {
        //generate a key to try to get from cache
        let key = Cache.getKey(type: self.type,
                               offset: self.offset,
                               limit: self.limit)
        
        //try to get the list from cache or try to get from service
        if let dataList = self.getDataFromCache(key: key) {
            callBack(dataList, true, "")
        } else {
            self.getDataFromService(callBack: callBack)
        }
    }
    
    //get data from cache with a key and a type
    func getDataFromCache(key: String) -> [Codable]? {
        //list of general type Codable
        var dataList: [Codable]? = nil
        
        //get from cache by type
        switch self.type {
        case .characters:
            guard let dataWrapper = Cache.characterCache.object(forKey: key as NSString) else { return nil }
            guard let result = dataWrapper.data?.results else { return nil }
            dataList = result
        case .comics:
            guard let dataWrapper = Cache.comicCache.object(forKey: key as NSString) else { return nil }
            guard let result = dataWrapper.data?.results else { return nil }
            dataList = result
        case .stories:
            guard let dataWrapper = Cache.storyCache.object(forKey: key as NSString) else { return nil }
            guard let result = dataWrapper.data?.results else { return nil }
            dataList = result
        case .none:
            dataList = nil
        }
        
        //return list
        return dataList
    }
    
    //get data from service with a url and a type
    func getDataFromService(callBack: @escaping DataListCallBack){
        do {
//            DebugPrint: use to create a valid link to test api
//            print(url + self.type.string() +
//                "?ts=" + timestamp +
//                "&apikey=" + publicKey +
//                "&hash=" + hash )
            let parameters = ["ts": timestamp,
                              "apikey": publicKey ,
                              "hash": hash,
                              "limit": self.limit,
                              "offset": String(self.offset)] as [String : Any]

            try service.getData(from: url + self.type.string(),
                                parameters: parameters,
                                callBack: { [weak self] (serviceData, status, message) in
                if status {
                    guard let data = serviceData else { return }
                    do {
                        print(message)
                        guard let self = self else {return}
                        var dataList: [Codable]
                        
                        switch self.type {
                        case .characters:
                            let dataWrapper = try JSONDecoder().decode(DataWrapper<Character>.self, from: data)
                            guard let list = dataWrapper.data?.results else {
                                callBack(nil, false, "")
                                return
                            }
                            self.total = dataWrapper.data?.total ?? 0
                            dataList = list as [Codable]
                            let key = Cache.getKey(type: .characters,
                                                   offset: self.offset,
                                                   limit: self.limit)
                            Cache.characterCache.setObject(dataWrapper, forKey: NSString(string: key))
                            copyright = dataWrapper.copyright ?? ""
                        case .comics:
                            let dataWrapper = try JSONDecoder().decode(DataWrapper<Comic>.self, from: data)
                            guard let list = dataWrapper.data?.results else {
                                callBack(nil, false, "")
                                return
                            }
                            self.total = dataWrapper.data?.total ?? 0
                            dataList = list as [Codable]
                            let key = Cache.getKey(type: .comics,
                                                   offset: self.offset,
                                                   limit: self.limit)
                            Cache.comicCache.setObject(dataWrapper, forKey: NSString(string: key))
                            copyright = dataWrapper.copyright ?? ""
                        case .stories:
                            let dataWrapper = try JSONDecoder().decode(DataWrapper<Story>.self, from: data)
                            guard let list = dataWrapper.data?.results else {
                                callBack(nil, false, "")
                                return
                            }
                            self.total = dataWrapper.data?.total ?? 0
                            dataList = list as [Codable]
                            let key = Cache.getKey(type: .stories,
                                                   offset: self.offset,
                                                   limit: self.limit)
                            Cache.storyCache.setObject(dataWrapper, forKey: NSString(string: key))
                            copyright = dataWrapper.copyright ?? ""
                        case .none:
                            dataList = []
                        }
                        
                        callBack(dataList, true, "")
                        self.pages = self.total/self.limit
                        self.actualPage = self.offset/self.limit
                    } catch {
                        print(error)
                    }
                } else {
                    print(message, self.debugDescription)
                    callBack(nil, false, message)
                }
            })
        }catch ConnectErrors.receivedFailure{
            callBack(nil, false, "Lack of internet connection")
        }catch{
            callBack(nil, false, error.localizedDescription)
        }
    }
    
    func getImage(from url: String, callBack: @escaping ImageCallBack) {
        //try to get the image from cache or try to get from service
        if let imageData = self.getImageFromCache(key: url) {
            callBack(imageData, true, "")
        } else {
            self.getImageFromService(from: url, callBack: callBack)
        }
    }
    
    func getImageFromCache(key: String) -> Data? {
        //data of image
        var data: Data? = nil
        
        //get image data from cache
        guard let nsData = Cache.imageCache.object(forKey: key as NSString) else { return nil }
        data = nsData as Data
        
        return data
    }
    
    func getImageFromService(from url: String, callBack: @escaping ImageCallBack) {
        do {
            try self.service.getData(from: url, parameters: nil) { (data, status, message) in
                if status {
                    if let imageData = data {
                        Cache.imageCache.setObject(imageData as NSData, forKey: NSString(string: url))
                    }
                }
                callBack(data, status, message)
            }
        } catch ConnectErrors.receivedFailure{
            callBack(nil, false, "Lack of internet connection")
        }catch{
            callBack(nil, false, error.localizedDescription)
        }
    }
}
