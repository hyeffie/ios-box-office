//
//  MovieRepositoryImpl.swift
//  BoxOffice
//
//  Created by Effie on 2/19/24.
//

import Foundation

enum MovieRepositoryError: Error {
  case urlError
  case decodingError
  case networkServiceError
  case unknownError
}

protocol MovieRepository {
  // TODO: 도메인 객체로 바꾸기
  // TODO: 지금은 파라미터 없는 형태인데 고민해보기
  func getDailyBoxOffice() async -> Result<SearchDailyBoxOffice, MovieRepositoryError>
}

struct MovieRepositoryImpl {
  private let requester: NetworkRequestable
  private let decoder: JSONDecoder
  
  init(requester: NetworkRequestable, decoder: JSONDecoder) {
    self.requester = requester
    self.decoder = decoder
  }
}

extension MovieRepositoryImpl: MovieRepository {
  func getDailyBoxOffice() async -> Result<SearchDailyBoxOffice, MovieRepositoryError> {
    do {
      // TODO: 이 부분 한 줄로
      let key = "f5eef3421c602c6cb7ea224104795888"
      let date = "20240210"
      let urlString = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=\(key)&targetDt=\(date)"
      guard let url = URL(string: urlString) else {
        return .failure(.urlError)
      }
      let request = URLRequest(url: url)
      let result = await self.requester.requestData(request: request)
      switch result {
      case .success(let data):
        let resultData = try self.decoder.decode(SearchDailyBoxOffice.self, from: data)
        return .success(resultData)
      case .failure(let networkError):
        throw networkError
      }
    } catch {
      let finalError = convertErrorToMovieRepositoryError(error)
      return .failure(finalError)
    }
  }
  
  private func convertErrorToMovieRepositoryError(_ error: Error) -> MovieRepositoryError {
    if error is DecodingError {
      return .decodingError
    } else if let networkServiceError = error as? NetworkServiceError {
      return .networkServiceError
    } else {
      return .unknownError
    }
  }
}
