import bb.cascades 1.0
import my.systemToasts 1.0

Page {
    id: gamePage
    property int score
    content: Container {
        background: tileBg.imagePaint
        layout: DockLayout {
        }
        topPadding: 30
        Label {
            text: qsTr("GAME OVER!")
            textStyle.base: SystemDefaults.TextStyles.TitleText
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
        }
        Container {
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            layout: StackLayout {
            }
            Label {
                id: scoreLabel
                textStyle.base: SystemDefaults.TextStyles.BigText
                horizontalAlignment: HorizontalAlignment.Center
            }
            Button {
                text: qsTr("Submit Score")
                onClicked: {
                    app.submitScore(score);
                    enabled = false;
                }
                verticalAlignment: VerticalAlignment.Center
            }
        }
    }
    onCreationCompleted: {
        score = Math.round(Math.random() * 1000);
        scoreLabel.text = qsTr("Score") + ": " + score;
        app.submitScoreCompleted.connect(gamePage.handleSubmitScoreCompleted)
    }
    attachedObjects: [
        ComponentDefinition {
            id: postGameLeadersDef
            source: "PostGameLeaderboard.qml"
        },
        SystemToast {
            id: submitScoreCompletedToast
            body: "Score submitted!"
            onFinished: {
                nav.pop();
            }
        }
    ]
    function handleSubmitScoreCompleted() {
        app.submitScoreCompleted.disconnect(gamePage.handleSubmitScoreCompleted)
        submitScoreCompletedToast.show();

        /*
         * @TODO fix segfault by calling this, the idea is that this would show the leaderboard around the score if this current game
         * var page = postGameLeadersDef.createObject();
         * console.log(page);
         * page.load = true;
         * nav.push(page);
         */
    }
}
