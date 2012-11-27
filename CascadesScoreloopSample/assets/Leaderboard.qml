import bb.cascades 1.0

Container {
    property alias model: leaderboardModel
    property alias list: leaderboardList
    property alias loader: loader
    background: tileBg.imagePaint
    layout: DockLayout {
    }
    ActivityIndicator {
        id: loader
        preferredHeight: 500
        preferredWidth: 500
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
                        preferredHeight: 60
                        Label {
                            text: ListItemData.rank
                            textStyle.fontSizeValue: 25
                            textStyle.textAlign: TextAlign.Center
                            preferredWidth: 150
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                        }
                        Container {
                            layout: StackLayout {
                            }
                            horizontalAlignment: HorizontalAlignment.Left
                            verticalAlignment: VerticalAlignment.Center
                            Label {
                                text: ListItemData.username
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
