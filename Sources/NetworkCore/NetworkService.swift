import Foundation

public class NetworkService {

    func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        guard let url = components.url else {
            completion(.failure(NetworkError.createUrl))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.methods
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                completion(.failure(err))
                return
            }
            guard response != nil,
                  let data = data else {
                completion(.failure(NetworkError.dataEmpty))
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch {
                completion(.failure(NetworkError.decoding))
            }
        }
        dataTask.resume()
    }

}
