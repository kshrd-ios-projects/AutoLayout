//
//  ViewController.swift
//  HomeworkAutoLayout
//
//  Created by Sreng Khorn on 3/12/18.
//  Copyright © 2018 Sreng Khorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let postCellId = "postCellId"
    var posts = [PostDTO]()
    
    private func registerPostCell() {
        tableView.register(UINib.init(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: postCellId)
    }
    
    private func initPostData() {
        let post = PostDTO(
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            location: "Phnom Penh",
            hasImage: false
        )
        let post2 = PostDTO(
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            location: "Kandal",
            hasImage: false
        )
        posts = [post, post2]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerPostCell()
        initPostData()
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postCellId, for: indexPath) as! PostTableViewCell
        
        cell.selectionStyle = .none
        let post = posts[indexPath.row]
        cell.descriptionLabel.text = post.description
        cell.locationLabel.text = post.location
        
        return cell
    }
    
    
}

