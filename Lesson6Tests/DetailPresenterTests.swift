import XCTest
@testable import Lesson6

final class DetailPresenterTests: XCTestCase {

  private var sut: DetailPresenter!

  override func setUp() {
    sut = DetailPresenter()
  }

  override func tearDown() {
    sut = nil
  }

  func testExample() {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
  }

  func testModelConsistency() {
    let model = Model.Artist(
      identifier: 1111,
      name: "A",
      albums: [
        Model.Artist.Album(
          name: "I",
          songs: [
            Model.Artist.Song(name: "I", duration: 1),
            Model.Artist.Song(name: "C", duration: 2),
            Model.Artist.Song(name: "J", duration: 2),
            Model.Artist.Song(name: "I", duration: 2),
            Model.Artist.Song(name: "I", duration: 3),
            Model.Artist.Song(name: "G", duration: 1),
            Model.Artist.Song(name: "O", duration: 1),
            Model.Artist.Song(name: "H", duration: 3),
            Model.Artist.Song(name: "H", duration: 2),
            Model.Artist.Song(name: "O", duration: 2)
          ],
          date: Date(timeIntervalSince1970: 5)
        )
      ]
    )

    sut.presentDetails(for: model)

    XCTAssertEqual(1, model.albums.count)
    XCTAssertEqual(10, model.albums[0].songs.count)
    XCTAssertEqual("A", model.name)
    XCTAssertEqual("I", model.albums[0].name)
    XCTAssertEqual(1111, model.identifier)
  }

  func testViewOutput() {
    XCTAssert(sut != nil)
  }
}
