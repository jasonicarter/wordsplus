import bb.cascades 1.0

Container {
    layout: DockLayout {
    }
    ListView {
        id: leaderboardList
        dataModel: XmlDataModel {
            source: "models/categories.xml"
        }
        listItemComponents: [
            ListItemComponent {
                type: "item"
                StandardListItem {
                    imageSpaceReserved: true
                    title: ListItemData.category
                    imageSource: ListItemData.image
                }
            }
        ]
        onTriggered: {
            var selectedItem = dataModel.data(indexPath);
            wordsPlus.category = selectedItem.filename;
            wordsPlus.intializePlayArea();
            categorySheet.close();
        }
    } //listview
}