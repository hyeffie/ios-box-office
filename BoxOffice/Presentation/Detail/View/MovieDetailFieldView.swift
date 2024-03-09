import UIKit

final class MovieDetailFieldView: UIView {
  private let fieldNameLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = .preferredFont(forTextStyle: .headline)
    return label
  }()
  
  private let contentLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.font = .preferredFont(forTextStyle: .body)
    label.numberOfLines = 0
    return label
  }()
  
  init(fieldName: String, content: String) {
    super.init(frame: .zero)
    configure(fieldName: fieldName, content: content)
    configureLayout()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureLayout() {
    self.addSubview(self.fieldNameLabel)
    self.addSubview(self.contentLabel)
    
    self.fieldNameLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentLabel.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      self.fieldNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      self.fieldNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
      self.fieldNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      self.fieldNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25),
      
      self.contentLabel.leadingAnchor.constraint(equalTo: self.fieldNameLabel.trailingAnchor),
      self.contentLabel.centerYAnchor.constraint(equalTo: self.fieldNameLabel.centerYAnchor),
      self.contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }
  
  private func configure(fieldName: String, content: String) {
    self.fieldNameLabel.text = fieldName
    self.contentLabel.text = content
  }
}
