//
//  LTableViewCell.swift
//  testToDo
//
//  Created by 黃肇祺 on 2021/5/6.
//

import UIKit
//建立自己的型別
protocol LTableViewCellDelegate {
    func lTableViewCell(_ cell: LTableViewCell, checkBool: Bool)
}

class LTableViewCell: UITableViewCell {
    
    // MARK: outLet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    
    // MARK: var
    //型別為自訂型別
    var delegate: LTableViewCellDelegate?
    //定義array
    var doingLists: [doingList]?
    //整數
    var indexP: Int?
    
    var point: CGPoint?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //按按鈕發生的動作
    @IBAction func checkButton(_ sender: UIButton) {
        
        if doingLists![indexP!].checked {
            print("indexPath\(indexP!),turn false")
            delegate?.lTableViewCell(self, checkBool: false)
            imageButton.setImage(UIImage(systemName: "square"), for: .normal)
        } else {
            print("indexPath\(indexP!),turn true")
            delegate?.lTableViewCell(self, checkBool: true)
            imageButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
