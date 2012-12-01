import bb.cascades 1.0

Container {
    property alias model: leaderboardModel
    property alias list: leaderboardList
    property alias loader: loader
    layout: DockLayout {
    }
    ActivityIndicator {
        id: loader
        preferredHeight: 500
        preferredWidth: 720
        verticalAlignment: VerticalAlignment.Center
        horizontalAlignment: HorizontalAlignment.Center
    }
    ListView {
        id: leaderboardList
        dataModel: GroupDataModel {
            id: leaderboardModel
            grouping: ItemGrouping.None
            sortingKeys: [
                "rank"
            ]
        }
        visible: false
        listItemComponents: [
            ListItemComponent {
                type: "item"
                content: Container {
                    Container {
                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }
                        preferredHeight: 50
                        Label {
                            text: ListItemData.rank
                            //textStyle.fontSizeValue: 25
                            textStyle.base: SystemDefaults.TextStyles.BigText
                            textStyle.textAlign: TextAlign.Center
                            preferredWidth: 150
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                        }
                        Container {
                            horizontalAlignment: HorizontalAlignment.Left
                            verticalAlignment: VerticalAlignment.Center
                            Label {
                                text: ListItemData.username //+ ": " + ListItemData.formattedScore
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                            }
                            Label {
                                text: ListItemData.formattedScore
                                textStyle.base: SystemDefaults.TextStyles.SubtitleText
                            }
                        }
                    }
                    Divider {
                    }
                }
            }
        ]
    }
}
