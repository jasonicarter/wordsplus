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
                            textStyle {
                                base: SystemDefaults.TextStyles.BigText
                                textAlign: TextAlign.Center
                                color: Color.create("#CC3F10")
                            }
                            preferredWidth: 150
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Left
                        }
                        Container {
                            horizontalAlignment: HorizontalAlignment.Left
                            verticalAlignment: VerticalAlignment.Center
                            Label {
                                text: ListItemData.username
                                textStyle.base: SystemDefaults.TextStyles.TitleText
                            }
                            Label {
                                text: {
                                    var x = ListItemData.formattedScore;
                                    var rgx = /(\d+)(\d{3})/;
                                    while (rgx.test(x)) {
                                        x = x.replace(rgx, '$1' + ',' + '$2');
                                    }
                                    x;
                                }
                                textStyle {
                                    base: SystemDefaults.TextStyles.SubtitleText
                                    //textStyle.color: Color.create("#555555")
                                    color: Color.create("#CC3F10")
                                }
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
