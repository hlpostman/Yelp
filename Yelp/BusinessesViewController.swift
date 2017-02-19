//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class BusinessesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var mapOrListViewButton = UIBarButtonItem()
    
    
    var businesses: [Business]!
    var searchedBusinesses: [Business]?
    let searchBar = UISearchBar()
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedBusinesses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        cell.business = searchedBusinesses?[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Table View setup
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        // Search Bar setup
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.placeholder = "tacos, cheap dinner, Max's"
        navigationItem.titleView = searchBar
        if let navigationBar = navigationController?.navigationBar {
    
            navigationBar.barTintColor = UIColor(red: 0.7, green: 0.03, blue: 0.03, alpha: 1)

        }
        
        // Map Button setup
        mapView.isHidden = true
        mapOrListViewButton = UIBarButtonItem(image: UIImage(named: "Map_View_Icon"), style: .plain, target: self, action: #selector(hideAndShowMapView))
//        mapOrListViewButton.image = UIImage(named: "Map_View_Icon")
//        mapOrListViewButton.
        navigationItem.rightBarButtonItems = [mapOrListViewButton]
        
        // Filter results loaded
        Business.searchWithTerm(term: "Thai", completion: { (businesses: [Business]?, error: Error?) -> Void in
            
            self.businesses = businesses
            self.searchedBusinesses = self.businesses
            self.tableView.reloadData()
            
            if let businesses = businesses {
                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
            
            }
        )
        
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
    }
    
    func extractKeywords(title: String) -> [String] {
        var keywords = [String]()
        keywords = title.lowercased().components(separatedBy: " ")
        let doNotMatch = ["a":1, "an":1, "and":1, "at":1, "by":1, "for":1, "if":1, "in":1, "it":1, "of":1, "on":1, "or":1, "the":1, "with":1]
        // First word of title is keyword even if insignificant.
        for _ in keywords[1..<keywords.count] {
            for (index, word) in keywords[1..<keywords.count].enumerated() {
                if (doNotMatch[word] != nil) && (index + 1 < keywords.count) {
                    keywords.remove(at: index + 1)
                    print(keywords)
                    break
                }
            }
        }
        return keywords
    }
    
    // Filter within results
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchedBusinesses = self.businesses
            tableView.reloadData()
        } else {
//            searchedBusinesses = businesses!.filter({ (business) -> bool in
//                return (business as! Business).name?.hasPrefix(searchText)
//                })
            searchedBusinesses = businesses.filter({ (dataItem: Business) -> Bool in
                let titleKeywords = extractKeywords(title: dataItem.name!)
                for word in titleKeywords {
                    if word.lowercased().hasPrefix(searchText.lowercased()) {
//                        print("I have the prefix \(searchText) in my word -> \(word)")
                        return true
                    }
                }
                return false
            })
            
        }
        tableView.reloadData()
    }
    
    func hideAndShowMapView() {
        if mapOrListViewButton.image != nil && mapOrListViewButton.image!.isEqual(UIImage(named: "Map_View_Icon")!) {
            print("It's a map view icon")
            mapView.isHidden = false
            mapOrListViewButton.image = UIImage(named: "List_View_Icon")
        } else {
            print("It's a list view icon")
            mapView.isHidden = true
            mapOrListViewButton.image = UIImage(named: "Map_View_Icon")
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
