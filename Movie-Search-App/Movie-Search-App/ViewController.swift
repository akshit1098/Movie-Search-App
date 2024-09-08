//
//  ViewController.swift
//  Movie-Search-App
//
//  Created by Akshit Saxena on 9/6/24.
//

import UIKit
import SafariServices

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
        table.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
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
        // keyboard of the field to go away
        field.resignFirstResponder()
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        let query = text.replacingOccurrences(of: " ", with: "%20")
        
        movies.removeAll()
        
        if let url = URL(string: "https://www.omdbapi.com/?i=tt3896198&apikey=ec4bd711&s=\(query)%20and&type=movie") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else {
                    return
                }
                
                // Convert
                var result: MovieResult?
                do {
                    result = try JSONDecoder().decode(MovieResult.self, from: data)
                }
                catch {
                    print("error")
                }
                
                guard let finalResult = result else {
                    return
                }
                
                
                
                // Update our movies array
                let newMovies = finalResult.Search
                self.movies.append(contentsOf: newMovies)
                
                
                
                // Refresh our table
                DispatchQueue.main.async {
                    self.table.reloadData()
                }
                
                
            }.resume()
        }

    }
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Show movie details
        let url = "https://www.imdb.com/title/\(movies[indexPath.row].imdbID)"
        let vc = SFSafariViewController(url: URL(string: url)!)
        present(vc, animated: true)
    }
    

}


struct MovieResult: Codable{
    let Search: [Movie]
    
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

