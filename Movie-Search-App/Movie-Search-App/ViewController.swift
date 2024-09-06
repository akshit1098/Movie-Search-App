//
//  ViewController.swift
//  Movie-Search-App
//
//  Created by Akshit Saxena on 9/6/24.
//

import UIKit

// Steps to follow:-
// 1. UI - Table View to display the movie
// 2. Netwrok Requests
// 3. tap a cell to see info about the movie
// 4. custom cell

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var field: UITextField!
    
    @IBOutlet weak var table: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
    // Field
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies() {
        field.resignFirstResponder()
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        if let url = URL(string: "https://www.omdbapi.com/?i=tt3896198&apikey=ec4bd711&s=fast%20and&type=movie") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }
                
                // Convert
                
                
                
                // Update our movies array
                
                
                
                // Refresh our table
                
                
            }.resume()
        }

    }
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Show movie details
    }
    

}


struct MovieResult: Codable{
    
}

struct Movie: Codable {
    
     let Title: String
     let Year: String
     let imdbID: String
    let `Type`: String
     let Poster: String
    
    // since the Type member cannot be named as type, therefore hence we need to do some kind of matching
    
    // type Coding keys and do the rest
//    private enum CodingKeys: String, CodingKey {
//        case Title, Year, imdbID, _Type = "Type", Poster
//    }
}

