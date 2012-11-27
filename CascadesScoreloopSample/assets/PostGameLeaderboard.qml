import bb.cascades 1.0

Page {
    property variant score
    property bool load
    id: postGameLeaderboardPage
    titleBar: TitleBar {
        title: "Game Ranking"
    }
    content: Leaderboard {
        id: postLeaderboard
    }
    onLoadChanged: {
        if (load) {
            postLeaderboard.list.visible = false;
            postLeaderboard.loader.start();
            app.scoreLoop().LoadLeaderboardCompleted.connect(postGameLeaderboardPage.handleLeaderboard)
            app.loadLeaderboardAroundLastScore();
        }
    }
    function handleLeaderboard(leaderboardData) {
        postLeaderboard.loader.stop();
        postLeaderboard.loader.visible = false;
        postLeaderboard.list.visible = true;
        postLeaderboard.model.clear();
        postLeaderboard.model.insertList(leaderboardData);
    }
}
