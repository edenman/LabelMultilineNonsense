import UIKit

class MyTableViewCell: UITableViewCell {
  private let titleLabel = UILabel()
  private let descriptionLabel = UILabel()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(titleLabel)
    contentView.addSubview(descriptionLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    titleLabel.setContentHuggingPriority(.required, for: .vertical)
    titleLabel.numberOfLines = 1
    titleLabel.textColor = UIColor.black
    titleLabel.text = "I'm a title!"
    descriptionLabel.preferredMaxLayoutWidth = frame.width
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    descriptionLabel.setContentHuggingPriority(.required, for: .vertical)
    descriptionLabel.numberOfLines = 0
    descriptionLabel.textColor = UIColor.black
    descriptionLabel.text = "Hi"

    let padding: CGFloat = 16
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: padding))
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: padding))
    contentView.addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -padding))

    contentView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: padding))
    contentView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: padding))
    contentView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -padding))
    contentView.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: -padding))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Not implemented")
  }
  
  func set(_ str: String) {
    descriptionLabel.text = str
//    descriptionLabel.sizeToFit()
//    descriptionLabel.invalidateIntrinsicContentSize()
  }
}
