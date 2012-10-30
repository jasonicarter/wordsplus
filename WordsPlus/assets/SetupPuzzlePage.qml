import bb.cascades 1.0

// The city browse page, filtering is done based on continents, the first
// control is a NavigationPane this in order to drill down in the lists.

NavigationPane {
    id: setupPuzzleNav
    Page {
        id: continentsPage
        Container {
            Button {
                text: "play"
                onClicked: {
                    // Then navigation to the puzzle page takes place.
                    var playPuzzlePage = playPuzzlePageDefinition.createObject();
                    setupPuzzleNav.push(playPuzzlePage);
                }
            }
            Button {
                text: "inject here"
                onClicked: {
                    // Then navigation to the puzzle page takes place.
//                    var playPuzzlePage = playPuzzlePageDefinition.createObject();
//                    setupPuzzleNav.push(playPuzzlePage);
                       wordsPlus.injectOnNavPane();
                }
            }
            
             Container {
                        //objectName: "playAreaContainer"
                        background: Color.Blue
                        preferredHeight: 500
                        preferredWidth: 500
                        horizontalAlignment: HorizontalAlignment.Center
                    }
        }
    }
    attachedObjects: [
        ComponentDefinition {
            id: playPuzzlePageDefinition
            source: "PlayPuzzlePage.qml"
        }
    ]
}
