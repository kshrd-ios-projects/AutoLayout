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
    let imageCellId = "imageCellId"
    var posts = [PostDTO]()
    
    private func registerPostCell() {
        tableView.register(UINib.init(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: postCellId)
        tableView.register(UINib.init(nibName: "ImageTableViewCell", bundle: nil), forCellReuseIdentifier: imageCellId)
    }
    
    private func initPostData() {
        let post = PostDTO(
            description: "Happy Birthday!",
            location: "Phnom Penh",
            postImage: ""
        )
        let post2 = PostDTO(
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            location: "Phnom Penh",
            postImage: ""
        )
        let post3 = PostDTO(
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            location: "Kandal",
            postImage: ""
        )
        let post4 = PostDTO(
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            location: "Kandal",
            postImage: "rose-blue"
        )
        posts = [post, post2, post3, post4]
        
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
        let postCell = tableView.dequeueReusableCell(withIdentifier: postCellId, for: indexPath) as! PostTableViewCell
        
        let imageCell = tableView.dequeueReusableCell(withIdentifier: imageCellId, for: indexPath) as! ImageTableViewCell
        var cell = postCell
        
        postCell.selectionStyle = .none
        imageCell.selectionStyle = .none
        let post = posts[indexPath.row]
        var attributedText = NSMutableAttributedString(string: post.description, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 28)])
        
        if post.postImage.isEmpty {
            
            if postCell.descriptionLabel.calculateMaxLines() > 1 {
                attributedText = NSMutableAttributedString(string: post.description, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)])
            }
            postCell.descriptionLabel.attributedText = attributedText
            postCell.locationLabel.text = post.location
            cell = postCell
        } else {
            imageCell.descriptionLabel.numberOfLines = imageCell.descriptionLabel.calculateMaxLines()
            imageCell.descriptionLabel.text = post.description
            imageCell.locationLabel.text = post.location
            imageCell.postImageView.image = UIImage(named: post.postImage)
            return imageCell
        }

        
        return cell
    }
    
    
}

extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }
}
