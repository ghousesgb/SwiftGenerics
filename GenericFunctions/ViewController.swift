//
//  ViewController.swift
//  GenericFunctions
//
//  Created by Ghouse Basha Shaik on 10/06/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import UIKit

let homeFeedURL = "https://api.letsbuildthatapp.com/youtube/home_feed"
let courseURL = "https://api.letsbuildthatapp.com/jsondecodable/courses"
let courseDetails = "https://api.letsbuildthatapp.com/youtube/course_detail?id=1"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*fetchData(withUrlString: homeFeedURL) { (homeFeedsVideos) in
            homeFeedsVideos.videos.forEach({print($0.name)})
        }
        fetchCourseDetailsData(withUrlString: courseDetails) { (courseDetails) in
            courseDetails.forEach({print("\($0.name) \($0.duration)")})
        }
        fetchCourseData(withUrlString: courseURL) { (courses) in
            courses.forEach({print("\($0.name) \($0.numberOfLessions)")})
        }*/
        
        fetchData(withUrlString: homeFeedURL) { (homeFeedsVideos: HomeFeedsVideos) in
            homeFeedsVideos.videos.forEach({print($0.name)})
        }
        fetchData(withUrlString: courseURL) { (courses: [Courses]) in
            courses.forEach({print("\($0.name) \($0.numberOfLessions)")})
        }
        fetchData(withUrlString: courseDetails) { (courseDetails: [CourseDetails]) in
            courseDetails.forEach({print("\($0.name) \($0.duration)")})
        }
    }
    
    /*func fetchData(withUrlString: String, completion: @escaping (HomeFeedsVideos)->()) {
        let urlString = URL(string: withUrlString)
        URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            guard let data = data else  {return}
            do {
                let homefeeds = try JSONDecoder().decode(HomeFeedsVideos.self, from: data)
                completion(homefeeds)
            }catch {
                print(error)
            }
        }.resume()
    }
    
    func fetchCourseDetailsData(withUrlString: String, completion: @escaping ([CourseDetails])->()) {
        let urlString = URL(string: withUrlString)
        URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            guard let data = data else  {return}
            do {
                let courseDetails = try JSONDecoder().decode([CourseDetails].self, from: data)
                completion(courseDetails)
            }catch {
                print(error)
            }
            }.resume()
    }
    func fetchCourseData(withUrlString: String, completion: @escaping ([Courses])->()) {
        let urlString = URL(string: withUrlString)
        URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            guard let data = data else  {return}
            do {
                let courses = try JSONDecoder().decode([Courses].self, from: data)
                completion(courses)
            }catch {
                print(error)
            }
            }.resume()
    }*/
    
    func fetchData<T: Decodable>(withUrlString: String, completion: @escaping (T)->()) {
        let urlString = URL(string: withUrlString)
        URLSession.shared.dataTask(with: urlString!) { (data, response, error) in
            guard let data = data else  {return}
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completion(obj)
            }catch {
                print(error)
            }
            }.resume()
    }
    
}

