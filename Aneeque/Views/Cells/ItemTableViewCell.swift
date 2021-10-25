//
//  ItemTableViewCell.swift
//  Aneeque
//
//  Created by Emmanuel Omokagbo on 24/10/2021.
//

import UIKit

protocol ItemTableViewCellDelegate: AnyObject {
   
    func didTapLikeButton()
    
    func didTapBuyButton()
}

class ItemTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let cellIdentifier = "ItemTableViewCell"
    
    var isLiked = false
    
    public weak var delegate: ItemTableViewCellDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var sellerName: UILabel!
    
    @IBOutlet weak var summary: UILabel!
    
    @IBOutlet weak var price: UILabel!
    
    
    
    // MARK: - Default methods

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        likeButton.setTitle("", for: .normal)
        self.createCardView(viewName: containerView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Actions
    
    @IBAction func didTapLikeButton(_ sender: UIButton) {
        isLiked = !isLiked
        likeButton.setImage(isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"), for: .normal)
        delegate?.didTapLikeButton()
    }
    
    @IBAction func didTapBuyButton(_ sender: UIButton) {
        delegate?.didTapBuyButton()
    }
    
    // MARK: - Methods
    
    public func setup(with model: Item) {
        itemImage.image = UIImage(named: model.itemImage)
        itemName.text = model.itemName
        sellerName.text = model.itemSeller
        summary.text = model.itemDescription
        price.text = model.itemPrice
    }
    
}
