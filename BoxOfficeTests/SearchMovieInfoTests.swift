import XCTest
@testable import BoxOffice

final class SearchMovieInfoTests: XCTestCase {
  private let sut: SearchMovieInfoDTO.Type = SearchMovieInfoDTO.self
  
  private var fileProvider: FileProvidable?
  
  override func setUpWithError() throws {
    self.fileProvider = BundleResourceManager(target: .main)
  }
  
  override func tearDownWithError() throws {
    self.fileProvider = nil
  }
  
  func test_주어진json데이터를_decoder를_이용해_SearchMovieInfo타입으로_decoding할때_에러를_던지지_않는다() throws {
    // given
    let fileName = "search-movie-info"
    guard let fileProvider else { return }
    let data: Data = try fileProvider.getData(from: fileName, extension: .json)
    
    // when
    let result = try JSONDecoder().decode(sut, from: data)
    
    // then
    XCTAssertNoThrow(result)
  }
}
