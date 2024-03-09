import UIKit

final class DetailViewController: UIViewController {
  // MARK: Properties
  
  private let movieTitle: String
  
  private let movieCode: String
  
  private let viewModel: DetailViewInput
  
  // MARK: Views
  
  private let scrollView: UIScrollView = UIScrollView()
  
  private let contentStackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 2
    return stack
  }()
  
  // MARK: Initializers
  
  init(
    movieTitle: String,
    movieCode: String,
    viewModel: DetailViewInput
  ) {
    self.movieTitle = movieTitle
    self.movieCode = movieCode
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: Lifecycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureLayout()
  }
}

private extension DetailViewController {
  func configureLayout() {
    self.view.addSubview(self.scrollView)
    self.scrollView.addSubview(self.contentStackView)
    
    self.scrollView.translatesAutoresizingMaskIntoConstraints = false
    self.contentStackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
      self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
      self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
      
      self.contentStackView.leadingAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.leadingAnchor),
      self.contentStackView.trailingAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.trailingAnchor),
      self.contentStackView.topAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.topAnchor),
      self.contentStackView.bottomAnchor.constraint(equalTo: self.scrollView.contentLayoutGuide.bottomAnchor),
      
      self.contentStackView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 1),
    ])
    
    let heightConstraint = self.contentStackView.heightAnchor.constraint(equalToConstant: self.scrollView.frame.height)
    heightConstraint.priority = .defaultLow
    heightConstraint.isActive = true
  }
}

protocol DetailViewInput {
  func viewDidLoad()
}
